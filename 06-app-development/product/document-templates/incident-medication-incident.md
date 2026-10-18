# 用药事件报告（Medication incident report）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。careKind **不替代用药系统（eNRMC / medication chart）**：药名、剂量、给药时间以用药系统为准，由 RN 核对后填写；careKind 不给任何用药处理建议。

## 1. 用途与触发事件
- 用途：记录一次用药事件或 near miss（漏给、给错人、给错药、剂量错误、时间错误、给药途径错误、已签未给、存储或交接问题等）的事实、对住户的影响、通知和后续，进 IMS，并供机构用药治理（如 Medication Advisory Committee）复盘。
- 触发事件：PRD §14 没有单列"用药事件"，按 **伤害**（有伤害或可能有伤害）和 **病情变化 / 升级** 处理；同时生成 `incident-report-ims.md`（链接同一 IMS 编号）和 SIRS 评估提示。PRN 效果记录不是用药事件，用 clinical 类模板。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | 发现人（RN / EN；PCW 发现时口述）；careKind 起草叙述 |
| 谁审核签署 | Shift RN 确认事实并核对用药系统；Care Manager 负责调查、分级（按机构用药事件分级，如有）和关闭 |
| 风险 Tier | **Tier 3**（按"伤害 / 病情变化"处理，PRD §6.5）——默认值，机构可配置 |
| 时限 | 发现后即时处理并通知 GP / 药剂师（按机构政策）；IMS 记录"及时"；涉及 SIRS 的时限见 `incident-sirs-assessment-prep.md`；记录保存 7 年（r 164-25(2)） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 安全用药系统；准确完整的用药记录；转运时可获得最新用药清单 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 5.3.1(b)(e)，第 35 页 | 药物信息以用药系统为准 |
| 用药不良事件后做用药复核 | 同上 | 5.3.2(e)，第 36 页 | 复核由 GP / 药剂师决定，careKind 只记录 |
| 向 TGA 报告药品和疫苗不良事件的流程 | 同上 | 5.3.5，第 36 页 | 是否报告 🧑 人工 |
| Incident management | 同上 | 2.5.1–2.5.6，第 17–18 页 | |
| IMS 最低记录字段 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 164-25(1)，印刷页 282 | 与 `incident-report-ims.md` 共用 |
| 用药事件管理阶段（含 SIRS、不良事件报告） | `03-legal-compliance/references/paperwork-templates/health-guiding-principles-medication-management-racf-2022.pdf` | Guiding Principle 3，第 30–31 页（Figure 4 phases of incident management） | CC BY 4.0；主题参考 |
| 用药事件字段与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md`；`03-legal-compliance/references/paperwork-requirements-by-event.md` | §2.4；§4 | 药名剂量不能由 AI 补全 |
| neglect 定义（可能与用药遗漏有关） | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 16-5(10)，印刷页 96 | 是否构成 neglect 🧑 RN/CM 决定 |

**州差异提示**：谁可以给药、协助给药（PCW / EN / RN）以及药品分类管理按州法差别很大，见 `03-legal-compliance/references/state-clinical-practice-rules.md`。本模板只记录"谁做了什么"，不评价是否越权；如果口述内容可能涉及越权给药，只提示"请按机构政策和州规则复核"。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| M01 | IMS reference | | 是 | 🧑 人工 | |
| M02 | Resident | | 是 | 🤖 | 本班名单内匹配 |
| M03 | Incident type | Omitted / wrong resident / wrong medicine / wrong dose / wrong time / wrong route / signed not given / other | 是 | 🧑 人工 | AI 可按原话预选，**RN 必须确认** |
| M04 | Medicine(s) involved | 名称、剂量、途径、计划时间 | 是 | 🧑 人工 | RN 从用药系统核对后填写；口述里的药名只作对照 |
| M05 | Date / time of the intended dose | | 是 | 🧑 人工 | 以用药系统为准 |
| M06 | Date / time identified · by whom | | 是 | 🗣️ | |
| M07 | How it was identified | | 是 | 🤖 | |
| M08 | What happened (facts) | | 是 | 🤖 | 只写事实，不写"原因是" |
| M09 | Staff involved — own account | 当事员工原话 | 否 | 🗣️ | 不评价过错 |
| M10 | Resident observed after identification | 员工观察、住户原话、数值 | 是 | 🗣️ | 数值照录；不判断"无影响" |
| M11 | Harm caused / could reasonably have been caused | | 是 | 🧑 人工 | RN 写；r 164-25(1)(a) |
| M12 | GP / NP contacted · time · instructions | 指示**逐字照录** | 是 | 🗣️ | careKind 不补充 |
| M13 | Pharmacist contacted | | 否 | 🗣️ | |
| M14 | Actions taken | 按 GP 指示做了什么 | 是 | 🗣️ | |
| M15 | Supporter / resident informed | 谁、时间、对方回应 | 是 | 🗣️ | open disclosure |
| M16 | Care Manager informed | | 是 | 🗣️ | |
| M17 | Is this a reportable incident? | Yes / No / Under assessment | 是 | 🧑 人工 | 不预填 |
| M18 | TGA adverse event report needed? | Yes / No / N/A | 否 | 🧑 人工 | SQS 5.3.5 |
| M19 | Medication review requested | | 否 | 🧑 人工 | GP / 药剂师决定 |
| M20 | Contributing factors observed | 员工看到的情况（中断、交接） | 否 | 🗣️ | 观察，不是根因 |
| M21 | Investigation / improvement actions | | 是 | 🧑 人工 | CM |
| M22 | Recorded by · RN confirmation | | 是 | 🤖 / 🧑 | |

## 5. 空白模板
```text
MEDICATION INCIDENT REPORT                         IMS ref: ____________
Resident: ______________ Room: ____ ID: ______
Incident type (RN confirmed): ☐ Omitted ☐ Wrong resident ☐ Wrong medicine ☐ Wrong dose
  ☐ Wrong time ☐ Wrong route ☐ Signed not given ☐ Other: ________
