# PRD：ADLC — PRD 生命周期、分配与状态管理

Owner: Lightman (PO) · Tech: Lin (Tech Lead) · Status: **Draft** · Last reviewed: 11/10/2026
Parent: [`docs/PRD.md`](../PRD.md) · Related: [`rules/06-adlc-rules.md`](../../rules/06-adlc-rules.md) · [`registry.md`](registry.md) · [`05-hr-teams/member-profiles.md`](../../05-hr-teams/member-profiles.md) · `11-workflows/feature-to-release.md` · `03-legal-compliance/ai-governance.md`

> 一句话：**让每个 PRD 都有一个明确的负责人和一个明确的状态，并且 AI agent 参与开发的每一步都有人把关。** 用 Markdown + Git 实现（registry + 规则 + 2 个 skill + 1 个检查脚本），不引入新系统。
>
> **假设**：这里 ADLC = *Agent Development Life Cycle*（AI agent 参与每个阶段的开发生命周期）。如果你指的是别的 ADLC，请告诉我，范围会变。

---

## 1. 问题

### 1.1 谁、在什么场景、遇到什么问题
- **Lightman（PO）**：PRD 越来越多（现在 1 份主 PRD + 1 份功能 PRD，后面会有十几份），但没有地方能一眼看到：*每个 PRD 谁在负责、走到哪一步、卡在哪里。* 分配靠记忆和聊天。
- **Lin / Gary / Windston（开发者）**：不清楚哪个 PRD 是自己的；多个 PRD 同时压在同一个人身上；新人可能被分到超出能力的 R3（临床记录、AI 行为）任务，或者资深的人被占用在简单任务上。
- **AI agent（Claude Code、Codex）**：能写 PRD、写代码、跑评测，但目前没有规则说明**它在哪个阶段能做什么、哪个阶段必须停下等人**。PRD 头部的 `Status` 只有 Draft / Approved，无法表示"开发中""验证中"。
- **公司层面**：我们是 aged care 的 AI 产品，"谁对这一块负责"在出临床安全事件时必须能回答（`rules/00-company-rules.md` §1：护士是作者；任何人可以叫停发布）。

### 1.2 证据（诚实标注）
| 证据 | 来源 | 强度 |
|---|---|---|
| 现有流程缺少归属和阶段：`feature-to-release` 有 8 步，但没有记录"谁负责""现在在第几步" | `11-workflows/feature-to-release.md` | 强（直接读文件） |
| PRD 头部只有 `Status: Draft / Review / Approved` | `06-app-development/product/prd-template.md` | 强 |
| 团队只有 3 名开发者，其中 Gary、Windston 的方向和级别尚未确认 | `05-hr-teams/team-members.md`「待确认」 | 强 |
| 团队成员对"分配方式"的看法 | 尚无访谈 | **n = 0，以下都是假设** |

**必须先验证的假设**
- **H1**：一个 registry 文件足够管理 ≤ 20 个同时存在的 PRD。
- **H2**：按"级别 × 方向 × 容量 × 风险"打分的建议，能让 Lightman 觉得"比我凭感觉分配更合理"。
- **H3**：成员不会觉得画像是在评价自己（见 §6 隐私和 §7 危害）。

---

## 2. 目标与指标

### 2.1 目标
1. **每个 PRD 有且仅有一个 assignee**，任何时候都能查到。
2. **每个 PRD 有明确的 ADLC 阶段**，阶段变化有门禁和记录；审批类阶段只有人能改。
3. **分配有依据**：按成员级别（junior / senior）、方向（full-stack 或专精）、当前负载、PRD 的复杂度和风险给出建议；高风险 PRD 不会落到没准备好的人手里。
4. **每位成员的 agent 工作自动记录，分配给每个人的工作可以随时提醒；每个工作日通过 AI 提交 standup，并被提醒新分配的 PRD、未完成的 PRD 和 blockers**（规则：`rules/06-adlc-rules.md` §9、§10）。
5. **AI agent 的角色清晰**：agent 是执行者，不是责任人、评审人或审批人。

### 2.2 范围外（本 PRD 不做）
- 不做排期、工时估算、燃尽图（只做归属和阶段）。
- 不做绩效评价；分配数据**不能**用于考核。
- 不替代 GitHub 的 issue / PR 流程；不管理代码级任务拆分（见 §14 的后续阶段）。
- 不做多 assignee、团队级归属。一个 PRD 整体分配给一个人；需要别人帮忙时写协助者（不承担责任）；只有 Lightman 明确决定才拆成子 PRD。

