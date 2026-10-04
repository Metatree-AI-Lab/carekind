# CLAUDE.md — 11 Workflows（工作流）

> 层级：部门 · 路径：`11-workflows/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
把多个 skill 串成的固定流程；runs/ 存放运行记录。Claude Code 和 Codex 都可以执行。

## 在这里通常要做的事
- 执行 workflow（run-workflow skill）
- 新增 workflow

## 本目录特有的规则（在根目录规则之外）
- 遇到 🧑 人工确认要停下
- 无人值守运行不能越过人工确认步骤
- 每次运行在 runs/ 写记录

## 关键文件
- README.md
- *.md（各 workflow）
- runs/

## 不要做
- 不要在无人值守模式下执行 incident-response

## 相关
- 12-skills/
- scripts/run-workflow.sh
