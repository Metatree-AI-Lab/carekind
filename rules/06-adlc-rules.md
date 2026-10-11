---
paths:
  - "docs/**"
  - "12-skills/prd-*/**"
  - "05-hr-teams/member-profiles.md"
---

# ADLC 规范：PRD 生命周期与分配 (Agent Development Lifecycle Rules)

Owner: Lightman (PO) · Last reviewed: 11/10/2026 · 适用：所有 PRD、所有 AI agent、所有被分配 PRD 的成员
规格来源：[`docs/prds/2026-10-11-adlc-prd-lifecycle.md`](../docs/prds/2026-10-11-adlc-prd-lifecycle.md)。**本文件是阶段、门禁、分配参数的唯一来源**，PRD 和 skill 引用这里，不重复写数值。

> ADLC = AI agent 参与每个阶段（起草、实现、评测、复核）的开发生命周期；**人负责决定和签字，agent 负责执行**。

## 1. 铁律
1. **每个 PRD 有且仅有一个 assignee**（一个人，不是团队、不是 AI agent、不是 "A/B"）。`idea` 以外的任何阶段都不能空缺。
2. **assignee 是责任人，不是唯一动手的人。** 他可以指挥 agent、请别人帮忙，但对该 PRD 能不能走到 `released` 负责。
3. **AI agent 不能当 assignee、reviewer 或 approver。** 审批类状态（`approved`、`released`）只能由人修改。
4. **reviewer ≠ assignee。**
5. 状态和 assignee 的唯一来源是 [`docs/prds/registry.md`](../docs/prds/registry.md)。PRD 文件头部的 `Status:` 只表示**文档审批状态**（Draft / Review / Approved），不要在两处各记一份生命周期阶段。
6. 分配建议由 `prd-assign` skill 给出，**最终分配必须由 Lightman 确认**（🧑）。重新分配同样要确认，并留下记录。

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

档位：**S = 0–2，M = 3–5，L = 6–8**。L 且需要 3 个以上技术方向（track）的 PRD，**应该先拆成子 PRD**，每个子 PRD 各有一个 assignee（registry 的 `Parent` 列记录父子关系）。

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
- 一个人也找不到时，不要放宽规则硬分：给出"缺什么"（缺 senior、缺容量、缺画像），让 Lightman 决定拆 PRD、延后或调整画像。

## 7. 参数调整
本文件的阈值、权重是**初版默认值，没有数据支撑**（⚠️ 需用前 3 个月的分配结果校准）。调整要在 registry 的历史里记录原因；改动超过一个因子的权重，写 ADR（`02-operating-system/decisions/`）。

## 8. 与其他规范的关系
- PRD 内容要求见 `rules/04-prd-rules.md`；本文件管**流转和归属**，不改变 PRD 的内容要求。
- `docs/PRD.md` §9 护栏优先于本文件；要改护栏必须写 ADR。
- 所有对 registry 和画像的修改都按 `rules/05-changelog-rules.md` 记 changelog。
- 分配结果**不能用于绩效考核**：registry 记录的是工作分派，不是评价。