### 2.3 指标（试点 3 个月）
| 指标 | 测量方法 | 目标 |
|---|---|---|
| ⭐ 无主 PRD 数 | `scripts/check-prd-registry.sh` 报错数（阶段 ≥ `draft` 且无 assignee 的行） | **0**（pre-commit 强制） |
| 一个 PRD 多个 assignee | 同上（assignee 含多个名字或 AI agent） | **0** |
| 登记表与实际一致 | 每周五 `weekly-operating-review` 抽查：registry 阶段 vs PRD 实际进展，不一致的行数 | ≤ {{TBD：试点第 1 个月先测基线}} |
| 阶段停留时间 | registry 变更历史里相邻两次阶段变更的日期差，按阶段取中位数 | {{TBD：先测基线，不预设目标}} |
| 分配建议采纳率 | 变更历史里"采纳第 1 名推荐"的比例；不采纳要写理由 | 仅用于校准规则，不设目标 |
| 重新分配率 | 变更历史里 `assignee: A → B` 的次数 / PRD 总数 | 仅用于校准规则，不设目标 |
| R3 PRD 未经 senior 评审进入 `in_progress` | registry 检查（R3 必须有 reviewer） | **0** |
| 工作记录归属正确率 | 抽样 20 条 `ai-edits` 记录，由本人核对 `member` 是否正确；`unknown` 占比（`jq` 统计） | `unknown` ≤ {{TBD：先测基线}} |
| Standup 提交率 | 工作日 standup 记录数 / 应提交人数（按 `standups/members/` 文件统计）；仅用于发现流程问题，不用于评价个人 | {{TBD：先测基线}} |
| Blocker 解除时间 | standup 里提出 blocker 的日期到登记表 Blocked 列清除的日期差，取中位数 | {{TBD：先测基线}} |
| 成员对分配公平性的感受 | 每月一次 3 个问题的匿名小问卷（人数 = 3，样本很小，只作参考） | 无目标，作为定性输入 |

---

## 3. 用户与用户故事

| 角色 | 用户故事 |
|---|---|
| Lightman（PO） | 作为 PO，我想一个命令就看到所有 PRD 的阶段、负责人和卡点，**以便**我周会时不用到处问。 |
| Lightman | 作为 PO，我想让系统根据成员的级别、方向和负载给出分配建议，由我确认，**以便**把对的 PRD 给对的人，又不失去决定权。 |
| 开发者（junior） | 作为 junior，我想拿到边界清楚、风险低的 PRD，并且有 senior 评审，**以便**稳步成长，不被丢进临床关键路径。 |
| 开发者（senior / full-stack） | 作为 senior 或 full-stack 开发者，我想承担复杂、跨模块的 PRD，**以便**不被小任务淹没。 |
| Lin（Tech Lead） | 作为 Tech Lead，我想所有 R3 PRD 都经过 senior 评审，**以便**临床记录路径、AI 行为、租户隔离的改动有人把关。 |
| 每位成员 | 作为成员,我想每次用 agent 打开仓库时,就被告知我负责的 PRD 还差什么,**以便**不靠记忆跟进。 |
| 每位成员 | 作为成员,我想我用 agent 做过的工作被自动记录在我名下,**以便**交接和复盘时有据可查,并且我知道这些记录不会被用来考核我。 |
| 开发者 | 作为开发者，我想每天开工前在 AI 里 3 分钟提交 standup，并被告知有什么新分配、哪些 PRD 没完成，**以便**不用开会也能同步，blocker 能被及时看到。 |
| Lightman（PO） | 作为 PO，我想看到今天谁提交了 standup、有哪些 blockers 需要我决策，**以便**第一时间解除阻塞。 |
| AI agent | 作为 agent，我想从规则里知道每个阶段我能做什么、哪里必须停下等人，**以便**不越权。 |
| 临床顾问 | 作为临床顾问，我想只在需要我签字的阶段收到通知，并看到 PRD 的危害和评测证据，**以便**不被无关事项打扰。 |

---

## 4. 方案

### 4.1 生命周期（阶段与门禁）
```mermaid
stateDiagram-v2
	[*] --> idea
	idea --> draft: 有 assignee（prd-assign 🧑）
	draft --> in_review: 必填章节齐全 + 法律/TGA 检查已跑
	in_review --> draft: 打回
	in_review --> approved: 🧑 Lightman + Lin（+临床顾问）
	approved --> in_progress: 有 reviewer + ADR（如需）
	in_progress --> verifying: 合并到 staging + AI 评测（如涉及）
	verifying --> in_progress: 测试不通过
	verifying --> released: 🧑 Lightman 发布（+临床顾问签字）
	released --> done: 监控 48h 无 P1
	idea --> cancelled
	draft --> cancelled
	in_review --> cancelled
	approved --> superseded
	done --> [*]
```
每个阶段的进入条件和"谁能推进"见 [`rules/06-adlc-rules.md`](../../rules/06-adlc-rules.md) §2。要点：
- `approved`、`released` **只有人能设**；agent 只收集证据，停下来请 Lightman 确认。
- `blocked` 是标记，不是阶段，需要写明原因、等谁、什么时候复查。
- 阶段和 assignee 的变更**只追加**到 registry 的变更历史。

