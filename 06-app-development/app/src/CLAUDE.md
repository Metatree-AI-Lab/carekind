# CLAUDE.md — src（源代码根目录）

> 层级：子部门 / 功能区 · 路径：`06-app-development/app/src/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
四层结构：domain（业务规则）、application（用例）、adapters（外部系统）、interfaces（API 和界面）。

## 在这里通常要做的事
- 确定代码应该放在哪一层

## 本目录特有的规则（在根目录规则之外）
- 依赖方向只能从外向内：interfaces → application → domain；adapters 实现 domain 的接口
- 新功能先在 domain/ 下建模块目录（含 CLAUDE.md + README.md）

## 关键文件
- domain/
- application/
- adapters/
- interfaces/

## 不要做
- 不要新建 utils/ 杂物间；通用代码放 shared/ 前先确认至少有两个模块在用

## 相关
- ../CLAUDE.md（仓库）
- rules/02-code-rules.md §3
