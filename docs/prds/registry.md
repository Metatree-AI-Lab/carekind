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
| 2026-10-11-carekind-design-system | careKind AI 设计系统（总 PRD · 任务拆分与分配） | draft | Lightman | — | M | R1 | — | — | 11/10/2026 |
| 2026-10-11-ds-foundations | DS-1 视觉基础与 design tokens | idea | Gary | — | S | R1 | 2026-10-11-carekind-design-system | 品牌视觉（Logo/主色/字体）未定 · 等 Lightman · 18/10/2026 | 11/10/2026 |
| 2026-10-11-ds-component-specs | DS-2 通用组件规格 | idea | Gary | — | S | R1 | 2026-10-11-carekind-design-system | Gary WIP 上限 1 · 等 ds-foundations 完成 · DS-1 完成后 | 11/10/2026 |
| 2026-10-11-ds-content-guidelines | DS-3 内容与语言规范 | idea | Lightman | — | S | R2 | 2026-10-11-carekind-design-system | Lightman WIP 已满 · 等 Lightman 确认例外或 ADLC PRD 进入 in_review · 18/10/2026 | 11/10/2026 |
| 2026-10-11-ds-clinical-patterns | DS-4 临床确认与 AI 内容模式 | idea | — | — | M | R3 | 2026-10-11-carekind-design-system | 无满足条件的 senior 容量、缺第二位评审人 · 等 Lightman（总 PRD Q3、Q6）· 18/10/2026 | 11/10/2026 |
| 2026-10-11-ds-component-library | DS-5 代码组件库 | idea | — | — | L | R3 | 2026-10-11-carekind-design-system | 等 ADR-0001 技术栈 · 等 Lin · ADR 完成后 | 11/10/2026 |
| 2026-10-11-ds-tooling | DS-6 设计系统工程与质量工具 | idea | — | — | L | R2 | 2026-10-11-carekind-design-system | 等 ADR-0001 + Windston 的 level · 等 Lightman/Lin · ADR 完成后 | 11/10/2026 |

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
| 11/10/2026 | 2026-10-11-carekind-design-system | 登记：draft，assignee = Lightman（docs-ops 类总 PRD） | 总 PRD 只含范围、拆分和分配，docs-ops 通过规则 §5 过滤；Lightman 的 WIP 因此达到 2 | Lightman（对话中要求"分配好"，按推荐记录） |
| 11/10/2026 | 2026-10-11-ds-foundations | 登记：idea，assignee = Gary | prd-assign 评分 85/100（方向 40 + 级别 25 + 负载 20 + 连续 0）；S、R1，junior 可接；唯一通过过滤的成员 | Lightman（同上；可随时否决） |
| 11/10/2026 | 2026-10-11-ds-component-specs | 登记：idea，assignee = Gary（排队） | S、R1，方向匹配；但 Gary WIP 上限 1，需 DS-1 完成后才能进入 draft | Lightman（同上） |
| 11/10/2026 | 2026-10-11-ds-content-guidelines | 登记：idea，assignee = Lightman（排队） | docs-ops，只有 Lightman 通过过滤；进入 draft 需要他的 WIP 例外或 ADLC PRD 进入 in_review | Lightman（同上；**⚠️ 待确认 WIP 例外**） |
| 11/10/2026 | 2026-10-11-ds-clinical-patterns | 登记：idea，assignee = —（无推荐） | M、R3：junior 不可；Lin 是唯一 senior，但 primary_tracks 未填、可能无 WIP 容量、且没有第二位 senior 评审；规则不允许放宽 | — |
| 11/10/2026 | 2026-10-11-ds-component-library | 登记：idea，assignee = —（无推荐） | L、R3，只有 senior 可接；依赖 ADR-0001 技术栈 | — |
| 11/10/2026 | 2026-10-11-ds-tooling | 登记：idea，assignee = —（无推荐） | 方向最匹配 Windston，但 level 未填，规则不允许猜；依赖 ADR-0001 | — |
