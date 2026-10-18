# 设计

Owner: Lightman (PO) · Status: Draft · Last reviewed: 11/10/2026

## 用途
UX 原则、无障碍、设计系统。

## 内容
- **DESIGN.md** — 设计规范（Source of Truth）：风格、tokens、排版、组件、状态与 AI 内容、无障碍、文案
- **COMPONENTS.md** — 组件规格（Source of Truth）：每个常用组件的用途、变体、状态、键盘与无障碍、文案
- design-system/ — tokens.json（数值唯一来源）、生成的 tokens.css、预览页
- decorations-2026-10-11/：四张原创场景配图与生成出处；统一预览和小配图库在 [Decoration](design-system/preview.html#decorations)。
- ux-principles.md

## 怎么用
- 界面文字上线前跑 tga-boundary-check

## 11/10/2026 单页重制
- 首先查看 `design-system/preview.html`：Hero、Typography、主背景色、组件状态与布局均在同一页面。
- 品牌构图与标题共用 `design-system/editorial.css`；交互演示 `preview.js` 仅使用页面内存，不写入临床记录。
- 全局画布与内页均为白色；参考图米色仅为展示底板，不用于页面背景。白色、浅灰、黑色已采样；字号与布局尺寸为推导值。

## 单页入口清理
- 删除独立旧组件样例页与文档 HTML 生成路径；唯一视觉入口为 `design-system/preview.html`。
- 保留 DESIGN.md / COMPONENTS.md 规格、tokens 和共享组件样式；生成脚本只更新 tokens.css 与 DESIGN.md 的 token 表格。

## 后台视觉统一（18/10/2026）

Owner: Lightman · Status: Local revision · Last reviewed: 18/10/2026

后台视觉修订、法律依据、真实页面截图与限制见 [admin-review-2026-10-18.md](admin-review-2026-10-18.md)。CSS 母版同步至 shared，未提交或部署。

## 图片与动效（18/10/2026）
Owner: Lightman · Status: Local revision · Last reviewed: 18/10/2026

插画与界面动效的范围、素材出处和验证见 [art-motion-review-2026-10-18.md](art-motion-review-2026-10-18.md)。
