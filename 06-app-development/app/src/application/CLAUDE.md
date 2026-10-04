# CLAUDE.md — 应用层（application）

> 层级：子部门 / 功能区 · 路径：`06-app-development/app/src/application/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
用例编排：StartShift、ProcessSegment、ConfirmDraft、AmendRecord、ExportRecord、GenerateHandover 等。调用 domain，通过接口使用 adapters。

## 在这里通常要做的事
- 在本层实现或修改代码

## 本目录特有的规则（在根目录规则之外）
- 一个用例一个文件，只做编排，不写业务规则
- 事务、权限检查、审计日志在这一层串起来

## 关键文件
- （技术栈确定后补充）

## 不要做
- 不要把业务规则写在这里（放回 domain）

## 相关
- ../CLAUDE.md（仓库）
- rules/02-code-rules.md §3
