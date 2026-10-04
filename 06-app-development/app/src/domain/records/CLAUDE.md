# CLAUDE.md — 功能模块：records

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/records/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
已确认的记录、老人档案时间线、更正（Amended）、导出。（PRD：docs/PRD.md §4.4、护栏 G7）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 已确认的记录**不能删除或覆盖**，只能更正
- "近期情况汇总"只复述已确认记录，每句附来源；**不做趋势判断、风险评分或告警**（TGA）
- 保留期按 04-security/data-classification-and-retention.md；careKind 是过渡层还是记录系统待 ADR 决定

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `createRecord(confirmedDraft): Record`
- `amendRecord(record, change, reason, staff): Record` — 保留原版本和原因（护栏 G7）
- `getTimeline(residentId, range): Record[]`
- `exportForResident(residentId, range, format)` — 支持访问请求（APP 12）

## 测试与验收
- 更正流程、导出内容、租户隔离都要有测试

## 相关
- docs/PRD.md §4.4、护栏 G7
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
