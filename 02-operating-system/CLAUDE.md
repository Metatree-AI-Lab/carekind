# CLAUDE.md — 02 Operating System（怎么运转）

> 层级：部门 · 路径：`02-operating-system/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
运营节奏、合规日历、决策机制、公司级决策日志（ADR）、指标定义。

## 在这里通常要做的事
- 新建公司级 ADR（用 adr skill）
- 更新合规日历
- 维护指标定义

## 本目录特有的规则（在根目录规则之外）
- 重大决策（股权、供应商、进入 SaMD、招聘、隐私例外）必须写 ADR
- ADR 编号递增、4 位数字，新增后更新 decisions/README.md 索引

## 关键文件
- operating-cadence.md
- decision-making.md
- decisions/
- metrics.md

## 不要做
- 不要修改已 Accepted 的 ADR 内容；要改就写新 ADR 并标注 Superseded

## 相关
- 09-templates/adr-template.md
- 06-app-development/engineering/adr/（技术类 ADR）
