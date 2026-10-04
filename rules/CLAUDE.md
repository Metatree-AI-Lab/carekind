---
paths:
  - "rules/**"
---

# CLAUDE.md — rules（规范）

> 层级：部门 · 路径：`rules/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
公司、运营、代码、产品设计、PRD 规范和法律参考对照表。Claude Code 通过 .claude/rules 自动加载。

## 在这里通常要做的事
- 修改规范（需要 ADR + Lightman 批准；代码规范还需要 Lin）

## 本目录特有的规则（在根目录规则之外）
- 每个规范文件用 frontmatter 的 paths 控制加载范围，避免占用上下文
- 改规范后同步检查 AGENTS.md 的规范表

## 关键文件
- README.md
- 00-company-rules.md … 04-prd-rules.md
- legal-reference-map.md

## 不要做
- 不要未经批准修改规范

## 相关
- AGENTS.md