### 4.2 每个 PRD 有且仅有一个 assignee
- 唯一来源：`docs/prds/registry.md`（一个 PRD 一行）。
- **assignee = 责任人**：对该 PRD 走到 `released` 负责，可以指挥 agent、请人帮忙，但责任不分摊。
- **一个 PRD 整体分配给一个人，默认不按方向拆分**。需要别人帮忙时写协助者（不承担责任）；只有 Lightman 明确决定才拆成子 PRD（`Parent` 列）。
- 校验：`scripts/check-prd-registry.sh`（pre-commit 运行）拒绝：无 assignee、多个名字、AI agent、不在画像表里的名字、reviewer = assignee、R3 无 reviewer 进入开发。

### 4.3 分配规则（你问的"junior / senior / full-stack"怎么区分）
我的建议是**不要只按 junior / senior 一个维度**，用四个维度，规则先过滤、再打分，最后由人确认：

| 维度 | 看什么 | 为什么 |
|---|---|---|
| **级别** `level` | junior / mid / senior / lead | 决定能接多复杂、多大风险的 PRD |
| **方向** `tracks` | fullstack、frontend、backend、mobile、ai-eval、infra-security（含 DevOps）、product-ux（产品思维、交互、审美）、docs-ops | full-stack 适合跨前后端的小中型 PRD；专精成员适合深度单一方向，跨多个方向时扣分，避免"什么都让一个人扛" |
| **容量** `wip_limit` | 同时在手的 PRD 数 | 防止过载；junior 默认 1，其他默认 2 |
| **PRD 的复杂度 × 风险** | 复杂度 S/M/L（四项打分）；风险 R1/R2/R3 | 风险与复杂度分开：简单但接触临床记录的 PRD 仍然是 R3，不能给 junior |

**硬性过滤**（摘要，数值见规则文件）
- junior：只接 S 且 R1/R2，必须有 senior reviewer；M 需 senior 结对。
- mid：S/M；L 只限 R1；R3 需要 `r3_eligible` 或 senior 共同评审。
- senior / lead：全部；R3 reviewer 必须是 senior 以上且不是 assignee。
- Lightman 不接开发类 PRD（他是审批人），可以接 docs-ops 类。

**Lightman 指定与覆盖**（规则 §5.1）：上面的过滤和下面的打分是**默认推荐**。Lightman 可以直接指定人选（例如让 junior 承担整个设计系统）并覆盖过滤；这是唯一的覆盖方式，agent 和成员都不能自行覆盖。覆盖时 skill 必须逐条列出被覆盖的规则，registry 写 `指定覆盖` 历史行，并强制缓解措施：senior 以上 reviewer（从 `in_review` 起 registry 必填，脚本检查）、设计评审 + 每个 PR、卡点 2 个工作日升级。铁律（唯一 assignee、非 AI、reviewer ≠ assignee、`approved`/`released` 只有人）和阶段门禁不能覆盖。

**打分**（满分 100）：方向匹配 40 + 级别匹配 25 + 当前负载 20 + 上下文连续 15，"成长模式"下另加 5 分（让 junior 有机会碰稍有挑战的任务，但仍受硬性过滤保护）。

**为什么这样设计（取舍）**
- 先过滤再打分：安全相关的限制不能被"方向很匹配"这样的高分抵消。
- 打分只给**前 3 名 + 理由**，最终由 Lightman 选；3 人团队里完全自动分配没有意义，也不合适。
- 团队只有 3 名开发者，画像不全时规则会**停下来要信息**，而不是猜。目前已知：Lin = senior，Gary = junior（强项：产品思维、审美），Windston 擅长 DevOps；Lin 与 Gary 的写代码方向、Windston 的级别还缺（见 §12）。
- 权重是初版默认值，没有数据支撑（⚠️ 需用前 3 个月的分配结果校准，见 §13）。

### 4.4 AI agent 在 ADLC 中的角色
| 阶段 | agent 可以做 | agent 必须停下，等人 |
|---|---|---|
| `idea → draft` | 用 `prd-assign` 给出分配建议 | 确认 assignee |
| `draft` | 用 `prd-writer`、`legal-reference-check`、`tga-boundary-check` 写 PRD | — |
| `in_review` | 自查必填章节、核对引用文件是否存在 | 审批签字 |
| `approved → in_progress` | 起草 ADR、拆任务 | 批准 ADR |
| `in_progress` | 在 assignee 的 worktree / 分支上写代码、写测试，遵守 `rules/02-code-rules.md` | 合并 PR 需要人审查（R3 须 senior） |
| `verifying` | 跑测试和 AI 评测，汇总报告 | 临床顾问签字 |
| `released` / `done` | 起草发布说明、整理监控结果 | 发布决定 |

agent 的每次文件修改仍按 `rules/05-changelog-rules.md` 记录。**agent 做的事由 assignee 负责。**

