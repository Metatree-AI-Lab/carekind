# Shift handover（交接班记录，ISBAR 结构）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
班末由 RN 生成、编辑、确认的交接摘要，交给下一班（[PRD §7.4](../../../docs/PRD.md)）。careKind 从**本班已确认的记录**汇总 S 和 B，A 和 R 只用 RN 原话。

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 进入交接 |
|---|---|
| 跌倒、伤害 / 疑似虐待或忽视、限制性措施、病情变化 / 升级、临终照护（Tier 3） | ✅ 置顶 |
| 情绪或行为、疼痛 / 皮肤 / 临床观察（Tier 2） | ✅ |
| 日常照护、饮食饮水、家属沟通 | 有变化或有需要时 |
| 本班没有任何记录的住户 | 列入"未记录住户"提醒 |

另外：转院、转科、住户从医院回来（transition of care）也用本模板。

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | careKind 从已确认记录汇总 S/B；交班 RN 口述或输入 A/R |
| 谁审核签署 | 交班 RN 编辑并确认；接班 RN / EN 在 App 中确认"已接收"（留痕） |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | 按所含最高 Tier；含 Tier 3 事件的交接只能由 RN 确认 |
| 时限 | 每次换班前完成；转院时随住户一起交出 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 交接时必须使用结构化沟通系统 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 3.3.1、3.3.2(c)(d)，第 27 页 | 固定 ISBAR 结构；风险、变化、恶化、事件必须进入交接 |
| 识别和升级恶化 | 同上 | Action 3.2.5(c)，第 26 页；Outcome 3.3 statement，第 27 页 | 恶化和升级状态要交接（是否升级由 RN 决定） |
| 信息准确、按需可得 | 同上 | Action 2.7.2(a)(b)，第 19 页 | 只复述已确认记录；接班确认留痕 |
| ISBAR 结构 | `03-legal-compliance/references/paperwork-templates/sa-health-isbar-clinical-handover-fact-sheet.pdf` | 第 1 页（Identify：至少 3 个识别信息；建议各单元定义最小数据集） | 只参考结构；**该文件版权说明矛盾（⚠️ 需核实），不复制其措辞和版式** |
| 转院时共享 ACP 文件 | strengthened-aged-care-quality-standards-nov-2025.pdf | Action 3.1.6，第 25 页 | 转院交接时显示 ACP 存放位置（只引用已有记录） |
| TGA 边界 | `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | — | A/R 栏最容易变成 AI "建议"：只用 RN 原话，没说就"请填写" |

**州差异**：交接结构没有州法差异；VIC 公营养老另有护士配比法（Safe Patient Care Act 2015），影响排班但不影响本模板字段。见 `03-legal-compliance/references/state-by-state-comparison.md` §3.6。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Handover from / to | 交班人、接班人、角色、时间 | ✅ | 🧑 人工 | |
| Scope | 整个单元 / 指定住户 | ✅ | 🧑 人工 | |
| **I** Identify | 住户姓名 + DOB + Resident ID（≥3 项）+ 房间 | ✅ | 🤖 AI 可起草 | 从住户档案带出，不从口述猜 |
| **S** Situation | 本班发生了什么 | ✅ | 🤖 AI 可起草 | 只复述**已确认**记录，附链接 |
| **B** Background | 相关背景（care plan、BSP、近期事件） | 有则填 | 🤖 AI 可起草 | 只引用档案里已有的内容，不总结病史 |
| **A** Assessment | 交班 RN 自己的评估 | ✅ | 🧑 人工 / 🗣️ 照录 | **只用 RN 原话**；没说 → "请填写" |
| **R** Recommendation / actions | 交班 RN 要求下一班做的事、责任人、时间 | ✅ | 🧑 人工 / 🗣️ 照录 | **只用 RN 原话**；AI 不补任何建议 |
| Values to carry over | 最近一次体征、摄入量等 | 有则填 | 🗣️ 照录 | 原值 + 时间；不标"正常 / 异常" |
| Pending items | 待回电、待复查、待写的记录 | 有则填 | 🤖 AI 可起草 | 来自未完成的"请填写"和已说出的跟进 |
| Unrecorded residents | 本班没有记录的住户 | 自动 | 🤖 AI 可起草 | 只是提醒，不推断原因 |
| Handover accepted | 接班人确认 | ✅ | 🧑 人工 | 留痕 |

## 5. 空白模板
```markdown
### Shift handover (ISBAR)
From: ____ (role) → To: ____ (role) · Date: __/__/____ · Time: __:__ · Scope: ____

