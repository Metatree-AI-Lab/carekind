#!/usr/bin/env bash
# 检查代码文件行数，超过上限就要求重构（rules/02-code-rules.md 核心要求 16）。
#
# 用法：
#   scripts/check-file-length.sh --hook          Claude Code PostToolUse hook：从 stdin 读 JSON，超限时返回 decision=block，把重构要求反馈给 Claude
#   scripts/check-file-length.sh --staged        git pre-commit：检查暂存区的代码文件，超限则拒绝提交
#   scripts/check-file-length.sh <file>...       手动或 CI：检查指定文件，超限时退出码为 1
#   scripts/check-file-length.sh --all           检查整个仓库的代码文件
set -euo pipefail

MAX_LINES="${CAREKIND_MAX_FILE_LINES:-1000}"
# 只检查代码文件；文档、数据、锁文件、生成代码不检查
CODE_EXT_REGEX='\.(ts|tsx|js|jsx|mjs|cjs|py|go|rs|java|kt|kts|swift|sql|sh|css|scss|vue|svelte)$'
EXCLUDE_REGEX='(^|/)(node_modules|dist|build|coverage|vendor|\.next|\.git|generated|__generated__|migrations)/|\.min\.|\.d\.ts$|(package-lock|yarn\.lock|pnpm-lock)'

is_checked_file() {
	local file="$1"
	[[ -f "$file" ]] || return 1
	[[ "$file" =~ $CODE_EXT_REGEX ]] || return 1
	[[ "$file" =~ $EXCLUDE_REGEX ]] && return 1
	return 0
}

count_lines() {
	wc -l < "$1" | tr -d ' '
}

# 输出所有超限文件，每行格式为 "行数<TAB>路径"
find_oversized() {
	local file lines
	for file in "$@"; do
		is_checked_file "$file" || continue
		lines="$(count_lines "$file")"
		if (( lines > MAX_LINES )); then
			printf '%s\t%s\n' "$lines" "$file"
		fi
	done
}

run_hook() {
	local payload file oversized lines reason
	payload="$(cat)"
	file="$(jq -r '.tool_response.filePath // .tool_input.file_path // empty' <<< "$payload")"
	[[ -n "$file" ]] || exit 0
	oversized="$(find_oversized "$file")"
	[[ -n "$oversized" ]] || exit 0
	lines="${oversized%%$'\t'*}"
	reason="文件 ${file} 现在有 ${lines} 行，超过了 ${MAX_LINES} 行的上限（rules/02-code-rules.md 核心要求 16）。请立即使用 refactor-large-file skill 重构这个文件：按职责拆分成多个模块，让每个文件都不超过 ${MAX_LINES} 行（目标 ≤ 500 行）。不要用压缩代码、删除测试或注释、合并多行的方式来减少行数；重构不能改变行为，完成后要跑测试。"
	jq -n --arg reason "$reason" --arg msg "⚠️ ${file} 有 ${lines} 行（> ${MAX_LINES}），已要求 Claude 重构" \
		'{decision: "block", reason: $reason, systemMessage: $msg}'
}

report_and_exit() {
	local oversized="$1" context="$2"
	if [[ -z "$oversized" ]]; then
		exit 0
	fi
	echo "❌ 以下代码文件超过 ${MAX_LINES} 行，必须先重构（rules/02-code-rules.md 核心要求 16）：" >&2
	while IFS=$'\t' read -r lines file; do
		echo "   ${lines} 行  ${file}" >&2
	done <<< "$oversized"
	echo "👉 ${context}：让 Claude Code 或 Codex 运行 refactor-large-file skill，按职责拆分文件。" >&2
	exit 1
}

main() {
	case "${1:-}" in
		--hook)
			run_hook
			;;
		--staged)
			local files=()
			while IFS= read -r f; do files+=("$f"); done < <(git diff --cached --name-only --diff-filter=ACMR)
			report_and_exit "$(find_oversized "${files[@]+"${files[@]}"}")" "提交已被拒绝"
			;;
		--all)
			local files=()
			while IFS= read -r f; do files+=("$f"); done < <(git ls-files 2>/dev/null || find . -type f)
			report_and_exit "$(find_oversized "${files[@]+"${files[@]}"}")" "检查未通过"
			;;
		"")
			echo "用法：$0 --hook | --staged | --all | <file>..." >&2
			exit 2
			;;
		*)
			report_and_exit "$(find_oversized "$@")" "检查未通过"
			;;
	esac
}

main "$@"