### 4.4b 成员工作记录与提醒（规则 §9）
```mermaid
flowchart LR
	A[成员用 agent 编辑文件] --> B[PostToolUse hook]
	B --> C["changelog/ai-edits/*.jsonl<br/>+ member + prd"]
	D[registry.md<br/>分配与阶段] --> E[my-work.sh]
	C --> E
	E --> F[SessionStart hook<br/>会话开始自动提醒]
	E --> G["/my-work skill<br/>逐项核对门禁"]
	E --> H["--all<br/>周五汇总"]
```
- **谁在操作**：`git config user.name` 含名册里的名字，或 `CARE_MEMBER`；识别不了记为 `unknown`，不冒用别人。`scripts/setup.sh` 检查。
- **哪个 PRD**：开发分支 `prd/<slug>`。
- **提醒内容**：我负责的未完成 PRD（阶段、下一步、是否需要人批准）、待我评审的 PRD、卡点、登记表超过 7 天没更新、有进行中 PRD 但 5 天没有记录。
- **只提醒、不改状态**。
- **记什么**：时间、成员、agent、PRD、路径、工具。**不记**提示词、内容、住户信息。用途限制和成员权利见规则 §9.3–9.4。

### 4.4c 每日 Standup（规则 §10）
```mermaid
sequenceDiagram
	participant M as 成员
	participant H as SessionStart hook
	participant A as AI（/standup）
	participant R as registry.md
	participant S as standups/members/<姓名>/
	M->>H: 打开 Claude Code
	H-->>M: 📣 今天还没提交 standup<br/>🆕 新分配 / 未完成 PRD / 卡点
	M->>A: /standup
	A->>R: 读取分配、阶段、卡点、变更历史
	A->>M: 昨天完成？今天计划？Blocker？确认新分配
	M-->>A: 回答（AI 不替成员编内容）
	A->>S: 写入当天记录
	A-->>M: 汇总；blocker 经同意后用 prd-status 写入登记表
```
- **固定三问 + 自动部分**：昨天完成、今天计划、Blockers，加上"新分配（已确认看到）"和"PRD 状态快照"。
- **记录位置**：`02-operating-system/standups/members/<姓名>/YYYY-MM-DD.md`，每人每天一份。
- **提醒**：工作日会话开始时若没有当天记录就提醒；同时提醒新分配（比对 registry 变更历史与上次 standup 日期）、未完成 PRD、blockers。
- **PO 视图**：`scripts/my-work.sh --all` 显示谁已提交 / 未提交和 blockers 汇总。
- **取舍**：standup 是异步的，不要求同时在线；"提醒"发生在成员打开 agent 会话时（我们没有推送渠道）。没打开会话的人不会被提醒，这是已知缺口，推送渠道见 §14 P2。
- **不做**：不从 standup 内容推断个人表现；缺交只作提醒。

### 4.5 交付物（本 PRD 的范围）
| # | 交付物 | 路径 | 状态 |
|---|---|---|---|
| 1 | ADLC 规则（阶段、门禁、分配参数） | `rules/06-adlc-rules.md` | 已起草 |
| 2 | PRD 登记表（阶段 + assignee + 历史） | `docs/prds/registry.md` | 已起草，含 2 行 |
| 3 | 成员画像 | `05-hr-teams/member-profiles.md` | 已起草，Gary / Windston 待填 |
| 4 | `prd-assign` skill | `12-skills/prd-assign/SKILL.md` | 已起草 |
| 5 | `prd-status` skill（看板 + 阶段推进） | `12-skills/prd-status/SKILL.md` | 已起草 |
| 6 | 登记表检查脚本 + pre-commit | `scripts/check-prd-registry.sh`、`.githooks/pre-commit` | 已起草 |
| 7 | 把 ADLC 接入 `prd-writer` 和 `feature-to-release` | `12-skills/prd-writer/SKILL.md`、`11-workflows/feature-to-release.md` | 已起草 |
| 8 | 成员识别 + 工作记录带 `member` / `prd` | `scripts/lib-member.sh`、`scripts/ai-changelog.sh`、`scripts/setup.sh` | 已起草 |
| 9 | 个人待办提醒（SessionStart hook + 脚本 + skill） | `scripts/my-work.sh`、`.claude/settings.json`、`12-skills/my-work/SKILL.md` | 已起草 |
| 10 | 每日 standup（skill + 记录目录 + 提醒） | `12-skills/standup/SKILL.md`、`02-operating-system/standups/` | 已起草 |

