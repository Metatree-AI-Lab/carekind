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
| 2026-10-18-event-to-multi-document-drafting | 说一次，处处归档：一个事件 → 多份关联文书草稿 | idea | — | — | L | R3 | — | assignee 待定 · 等 Lightman · 25/10/2026 | 18/10/2026 |
| 2026-10-18-tiered-review-and-audit-trail | 分级审核（PCW → RN，Tier 1/2/3）与证据级审计链 | idea | — | — | L | R3 | — | 律师意见（知悉时间、工作场所监控、APP 1.7–1.9）· 等 Lightman · 25/10/2026 | 18/10/2026 |
| 2026-10-18-isbar-handover-and-care-coverage | ISBAR 交接 + 跨班次事项 + 覆盖视图 | idea | — | — | M | R3 | — | assignee 待定 · 等 Lightman · 25/10/2026 | 18/10/2026 |
| 2026-10-18-multilingual-dictation-and-person-centred-language | 母语口述 → 澳式英语记录 + person-centred 改写 | idea | — | — | L | R3 | — | 首批语种待试点问卷；境内 ASR 待 spike · 等 Lightman · 25/10/2026 | 18/10/2026 |
| 2026-10-18-record-export-and-cms-integration | 已确认记录导出与 CMS 集成 | idea | — | — | L | R3 | — | 首个 CMS 待 ADR · 等 Lightman / Lin · 25/10/2026 | 18/10/2026 |
| 2026-10-18-demo-workspace-and-synthetic-data | Demo 工作区与合成示例数据 | idea | — | — | M | R2 | — | 部署方式待 ADR（隔离租户则升 R3）· 等 Lin · 25/10/2026 | 18/10/2026 |
| 2026-10-18-super-admin-multi-facility-console | Super Admin：careKind 内部多机构管理与配置（独立 React app） | idea | — | — | L | R3 | — | 第二批准人、break-glass、计价单位待定 · 等 Lightman · 25/10/2026 | 18/10/2026 |
| 2026-10-18-provider-portal-facility-admin | 机构管理端：多院员工 / 住户 / 流程管理 + business owner 看板 | idea | — | — | L | R3 | — | Owner 临床内容权限、独立 app 与否、MVP 切分待定 · 等 Lightman · 25/10/2026 | 18/10/2026 |
| 2026-10-18-marketing-website | Marketing website（纯 HTML + CSS，脚本用 TypeScript） | idea | — | — | M | R2 | — | 域名、实体名 / ABN、隐私政策律师审核待定 · 等 Lightman · 25/10/2026 | 18/10/2026 |
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
| 11/10/2026 | 2026-10-11-carekind-design-system | 进展：DS-2 第一批完成（COMPONENTS.md + components.css + components.html），阶段不变（draft） | Lightman 要求"常用的所有组件根据 DESIGN.md 完成标准化设计"；第二批（Combobox、日期 / 时间、抽屉）与 DS-4 的临床模式未做；进入 in_review 前仍需 Lin 设计评审 | Lightman（对话中要求） |
| 18/10/2026 | 2026-10-18-event-to-multi-document-drafting | 登记：idea，assignee = —（待 Lightman 确认） | AI agent 按 Lightman 要求（分析产品功能和解决方案，分别写出对应的 PRD）起草了 PRD 文件（Status: Draft）；复杂度和风险是 PRD 里的建议值；进入 draft 前需按 prd-assign 分配并由 Lightman 确认 | — |
| 18/10/2026 | 2026-10-18-tiered-review-and-audit-trail | 登记：idea，assignee = —（待 Lightman 确认） | AI agent 按 Lightman 要求（分析产品功能和解决方案，分别写出对应的 PRD）起草了 PRD 文件（Status: Draft）；复杂度和风险是 PRD 里的建议值；进入 draft 前需按 prd-assign 分配并由 Lightman 确认 | — |
| 18/10/2026 | 2026-10-18-isbar-handover-and-care-coverage | 登记：idea，assignee = —（待 Lightman 确认） | AI agent 按 Lightman 要求（分析产品功能和解决方案，分别写出对应的 PRD）起草了 PRD 文件（Status: Draft）；复杂度和风险是 PRD 里的建议值；进入 draft 前需按 prd-assign 分配并由 Lightman 确认 | — |
| 18/10/2026 | 2026-10-18-multilingual-dictation-and-person-centred-language | 登记：idea，assignee = —（待 Lightman 确认） | AI agent 按 Lightman 要求（分析产品功能和解决方案，分别写出对应的 PRD）起草了 PRD 文件（Status: Draft）；复杂度和风险是 PRD 里的建议值；进入 draft 前需按 prd-assign 分配并由 Lightman 确认 | — |
| 18/10/2026 | 2026-10-18-record-export-and-cms-integration | 登记：idea，assignee = —（待 Lightman 确认） | AI agent 按 Lightman 要求（分析产品功能和解决方案，分别写出对应的 PRD）起草了 PRD 文件（Status: Draft）；复杂度和风险是 PRD 里的建议值；进入 draft 前需按 prd-assign 分配并由 Lightman 确认 | — |
| 18/10/2026 | 2026-10-18-demo-workspace-and-synthetic-data | 登记：idea，assignee = —（待 Lightman 确认） | AI agent 按 Lightman 要求（分析产品功能和解决方案，分别写出对应的 PRD）起草了 PRD 文件（Status: Draft）；复杂度和风险是 PRD 里的建议值；进入 draft 前需按 prd-assign 分配并由 Lightman 确认 | — |
| 18/10/2026 | 2026-10-18-super-admin-multi-facility-console | 登记：idea，assignee = —（待 Lightman 确认） | Lightman 要求第一阶段加入 super admin 与养老院管理端，只写 PRD、不开发；AI agent 起草（Status: Draft）；复杂度与风险为 PRD 建议值 | — |
| 18/10/2026 | 2026-10-18-provider-portal-facility-admin | 登记：idea，assignee = —（待 Lightman 确认） | Lightman 要求第一阶段加入 super admin 与养老院管理端，只写 PRD、不开发；AI agent 起草（Status: Draft）；复杂度与风险为 PRD 建议值 | — |
| 18/10/2026 | 2026-10-18-marketing-website | 登记：idea，assignee = —（待 Lightman 确认） | Lightman 要求补一个宣传 careKind 的 marketing website，只写 PRD；技术栈纯 HTML（不用 Next.js），脚本统一 TypeScript；AI agent 起草（Status: Draft） | — |
| 18/10/2026 | 2026-10-18-super-admin-multi-facility-console | 备注：Lightman 指示第一阶段只做管理端并立即开发（阶段仍为 idea） | 门禁未满足：assignee 未定、未审批（rules/06 §2）；AI 按 PRD 写代码到本地 submodule，未提交；开发默认值见 engineering/adr/0006（Proposed） | Lightman（对话中指示） |
| 18/10/2026 | 2026-10-18-provider-portal-facility-admin | 备注：Lightman 指示第一阶段只做管理端并立即开发（阶段仍为 idea） | 门禁未满足：assignee 未定、未审批（rules/06 §2）；AI 按 PRD 写代码到本地 submodule，未提交；开发默认值见 engineering/adr/0006（Proposed） | Lightman（对话中指示） |
