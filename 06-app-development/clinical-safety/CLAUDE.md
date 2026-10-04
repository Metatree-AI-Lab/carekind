# CLAUDE.md — 临床安全

> 层级：子部门 / 功能区 · 路径：`06-app-development/clinical-safety/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
临床安全案例、危害日志、AI 评测方案。临床顾问是 Owner，有发布否决权。

## 在这里通常要做的事
- 提出新危害（Proposed）
- 设计评测场景和指标

## 本目录特有的规则（在根目录规则之外）
- 危害只能由临床顾问改为接受
- 评测数据只用合成数据
- 发布门槛由临床顾问 + Lin 签字

## 关键文件
- clinical-safety-case.md
- hazard-log.md
- evaluation-plan.md

## 不要做
- 不要自行降低风险等级或删除危害

## 相关
- docs/PRD.md §9
- 03-legal-compliance/ai-governance.md
