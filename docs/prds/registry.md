# PRD 登记表 (PRD Registry)

Owner: Lightman (PO) · Last reviewed: 11/10/2026
Parent: [`docs/PRD.md`](../PRD.md) · 规则：[`rules/06-adlc-rules.md`](../../rules/06-adlc-rules.md)

> **所有 PRD 的阶段和 assignee 以这里为准。** 每个 PRD 一行，assignee 有且仅有一个人。
> 用 `prd-assign`（分配）和 `prd-status`（推进阶段）修改；手动改也可以，但要同步追加"变更历史"。
> `scripts/check-prd-registry.sh` 会检查格式（pre-commit 自动运行）。**表格列顺序不要改。**

阶段：`idea` → `draft` → `in_review` → `approved` → `in_progress` → `verifying` → `released` → `done`；另有 `cancelled` / `superseded`。

## 登记表
| PRD | 标题 | 阶段 | Assignee | Reviewer | 复杂度 | 风险 | Parent | Blocked | 更新 |
|---|---|---|---|---|---|---|---|---|---|
| 2026-10-04-shift-capture-and-resident-records | Shift Capture + 按老人分配 + 老人档案 | draft | Lin | — | {{TBD}} | R3 | — | — | 11/10/2026 |
| 2026-10-11-adlc-prd-lifecycle | ADLC：PRD 生命周期、分配与状态管理 | draft | Lightman | — | M | R1 | — | — | 11/10/2026 |

列说明：
- **PRD**：`docs/prds/` 下的文件名（不含 `.md`）。
- **Assignee**：`member-profiles.md` 里的一个姓名。
- **Reviewer**：R3 必填，且不能等于 Assignee；`—` 表示尚未指定。
- **复杂度**：S / M / L；**风险**：R1 / R2 / R3（评分方法见规则 §3）。
- **Parent**：拆分出来的子 PRD 填父 PRD 文件名，否则 `—`。
- **Blocked**：`—`，或 `原因 · 等谁 · 复查日期`。

## 变更历史（只追加，不改旧行）
| 日期 | PRD | 变更 | 原因 / 依据 | 确认人 |
|---|---|---|---|---|
| 11/10/2026 | 2026-10-04-shift-capture-and-resident-records | 登记：draft，assignee = Lin | 迁移自该 PRD 头部的 `Tech: Lin (Tech Lead)`；**⚠️ 待 Lightman 确认这就是 assignee**；复杂度待评 | — |
| 11/10/2026 | 2026-10-11-adlc-prd-lifecycle | 登记：draft，assignee = Lightman（docs-ops 类 PRD） | 本 PRD 由 Lightman 提出；落地开发阶段需要重新分配（见该 PRD §12） | — |
