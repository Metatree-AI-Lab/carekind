# CLAUDE.md — 接口层（interfaces）

> 层级：子部门 / 功能区 · 路径：`06-app-development/app/src/interfaces/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
API 路由和护士端 App 界面。

## 在这里通常要做的事
- 在本层实现或修改代码

## 本目录特有的规则（在根目录规则之外）
- 外部输入在这里用 schema 校验（只在边界校验）
- 界面文字跑 tga-boundary-check；目标 WCAG 2.2 AA
- 性能底线见 rules/02-code-rules.md §0.1（API p95 > 2 秒不合格）

## 关键文件
- （技术栈确定后补充）

## 不要做
- 不要在界面层写业务规则

## 相关
- ../CLAUDE.md（仓库）
- rules/02-code-rules.md §3
