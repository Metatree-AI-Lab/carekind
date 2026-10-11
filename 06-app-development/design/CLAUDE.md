# CLAUDE.md — 设计

Owner: Lightman (PO) · Status: Draft · Last reviewed: 11/10/2026

> 层级：子部门 / 功能区 · 路径：`06-app-development/design/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
UX 原则、无障碍、设计系统。

## 在这里通常要做的事
- 设计界面和交互
- 检查界面文字

## 本目录特有的规则（在根目录规则之外）
- 界面文字跑 tga-boundary-check
- 目标 WCAG 2.2 AA
- 为戴手套、单手、被打断、Wi-Fi 差、英语非母语的场景设计
- **以 DESIGN.md 为准**；代码和设计稿里只引用 token 名；不提供评分、风险、趋势类组件
- 参考图不入库（版权）；插画和照片只用自己创作 / 授权 / 合成的素材

## 关键文件
- **DESIGN.md**（设计规范 SoT：做任何界面、组件、插画、文案之前先读）
- **COMPONENTS.md**（组件规格 SoT：做界面前先找现成组件；新组件先补规格再实现）
- design-system/components.css（参考实现，ck- 前缀，只用 token）；交互样例统一在 design-system/preview.html
- design-system/（tokens.json 是数值唯一来源；改完运行 scripts/build-design-system.sh）
- decorations-2026-10-11/：四张原创场景配图与生成出处；统一预览和小配图库在 [Decoration](design-system/preview.html#decorations)。
- ux-principles.md

## 不要做
- 不要在设计稿里使用真实住户信息

## 相关
- rules/03-product-design-rules.md

## 11/10/2026 单页重制
- 首先查看 `design-system/preview.html`：Hero、Typography、主背景色、组件状态与布局均在同一页面。
- 品牌构图与标题共用 `design-system/editorial.css`；交互演示 `preview.js` 仅使用页面内存，不写入临床记录。
- 背景四主色已对原始附件做像素采样；字号与布局尺寸为推导值。

## 单页入口清理
- 删除独立旧组件样例页与文档 HTML 生成路径；唯一视觉入口为 `design-system/preview.html`。
- 保留 DESIGN.md / COMPONENTS.md 规格、tokens 和共享组件样式；生成脚本只更新 tokens.css 与 DESIGN.md 的 token 表格。
