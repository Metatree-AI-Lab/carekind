#!/usr/bin/env bash
# 检查各层目录是否都有 README.md（给人看）和 CLAUDE.md（给 AI 看），以及 AGENTS.md → CLAUDE.md 软链接。
# 规则见 rules/00-company-rules.md §4。
# 用法：scripts/check-context-docs.sh            检查全部
#       scripts/check-context-docs.sh --fix-links 自动补齐缺失的 AGENTS.md 软链接
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# 不需要上下文文档的目录：原始数据、下载资料、运行记录、单个 skill、个人清单、工具目录
EXCLUDE_REGEX='^\./(\.git|\.claude|\.agents|\.githooks|node_modules)(/|$)|/(ai-edits|\.pending|law-library|paperwork-templates|profiles|runs|logs|weekly|archive|members|prompts|evaluations|notes)(/|$)|^\./10-feedback/.+|^\./99-inbox/.+|^\./12-skills/.+'

missing=0
fix_links=false
[[ "${1:-}" == "--fix-links" ]] && fix_links=true

while IFS= read -r dir; do
	[[ "$dir" =~ $EXCLUDE_REGEX ]] && continue
	for doc in README.md CLAUDE.md; do
		if [[ ! -f "$dir/$doc" ]]; then
			echo "❌ 缺少 $dir/$doc" >&2
			missing=1
		fi
	done
	# 根目录的 AGENTS.md 是真实文件；子目录用软链接指向 CLAUDE.md
	if [[ "$dir" != "." && -f "$dir/CLAUDE.md" && ! -e "$dir/AGENTS.md" ]]; then
		if $fix_links; then
			ln -s CLAUDE.md "$dir/AGENTS.md"
			echo "🔗 已创建 $dir/AGENTS.md → CLAUDE.md"
		else
			echo "❌ 缺少 $dir/AGENTS.md（应为指向 CLAUDE.md 的软链接，可用 --fix-links 补齐）" >&2
			missing=1
		fi
	fi
done < <(find . -type d | sort)

if (( missing )); then
	echo "👉 用 09-templates/claude-md-template.md 和 readme-template.md 补齐（rules/00-company-rules.md §4）。" >&2
	exit 1
fi
echo "✅ 所有目录都有 README.md、CLAUDE.md 和 AGENTS.md"
