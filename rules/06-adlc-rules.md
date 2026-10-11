---
paths:
  - "docs/**"
  - "12-skills/prd-*/**"
  - "05-hr-teams/member-profiles.md"
  - "02-operating-system/standups/**"
---

# ADLC 规范：PRD 生命周期与分配 (Agent Development Lifecycle Rules)

Owner: Lightman (PO) · Last reviewed: 11/10/2026（§1 第 7 条、§3.1、§5.1 修订：整体分配与指定覆盖）· 适用：所有 PRD、所有 AI agent、所有被分配 PRD 的成员
规格来源：[`docs/prds/2026-10-11-adlc-prd-lifecycle.md`](../docs/prds/2026-10-11-adlc-prd-lifecycle.md)。**本文件是阶段、门禁、分配参数的唯一来源**，PRD 和 skill 引用这里，不重复写数值。

> ADLC = AI agent 参与每个阶段（起草、实现、评测、复核）的开发生命周期；**人负责决定和签字，agent 负责执行**。

## 1. 铁律
1. **每个 PRD 有且仅有一个 assignee**（一个人，不是团队、不是 AI agent、不是 "A/B"）。`idea` 以外的任何阶段都不能空缺。
2. **assignee 是责任人，不是唯一动手的人。** 他可以指挥 agent、请别人帮忙，但对该 PRD 能不能走到 `released` 负责。
3. **AI agent 不能当 assignee、reviewer 或 approver。** 审批类状态（`approved`、`released`）只能由人修改。
4. **reviewer ≠ assignee。**
5. 状态和 assignee 的唯一来源是 [`docs/prds/registry.md`](../docs/prds/registry.md)。PRD 文件头部的 `Status:` 只表示**文档审批状态**（Draft / Review / Approved），不要在两处各记一份生命周期阶段。
6. 分配建议由 `prd-assign` skill 给出，**最终分配必须由 Lightman 确认**（🧑）。重新分配同样要确认，并留下记录。
7. **一个 PRD 整体分配给一个人**，不按技术方向把同一个 PRD 拆给多个 assignee。跨方向的 PRD 由 assignee 统一负责、统一协调；需要别人帮忙的部分写在备注里（协助者不承担责任）。只有 Lightman 明确决定拆分时才拆成子 PRD。

## 2. 生命周期阶段
| 阶段 id | 含义 | 进入条件（门禁） | 谁能推进 |
|---|---|---|---|
| `idea` | 想法已登记，还没有 PRD | 在 registry 登记一行 | 任何人 |
| `draft` | 正在写 PRD | 已有 assignee（`prd-assign`，🧑 Lightman 确认）；已用 `prd-writer` 创建文件 | assignee |
| `in_review` | PRD 写完，等审 | 必填章节齐全（法律依据、TGA、隐私、危害、评测）；`legal-reference-check` 和 `tga-boundary-check` 已跑；TGA 为 🔴 则不能进入 | assignee 提交 |
| `approved` | PRD 已批准，可以开发 | 🧑 产品（Lightman）+ Tech Lead（Lin）；有新危害或改变 AI 行为时还要 🧑 临床顾问；PRD 头部 `Status` 同步改为 Approved | **只有人** |
| `in_progress` | 开发中（agent 辅助） | 已确定 reviewer；需要技术决策的已有 ADR；PRD 里的开放问题已关闭或有 Owner | assignee |
| `verifying` | 测试、AI 评测、临床验证 | 代码已合并到 staging；涉及 AI 的评测报告已出 | assignee |
| `released` | 已发布 | 🧑 Lightman 发布；临床相关变更有临床顾问签字；影响记录格式或 AI 行为的变更已按 `release-process.md` 通知客户 | **只有人** |
| `done` | 发布后监控 48 小时无 P1，PRD 归档 | 监控结论已写入 PRD 变更记录 | assignee + Lightman |
| `cancelled` / `superseded` | 取消 / 被新 PRD 取代 | 🧑 Lightman 决定，写明原因（`superseded` 要写新 PRD） | Lightman |