Medicine(s) involved (per medication system, entered by RN): ______________________
Intended dose date/time: __/__/____ __:__
Identified: __/__/____ __:__ by ____________   How: ____________________________
What happened (facts): ___________________________________________________
Staff member's own account: "______________________________________________"
Resident observed after identification (time, observations, own words): ________
Harm caused / could reasonably have been caused (RN): ___________________________
GP/NP contacted: __:__ by ______  Instructions (verbatim): "____________________"
Pharmacist contacted: ☐ Yes __:__ ☐ No
Actions taken: ___________________________________________________________
Resident / supporter informed: ______ __:__  Response: _______________________
Care Manager informed: ______ __:__
Reportable incident? ☐ Yes ☐ No ☐ Under assessment — decided by: ______ (RN/CM)
TGA adverse event report: ☐ Yes ☐ No ☐ N/A   Medication review requested: ☐ Yes ☐ No
Contributing factors observed: ___________________________________________
Investigation / improvement actions (CM): _________________________________
Recorded by: ________ __/__/____ __:__   RN confirmed: ________ __/__/____ __:__
```

## 6. 示例（虚构）
> 虚构机构 Wattle Grove Residential Care（虚构）。新增虚构人物：Sunita Rao RN（AM shift RN，虚构）、Marek Nowak（Mr Nowak 的儿子，VIC temporary SDM，虚构）。Mr Tomasz Nowak · DOB 22/06/1945 · WG-0287 · Room 7, Banksia wing（memory support）。

**原话 → AI 草稿对照（片段）**
| 片段 | 口述原话 | careKind 草稿 |
|---|---|---|
| S1（Daniel Reyes RN, 13:45） | "Tomasz Nowak, room seven Banksia. His eight o'clock paracetamol isn't signed in the eNRMC. Sunita says he was asleep at eight, she meant to go back and didn't. So it wasn't given." | At 13:40 on 18/10/2026, Daniel Reyes RN found that Mr Tomasz Nowak's 08:00 dose was not signed in the eNRMC. Sunita Rao RN said Mr Nowak was asleep at 08:00, that she meant to return and did not. The dose was not given. |
| S2（Daniel, 13:55） | "He's out in the garden with Ana, walking, smiling. I asked if he's sore anywhere, he said 'No, no, I'm good.'" | At 13:50 Mr Nowak was walking in the garden with Ana Lopes (lifestyle coordinator) and smiling. When asked if he had pain anywhere, he said: "No, no, I'm good." |

> 草稿没有写"no harm"——是否造成伤害由 RN 在 M11 自己写。口述里的 "paracetamol" 只作对照；M04 由 RN 从 eNRMC 填入。

**填写后的记录**
```text
MEDICATION INCIDENT REPORT                   IMS ref: WG-IMS-2026-0417 (fictional)
Resident: Mr Tomasz Nowak (fictional), 81, DOB 22/06/1945, WG-0287   Room: 7, Banksia wing — memory support (fictional)
Incident type (RN confirmed): Omitted
Medicine(s) involved (per eNRMC, entered by Daniel Reyes RN): Paracetamol 1 g oral, regular,
  charted 08:00 / 14:00 / 20:00
