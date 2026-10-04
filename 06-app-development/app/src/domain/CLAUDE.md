# CLAUDE.md — 领域层（domain）

> 层级：子部门 / 功能区 · 路径：`06-app-development/app/src/domain/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
纯业务规则：按功能模块分目录。不依赖框架、数据库、HTTP、供应商 SDK。

## 在这里通常要做的事
- 在本层实现或修改代码

## 本目录特有的规则（在根目录规则之外）
- 每个子目录是一个功能模块，必须有 CLAUDE.md + README.md
- 业务规则（阈值、分级、保留期）只定义一次，放在模块的 policy 文件里
- 领域层单元测试覆盖率 ≥ 90%

## 关键文件
- （技术栈确定后补充）

## 不要做
- 禁止 import adapters/ 或 interfaces/
- 禁止 any

## 相关
- ../CLAUDE.md（仓库）
- rules/02-code-rules.md §3
