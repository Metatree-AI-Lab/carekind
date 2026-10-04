# CLAUDE.md — 功能模块：review

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/review/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
草稿审核状态机：Drafted → PendingPCW / PendingRN → Confirmed / Returned。（PRD：docs/PRD.md §6.3、§7.2）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 没有人工确认，草稿不能变成记录（护栏 G1）
- Tier 3 必须逐条确认，不能批量（护栏 G5）
- 每个操作都要写 ReviewAction（操作人、操作、差异、时间）

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `submitForReview(draft)` — 按 tiering 路由到 PCW 或 RN
- `confirm(draft, staff)` — 校验 canConfirm，写审计日志
- `returnWithComment(draft, rn, comment)` — 退回必须有批注
- `reassign / split / merge` — 改归属、拆分、合并，全部留痕

## 测试与验收
- 状态机转换、权限、审计日志都要有测试

## 相关
- docs/PRD.md §6.3、§7.2
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
