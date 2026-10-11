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
| 2026-10-11-carekind-design-system | careKind AI 设计系统（含 DS-1…DS-6 六个工作包） | draft | Gary | Lin | L | R3 | — | Logo 与最终品牌主色待定（视觉风格已选定，见 DESIGN.md） · 等 Lightman · 18/10/2026 | 11/10/2026 |

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
| 11/10/2026 | 2026-10-11-carekind-design-system | 合并：DS-1…DS-6 不再单独登记，作为 6 个工作包并入同一个 PRD；删除登记表里 6 个 idea 行（上面的历史行保留不动） | Lightman 要求"整个任务分配给一个人，整个 PRD 分配给一个人" | Lightman |
| 11/10/2026 | 2026-10-11-carekind-design-system | **指定覆盖** assignee: Lightman → Gary；reviewer: — → Lin | 覆盖的规则：junior × L（复杂度 7）、junior × R3（含临床确认与 AI 内容模式）、方向（含 frontend、DevOps 工作包，超出 product-ux）。Lightman 的原因：设计系统整体由 Gary 负责（产品思维、审美）。重新评分：范围 2 + 技术面 1 + 不确定性 2 + 依赖 2 = 7，L；R3。缓解：Lin（senior）为 reviewer，参与设计评审和每个 PR；Lin 同时负责 ADR-0001；DS-6 工具链由 Windston 协助（级别待确认）；品牌视觉与 DS-3 语言规范的业务确认由 Lightman 负责；卡点超过 2 个工作日升级给 Lin；Gary 的 WIP 1/1，未超限 | Lightman（对话中指定） |
| 11/10/2026 | 2026-10-11-carekind-design-system | 卡点更新：视觉风格已由 Lightman 选定；DS-1 产出 DESIGN.md、tokens.json、生成脚本和预览页（draft 状态，待 Lin 设计评审） | Lightman 提供两张参考图并要求保存为设计系统和 DESIGN.md 作为设计规范 SoT；颜色从参考图实测，标注 measured / derived / proposed；仍待定：Logo、最终品牌主色、品牌字体 | Lightman（对话中选定风格） |
