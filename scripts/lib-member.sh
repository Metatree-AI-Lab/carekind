#!/usr/bin/env bash
# 共用函数：识别当前操作仓库的成员、当前 PRD。被 ai-changelog.sh 和 my-work.sh source。
# 成员名册以 05-hr-teams/member-profiles.md 为准（rules/06-adlc-rules.md §9）。

member_names() {
	awk -F'|' '/^\| *(\*\*)?[A-Za-z]/ && !/姓名/ && !/日期/ { n=$2; gsub(/[ *]/, "", n); print n }' \
		"$ROOT/05-hr-teams/member-profiles.md" | sort -u
}

# 优先级：环境变量 CARE_MEMBER > git config user.name 里包含的成员名（不区分大小写）> unknown
resolve_member() {
	local candidate git_name member
	if [[ -n "${CARE_MEMBER:-}" ]]; then
		candidate="$CARE_MEMBER"
	else
		git_name="$(git -C "$ROOT" config user.name 2>/dev/null || true)"
		candidate=""
		while IFS= read -r member; do
			[[ -n "$member" ]] || continue
			if [[ "$(tr '[:upper:]' '[:lower:]' <<< "$git_name")" == *"$(tr '[:upper:]' '[:lower:]' <<< "$member")"* ]]; then
				candidate="$member"
				break
			fi
		done < <(member_names)
	fi
	# 只接受名册里的名字，其他一律记为 unknown，避免把任意字符串写进记录
	if [[ -n "$candidate" ]] && member_names | grep -qx -- "$candidate"; then
		echo "$candidate"
	else
		echo "unknown"
	fi
}

# 当前 PRD：分支名 prd/<slug> → slug；否则空
current_prd() {
	local branch
	branch="$(git -C "$ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
	if [[ "$branch" == prd/* ]]; then
		echo "${branch#prd/}"
	fi
}