- **回退**：`in_review → draft`（审核打回）、`verifying → in_progress`（测试不通过）可随时发生，在历史里记原因。其他阶段不能跳级。
- **blocked** 不是阶段，是 registry 里的一个标记列：写明被什么卡住、等谁、什么时候复查。blocked 超过 5 个工作日要在周会上提出。
- 阶段变更、assignee 变更都必须在 registry 的"变更历史"末尾**追加**一行；只追加，不改历史。

## 3. 分配规则：PRD 的两个评分
`prd-assign` 先给 PRD 打两个分，人可以改，但要写理由。

### 3.1 复杂度（Complexity）：四项相加，0–8
| 维度 | 0 | 1 | 2 |
|---|---|---|---|
| 范围 | 单个模块 | 跨 2–3 个模块 | 跨 4 个以上模块，或新增子系统 |
| 技术面 | 只有文档 / 配置 / UI 文字 | 前后端都要动 | AI 管线、语音转写、LLM、多租户、鉴权 |
| 不确定性 | 方案清楚 | 需要 spike 或 ADR | 需要新技术选型，或集成外部系统 |
| 依赖 | 无 | 1–2 个 PRD 或外部依赖 | 3 个以上，或会阻塞其他 PRD |

档位：**S = 0–2，M = 3–5，L = 6–8**。

**默认不拆分**：L 且需要 3 个以上方向（track）的 PRD，也整体交给一个人。`prd-assign` 只**提示**"跨方向多，建议安排协助者"，并列出可协助的成员；是否拆成子 PRD 由 Lightman 决定（拆了才用 registry 的 `Parent` 列，每个子 PRD 各有一个 assignee）。PRD 内部可以分成多个**工作包**，它们不是独立的 PRD，也不单独分配。

### 3.2 风险等级（Risk）：独立于复杂度，取最高的一项
| 等级 | 触及什么 |
|---|---|
| **R3 高** | 临床记录的写入或确认路径；老人归属（G4）；AI 生成行为或提示词；租户隔离、鉴权；健康数据存储；TGA 🟡 的功能；`docs/PRD.md` §9 护栏的任何一条 |
| **R2 中** | 新的个人信息流、日志、第三方子处理方、对客户可见的文案 |
| **R1 低** | 内部工具、文档、不接触数据的 UI |

## 4. 分配规则：成员画像
画像写在 [`05-hr-teams/member-profiles.md`](../05-hr-teams/member-profiles.md)，**只记录工作能力和容量，不记录绩效评价或个人档案**。字段：

| 字段 | 取值 |
|---|---|
| `level` | `junior` / `mid` / `senior` / `lead` |
| `primary_tracks` / `secondary_tracks` | `fullstack` · `frontend` · `backend` · `mobile` · `ai-eval`（提示词、评测、ASR/LLM 管线）· `infra-security`（含 DevOps、CI/CD、云基础设施）· `product-ux`（产品思维、交互设计、视觉审美：界面、流程、文案体验）· `docs-ops`（文档、流程、非代码） |
| `wip_limit` | 同时在 `draft`～`verifying` 的 PRD 上限（默认：junior 1，其他 2） |
| `r3_eligible` | 是否可以做 R3 PRD 的 assignee（默认：只有 senior / lead） |
| `strengths` | 自由文字，说明特长（不计分，供 Lightman 判断时参考） |
| `growth_goal` | 可选，想练的方向，只在"成长模式"下加分 |

**`level`、`primary_tracks` 是 `{{TBD}}` 的成员不参与自动推荐**（`wip_limit`、`r3_eligible` 缺省时取默认值）。 不能替人猜 level 或方向；`prd-assign` 遇到这种情况要停下来，列出缺哪些字段，问 Lightman。

## 5. 分配规则：硬性过滤（先过滤，再打分）
> 这是**默认推荐**的过滤。Lightman 可以按 §5.1 直接指定人选并覆盖它们。

