# CLAUDE.md — design-system（设计 tokens 与预览）

Owner: Lightman (PO) · Status: Draft · Last reviewed: 11/10/2026

> 层级：子部门 / 功能区 · 路径：`06-app-development/design/design-system/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
设计系统的 tokens（唯一数值来源）、生成的 CSS 变量和预览页。规则在上一级的 `DESIGN.md`。

## 在这里通常要做的事
- 改 tokens 的数值，然后运行 `scripts/build-design-system.sh`
- 更新预览页

## 本目录特有的规则（在根目录规则之外）
- **改数值只改 `tokens.json`**，然后重新生成；`tokens.css` 和 `DESIGN.md` 里"tokens:begin/end"之间的表格是生成物，**不要手改**
- 新增颜色要在 `tokens.json` 的 `contrast` 里登记使用场景，对比度不达标（WCAG 2.2 AA）不能提交
- `source` 必须如实标注：measured（从参考图实测）/ derived（推导）/ proposed（提议，待确认）；**不要把 proposed 写成 measured**
- 参考图是第三方设计，不得存入仓库，也不得复制其照片、插画、Logo、文案
- 预览页和示例只用合成数据，不出现真实住户或员工信息
- 不新增评分、风险、趋势类组件（TGA 红灯，见 DESIGN.md §7.3）
- 改组件样式先改 `../COMPONENTS.md` 的规格，再改 components.css 和样例；改完在浏览器里用键盘测一遍

## 关键文件
- decoration-mini-*-v1.png / mini-decorations-prompts.json：六张轻线小装饰与实际提示词；#mini-decorations 提供真实小尺寸样张与下载。
- decorations.css / decoration-*-v1.png：品牌层装饰图；保持透明度与比例，不替代状态图标。
- decorations-prompts.json：实际 image_gen 提示词及原始素材出处。
- tokens.json
- tokens.css（生成）
- preview.html（风格总览）
- components.css（组件参考实现）

## 不要做
- 不要在代码或设计稿里写死十六进制颜色或像素值
- 不要手改生成的文件

## 相关
- ../DESIGN.md
- scripts/build-design-system.sh
- docs/prds/2026-10-11-carekind-design-system.md

## 11/10/2026 单页重制
- 首先查看 `preview.html`：Hero、Typography、主背景色、组件状态与布局均在同一页面。
- 品牌构图与标题共用 `editorial.css`；交互演示 `preview.js` 仅使用页面内存，不写入临床记录。
- 背景四主色已对原始附件做像素采样；字号与布局尺寸为推导值。

## 单页入口清理
- 删除独立旧组件样例页与文档 HTML 生成路径；唯一视觉入口为 `preview.html`。
- 保留 DESIGN.md / COMPONENTS.md 规格、tokens 和共享组件样式；生成脚本只更新 tokens.css 与 DESIGN.md 的 token 表格。
