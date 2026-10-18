# Restrictive practice consent record（限制性措施知情同意记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录**同意讨论的过程和结果**：给同意的人是谁、依据什么身份、同意了什么（做法、情境、频率、持续时间、预期结果、复核时间）、讨论前告知了哪些替代策略和结果、对方的问题和原话、拒绝或撤回。**同意本身是人的决定，careKind 只记录讨论**；结果必须写进 BSP 和 care and services plan。

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 限制性措施：评估认为需要，准备取得同意 | ✅（Care Manager / RN 口述讨论过程） |
| 限制性措施：复核后需要继续使用（r 162-65） | ✅ 新的同意记录 |
| 同意人撤回或拒绝同意 | ✅ + 提示"不能再按原同意使用，请更新 BSP" |
| 使用超出已同意的范围，或换了另一种做法 | 提示"需要另行取得同意"（RPSDM fact sheet 第 2 页） |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 主持同意讨论的 Care Manager 或 RN（careKind 整理其口述） |
| 谁审核签署 | Care Manager / RN 确认记录；**同意由住户本人或 RPSDM 给出**，签名或书面确认按机构流程（careKind 不代签） |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 3，只能 RN / Care Manager 逐条确认 |
| 时限 | **使用前**取得（紧急情况例外，见 r 162-15(2)、162-35）；按 BSP 复核日期重新确认；联邦 hierarchy 过渡期到 01/12/2026 ⚠️ |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 同意须由住户或（无能力时）RPSDM 给出，覆盖做法和使用方式（持续时间、频率、预期结果） | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 162-15(1)(f)(g)，第 269 页（印刷页码） | "同意范围"字段必须有这几项 |
| RPSDM 的含义（先看州法，再看联邦 hierarchy） | 同上 | r 6-20，第 33 页；nominee r 6-15，第 31 页 | 记录 RPSDM 的身份**依据**；由人判断 |
| BSP 必须写明：适用 r 6-20 的哪一款及理由、RPSDM 姓名、与住户 / RPSDM 的协商、同意的记录 | 同上 | r 162-55(f)(g)(h)，第 275–276 页 | 字段一一对应 |
| 继续使用需重新协商和同意 | 同上 | r 162-65(d)(e)，第 277 页 | 复核后生成新记录 |
| nominee：防止胁迫、协助通知、保存提名记录 | 同上 | r 162-40，第 272–273 页 | 记录提名是否已同意 / 撤回 |
| 协商 BSP、可获得的格式 | 同上 | r 162-75，第 278 页 | 记录提供了 BSP 副本及格式 |
| 同意须 informed、voluntary、current，有能力；可拒绝或撤回；超出范围须另行同意；告知替代策略和结果；记录在 BSP 和 care and services plan | `03-legal-compliance/references/paperwork-templates/health-consent-for-restrictive-practices-info-for-providers-2026.pdf` | 第 1–2 页 | 清单字段参考（**用自己的措辞，不复制原文**） |
| 知情同意、最后手段 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 3.2.7(c)，第 26 页 | |
| BSP 内容（旧法时期） | `03-legal-compliance/references/paperwork-templates/acqsc-behaviour-support-plans-fact-sheet.pdf` | v1.8，2021（⚠️ 法律依据已换成 Rules 2025） | 只作参考 |

