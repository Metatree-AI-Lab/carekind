#!/usr/bin/env bash
# 检查 docs/prds/registry.md：每个 PRD 一行、阶段合法、assignee 有且仅有一个人。
# 规则见 rules/06-adlc-rules.md。用法：scripts/check-prd-registry.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

REGISTRY="docs/prds/registry.md"
PROFILES="05-hr-teams/member-profiles.md"
[[ -f "$REGISTRY" ]] || { echo "❌ 缺少 $REGISTRY" >&2; exit 1; }
[[ -f "$PROFILES" ]] || { echo "❌ 缺少 $PROFILES" >&2; exit 1; }

# 成员姓名：画像表第一列（去掉 ** 和空格），跳过表头和分隔行
MEMBERS="$(awk -F'|' '/^\| *(\*\*)?[A-Za-z]/ && !/姓名/ && !/日期/ { n=$2; gsub(/[ *]/, "", n); print n }' "$PROFILES" | sort -u | paste -sd, -)"
# 按 level 分组（画像表第 4 列）：junior 超出级别、R3 的 PRD 需要 senior 以上的 reviewer
LEVELS="$(awk -F'|' '/^\| *(\*\*)?[A-Za-z]/ && !/姓名/ && !/日期/ { n=$2; l=$4; gsub(/[ *]/, "", n); gsub(/ /, "", l); print n ":" l }' "$PROFILES" | paste -sd, -)"

# 磁盘上的 PRD（不含 registry/README/CLAUDE/AGENTS）
FILES="$(find docs/prds -maxdepth 1 -name '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*.md' -exec basename {} .md \; | sort | paste -sd, -)"

awk -F'|' -v members="$MEMBERS" -v files="$FILES" -v levels="$LEVELS" '
function trim(s) { gsub(/^[ \t]+|[ \t]+$/, "", s); return s }
function err(msg) { print "❌ " msg > "/dev/stderr"; bad = 1 }
BEGIN {
	split(members, m, ","); for (i in m) isMember[m[i]] = 1
	split(levels, lv, ","); for (i in lv) { split(lv[i], kv, ":"); level[kv[1]] = kv[2] }
	review["in_review"] = review["approved"] = review["in_progress"] = review["verifying"] = review["released"] = review["done"] = 1
	split(files, f, ","); for (i in f) if (f[i] != "") onDisk[f[i]] = 1
	n = split("idea draft in_review approved in_progress verifying released done cancelled superseded", s, " ")
	for (i = 1; i <= n; i++) validStage[s[i]] = 1
	late["in_progress"] = late["verifying"] = late["released"] = late["done"] = 1
}
/^## 登记表/ { inTable = 1; next }
/^## / && inTable { inTable = 0 }
inTable && /^\|/ {
	prd = trim($2)
	if (prd == "PRD" || prd ~ /^-+$/) next
	rows++
	stage = trim($4); who = trim($5); rev = trim($6); risk = trim($8)
	if (seen[prd]++) err(prd ": 在登记表里出现了多次（每个 PRD 只能一行）")
	# idea = 还没有 PRD（rules/06-adlc-rules.md §2），其他阶段必须有文件
	if (!(prd in onDisk) && stage != "idea") err(prd ": docs/prds/ 里没有这个文件")
	delete onDisk[prd]
	if (!(stage in validStage)) { err(prd ": 阶段 \"" stage "\" 不合法"); next }
	noOwner = (who == "" || who == "—" || who ~ /TBD/)
	# idea 阶段可以还没有 assignee；一旦填了，就必须是且只能是一个名册里的人
	if (noOwner && stage == "idea") next
	if (noOwner) { err(prd ": 阶段 " stage " 必须有 assignee"); next }
	if (who ~ /[,，、\/&+]|和| and /) err(prd ": assignee \"" who "\" 看起来不止一个人（有且仅有一个）")
	else if (tolower(who) ~ /claude|codex|agent|^ai$/) err(prd ": AI agent 不能当 assignee")
	else if (!(who in isMember)) err(prd ": assignee \"" who "\" 不在 05-hr-teams/member-profiles.md")
	if (rev != "" && rev != "—" && rev == who) err(prd ": reviewer 不能等于 assignee")
	# 需要 senior 以上 reviewer：R3，或 junior 负责 S 以外的 PRD（rules/06-adlc-rules.md §5.1），从 in_review 起
	cx = trim($7)
	needSenior = (risk == "R3") || (level[who] == "junior" && cx != "S")
	if (needSenior && (stage in review)) {
		if (rev == "" || rev == "—" || rev ~ /TBD|需外部评审/) err(prd ": " stage " 阶段必须指定 senior 以上的 reviewer（R3 或超出级别的 PRD）")
		else if (!(level[rev] == "senior" || level[rev] == "lead")) err(prd ": reviewer \"" rev "\" 不是 senior 以上")
	}
}
END {
	for (p in onDisk) err(p ": 有 PRD 文件但没有登记（请加到 " "docs/prds/registry.md" "）")
	if (rows == 0) err("登记表是空的")
	if (!bad) print "✅ PRD 登记表检查通过（" rows " 个 PRD）"
	exit bad
}' "$REGISTRY"