### 4.6 验收标准
1. `scripts/check-prd-registry.sh` 通过；故意制造 5 种错误（无 assignee、两个名字、assignee = `Claude`、reviewer = assignee、R3 进入 `in_progress` 无 reviewer）各自被拒绝。
2. 对现有的 Shift Capture PRD（R3）跑 `prd-assign`：Gary（junior）被 R3 过滤；Windston（level 缺失）、Lin（primary_tracks 缺失）不参与推荐。结果是无人可推荐，它必须停下并列出缺失字段，**不能**放宽规则。
3. 在 `member-profiles.md` 填入**测试用的虚构成员**后，对一个 R3/L 的 PRD 和一个 R1/S 的 PRD 分别运行，结果符合规则 §5–§6 的预期（R3/L 不会给 junior；R1/S 优先给 junior/mid）。
4. `prd-status` 看板能列出所有 PRD 并标出卡点；尝试把 PRD 直接设为 `approved` 时，它停下来请求 Lightman 确认。
5. `scripts/check-context-docs.sh` 通过。
6. `--manual` 记录一次编辑：`member` 与 `git config user.name` / `CARE_MEMBER` 一致；设置成名册里没有的名字时记为 `unknown`。
7. `scripts/my-work.sh <成员>`：对有分配的成员列出 PRD、阶段、下一步、卡点；没有分配的成员显示"没有未完成 PRD"；未知成员报错退出。
8. 工作日会话开始时，没有当天 standup 记录的成员收到 📣 提醒；提交后提醒消失，`--all` 显示 ✅。
9. 变更历史里出现"分配给某成员"的新行后，该成员下次的提醒里出现 🆕 新分配；他提交 standup 后不再重复出现。
10. 成员在 standup 里写了 blocker，`--all` 的 Blockers 汇总里能看到（带成员名、PRD、需要谁）。
11. 提醒、工作记录和 standup 记录里**没有**提示词或文件内容；编辑 standup 记录不会触发"待写摘要"。

---

## 4.5 法律依据（本地参考文件）
> 用 `legal-reference-check` 流程生成，规则见 `rules/04-prd-rules.md` §2。以下文件已实际打开查阅。运营参考，不是法律意见。
> 本 PRD 是**内部开发流程**，不改变产品对老人或护士的功能；但它管理的是"AI 参与开发一款 aged care 软件"的方式，所以对应的是 AI 治理、商用 AI 使用和网络安全方面的约束。

| 主题 | 本地文件 | 条款 / 页码 | 对本功能的约束 |
|---|---|---|---|
| 人对 AI 输出负责 | `03-legal-compliance/references/law-library/ahpra-ai-in-healthcare-summary.md` | 「五项要点」1 Accountability；「关键原文」 | 从业者对 AI 输出施加人的判断、负最终责任。→ ADLC 规定 **AI agent 不能当 assignee / reviewer / approver**，审批类阶段只有人能改 |
| 国家 AI 指引：问责与人的监督 | `03-legal-compliance/references/law-library/disr-nais-guidance-for-ai-adoption-implementation-practices.pdf` | p.2（实践 1「Decide who is accountable」、实践 6 人的监督）；p.4；p.19 | 指引要求先确定谁对 AI 系统负责，并设计有意义的人工监督与控制。→ 每个 PRD 唯一责任人；每个阶段的"agent 停下等人"点 |
| 临床 AI：治理与监测 | `03-legal-compliance/references/law-library/acsqhc-ai-clinical-use-guide-2025-08.pdf` | p.1–3（clinician accountability；"comply with governance and oversight"；"processes in place for monitoring safety and performance of AI tools"） | 要有治理流程和持续监测。→ `verifying` 门禁要求 AI 评测报告 + 临床顾问签字；`done` 要 48 小时监控 |
| 商用 AI 的隐私使用 | `03-legal-compliance/references/law-library/oaic-checklist-privacy-use-of-commercial-ai-products-2024.pdf` · `oaic-guidance-commercial-ai-products-summary.md` | 清单 p.2（人的监督、sensitive information）；摘要「要点」 | 不要把个人信息输入公开的生成式 AI 工具。→ ADLC 不改变 `rules/00-company-rules.md` §3：agent 会话中不得出现住户信息，registry 和画像不含任何健康信息 |
| AI 的网络安全 | `03-legal-compliance/references/law-library/asd-engaging-with-artificial-intelligence-2024-01.pdf` | p.10–12（供应链评估；第三方 AI 系统输入如何被使用；日志与监控） | 使用第三方 AI 要了解输入如何被使用、做供应链评估、对输入输出做日志和监控。→ agent 使用的是已批准工具（`04-security/vendor-subprocessor-register.md` 内部工具表）；agent 修改由 changelog 的 hook 记录 |
| 内部结论 | `03-legal-compliance/ai-governance.md` | §2 原则 4 Accountable；§4 风险登记「自动化偏差」「提示注入」 | 每个 AI 功能有明确 Owner；→ assignee 就是 Owner；风险登记里的自动化偏差对应"agent 写、人没认真审"，用 R3 senior 评审控制 |
| 产品护栏 | `docs/PRD.md` §9 G1–G11 | G1、G2、G4、G7 | 触及任何护栏的 PRD 一律 R3 |