**州差异（重要）**：先确定住户所在州的 RPSDM 机制——VIC：*Aged Care Restrictive Practices Substitute Decision-maker Act 2024* (Vic)，四层级（nominee → temporary SDM → VCAT 委任 → VCAT），provider 须在 BSP 或管理系统中记录 temporary SDM；QLD：QCAT 委任 guardian / Public Guardian；NSW：guardian 或 enduring guardian 的 RP 职能（Guardianship Regulation 2026）；SA：ACD Act SDM，physical restraint 可能须 SACAT 授权 ⚠️；WA：须有相应授权的 guardian ⚠️；TAS / ACT / NT ⚠️ 未核实。联邦 hierarchy 只在州法没有机制或委任严重延迟时使用，过渡期到 01/12/2026。**模板不硬编码联邦五级 hierarchy。** 见 `03-legal-compliance/references/state-by-state-comparison.md` 表 B、§3.4、§4.6。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident / State | | ✅ | 🧑 人工 | |
| Restrictive practice & type | 做法 + 5 类之一 | ✅ | 🧑 人工 | 来自 BSP |
| Assessment reference | approved health practitioner（非化学）或医生 / NP（化学）的评估日期和人 | ✅ | 🧑 人工 | 引用 BSP；careKind 不生成评估 |
| Capacity to consent | 住户是否有能力就此同意，由谁、何时判断 | ✅ | 🧑 人工 | **AI 不判断能力** |
| Consent given by | 住户本人 / RPSDM 姓名 | ✅ | 🧑 人工 | |
| Basis for RPSDM | 州法机制及层级 / 委任文件 / r 6-20 某款 + 理由 | RPSDM 时必填 | 🧑 人工 | **AI 不判断谁有权同意** |
| RPSDM capacity & willingness confirmed | | RPSDM 时必填 | 🧑 人工 | |
| Information provided | 为什么需要、预期结果、形式、时长、可能的影响 | ✅ | 🤖 AI 可起草 | 只整理员工说过已告知的内容 |
| Alternative strategies tried & outcomes shared | | ✅ | 🤖 AI 可起草 | 引用 BSP 和 ABC |
| Scope of consent | 情境 · 频率 · 持续时间 · 何时复核 · 如何监测 | ✅ | 🧑 人工 | 逐项确认；缺一项就不能标"完成" |
| Resident's own views | 住户本人的话（即使没有能力同意也要征求） | ✅ | 🗣️ 照录 | |
| RPSDM's questions & words | | 有则必填 | 🗣️ 照录 | |
| Decision | 同意 / 拒绝 / 需要时间考虑 | ✅ | 🧑 人工 | **同意本身** |
| Right to refuse / revoke explained | | ✅ | 🧑 人工 | |
| Copy of BSP provided (format) | | ✅ | 🧑 人工 | |
| Support contacts provided | 例如 Dementia Support Australia、OPAN | ✅ | 🧑 人工 | |
| Recorded in BSP & care plan | 日期 | ✅ | 🧑 人工 | |
| Review date | | ✅ | 🧑 人工 | |
| Withdrawal / change log | 日期、谁、原话 | 有则填 | 🗣️ 照录 | |
| Recorded by / witness | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### Restrictive practice consent record
Resident: ____ · ID: ____ · State: ____
Practice: ____ · Type: ____ · BSP version: ____
Assessment: ____ (practitioner, date)
Capacity to consent (who assessed, when): ____
Consent given by: ____ · Basis (state mechanism / document / Rules s 6-20 item + reason): ____
RPSDM capacity and willingness confirmed: ☐ · Written agreement to act: ☐

Information provided: ____
Alternative strategies tried → outcomes: ____
Scope — circumstances: ____ · frequency: ____ · duration: ____ · monitoring: ____ · review: __/__/____
Resident's own views: "____"
RPSDM said / asked: "____"
Decision: ☐ consent ☐ refuse ☐ needs time · Right to refuse / revoke explained: ☐
Copy of BSP provided (format): ____ · Support contacts provided: ____
Recorded in BSP and care and services plan on: __/__/____
Recorded by: ____ · Witness: ____ · __/__/____ __:__
Withdrawal / change log: ____
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 同意讨论 01/09/2026 14:00，Grace Liu 办公室。18/10/2026 的监测条目引用本记录。

Resident: Mr Tomasz Nowak（虚构，81 岁）· WG-0287 · State: VIC
Practice: Keypad-locked exit doors, Banksia wing (memory support) · Type: environmental · BSP version: 01/09/2026
Assessment: Dr Amelia Brooks（GP，虚构）, 27/08/2026 — documented in BSP
Capacity to consent: 🧑 "Dr Brooks assessed on 27/08/2026 that Tomasz is not able to consent to this practice." — recorded by Grace Liu
Consent given by: Marek Nowak（虚构，son）· Basis: 🧑 "Temporary SDM under the Victorian Act — Tomasz has no nominee and no partner; Marek has been his primary carer since 2023." — Grace Liu（Care Manager，虚构）
RPSDM capacity and willingness confirmed: ☑ · Written agreement to act: ☑ (signed 01/09/2026)

