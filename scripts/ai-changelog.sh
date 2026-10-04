#!/usr/bin/env bash
# AI 修改记录（rules/05-changelog-rules.md）
#
#   --post-tool         Claude Code PostToolUse hook：把每次文件编辑追加到 changelog/ai-edits/YYYY-MM.jsonl；
#                       改了非 changelog 文件 → 标记本会话"待写摘要"；改了 changelog/YYYY-MM.md → 清除标记
#   --stop              Claude Code Stop hook：本会话有待写摘要时阻止结束，要求先写 changelog
#   --manual <agent> <file>...   Codex 或其他 agent 手动记录编辑明细（会话 ID 用 manual-<日期>）
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LOG_DIR="$ROOT/changelog/ai-edits"
PENDING_DIR="$ROOT/changelog/.pending"
SUMMARY_REGEX='^changelog/[0-9]{4}-[0-9]{2}\.md$'
mkdir -p "$LOG_DIR" "$PENDING_DIR"

now_iso() { TZ=Australia/Melbourne date +%Y-%m-%dT%H:%M:%S%z; }
month() { TZ=Australia/Melbourne date +%Y-%m; }

relative_path() {
	local path="$1"
	case "$path" in
		"$ROOT"/*) echo "${path#"$ROOT"/}" ;;
		*) echo "$path" ;;
	esac
}

append_edit() {
	local agent="$1" session="$2" tool="$3" path="$4"
	jq -cn --arg ts "$(now_iso)" --arg agent "$agent" --arg session "$session" --arg tool "$tool" --arg path "$path" \
		'{ts: $ts, agent: $agent, session: $session, tool: $tool, path: $path}' >> "$LOG_DIR/$(month).jsonl"
}

run_post_tool() {
	local payload session tool file path
	payload="$(cat)"
	session="$(jq -r '.session_id // "unknown"' <<< "$payload")"
	tool="$(jq -r '.tool_name // "unknown"' <<< "$payload")"
	file="$(jq -r '.tool_response.filePath // .tool_input.file_path // .tool_input.notebook_path // empty' <<< "$payload")"
	[[ -n "$file" ]] || exit 0
	path="$(relative_path "$file")"
	# 明细日志和标记文件本身不记录，避免自我循环
	[[ "$path" == changelog/ai-edits/* || "$path" == changelog/.pending/* ]] && exit 0

	append_edit "claude-code" "$session" "$tool" "$path"
	if [[ "$path" =~ $SUMMARY_REGEX ]]; then
		rm -f "$PENDING_DIR/$session"
	else
		echo "$path" >> "$PENDING_DIR/$session"
	fi
}

run_stop() {
	local payload session active pending_file files
	payload="$(cat)"
	session="$(jq -r '.session_id // "unknown"' <<< "$payload")"
	active="$(jq -r '.stop_hook_active // false' <<< "$payload")"
	pending_file="$PENDING_DIR/$session"
	[[ -f "$pending_file" ]] || exit 0
	# 已经因为本 hook 继续过一次仍未写摘要时放行，避免无限循环；标记保留，下次结束时会再次提醒
	[[ "$active" == "true" ]] && exit 0
	files="$(sort -u "$pending_file" | head -20 | tr '\n' ' ')"
	jq -n --arg reason "本会话修改了文件但还没有写 AI 修改记录（rules/05-changelog-rules.md）。请在 changelog/$(month).md 末尾追加一条摘要（格式见 changelog/README.md），session 填 ${session}。本次改动的文件：${files}" \
		'{decision: "block", reason: $reason}'
}

run_manual() {
	local agent="${1:?用法：--manual <agent> <file>...}"
	shift
	local session="manual-$(TZ=Australia/Melbourne date +%Y%m%d)" file
	for file in "$@"; do
		append_edit "$agent" "$session" "manual" "$(relative_path "$(cd "$(dirname "$file")" && pwd)/$(basename "$file")")"
	done
	echo "已记录 $# 个文件。完成任务后请在 changelog/$(month).md 写摘要。"
}

case "${1:-}" in
	--post-tool) run_post_tool ;;
	--stop) run_stop ;;
	--manual) shift; run_manual "$@" ;;
	*) echo "用法：$0 --post-tool | --stop | --manual <agent> <file>..." >&2; exit 2 ;;
esac