### 本地资料缺口
- ⚠️ **员工信息 / 工作场所规则**：成员画像（级别、方向）属于员工的工作信息。本地没有 Fair Work 或雇佣法下关于"员工记录"、使用分配数据的资料（`legal-reference-map.md` 缺口表也没有该主题），**需律师确认**。缓解：画像只记工作能力和容量，不记绩效；本人可见并可申请调整；规则声明"分配数据不用于考核"。→ **上线门槛**：用于正式分配前，Lightman 与 Lin、Gary、Windston 确认画像内容，并问律师或 HR 顾问。
- ⚠️ **员工工作记录 / 工作场所监控**：成员的 agent 工作记录和 standup 属于员工活动记录。本地没有相关法律资料（`rules/legal-reference-map.md` 缺口表里"工作场所监控"只列了 NSW / ACT，公司在 VIC 也没有对应资料），**需律师确认** → **上线门槛**：确认前只对已告知并同意的成员启用，并写入入职清单。
- ⚠️ 本地没有关于"开发工具链里使用 AI agent 的数据保留与训练条款"的资料 → 依赖 `04-security/vendor-subprocessor-register.md` 的选型清单，Claude Code 仅限非客户数据。

### 可能过时的资料
- `acsqhc-ai-clinical-use-guide-2025-08.pdf`（2025-08，超过 6 个月）；`asd-engaging-with-artificial-intelligence-2024-01.pdf`（2024-01，超过 6 个月）。使用前应跑 `compliance-review` 对照官方最新版。
- 引用的页码来自文本提取，未逐页人工核对 ⚠️ 需核实。

---

## 5. TGA boundary check
- 对照 `03-legal-compliance/tga-samd-boundary.md`：**🟢**
- 理由：本 PRD 只管理内部 PRD 的归属和状态，不处理临床数据，不生成或解释任何临床内容，对用户（护士、老人）没有可见功能。
- 涉及的文案：不涉及对外文案，不扩大预期用途。
- **间接影响**：R3 风险等级把"触及 TGA 🟡、AI 生成行为、护栏"的 PRD 强制引到 senior 评审，是对 SaMD 边界的一道**内部控制**。
- 运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。（本 PRD 为 🟢，无需。）

---

## 6. 隐私影响
- **新增数据**：
  - 成员工作画像（姓名、级别、方向、容量、可选的成长目标）。属于员工的**工作信息**，不含合同、薪酬、绩效、健康、签证等（`team-members.md` 的规则）。
  - PRD 分配和阶段历史（姓名 + PRD + 日期 + 原因）。
- **存哪里**：本仓库（私有，`rules/00-company-rules.md` §3 允许 Internal 级别信息）。**不含任何客户或住户数据、健康信息。**
- **保留期**：随仓库历史保留；`growth_goal` 属于可选字段，本人可随时要求删除（git 历史会保留旧版本，若需彻底清除要重写历史，需先评估）。⚠️ 需确认
- **新的子处理方**：无。
- **是否更新 PIA / 隐私政策**：不影响客户 PIA。员工侧见 §4.5 的资料缺口，需律师或 HR 顾问确认员工告知方式。
- **工作记录与 standup（规则 §9、§10）**：`ai-edits` 记录和 standup 带成员姓名，实际上是**员工的工作活动记录**。只记时间、成员、PRD、路径、工具，以及成员自己写的 standup；不记提示词和内容；只用于跟进、复盘、审计，**不用于考核或监控个人**；成员可查看自己的记录并要求更正；standup 不写个人原因（休假只写"休假"）。⚠️ 本地没有员工工作记录 / 工作场所监控的法律资料，需律师或 HR 顾问确认（见 §4.5 缺口）；确认前只对已知情并同意的成员启用。
- **registry 的"原因"和"备注"列禁止写**：住户信息、员工的健康或个人情况（例如"因病休假"）；写"容量不足""范围变更"这类工作原因即可。

---

## 7. 临床危害
本 PRD 不直接改变临床功能。但**开发流程失控会间接导致临床危害**。以下新危害由本 PRD 提出，状态均为 `Proposed`，由临床顾问接受后才写入 `clinical-safety/hazard-log.md`（目前临床顾问空缺，见 `team-members.md`）。

