#!/usr/bin/env python3
"""把 DESIGN.md 渲染成给人阅读的 HTML（只用 Python 标准库，输出稳定、无时间戳）。

用法：python3 -I scripts/render-design-md.py <DESIGN.md> > DESIGN.html
通常不要直接运行，而是用 scripts/build-design-system.sh（会同时生成 tokens.css，并在 --check 时检查是否过期）。
支持 DESIGN.md 用到的 Markdown 子集：标题、表格、无序/有序列表、引用、分隔线、**粗体**、`代码`、[链接](url)。
"""
import html
import re
import sys


def esc(text):
	return html.escape(text, quote=True)


def inline(text):
	"""行内格式：先把 `代码` 暂存，转义其余文本，再处理粗体和链接，最后还原代码。"""
	codes = []

	def stash(match):
		codes.append(match.group(1))
		return "\x00%d\x00" % (len(codes) - 1)

	out = re.sub(r"`([^`]+)`", stash, text)
	out = esc(out)
	out = re.sub(r"\*\*(.+?)\*\*", r"<strong>\1</strong>", out)
	out = re.sub(r"\[([^\]]+)\]\(([^)\s]+)\)", lambda m: '<a href="%s">%s</a>' % (m.group(2), m.group(1)), out)
	return re.sub(r"\x00(\d+)\x00", lambda m: "<code>%s</code>" % esc(codes[int(m.group(1))]), out)


def plain(text):
	return re.sub(r"[`*]", "", re.sub(r"\[([^\]]+)\]\([^)]*\)", r"\1", text))


def slugify(text, used):
	slug = re.sub(r"[^\w\- ]+", "", plain(text), flags=re.UNICODE).strip().lower().replace(" ", "-") or "section"
	base, count = slug, 1
	while slug in used:
		count += 1
		slug = "%s-%d" % (base, count)
	used.add(slug)
	return slug


def split_row(line):
	return [cell.strip() for cell in line.strip().strip("|").split("|")]


def is_separator(cells):
	return all(re.fullmatch(r":?-{2,}:?", c) for c in cells)


def starts_block(s):
	return bool(
		s.startswith(("#", ">", "|", "<!--"))
		or re.match(r"^[-*]\s+", s)
		or re.match(r"^\d+\.\s+", s)
		or re.fullmatch(r"-{3,}", s)
	)


def render_table(rows):
	header, body = rows[0], rows[1:]
	if body and is_separator(body[0]):
		body = body[1:]
	parts = ['<div class="table-wrap"><table>', "<thead><tr>"]
	parts += ["<th>%s</th>" % inline(c) for c in header]
	parts.append("</tr></thead><tbody>")
	for row in body:
		parts.append("<tr>")
		for index, cell in enumerate(row):
			swatch = ""
			token = re.fullmatch(r"`--(color-[a-z0-9-]+)`", cell)
			if index == 0 and token:
				swatch = '<span class="sw" style="background: var(--%s)" aria-hidden="true"></span>' % token.group(1)
			parts.append("<td>%s%s</td>" % (swatch, inline(cell)))
		parts.append("</tr>")
	parts.append("</tbody></table></div>")
	return "".join(parts)


def render(markdown):
	lines = markdown.split("\n")
	out, toc, used = [], [], set()
	title = "DESIGN.md"
	i, n = 0, len(lines)
	while i < n:
		s = lines[i].strip()
		if not s or s.startswith("<!--"):
			i += 1
			continue
		heading = re.match(r"^(#{1,6})\s+(.*)$", s)
		if heading:
			level, text = len(heading.group(1)), heading.group(2)
			slug = slugify(text, used)
			if level == 1:
				title = plain(text)
			if level in (2, 3):
				toc.append((level, slug, plain(text)))
			out.append('<h%d id="%s">%s</h%d>' % (level, slug, inline(text), level))
			i += 1
		elif re.fullmatch(r"-{3,}", s):
			out.append("<hr>")
			i += 1
		elif s.startswith(">"):
			quote = []
			while i < n and lines[i].strip().startswith(">"):
				quote.append(lines[i].strip().lstrip(">").strip())
				i += 1
			out.append("<blockquote><p>%s</p></blockquote>" % inline(" ".join(q for q in quote if q)))
		elif s.startswith("|"):
			rows = []
			while i < n and lines[i].strip().startswith("|"):
				rows.append(split_row(lines[i]))
				i += 1
			out.append(render_table(rows))
		elif re.match(r"^[-*]\s+", s):
			items = []
			while i < n and re.match(r"^[-*]\s+", lines[i].strip()):
				items.append(re.sub(r"^[-*]\s+", "", lines[i].strip()))
				i += 1
			out.append("<ul>%s</ul>" % "".join("<li>%s</li>" % inline(t) for t in items))
		elif re.match(r"^\d+\.\s+", s):
			items = []
			while i < n and re.match(r"^\d+\.\s+", lines[i].strip()):
				items.append(re.sub(r"^\d+\.\s+", "", lines[i].strip()))
				i += 1
			out.append("<ol>%s</ol>" % "".join("<li>%s</li>" % inline(t) for t in items))
		else:
			para = []
			while i < n and lines[i].strip() and not starts_block(lines[i].strip()):
				para.append(lines[i].strip())
				i += 1
			out.append("<p>%s</p>" % "<br>".join(inline(p) for p in para))
	return title, toc, "\n".join(out)


