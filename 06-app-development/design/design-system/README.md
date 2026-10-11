# design-system — 设计 tokens 与预览

Owner: Lightman (PO) · Assignee: Gary · Last reviewed: 11/10/2026

careKind AI 设计系统的**数值来源**和预览。规则和用法在上一级的 [`../DESIGN.md`](../DESIGN.md)。

## 内容
- `tokens.json` — **所有设计数值的唯一来源**（颜色、字体、间距、圆角、阴影、尺寸、动效、对比度要求）
- `tokens.css` — 由脚本从 tokens.json **生成**的 CSS 变量，不要手改
- `preview.html` — 风格总览（引用 tokens.css，内容全部是合成示例）
- `components.css` — 组件的参考实现（类名前缀 `ck-`，只用 token；先引入 tokens.css）
- `components.html` — 组件交互样例：每个组件的变体和状态，可用键盘试用（规格见 `../COMPONENTS.md`）

## 怎么用
- 改数值：编辑 `tokens.json`，运行 `scripts/build-design-system.sh`，把 `tokens.css` 和 `DESIGN.md` 一起提交。
- 看预览：在这个目录运行 `python3 -m http.server 8765`，浏览器打开 http://127.0.0.1:8765/preview.html 或 /components.html。
- 检查：`scripts/build-design-system.sh --check`（pre-commit 会自动运行；生成文件过期或对比度低于 WCAG 2.2 AA 会拒绝提交）。

## 注意
- 参考风格来自第三方设计，**参考图不存入本仓库**（版权）。这里只有从中提取的数值和我们自己的规则。
- 代码和设计稿里只引用 token 名，不写死十六进制或像素值。