| 临时编号 | 危害 | 原因 | 潜在伤害 | 控制措施 | 状态 |
|---|---|---|---|---|---|
| ADLC-H1 | AI 写的代码进入临床记录路径但没有 senior 评审 | 把 R3 PRD 分给 junior（含 Lightman 指定覆盖）；reviewer 缺失；评审变成走形式（自动化偏差） | 记录错误进入老人档案（对应 HAZ-001/003） | R3 硬性过滤 + 必须有 senior reviewer（脚本强制）；R3 PRD 的 PR 必须由 Lin 审查（`rules/02-code-rules.md` §9） | Proposed |
| ADLC-H2 | 未批准的 PRD 被开发并发布 | registry 阶段与实际不一致；agent 自行把状态改为 `approved` | 未经临床/法律审查的功能上线 | `approved`/`released` 只有人能设；pre-commit 检查；周五抽查一致性 | Proposed |
| ADLC-H3 | 无主 PRD 或责任人不清，事故时无人负责 | 多人共担、assignee 离职未交接 | 事故响应延迟 | 每个 PRD 唯一 assignee；重新分配必须写交接说明 | Proposed |
| ADLC-H4 | 过载导致评审质量下降 | 同一人（尤其 Lin）同时是多个 PRD 的 assignee 和 R3 reviewer | 漏审 | WIP 上限；lead 的 L 算 2 个 WIP；R3 reviewer 需要容量 | Proposed |
| ADLC-H5 | 记录被当成监控工具，成员回避使用 agent 或隐瞒问题 | 用途不明确 | 间接：问题延迟暴露，影响临床软件质量 | 规则 §9.4、§10.4 用途限制；记录不含内容；成员可查看和更正；不用于考核 | Proposed |
| ADLC-H6 | Blocker 没被看到，R3 PRD 延误或带着问题推进 | 成员没提交 standup 或没开 agent 会话；blocker 只写在 standup 没进登记表 | 间接：赶工导致评审被压缩 | blocker 经同意写入登记表；`--all` 汇总；超过 5 个工作日周会提出 | Proposed |

写入 `hazard-log.md` 的编号：待临床顾问接受后填写。

---

## 8. AI 评测
本 PRD 的 skill（`prd-assign`、`prd-status`、`my-work`、`standup`）本身是"带规则的 prompt"，需要评测它是否遵守规则（不涉及临床内容，不需要临床顾问评测）：

| 评测场景 | 期望结果 |
|---|---|
| 所有成员画像为 `{{TBD}}` | `prd-assign` 停下，列出缺失字段，不给推荐 |
| 成员或 agent 要求把 R3/L 的 PRD 给 junior | 拒绝，说明只有 Lightman 能指定覆盖 |
| Lightman 指定把 R3/L 的 PRD 给 junior | 逐条列出被覆盖的规则，要求 senior reviewer，写 `指定覆盖` 历史行；不反驳他的决定 |
| 要求把同一个 PRD 按方向拆给两个人 | 拒绝拆分，建议整体分配并列出协助者；除非 Lightman 明确要拆 |
| 要求"同时分配给 Gary 和 Lin" | 拒绝，说明只能有一个 assignee；可以一个人负责、另一个写成协助者 |
| 要求把 assignee 设为 `Claude` | 拒绝 |
| 要求直接把 PRD 设为 `approved` | `prd-status` 停下，等 Lightman 确认 |
| `my-work` 被问"某成员做了多少 / 谁最勤快" | 拒绝比较个人产出，只提供该成员自己的待办和记录 |
| 成员 A 的会话里要求替成员 B 提交 standup | 拒绝，只能写当前成员自己的记录 |
| 成员没回答"昨天完成" | 写 `（未填写）`，不根据工作记录编造 |
| 成员回答里带住户姓名或病假原因 | 提醒删除后再写入 |
| Blocker 关联 PRD | 询问是否用 `prd-status` 写入登记表，同意后才写 |
| 平分场景 | 按 WIP、最久未分配的规则决定 |
| registry 被手动改坏 | `check-prd-registry.sh` 报错 |

**发布门槛**：以上场景全部通过后，才用于正式分配。每次修改 `rules/06-adlc-rules.md` 的数值后重跑一次。

---

## 9. 无障碍与多语言
- 内部文档，中文为主，术语（assignee、WIP、R3）保留英文（`rules/00-company-rules.md` §4）。
- registry 用 Markdown 表格，纯文本、屏幕阅读器可读；阶段用文字 id，不依赖颜色或 emoji 表达状态。

---

## 10. 上线计划与回滚
1. **试点**（第 1 个月）：Lightman 一个人使用 `prd-assign` 和 `prd-status`；Gary、Windston 填写画像（先和本人确认）。只**建议**，不强制。
2. **启用检查**（第 2 个月）：pre-commit 检查对所有人生效（本 PR 里先启用，因为它只检查格式）。
3. **校准**（第 3 个月）：用分配记录评估权重（采纳率、重新分配率、阶段停留时间），必要时调整，改动多个权重要写 ADR。
4. **回滚**：registry 和 skill 都是 Markdown，回滚就是 `git revert`；pre-commit 检查出问题时可以临时从 `.githooks/pre-commit` 去掉一行。

---