| 成员 level | 复杂度 | 风险 | 附加条件 |
|---|---|---|---|
| junior | 只能 S（M 需指定一位 senior 结对，并写进 registry 备注） | 只能 R1、R2 | 必须有 senior reviewer；WIP 上限 1 |
| mid | S、M；L 只限 R1 | R1、R2；R3 只限 S/M 且 `r3_eligible` 或有 senior 共同评审 | WIP 上限 2 |
| senior | 全部 | 全部 | L 算 2 个 WIP |
| lead | 全部 | 全部 | 同时还要做别人的 R3 评审，所以 L 算 2 个 WIP，且优先把 R3 评审留给他 |

另外：
- 当前 WIP ≥ `wip_limit` 的成员**排除**（Lightman 明确要求"插队"时除外，要写进备注）。
- **Lightman（PO / 审批人）不作为开发类 PRD 的 assignee**；他可以当 `docs-ops` 类（战略、运营、合规文档）PRD 的 assignee。
- **R3 的 reviewer 必须是 senior 以上**，且不是 assignee。assignee 是 Lin 时，如果没有第二位 senior，就写 `🧑 需外部评审` 并交给 Lightman 决定，不能自审。

### 5.1 Lightman 指定与覆盖
Lightman（PO）可以**直接指定** assignee，覆盖 §5 的硬性过滤和 §6 的打分结果——例如让 junior 承担超出默认级别的 PRD（成长机会、团队只有少数人）。

**可以覆盖**：级别 × 复杂度 × 风险的限制、WIP 上限、方向匹配、`r3_eligible`、"画像为 `{{TBD}}` 不参与推荐"。
**不能覆盖**（铁律）：§1 的第 1–4 条（唯一 assignee、不能是 AI agent、reviewer ≠ assignee、`approved` / `released` 只有人能设）和所有阶段门禁（§2）。

**覆盖只有 Lightman 本人能做**，必须是他明确说出的指定（不能是 agent 或成员自行判断）。覆盖时：
1. `prd-assign` 照常跑一遍过滤和打分，**把被覆盖的规则逐条列出来**（"junior × L × R3""WIP 将超限"），不能省略，也不能替他反驳。
2. 在 registry 变更历史写一行：`指定覆盖`、被覆盖的规则、Lightman 给的原因、采取的缓解措施。
3. **缓解措施（必须）**：
   - 超出默认级别的 PRD（junior 做 M 以上或 R3，mid 做 L 或 R3 等）和所有 R3：**必须指定 senior 以上的 reviewer**，从 `in_review` 起 registry 里就要填（`scripts/check-prd-registry.sh` 检查）；
   - reviewer 参与**设计评审**（进入 `in_review` 前）和**开发期的每个 PR**；
   - assignee 在每日 standup 里主动报告卡点（§10），卡住超过 2 个工作日要升级给 reviewer；
   - 需要其他人协助的部分，在备注里写明协助者和范围。
4. 覆盖不改变风险等级：R3 仍是 R3，涉及护栏的评审（Lin、临床顾问）一个都不能少。
5. 被覆盖后，下一次 `prd-assign` 对同一个人不再重复提示覆盖，除非 PRD 的复杂度或风险变了。

## 6. 分配规则：打分（满分 100）
对过滤后的候选人逐一打分，取前 3 名给 Lightman 选。

| 因子 | 分值 | 规则 |
|---|---|---|
| 方向匹配 | 40 | PRD 需要的方向覆盖成员 `primary_tracks` = 40；只覆盖 `secondary_tracks` = 20；都不覆盖 = 0。**`fullstack` 成员**：PRD 需要的方向 ≤ 2 个（如 frontend + backend）按 40；需要 3 个以上（加上 ai-eval 或 infra-security）按 30。**专精成员**：PRD 每多出一个自己不覆盖的方向，扣 10（最低 0） |
| 级别匹配 | 25 | 见下表 |
| 当前负载 | 20 | `20 × (1 − 当前 WIP / wip_limit)` |
| 上下文连续 | 15 | 做过同一个父 PRD、同一模块的 PRD = 15；做过相邻模块 = 8；否则 0 |
| 成长加分 | +5 | 仅"成长模式"：PRD 命中成员的 `growth_goal`，且硬性过滤已通过 |

