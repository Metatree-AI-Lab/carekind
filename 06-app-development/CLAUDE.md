# CLAUDE.md — 06 App Development（App 开发）

> 层级：部门 · 路径：`06-app-development/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
产品原则与路线图、临床安全（危害日志、评测）、工程（架构、规范、发布、技术 ADR）、设计、用户研究，以及 App 代码仓库 app/（**git submodule**，独立私有仓库 `Metatree-AI-Lab/carekind-app`；改代码要先在 submodule 里提交推送，再在 meta repo 提交指针）。产品做什么以 docs/PRD.md 为准。

## 在这里通常要做的事
- 实现功能：先读 docs/PRD.md §6 产品逻辑和 §9 护栏
- 写技术 ADR
- 更新危害日志（只能标 Proposed）
- 设计 AI 评测

## 本目录特有的规则（在根目录规则之外）
- 代码规范：rules/02-code-rules.md（16 条核心要求、Tab 缩进 4、单文件 ≤ 1000 行）
- 产品设计：rules/03-product-design-rules.md（必须查本地法律文件）
- PRD 放在 docs/prds/，不放这里
- 新增危害只能标 Proposed，由临床顾问接受

## 关键文件
- product/
- clinical-safety/
- engineering/
- design/
- research/
- app/（代码仓库）

## 不要做
- 不要实现 TGA 红灯功能（诊断、风险评分、治疗建议、数值报警）
- 不要使用真实住户数据做测试或评测

## 相关
- docs/PRD.md
- rules/02-code-rules.md
- 11-workflows/feature-to-release.md