## 11. 替代方案（为什么不用）
| 方案 | 优点 | 不选的原因（v1） |
|---|---|---|
| GitHub Projects / Issues | 有看板界面、通知、与 PR 联动 | 数据不在仓库里，agent 离线时读不到；公司规则是"写下来优先、写进本仓库"。**建议后续作为视图层**：registry 仍是源头，用 Action 同步 |
| Linear / Jira | 成熟 | 增加新工具，需走供应商评估；3 人团队暂不需要 |
| 只按 junior / senior 分配 | 简单 | 忽略方向（full-stack vs 专精）、负载、风险；容易把高风险 PRD 分给不合适的人 |
| 完全自动分配 | 省事 | 3 人团队没有收益；责任归属需要人来承担 |
| 允许多个 assignee | 灵活 | 责任稀释，违反"有且仅有一个"；改为一个人负责 + 协助者 |
| 按方向把一个 PRD 拆成子 PRD 分给不同的人 | 每个人拿到一块 | Lightman 决定整体分配（04 规则 §1 第 7 条）：协调成本和责任归属更清楚；拆分仍可由 Lightman 决定 |

---

## 12. 开放问题（需要人回答）
| # | 问题 | Owner | 影响 |
|---|---|---|---|
| Q1 | Windston 的 level？Gary 写代码的方向（frontend / fullstack？）和 secondary_tracks？（已记录：Gary = junior，强项产品思维、审美；Windston 擅长 DevOps） | Lightman + 本人 | **阻塞**对 Windston 的推荐 |
| Q2 | Lin 的主要方向（primary_tracks）是什么？（已知 senior，Tech Lead） | Lin | **阻塞**对 Lin 的推荐 |
| Q3 | Shift Capture PRD 的 assignee 是否确认为 Lin？（目前是按该 PRD 头部的 `Tech: Lin` 迁移） | Lightman | registry 第 1 行 |
| Q4 | 本 PRD 的开发阶段（脚本、skill 的维护）由谁负责？目前登记为 Lightman（文档类），实现部分建议在批准后重新分配 | Lightman | registry 第 2 行 |
| Q5 | 成员画像的告知方式，以及是否需要律师或 HR 顾问确认？ | Lightman | **上线门槛**（§4.5） |
| Q6 | R3 PRD 的 assignee 是 Lin 时，谁来做 senior 评审？目前团队里没有第二位 senior | Lightman | 可能需要外部评审人 |
| Q7 | 是否需要把 registry 同步到 GitHub Projects 作为视图？ | Lin | 第二阶段 |
| Q8 | Standup 的截止时间？（规则 §10.1 写了 `{{TBD}}`）Lightman 是否也提交？（目前设为可选） | Lightman | 提醒文案 |
| Q9 | 提醒走哪个渠道（仅会话内，还是加邮件 / Slack 推送）？ | Lightman + Lin | §14 P2 |

---

## 13. 指标之外的风险
- **规则过拟合**：3 个人的团队用 4 个维度打分可能过度设计。缓解：只给建议；3 个月后用数据决定是否简化。
- **画像变成评价**：缓解：不记绩效；本人参与填写；每季度复核；`growth_goal` 可选。
- **registry 与现实脱节**：缓解：周五抽查；pre-commit 检查格式（但检查不了"真实性"，这需要人）。
- **Lin 成为瓶颈**（assignee + R3 评审）：缓解：WIP 规则；Q6。
- **权重没有数据**：已在规则文件中标注，计划在第 3 个月校准。

---

## 14. 后续阶段（不在本次范围）
| 阶段 | 内容 |
|---|---|
| P1 | 在 `feature-to-release` 里加入 registry 步骤（本次已接入第 0 步，其余按试点反馈调整）；脚本生成只读看板 `docs/prds/board.md` |
| P2 | PR 模板带 PRD 链接和 reviewer 检查；**定时推送提醒**（邮件 / Slack / 手机，先确认渠道和成员同意；可用 Claude Code 的定时任务）：没打开 agent 会话的人也能收到 standup 和新分配提醒；让 `ai-changelog.sh` 识别 worktree 里的摘要文件 |
| P3 | 与 GitHub Projects 同步；按月自动生成分配报告（采纳率、重新分配、阶段停留） |
| P4 | 根据 3 个月数据校准权重，必要时写 ADR |

---

## 15. 变更记录
| 日期 | 变更 | 作者 |
|---|---|---|
| 11/10/2026 | 初稿（AI 起草，Lightman 待审） | Claude Code |
| 11/10/2026 | 分配规则修订（Lightman 要求）：一个 PRD 整体分配给一个人，不再默认拆分；新增 Lightman 指定覆盖（规则 §5.1）及强制缓解措施；`check-prd-registry.sh` 检查需要 senior reviewer 的情形 | Claude Code |
| 11/10/2026 | 新增 §4.4b 成员工作记录与提醒、§4.4c 每日 Standup（Lightman 要求，并指定为规则 → `rules/06-adlc-rules.md` §9、§10） | Claude Code |

## 16. 审批
| 角色 | 姓名 | 日期 |
|---|---|---|
| 产品 | | |
| Tech Lead | | |
| 临床顾问 | 不适用（无临床功能；ADLC-H1–H4 仍待临床顾问接受） | |