Intended dose: 18/10/2026 08:00
Identified: 18/10/2026 13:40 by Daniel Reyes RN   How: reviewing the eNRMC at the start of PM shift
What happened: The 08:00 dose was not signed in the eNRMC. Sunita Rao RN (AM shift) said Mr Nowak
  was asleep at 08:00 and that she intended to return and did not. The dose was not given.
Staff member's own account (Sunita Rao RN, by phone 13:48): "He was fast asleep at eight. I put
  it aside to go back, then the morning got busy with the wound dressings and I forgot."
Resident observed: 13:50 walking in the garden with Ana Lopes, smiling. Asked about pain:
  "No, no, I'm good." Ate lunch (Priya, PCW: "ate all his soup and half the sandwich").
Harm (RN): No harm observed at 13:50 or 14:25. Dose missed for 6 hours. — Daniel Reyes RN
GP/NP contacted: 14:20 by Daniel Reyes RN — Dr Amelia Brooks (GP, fictional)
  Instructions (verbatim): "Don't give the missed dose. Give the 14:00 dose as charted and carry
  on with the usual times. Let me know if he seems uncomfortable."
Pharmacist contacted: No
Actions taken: 14:00 dose given at 14:25 after the GP call (Daniel Reyes RN, signed in eNRMC).
Resident / supporter informed: Mr Nowak told at 14:25 ("Okay, thank you"). Son Marek Nowak
  (fictional) informed by phone 14:45, per Mr Nowak's documented contact preference —
  Marek: "Thanks for telling me. As long as he's comfortable."
Care Manager informed: Grace Liu (CM, fictional) 16:00 by phone (same call as the fall notification)
Reportable incident? Under assessment — decided by: Grace Liu (CM)
TGA adverse event report: N/A (Grace Liu)   Medication review requested: No (Dr Brooks)
Contributing factors observed: Mr Nowak asleep at the scheduled time; AM shift had three wound
  dressings between 08:00 and 10:30 (Sunita Rao RN's account).
Investigation / improvement actions (CM): Grace Liu to review "withheld / return later" process
  with AM RNs at the 20/10/2026 huddle.
Recorded by: Daniel Reyes RN via careKind dictation 18/10/2026 14:50
RN confirmed: Daniel Reyes RN 18/10/2026 15:00
```

## 7. careKind 起草规则
- **可以从口述自动填**：M02、M06–M10、M12–M16、M20（只照录）、M22 的记录人。
- **缺失显示"请填写"**：M04 药物信息（**永远不由 AI 填**）、M05、GP 指示、通知 supporter 的时间和回应。
- **必须 RN / CM 确认或填写**：M03、M04、M05、M11、M17–M19、M21。
- **禁止生成**：是否补服、是否加量 / 减量、观察多久、换药或停药等任何用药处理建议；"no harm / low risk"等伤害等级；用药错误原因结论或对员工的评价；药名或剂量的自动补全（即使口述含糊——识别置信度低时必须让员工确认）。
- 口述中出现"PRN""sedation""to settle him"等词时，提示 RN 核对 BSP 和同意记录（PRD §14 限制性措施提示），**只提示，不判定 chemical restraint**。
