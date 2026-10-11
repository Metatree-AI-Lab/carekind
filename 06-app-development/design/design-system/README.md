# design-system — 设计 tokens 与预览

Owner: Lightman (PO) · Assignee: Gary · Status: Draft · Last reviewed: 11/10/2026

careKind AI 设计系统的**数值来源**和预览。规则和用法在上一级的 [`../DESIGN.md`](../DESIGN.md)。

## 内容
- `decoration-mini-*-v1.png` — 六张更轻的笑脸、爱心、植物等小装饰；见 [Mini decoration](preview.html#mini-decorations)，提示词见 `mini-decorations-prompts.json`。
- `decorations.css` / `decoration-*-v1.png` — 四张透明底装饰图及 token 样式，见 `preview.html#decorations`；`decorations-prompts.json` 保留生成出处。
- `tokens.json` — **所有设计数值的唯一来源**（颜色、字体、间距、圆角、阴影、尺寸、动效、对比度要求）
- `tokens.css` — 由脚本从 tokens.json **生成**的 CSS 变量，不要手改
- `preview.html` — 风格总览（引用 tokens.css，内容全部是合成示例）
- `components.css` — 组件的参考实现（类名前缀 `ck-`，只用 token；先引入 tokens.css）

## 怎么用
- 改数值：编辑 `tokens.json`，运行 `scripts/build-design-system.sh`，把 `tokens.css` 和 `DESIGN.md` 一起提交。
- 看预览：从仓库根目录启动本地 HTTP server，然后打开 /06-app-development/design/design-system/preview.html。
- 检查：`scripts/build-design-system.sh --check`（pre-commit 会自动运行；生成文件过期或对比度低于 WCAG 2.2 AA 会拒绝提交）。

## 注意
- 参考风格来自第三方设计，**参考图不存入本仓库**（版权）。这里只有从中提取的数值和我们自己的规则。
- 代码和设计稿里只引用 token 名，不写死十六进制或像素值。

## 11/10/2026 单页重制
- 首先查看 `preview.html`：Hero、Typography、主背景色、组件状态与布局均在同一页面。
- 品牌构图与标题共用 `editorial.css`；交互演示 `preview.js` 仅使用页面内存，不写入临床记录。
- 全局画布与内页均为白色；参考图米色仅为展示底板，不用于页面背景。白色、浅灰、黑色已采样；字号与布局尺寸为推导值。

## 单页入口清理
- 删除独立旧组件样例页与文档 HTML 生成路径；唯一视觉入口为 `preview.html`。
- 保留 DESIGN.md / COMPONENTS.md 规格、tokens 和共享组件样式；生成脚本只更新 tokens.css 与 DESIGN.md 的 token 表格。
