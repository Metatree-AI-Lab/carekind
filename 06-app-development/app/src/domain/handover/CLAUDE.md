# CLAUDE.md — 功能模块：handover

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/handover/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
班末生成 ISBAR 交接摘要。（PRD：docs/PRD.md §7.4）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 只使用本班**已确认**的记录
- 排序：Tier 3 事件 → Tier 2 变化 → 未记录的老人

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `buildHandover(confirmedRecords, scope): HandoverDraft` — S、B 复述已确认记录；A、R 只用 RN 原话，没有就"请填写"
- `acknowledgeHandover(handover, receiver)` — 下一班确认接收（留痕）

## 测试与验收
- 生成时间 ≤ 10 秒（性能底线 > 30 秒不合格）

## 相关
- docs/PRD.md §7.4
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
