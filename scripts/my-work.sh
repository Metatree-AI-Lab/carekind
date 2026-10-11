#!/usr/bin/env bash
# 成员工作提醒：分配给我的未完成 PRD、待我评审的 PRD、卡点、最近的 agent 工作记录。
# 规则见 rules/06-adlc-rules.md §9。数据来源：docs/prds/registry.md + changelog/ai-edits/*.jsonl。
# 用法：
#   scripts/my-work.sh              当前成员（CARE_MEMBER 或 git user.name）
#   scripts/my-work.sh <姓名>       指定成员
#   scripts/my-work.sh --all        所有成员的汇总（Lightman 周会用）
#   scripts/my-work.sh --hook       SessionStart hook：有内容才输出，永远 exit 0
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
# shellcheck source=lib-member.sh
source "$ROOT/scripts/lib-member.sh"

REGISTRY="docs/prds/registry.md"
STALE_DAYS=7        # 登记表超过这么多天没更新 → 提醒
QUIET_DAYS=5        # 有进行中的 PRD 但这么多天没有 agent 记录 → 提醒
MODE="member"
TARGET=""

case "${1:-}" in
	--hook) MODE="hook" ;;
	--all) MODE="all" ;;
	"") ;;
	*) TARGET="$1" ;;
esac

to_epoch() { # DD/MM/YYYY → epoch；失败返回空
	local d="$1" iso
	[[ "$d" =~ ^([0-9]{2})/([0-9]{2})/([0-9]{4})$ ]] || return 0
	iso="${BASH_REMATCH[3]}-${BASH_REMATCH[2]}-${BASH_REMATCH[1]}"
	date -j -f "%Y-%m-%d" "$iso" +%s 2>/dev/null || date -d "$iso" +%s 2>/dev/null || true
}

days_ago() { # 给定 DD/MM/YYYY，返回距今天数；未知返回空
	local e now
	e="$(to_epoch "$1")"
	[[ -n "$e" ]] || return 0
	now="$(date +%s)"
	echo $(( (now - e) / 86400 ))
}

next_stage() {
	case "$1" in
		idea) echo draft ;; draft) echo in_review ;; in_review) echo approved ;;
		approved) echo in_progress ;; in_progress) echo verifying ;; verifying) echo released ;;
		released) echo done ;; *) echo "—" ;;
	esac
}

human_only() { [[ "$1" == "approved" || "$1" == "released" ]]; }

cutoff_date() { # N 天前的 YYYY-MM-DD
	date -v-"$1"d +%Y-%m-%d 2>/dev/null || date -d "$1 days ago" +%Y-%m-%d
}

# 登记表 → TSV：prd stage assignee reviewer risk blocked updated
registry_rows() {
	awk -F'|' '
		function t(s) { gsub(/^[ \t]+|[ \t]+$/, "", s); return s }
		/^## 登记表/ { on = 1; next }
		/^## / && on { on = 0 }
		on && /^\|/ { p = t($2); if (p == "PRD" || p ~ /^-+$/) next
			print p "\t" t($4) "\t" t($5) "\t" t($6) "\t" t($8) "\t" t($10) "\t" t($11) }' "$REGISTRY"
}

activity_line() { # 成员 + PRD slug → 最近一次记录
	local member="$1" prd="$2" last
	last="$(cat changelog/ai-edits/*.jsonl 2>/dev/null | jq -r --arg m "$member" --arg p "$prd" \
		'select(.member == $m and (.prd == $p or (.path | contains($p)))) | .ts' | sort | tail -1)"
	echo "${last:-}"
}

STANDUP_DIR="02-operating-system/standups/members"
STANDUP_EXEMPT="Lightman"   # PO 可选提交，不强制提醒（rules/06-adlc-rules.md §10.1）

today_iso() { TZ=Australia/Melbourne date +%Y-%m-%d; }

is_weekday() { [[ "$(TZ=Australia/Melbourne date +%u)" -le 5 ]]; }

standup_file() { echo "$STANDUP_DIR/$1/$(today_iso).md"; }

last_standup_date() { # 成员最近一次 standup 的 YYYY-MM-DD；没有则空
	ls "$STANDUP_DIR/$1" 2>/dev/null | sed -n 's/^\([0-9-]\{10\}\)\.md$/\1/p' | sort | tail -1 || true
}

# 变更历史里"分配给 <成员>"的行（日期晚于上次 standup；没有 standup 记录则看最近 3 天）
new_assignments() {
	local member="$1" since d prd change iso
	since="$(last_standup_date "$member")"
	[[ -n "$since" ]] || since="$(cutoff_date 3)"
	awk -F'|' '
		function t(s) { gsub(/^[ \t]+|[ \t]+$/, "", s); return s }
		/^## 变更历史/ { on = 1; next }
		on && /^\|/ { print t($2) "\t" t($3) "\t" t($4) }' "$REGISTRY" |
	while IFS=$'\t' read -r d prd change; do
		[[ "$d" =~ ^([0-9]{2})/([0-9]{2})/([0-9]{4})$ ]] || continue
		iso="${BASH_REMATCH[3]}-${BASH_REMATCH[2]}-${BASH_REMATCH[1]}"
		[[ "$iso" > "$since" ]] || continue
		# prd-assign 写的格式：assignee: A → B；首次登记：assignee = B
		if grep -qE "assignee[: ]*(.*→|=) *${member}( |$|，|,|（)" <<< "$change"; then
			echo "${prd}（${d}）"
		fi
	done
}