PAGE = """<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>%%TITLE%%</title>
<!-- 由 scripts/build-design-system.sh 从 DESIGN.md 生成，仅供阅读，不要手工修改。要改内容请改 DESIGN.md 或 design-system/tokens.json。 -->
<link rel="stylesheet" href="design-system/tokens.css">
<style>
	* { box-sizing: border-box; }
	html { scroll-behavior: smooth; scroll-padding-top: var(--space-5); }
	body { margin: 0; background: var(--color-canvas); color: var(--color-ink); font-family: var(--font-family-sans); font-size: var(--font-size-body); line-height: var(--font-leading-body); }
	a { color: var(--color-blue-ink); }
	a:focus-visible, summary:focus-visible { outline: none; box-shadow: var(--focus-ring); border-radius: var(--radius-sm); }
	.skip { position: absolute; left: var(--space-3); top: -100px; background: var(--color-ink); color: var(--color-on-ink); padding: var(--space-2) var(--space-4); border-radius: var(--radius-pill); z-index: 10; }
	.skip:focus { top: var(--space-3); }
	.layout { display: grid; grid-template-columns: 280px minmax(0, 1fr); gap: var(--space-6); max-width: 1280px; margin: 0 auto; padding: var(--space-6) var(--space-5) var(--space-9); }
	.toc { position: sticky; top: var(--space-5); align-self: start; max-height: calc(100vh - var(--space-7)); overflow: auto; background: var(--color-surface); border-radius: var(--radius-lg); padding: var(--space-5); font-size: var(--font-size-caption); }
	.toc strong { display: block; font-size: var(--font-size-body); margin-bottom: var(--space-3); }
	.toc ul { list-style: none; margin: 0; padding: 0; }
	.toc li { margin: 0; }
	.toc a { display: block; padding: var(--space-1) var(--space-2); border-radius: var(--radius-sm); color: var(--color-ink-soft); text-decoration: none; min-height: 28px; }
	.toc .l3 a { padding-left: var(--space-5); }
	.toc a:hover { background: var(--color-surface-subtle); color: var(--color-ink); }
	.toc a[aria-current="true"] { background: var(--color-ink); color: var(--color-on-ink); }
	.toc-mobile { display: none; }
	main { background: var(--color-surface); border-radius: var(--radius-lg); padding: var(--space-7) var(--space-7) var(--space-8); min-width: 0; }
	main h1 { font-size: var(--font-size-display-sm); font-weight: var(--font-weight-medium); line-height: var(--font-leading-tight); letter-spacing: var(--font-tracking-display); margin: 0 0 var(--space-4); }
	main h2 { font-size: var(--font-size-heading); font-weight: var(--font-weight-medium); line-height: var(--font-leading-heading); margin: var(--space-8) 0 var(--space-4); padding-top: var(--space-5); border-top: 1px solid var(--color-line); }
	main h3 { font-size: var(--font-size-heading-sm); font-weight: var(--font-weight-semibold); line-height: var(--font-leading-heading); margin: var(--space-6) 0 var(--space-3); }
	main h4 { font-size: var(--font-size-title); font-weight: var(--font-weight-semibold); margin: var(--space-5) 0 var(--space-3); }
	p, ul, ol { margin: 0 0 var(--space-4); }
	li { margin-bottom: var(--space-2); }
	hr { border: 0; border-top: 1px solid var(--color-line); margin: var(--space-6) 0; }
	hr + h2 { border-top: 0; padding-top: 0; margin-top: var(--space-6); }
	code { font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; font-size: 0.875em; background: var(--color-surface-subtle); padding: 0.1em 0.4em; border-radius: var(--radius-sm); overflow-wrap: anywhere; }
	blockquote { margin: 0 0 var(--space-5); padding: var(--space-4) var(--space-5); background: var(--color-blue-tint); color: var(--color-ink); border-radius: var(--radius-md); border-left: 4px solid var(--color-blue-ink); }
	blockquote p { margin: 0; }
	.table-wrap { overflow-x: auto; margin: 0 0 var(--space-5); border: 1px solid var(--color-line); border-radius: var(--radius-md); }
	table { border-collapse: collapse; width: 100%; font-size: var(--font-size-caption); }
	th, td { text-align: left; vertical-align: top; padding: var(--space-3) var(--space-4); border-bottom: 1px solid var(--color-line); }
	th { background: var(--color-surface-subtle); font-weight: var(--font-weight-semibold); white-space: nowrap; }
	tr:last-child td { border-bottom: 0; }
	td code { white-space: nowrap; }
	td:first-child { white-space: nowrap; }
	.sw { display: inline-block; width: 18px; height: 18px; border-radius: var(--radius-pill); border: 1px solid var(--color-line-strong); vertical-align: middle; margin-right: var(--space-2); }
	.top { position: fixed; right: var(--space-5); bottom: var(--space-5); min-height: 40px; display: inline-flex; align-items: center; padding: 0 var(--space-4); border-radius: var(--radius-pill); background: var(--color-ink); color: var(--color-on-ink); text-decoration: none; box-shadow: var(--shadow-1); }
	@media (max-width: 900px) {
		.layout { grid-template-columns: minmax(0, 1fr); padding: var(--space-4) var(--space-3) var(--space-8); }
		.toc { display: none; }
		.toc-mobile { display: block; background: var(--color-surface); border-radius: var(--radius-md); padding: var(--space-3) var(--space-4); margin-bottom: var(--space-3); }
		.toc-mobile summary { min-height: 40px; display: flex; align-items: center; cursor: pointer; font-weight: var(--font-weight-semibold); }
		.toc-mobile ul { list-style: none; padding: 0; margin: var(--space-2) 0 0; }
		.toc-mobile .l3 { padding-left: var(--space-4); }
		.toc-mobile a { display: block; padding: var(--space-2) 0; }
		main { padding: var(--space-5) var(--space-4) var(--space-7); }
		main h1 { font-size: var(--font-size-heading); }
	}
	@media print {
		body { background: var(--color-surface); }
		.toc, .toc-mobile, .top, .skip { display: none; }
		.layout { display: block; padding: 0; }
		main { padding: 0; border-radius: 0; }
		.table-wrap { overflow: visible; }
		a { color: inherit; }
	}
	@media (prefers-reduced-motion: reduce) { html { scroll-behavior: auto; } }
</style>
</head>
<body>
<a class="skip" href="#main">跳到正文</a>
<div class="layout">
	<nav class="toc" aria-label="目录">
		<strong>目录</strong>
		<ul>%%TOC%%</ul>
	</nav>
	<div>
		<details class="toc-mobile">
			<summary>目录</summary>
			<ul>%%TOC%%</ul>
		</details>
		<main id="main">
%%BODY%%
		</main>
	</div>
</div>
<a class="top" href="#main">回到顶部 ↑</a>
<script>
	// 目录高亮当前章节（没有 JS 时目录照常可用）
	(function () {
		var links = Array.prototype.slice.call(document.querySelectorAll(".toc a"));
		if (!("IntersectionObserver" in window) || !links.length) { return; }
		var byId = {};
		links.forEach(function (a) { byId[a.getAttribute("href").slice(1)] = a; });
		var observer = new IntersectionObserver(function (entries) {
			entries.forEach(function (entry) {
				if (!entry.isIntersecting || !byId[entry.target.id]) { return; }
				links.forEach(function (a) { a.removeAttribute("aria-current"); });
				byId[entry.target.id].setAttribute("aria-current", "true");
			});
		}, { rootMargin: "0px 0px -75% 0px" });
		document.querySelectorAll("main h2, main h3").forEach(function (h) { observer.observe(h); });
	})();
</script>
</body>
</html>
"""


def main():
	if len(sys.argv) != 2:
		sys.exit("用法：render-design-md.py <DESIGN.md>")
	with open(sys.argv[1], encoding="utf-8") as handle:
		title, toc, body = render(handle.read())
	toc_html = "".join(
		'<li class="l%d"><a href="#%s">%s</a></li>' % (level, slug, esc(text)) for level, slug, text in toc
	)
	page = PAGE.replace("%%TITLE%%", esc(title)).replace("%%TOC%%", toc_html).replace("%%BODY%%", body)
	sys.stdout.write(page)


if __name__ == "__main__":
	main()
