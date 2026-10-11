# CLAUDE.md — 设计

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
- DESIGN.html（**生成物**，给人看；改 DESIGN.md 后运行 scripts/build-design-system.sh，不要手改）
- design-system/（tokens.json 是数值唯一来源；改完运行 scripts/build-design-system.sh）
- ux-principles.md

## 不要做
- 不要在设计稿里使用真实住户信息

## 相关
- rules/03-product-design-rules.md