#### Resident: ____
- **I** — Name: ____ · DOB: __/__/____ · ID: ____ · Room: ____
- **S** — ____ (linked records: ____)
- **B** — ____
- **A** (handing-over RN's words): ____
- **R** (actions · who · by when): ____
- Latest values (as recorded): ____
- Pending: ____

Unrecorded residents this shift: ____
Handover accepted by: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · PM shift → Night shift。人物均为虚构。

From: Daniel Reyes RN（虚构）→ To: Sofia Martins RN（虚构，night shift RN）· 18/10/2026 · 22:45 · Scope: Wattle wing + Banksia wing

#### Resident: Mrs Edna Hall（虚构，88 岁）— Tier 3 置顶
- **I** — Edna Hall · DOB 03/02/1938 · WG-0412 · Room 12, Wattle wing
- **S** — Unwitnessed fall in her en-suite bathroom at 15:10, found sitting on the floor by Priya (PCW). Edna said her foot slipped on the wet mat. Right wrist skin tear 3.0 × 1.0 cm, dressed 15:50. GCS 15 at 15:15 (RN). Edna rated right wrist pain 4/10 at 15:25 and 2/10 at 17:30. GP and daughter notified. （links: progress note 15:35 · incident draft · pain · vital signs · wound · escalation · family log）
- **B** — Lives in Wattle wing; walks with a four-wheeled walker（档案记录）. Care plan: food & fluid chart since 15/10/2026.
- **A**（RN 原话，22:40 口述）："She's comfortable in bed, chatting earlier, obs have been steady all evening, wrist dressing is dry and intact."
- **R**（RN 原话）："Keep going with neuro obs as per the post-fall procedure, next set at 02:20. Check the dressing stays intact. Dr Brooks is reviewing her on the morning round. If anything changes, ring Dr Brooks' after-hours line and let Karen know."
- Latest values（as recorded, 22:20）: BP 134/80 · HR 80 · RR 16 · SpO2 96% (room air) · GCS 15
- Pending: Incident report — RN / Care Manager to complete review（`请填写`：SIRS 评估结果由 Grace Liu 记录）。Karen Hall to visit 19/10/2026 10:00.

#### Resident: Mr Tomasz Nowak（虚构，81 岁）— Tier 3
- **I** — Tomasz Nowak · DOB 22/06/1945 · WG-0287 · Room 7, Banksia wing (memory support)
- **S** — 16:40–16:58 at the Banksia wing exit door, pushing the handle and hitting the door with his open hand, saying "Let me out, I need to go home." Settled with a garden walk (BSP strategy). Said "This knee is no good today"; PRN paracetamol 17:10 as charted in eNRMC; at 18:10 said "Knee is better now". Declined shower at 19:30, said "Tomorrow." （links: ABC chart · PRN record · RP monitoring entry）
- **B** — BSP reviewed 01/09/2026. Environmental restraint (keypad exit doors, Banksia wing) with consent recorded 01/09/2026; next BSP review 01/12/2026（档案记录）.
- **A**: **请填写**（Daniel 没有口述 Tomasz 的 assessment）
- **R**（RN 原话）："Offer the shower in the morning, he likes it before breakfast."
- Pending: —

Unrecorded residents this shift: 无
Handover accepted by: Sofia Martins RN · 22:52

**原话 → AI 草稿对照（Edna 的 S 栏）**
- 原话（Daniel 22:40）："Just tell her about Edna's fall, the wrist, and the pain scores."
- AI 草稿 S 栏是从**已确认**的 progress note、pain 和 wound 记录拼出的；**粗体**部分是 AI 选择和压缩：**"Unwitnessed fall"**（来自 RN 15:15 已确认的 note，而不是 AI 自己判断）、**"GP and daughter notified"**（压缩自 15:45、15:55 两条已确认记录）。
- AI 没有写 "no head injury"——RN 记录的是 "Edna denied hitting her head"，两者不是同一事实。

## 7. careKind 起草规则
- **可自动填**：I（从档案）、S（只用本班已确认记录，并显示链接）、B（只引用档案中已有条目）、latest values（原值 + 时间）、pending、未记录住户。
- **缺失时显示"请填写"**：A、R（任何一位住户）；交接人 / 接班人。
- **必须 RN 确认**：整份交接；含 Tier 3 的部分逐位住户确认。
- **禁止生成**：A/R 中任何 RN 没说过的内容（"monitor closely"、"consider X-ray"、"watch for delirium"）；对体征的判断（"stable"、"within normal limits"，除非 RN 原话）；风险等级或优先级评分；对未记录住户的推断。
- 排序只按 Tier 和事件类型（Tier 3 → Tier 2 → 其他），**不按"病情严重程度"排序**。