**级别匹配分**（行 = 复杂度，列 = level）
| | junior | mid | senior | lead |
|---|---|---|---|---|
| S | 25 | 25 | 10 | 5 |
| M | 10（需结对） | 25 | 20 | 10 |
| L | — | 10 | 25 | 20 |
| R3 的 S/M | — | 10 | 25 | 20 |

- **平分**：当前 WIP 少的优先；仍相同，取最久没有被分配 PRD 的人。
- 输出必须说明每个因子的得分和扣分原因；候选人不足 3 个时，要说明被过滤掉的人为什么被过滤。
- 一个人也找不到时，不要放宽规则硬分：给出"缺什么"（缺 senior、缺容量、缺画像），让 Lightman 决定延后、调整画像，或按 §5.1 直接指定（不拆 PRD，除非他明确要拆）。

## 7. 参数调整
本文件的阈值、权重是**初版默认值，没有数据支撑**（⚠️ 需用前 3 个月的分配结果校准）。调整要在 registry 的历史里记录原因；改动超过一个因子的权重，写 ADR（`02-operating-system/decisions/`）。

## 8. 与其他规范的关系
- PRD 内容要求见 `rules/04-prd-rules.md`；本文件管**流转和归属**，不改变 PRD 的内容要求。
- `docs/PRD.md` §9 护栏优先于本文件；要改护栏必须写 ADR。
- 所有对 registry 和画像的修改都按 `rules/05-changelog-rules.md` 记 changelog。
- 分配结果**不能用于绩效考核**：registry 记录的是工作分派，不是评价。

## 9. 成员工作记录与提醒（硬性要求）
成员用 agent（Claude Code、Codex）操作本仓库时，工作要被自动记录；分配给每个人的工作要能随时提醒。

### 9.1 自动记录
- **必须**：每次文件编辑的明细（`changelog/ai-edits/YYYY-MM.jsonl`）都带 `member`（谁在操作）和 `prd`（属于哪个 PRD）。Claude Code 由 hook 自动写；Codex 用 `scripts/ai-changelog.sh --manual codex <文件>...`，同样会带上这两个字段。
- **必须**：每位成员设置好身份，agent 才能把记录归到本人名下：`git config user.name` 需**包含**名册（`05-hr-teams/member-profiles.md`）里的名字，或设置环境变量 `CARE_MEMBER`。`scripts/setup.sh` 会检查。识别不了的记为 `unknown`，**不能**冒用别人的名字。
- **必须**：做 PRD 的开发时用分支 `prd/<slug>`（`<slug>` 是 PRD 文件名去掉 `.md`），记录才能自动关联到 PRD。
- 任务级的摘要仍按 `rules/05-changelog-rules.md` 写；摘要里的 `request` 写清楚是做哪个 PRD。

### 9.2 随时提醒
- **会话开始自动提醒**：`SessionStart` hook 运行 `scripts/my-work.sh --hook`，列出：我负责的未完成 PRD（含当前阶段、下一步）、待我评审的 PRD、卡点、登记表超过 7 天没更新、有进行中的 PRD 但最近 5 天没有任何记录。**agent 看到提醒后，在会话开头先告诉成员。**
- **随时查看**：`/my-work` skill（会逐项核对下一阶段的门禁还缺什么），或 `scripts/my-work.sh [姓名]`。
- **Lightman 的汇总**：`scripts/my-work.sh --all`，每周五 `weekly-operating-review` 时运行。
- 提醒**只是提醒**：不改阶段、不改 assignee；要改走 `prd-status` / `prd-assign`。

### 9.3 记录什么、不记录什么
- **只记**：时间、成员、agent、PRD、文件路径、工具名、会话 ID。
- **禁止记录**：提示词、对话内容、文件内容、录音或转写文本、住户信息、健康信息、成员的个人情况（原因栏同理）。
- 数据只放本仓库（私有）。

