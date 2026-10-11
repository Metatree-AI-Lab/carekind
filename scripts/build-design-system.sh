#!/usr/bin/env bash
# 从设计 tokens 生成 tokens.css、DESIGN.md 里的 token 表格（含对比度检查），并把 DESIGN.md、COMPONENTS.md 渲染成给人看的 HTML。
# tokens.json 是所有数值的唯一来源（06-app-development/design/DESIGN.md §0）。
# 用法：scripts/build-design-system.sh          生成（并检查对比度）
#       scripts/build-design-system.sh --check  只检查：生成文件是否过期、对比度是否达标（pre-commit 使用）
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

DIR="06-app-development/design/design-system"
TOKENS="$DIR/tokens.json"
CSS="$DIR/tokens.css"
DOC="06-app-development/design/DESIGN.md"
HTML="06-app-development/design/DESIGN.html"
COMP_DOC="06-app-development/design/COMPONENTS.md"
COMP_HTML="06-app-development/design/COMPONENTS.html"
RENDERER="scripts/render-design-md.py"
MODE="${1:-build}"

[[ -f "$TOKENS" ]] || { echo "❌ 缺少 $TOKENS" >&2; exit 1; }
[[ -f "$DOC" ]] || { echo "❌ 缺少 $DOC" >&2; exit 1; }
[[ -f "$RENDERER" ]] || { echo "❌ 缺少 $RENDERER" >&2; exit 1; }
[[ -f "$COMP_DOC" ]] || { echo "❌ 缺少 $COMP_DOC" >&2; exit 1; }
command -v python3 > /dev/null || { echo "❌ 需要 python3 来生成 DESIGN.html" >&2; exit 1; }
grep -q '<!-- tokens:begin -->' "$DOC" && grep -q '<!-- tokens:end -->' "$DOC" ||
	{ echo "❌ $DOC 里缺少 <!-- tokens:begin --> / <!-- tokens:end --> 标记" >&2; exit 1; }

# 把 tokens.json 拍平成 {name, value, source, desc, group}
FLAT='[paths(type == "object" and has("$value")) as $p
	| getpath($p) as $t
	| {name: ($p | map(tostring) | join("-")), group: $p[0], value: $t["$value"], source: $t.source, desc: $t["$description"]}]'

# WCAG 相对亮度与对比度
LUM='def rgb($h): ($h | ltrimstr("#") | ascii_downcase | explode | map(if . >= 97 then . - 87 else . - 48 end)) as $d
		| [($d[0] * 16 + $d[1]), ($d[2] * 16 + $d[3]), ($d[4] * 16 + $d[5])];
	def lin: . / 255 | if . <= 0.03928 then . / 12.92 else pow((. + 0.055) / 1.055; 2.4) end;
	def lum($h): rgb($h) | map(lin) | .[0] * 0.2126 + .[1] * 0.7152 + .[2] * 0.0722;
	def ratio($a; $b): (lum($a)) as $x | (lum($b)) as $y
		| (if $x > $y then ($x + 0.05) / ($y + 0.05) else ($y + 0.05) / ($x + 0.05) end);'

build_css() {
	echo "/* 由 scripts/build-design-system.sh 从 tokens.json 生成，不要手工修改。 */"
	echo ":root {"
	jq -r "$FLAT | .[] | \"\\t--\\(.name): \\(.value);\"" "$TOKENS"
	echo "}"
}