**原话（Grace Liu 14:45 口述，转写）**
> "Went through it with Marek. Told him why — Tomasz has been trying the front door most afternoons in August, the ABC charts show it, and twice he got out to the car park. Explained the Banksia doors stay keypad locked all the time but he can go anywhere inside the wing and the courtyard any time. What we've tried: the four o'clock garden walks, the Polish radio, the carpentry box, walking with him when he's at the door — fewer attempts but it hasn't stopped. Marek asked if his dad can still go out with family, I said yes, any time with family or staff. He said 'I don't like it, but I'd rather that than him on the road.' Tomasz was with us for the first part, he said 'I don't like locks, but I like the garden.' Marek agreed. Review on the first of December, sooner if anything changes. Told him he can change his mind any time. Gave him a copy of the BSP, large print, and the DSA and OPAN numbers. Daniel was there as witness."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Information provided: Why: Tomasz **attempted to leave through the front door on most afternoons in August 2026** (ABC charts) and **twice left the building to the car park**. Form: Banksia wing exit doors **remain keypad-locked at all times**; Tomasz can move freely inside the wing and garden courtyard at any time and can go out with family or staff at any time.
Alternative strategies tried → outcomes: 16:00 garden walks · Polish radio · carpentry activity box · staff walking with him at the door → **fewer attempts, but attempts continued**.
Scope — circumstances: **请确认**（原话："all the time"）· frequency: **continuous** · duration: until review · monitoring: **请填写**（原话没有说怎么监测）· review: 01/12/2026, or sooner if circumstances change
Resident's own views: "I don't like locks, but I like the garden."
RPSDM said / asked: Asked whether his father can still go out with family. "I don't like it, but I'd rather that than him on the road."
Decision: ☑ consent（🧑 Grace 确认）· Right to refuse / revoke explained: ☑
Copy of BSP provided (format): Large print · Support contacts provided: Dementia Support Australia, OPAN
Recorded in BSP and care and services plan on: 01/09/2026
Recorded by: Grace Liu（Care Manager，虚构）· Witness: Daniel Reyes RN（虚构）· 01/09/2026 15:00

**改写说明与审核要点**
- "twice he got out to the car park" → **"twice left the building to the car park"**：AI 只规范措辞；careKind **没有**判断这两次是否属于 SIRS "unexplained absence"（那是当时 RN / 经理的判断，应已在 incident 记录中处理）。
- "Basis for RPSDM" 和 "Capacity" 两栏完全来自 Grace 的人工填写，AI 不起草。
- Monitoring 一栏原话没有 → "请填写"；Grace 审核时补充："Each shift, RN records the six monitoring items in the RP monitoring record; Care Manager reviews weekly."
- 18/10/2026 的监测条目（`clinical-restrictive-practice-use-monitoring.md`）引用本记录；如果那天的使用超出这里的范围（例如把 Tomasz 留在房间里），系统会提示"需要另行同意，请确认"。

## 7. careKind 起草规则
- **可从口述自动填**：告知了什么、替代策略和结果（引用 BSP / ABC）、住户和 RPSDM 原话、提供的材料、讨论时间和在场人员。
- **缺失时显示"请填写"**：同意范围的任一项（情境、频率、时长、监测、复核）；同意依据；提供 BSP 副本；撤回权是否已告知。范围不完整时不能标记为"完成"。
- **必须人工（Care Manager / RN）**：住户能力、RPSDM 身份及依据、同意决定、复核日期、记录进 BSP 的确认。
- **禁止生成**：建议使用或不使用限制性措施；推荐某种做法或替代策略；判断住户是否有能力；判断谁是合法 RPSDM（尤其不能默认套用联邦 hierarchy）；"同意已有效"之类结论；代替同意人签名。
- 2026-12-01 之后：如果记录的依据是"联邦 hierarchy"，显示"联邦 hierarchy 过渡期已结束，请按现行规定核实"（⚠️ 期限是否延长需核实）。