### 9.4 用途限制与成员权利
- 这些记录**只用于**：任务跟进与提醒、事后复盘、审计追溯（谁在什么时候改了什么）。
- **禁止**用于：绩效考核、衡量个人效率或工作时间、比较成员"产出"、监控个人行为（与护栏 G10 的精神一致）。需要把记录用于其他目的，必须先写 ADR 并告知全体成员。
- 成员**可以随时查看自己的记录**，发现归属错误可以要求更正（按 `rules/05-changelog-rules.md` 追加 `type: correction`，不改历史）。
- ⚠️ 本地没有关于员工工作记录 / 工作场所监控的法律资料（`legal-reference-map.md` 缺口表同样没有该主题）。**在律师或 HR 顾问确认前**，只对已知情并同意的成员启用，并在入职清单里写明本节内容。

## 10. 每日 Standup（硬性要求）
每位成员每个工作日都要通过 AI 提交 standup；AI 负责提醒、整理，成员本人负责内容。

### 10.1 谁、何时、怎么交
- **必须**：Lin、Gary、Windston（以及之后加入的开发者）在**每个工作日（周一到周五，墨尔本时间）开始工作前**，用 `/standup` skill 提交当天的 standup。Lightman（PO）可选。
- 截止时间：{{TBD：Lightman 确定，例如 10:00 前}}。默认异步提交，不要求同时在线（`rules/00-company-rules.md` §5）。
- 休假、不工作：提交 `休假 / 不工作`，**不写原因**。
- 同一天需要补充，写在原记录的 `## 补充` 一节，不删除、不改写已提交的内容。

### 10.2 内容（固定三问 + 自动部分）
| 部分 | 来源 | 谁写 |
|---|---|---|
| 昨天完成 | 成员回答（agent 可用 `ai-edits` 记录给出**草稿提示**，成员确认或重写） | 成员 |
| 今天计划 | 成员回答（关联 PRD slug） | 成员 |
| Blockers | 成员回答 + registry 里的卡点；写清楚**卡在哪个 PRD、需要谁、影响什么** | 成员 |
| 新分配（已确认看到） | registry 变更历史里上次 standup 之后分配给成员的 PRD，成员要确认看到 | 自动 + 成员确认 |
| PRD 状态快照 | registry（阶段 → 下一步） | 自动 |

- **agent 不得编造**成员没说过的完成事项、计划或 blocker；成员没回答的写 `（未填写）`。
- **Blocker 必须有去向**：关联 PRD 的 blocker，经成员同意后用 `prd-status` 写入登记表的 Blocked 列；需要 Lightman 或临床顾问决策的，standup 里要点名。blocked 超过 5 个工作日按 §2 在周会提出。

### 10.3 提醒
- **没提交就提醒**：`SessionStart` hook（`scripts/my-work.sh --hook`）在工作日会话开始时，如果成员今天还没有 standup 记录，提醒 `/standup`；同时提醒**新分配的 PRD**、**未完成的 PRD**、**卡点**（§9.2）。
- **agent 看到提醒后，在会话开头先告诉成员，并主动提出帮他走 `/standup`**；成员明确说先不做，不要反复追问。
- **Lightman 的团队视图**：`scripts/my-work.sh --all` 显示今天谁已提交 / 未提交，以及所有 blockers 的汇总；`/standup` 的 digest 模式给出可读的汇总。

### 10.4 记录与用途限制
- 位置：`02-operating-system/standups/members/<姓名>/YYYY-MM-DD.md`（团队内可见，这是 standup 的本意）。
- **只能写自己的记录**；agent 不能替别人提交，也不能改别人的记录。
- 不得写：住户信息、健康信息、密钥、个人原因（病假、家庭情况等）。
- **禁止**用于：绩效考核、比较成员、从记录推断努力程度；缺交只作提醒，不作评价。
- 本节与 §9.4 同样受"⚠️ 本地无员工工作记录 / 工作场所监控资料，需律师或 HR 顾问确认"的限制。
- 编辑 standup 记录**不要求**写 changelog 摘要（编辑明细仍自动记录，`ai-changelog.sh` 对该目录不标记"待写摘要"）。