build_tables() {
	local groups=("color:颜色" "font:字体" "space:间距" "radius:圆角" "shadow:阴影" "size:尺寸" "z:层级" "focus:焦点" "motion:动效")
	local g key title
	echo
	echo "> 本节由 \`scripts/build-design-system.sh\` 从 \`design-system/tokens.json\` 生成，**不要手工修改**。来源：measured = 从选定的参考图实测；derived = 由实测值推导（满足 WCAG 2.2 AA）；proposed = 参考图里没有，我们提议的值，待确认。"
	for g in "${groups[@]}"; do
		key="${g%%:*}"
		title="${g#*:}"
		echo
		echo "#### ${title}（\`${key}\`）"
		echo
		echo "| Token | 值 | 来源 | 用途 |"
		echo "|---|---|---|---|"
		jq -r --arg k "$key" "$FLAT | .[] | select(.group == \$k) | \"| \`--\\(.name)\` | \`\\(.value)\` | \\(.source) | \\(.desc) |\"" "$TOKENS"
	done
	echo
	echo "#### 对比度检查（WCAG 2.2 AA：正文 ≥ 4.5:1，大字与图形 ≥ 3:1）"
	echo
	echo "| 用途 | 前景 | 背景 | 对比度 | 要求 | 结果 |"
	echo "|---|---|---|---|---|---|"
	jq -r "$LUM $FLAT as \$flat | (\$flat | map({(.name): .value}) | add) as \$v
		| .contrast[]
		| ratio(\$v[.fg]; \$v[.bg]) as \$r
		| \"| \\(.use) | \`--\\(.fg)\` | \`--\\(.bg)\` | \\((\$r * 100 | floor) / 100):1 | ≥ \\(.min):1 | \\(if \$r >= .min then \"✅\" else \"❌\" end) |\"" "$TOKENS"
}

contrast_failures() {
	jq -r "$LUM $FLAT as \$flat | (\$flat | map({(.name): .value}) | add) as \$v
		| .contrast[] | select(ratio(\$v[.fg]; \$v[.bg]) < .min)
		| \"\\(.use)：--\\(.fg) 在 --\\(.bg) 上只有 \\((ratio(\$v[.fg]; \$v[.bg]) * 100 | floor) / 100):1，要求 ≥ \\(.min):1\"" "$TOKENS"
}

render_doc() { # $1 = 生成内容所在文件
	awk -v genfile="$1" '
		/<!-- tokens:begin -->/ { print; while ((getline line < genfile) > 0) print line; skip = 1; next }
		/<!-- tokens:end -->/ { skip = 0 }
		!skip { print }' "$DOC"
}

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
build_css > "$WORK/tokens.css"
build_tables > "$WORK/tables.md"
render_doc "$WORK/tables.md" > "$WORK/DESIGN.md"
python3 -I "$RENDERER" "$WORK/DESIGN.md" > "$WORK/DESIGN.html"
python3 -I "$RENDERER" "$COMP_DOC" > "$WORK/COMPONENTS.html"

status=0
failures="$(contrast_failures)"
if [[ -n "$failures" ]]; then
	echo "❌ 对比度不达标（WCAG 2.2 AA）：" >&2
	echo "$failures" | sed 's/^/   /' >&2
	status=1
fi

if [[ "$MODE" == "--check" ]]; then
	if ! diff -q "$WORK/tokens.css" "$CSS" > /dev/null 2>&1 || ! diff -q "$WORK/DESIGN.md" "$DOC" > /dev/null 2>&1 \
		|| ! diff -q "$WORK/DESIGN.html" "$HTML" > /dev/null 2>&1 || ! diff -q "$WORK/COMPONENTS.html" "$COMP_HTML" > /dev/null 2>&1; then
		echo "❌ tokens.css、DESIGN.md 里的 token 表格、DESIGN.html 或 COMPONENTS.html 已过期，请运行 scripts/build-design-system.sh 并提交" >&2
		status=1
	fi
	[[ "$status" -eq 0 ]] && echo "✅ 设计系统检查通过（tokens 与生成文件一致，对比度达标）"
	exit "$status"
fi

cp "$WORK/tokens.css" "$CSS"
cp "$WORK/DESIGN.md" "$DOC"
cp "$WORK/DESIGN.html" "$HTML"
cp "$WORK/COMPONENTS.html" "$COMP_HTML"
[[ "$status" -eq 0 ]] && echo "✅ 已生成 ${CSS}、${DOC} 里的 token 表格、${HTML} 和 ${COMP_HTML}"
exit "$status"