report_member() { # 返回：输出提醒文本；有内容时 exit 状态 0，没有内容 1
	local member="$1" printed=0 prd stage who rev risk blocked updated age last next cutoff recent
	local lines="" na has_prd=0
	if [[ "$member" != "$STANDUP_EXEMPT" ]] && is_weekday && [[ ! -f "$(standup_file "$member")" ]]; then
		lines+="📣 今天（$(today_iso)）还没提交 standup → 输入 /standup"$'\n'
		printed=1
	fi
	while IFS= read -r na; do
		[[ -n "$na" ]] || continue
		lines+="🆕 新分配给你：${na}"$'\n'
		printed=1
	done < <(new_assignments "$member")
	while IFS=$'\t' read -r prd stage who rev risk blocked updated; do
		case "$stage" in released|done|cancelled|superseded) continue ;; esac
		if [[ "$who" == "$member" ]]; then
			next="$(next_stage "$stage")"
			age="$(days_ago "$updated")"
			last="$(activity_line "$member" "$prd")"
			has_prd=1
			lines+="• [负责] ${prd}  阶段 ${stage} → 下一步 ${next}"
			human_only "$next" && lines+="（需要人批准，agent 只能准备证据）"
			lines+=$'\n'
			[[ "$blocked" != "—" && -n "$blocked" ]] && lines+="    ⛔ 卡点：${blocked}"$'\n'
			[[ -n "$age" && "$age" -ge "$STALE_DAYS" ]] && lines+="    ⏰ 登记表已 ${age} 天没有更新（${updated}）"$'\n'
			[[ "$risk" == "R3" && ( "$rev" == "—" || -z "$rev" ) ]] && lines+="    ⚠️ R3 还没有 reviewer"$'\n'
			lines+="    最近 agent 记录：${last:-无}"$'\n'
			printed=1
		elif [[ "$rev" == "$member" ]]; then
			case "$stage" in in_review|in_progress|verifying)
				lines+="• [评审] ${prd}  阶段 ${stage}，负责人 ${who}"$'\n'
				printed=1 ;;
			esac
		fi
	done < <(registry_rows)

	cutoff="$(cutoff_date "$QUIET_DAYS")"
	recent="$(cat changelog/ai-edits/*.jsonl 2>/dev/null | jq -r --arg m "$member" --arg c "$cutoff" \
		'select(.member == $m and (.ts[0:10] >= $c)) | .path' | wc -l | tr -d ' ')"
	if [[ "$printed" -eq 1 ]]; then
		echo "【${member} 的工作提醒】（$(date +%d/%m/%Y)）"
		printf '%s' "$lines"
		echo "最近 ${QUIET_DAYS} 天 agent 编辑记录：${recent} 条"
		[[ "$recent" -eq 0 && "$has_prd" -eq 1 ]] && echo "    ⏰ 有未完成的 PRD，但最近 ${QUIET_DAYS} 天没有任何记录"
		echo "详细清单（每个阶段还缺哪些门禁）：/my-work；分配规则：rules/06-adlc-rules.md"
		return 0
	fi
	return 1
}

case "$MODE" in
	hook)
		member="$(resolve_member)"
		if [[ "$member" == "unknown" ]]; then
			echo "【careKind 工作记录】没能识别你是哪位成员，本次会话的 agent 记录会记为 unknown。请设置 git config user.name（需包含 05-hr-teams/member-profiles.md 里的名字）或环境变量 CARE_MEMBER。"
		else
			report_member "$member" || true
		fi
		exit 0 ;;
	all)
		any=0
		while IFS= read -r m; do
			[[ "$m" == "Lightman" ]] && continue
			report_member "$m" && any=1 && echo || true
		done < <(member_names)
		[[ "$any" -eq 1 ]] || echo "没有成员有未完成的 PRD。"
		echo "【今天（$(today_iso)）的 standup】$(is_weekday || echo '（周末，不要求提交）')"
		while IFS= read -r m; do
			[[ "$m" == "$STANDUP_EXEMPT" ]] && continue
			if [[ -f "$(standup_file "$m")" ]]; then echo "  ✅ $m 已提交"; else echo "  ❌ $m 未提交"; fi
		done < <(member_names)
		echo "【Blockers 汇总】"
		blockers=""
		for f in "$STANDUP_DIR"/*/"$(today_iso)".md; do
			[[ -f "$f" ]] || continue
			blockers+="$(awk -v who="$(basename "$(dirname "$f")")" '/^## Blockers/ { on = 1; next } /^## / { on = 0 }
				on && /^- / && $0 !~ /^- 无/ { print "  • (" who ") " substr($0, 3) }' "$f")"$'\n'
		done
		registry_blocked="$(registry_rows | awk -F'\t' '$6 != "—" && $6 != "" { print "  • [登记表] " $1 " · " $6 }')"
		if [[ -z "${blockers//[$'\n ']/}${registry_blocked}" ]]; then echo "  无"; else printf '%s\n%s\n' "$blockers" "$registry_blocked" | sed '/^$/d'; fi ;;
	*)
		member="${TARGET:-$(resolve_member)}"
		if [[ "$member" == "unknown" ]] || ! member_names | grep -qx -- "$member"; then
			echo "❌ 没能识别成员「${member}」。名册：$(member_names | paste -sd, -)" >&2
			exit 1
		fi
		report_member "$member" || echo "【${member}】没有分配给你的未完成 PRD，也没有待你评审的 PRD。" ;;
esac
