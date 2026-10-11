# CLAUDE.md — 功能 PRD

> 层级：子部门 / 功能区 · 路径：`docs/prds/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
功能级详细规格：法律依据、TGA 检查、隐私影响、临床危害、评测、上线计划。

## 在这里通常要做的事
- 新建功能 PRD（prd-writer skill）
- 分配 / 查看 / 推进 PRD（prd-assign、prd-status skill，规则 rules/06-adlc-rules.md）

## 本目录特有的规则（在根目录规则之外）
- 文件名 YYYY-MM-DD-<slug>.md
- 开头写 Parent: docs/PRD.md
- 新危害标 Proposed
- 每个 PRD 必须在 registry.md 有且仅有一行，assignee 只能是一个人（不能是 AI agent）
- `approved` / `released` 只有人能设；agent 收集证据后停下等 Lightman

## 关键文件
- registry.md（阶段与 assignee 的唯一来源）
- 2026-10-11-adlc-prd-lifecycle.md
- 2026-10-11-carekind-design-system.md（设计系统总 PRD；子 PRD DS-1…DS-6 先在 registry 登记为 idea，尚无文件）
- 2026-10-04-shift-capture-and-resident-records.md

## 不要做
- 不要省略"法律依据"一节

## 相关
- rules/06-adlc-rules.md
- 05-hr-teams/member-profiles.md
- 06-app-development/product/prd-template.md
