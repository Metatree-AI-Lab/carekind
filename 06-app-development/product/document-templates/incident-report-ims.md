# 住户事件内部报告（Incident report — IMS）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草`（只用口述里的事实整理措辞）· `🗣️ 照录原话/数值`（逐字照录，不改写、不补全）· `🧑 人工`（必须由指定人员自己填写或决定）。
> 本模板是**住户事件**（resident incident）的 IMS 记录；careKind 公司内部的安全 / 数据事故用 `09-templates/incident-report.md`，两者不能混用。

## 1. 用途与触发事件
- 用途：把一次住户事件或 near miss 的事实记进机构的 incident management system（IMS），作为调查、SIRS 评估、家属沟通和改进的共同底稿。
- 触发事件（PRD §14 事件类别）：**跌倒**；**伤害 / 疑似虐待或忽视**；情绪或行为（有伤害时）；限制性措施（视情况）；用药事件（另见 `incident-medication-incident.md`）；near miss。
- 同一事件通常还会生成：progress note、`incident-post-fall-record.md`（跌倒）、`incident-sirs-assessment-prep.md`、家属沟通记录、交接要点（PRD §7.3）。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | 发现或参与事件的 aged care worker 口述（PCW / EN / RN）；careKind 起草 |
| 谁审核签署 | Shift RN 逐条确认（PRD §9 G5）；Care Manager 负责调查、改进措施和关闭 |
| 风险 Tier | **Tier 3 敏感事件**（PRD §6.5）：只有 RN 能确认，不能批量确认 |
| 时限 | 员工知悉 reportable incident 后**尽快**告知 responsible person / 主管（Rules r 164-20(g)、r 165A-20）；有合理理由报警的，provider 须在知悉后 **24 小时内**通知警方（r 164-40(2)）；SIRS 时限见 `incident-sirs-assessment-prep.md`；记录保存 **7 年**（r 164-25(2)、r 154-150）。机构内部"几小时内录入 IMS"按机构政策 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| IMS 最低记录字段 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 164-25(1)(a)–(m)，印刷页 282 | 本模板字段 F05–F24 逐项对应 (a)–(m) |
| 适用范围（已造成或可合理预期造成伤害；含 alleged / suspected） | 同上 | r 164-10，印刷页 280 | "疑似"和"被指称"的事件也要记录 |
| IMS 须规定识别、记录、评估、响应、报告程序；员工尽快上报 | 同上 | r 164-20，印刷页 281 | 字段"Who was told / when" |
| 管理事件：支持受影响者、让其参与、open disclosure；警方 24 小时 | 同上 | r 164-40，印刷页 284 | F17–F19 |
| 评估可否预防、补救、是否通知他人 | 同上 | r 164-45，印刷页 285 | 调查部分 🧑 人工 |
| 记录保存 7 年 | 同上 | r 154-150，印刷页 234 | 已确认记录只能更正（PRD §9 G7） |
| Outcome 2.5 Incident management | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 2.5.1–2.5.6，第 17–18 页 | near miss 也要记录 |
| Outcome 5.4 通知 GP 和 supporters | 同上 | 5.4.4(d)，第 37 页 | F18 通知记录 |
| IMS 记录要点、即时支持 | `03-legal-compliance/references/law-library/acqsc-effective-incident-management-systems-guidance-2021.pdf` | 第 12 页（near miss）、第 29–30 页（即时支持）、第 32–33 页（记录字段） | 2021 旧法时期指南，以 Rules 为准 |
| 新法术语（older person、supporters、aged care workers） | `03-legal-compliance/references/law-library/acqsc-reportable-incidents-sirs-quick-guide-changes-1-nov-2025.pdf` | 第 4 页 | 草稿用新术语（PRD §6.6 第 6 条） |
| 字段与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md` | §2.1 | AI 不推断原因或根因 |

**州差异提示**：IMS 和 SIRS 是联邦制度，各州相同；但报警、elder abuse 机构（NSW ADC、SA Adult Safeguarding Unit）、健康记录保存期按州不同，见 `03-legal-compliance/references/state-by-state-comparison.md` §3.2、§3.5。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| F01 | IMS reference | 机构 IMS 编号 | 是 | 🧑 人工 | 由 CMS / IMS 生成 |
| F02 | Resident(s) affected | 姓名、偏好称呼、房间、ID | 是 | 🤖 | 只在本班名单内匹配（PRD §6.4 / G4） |
| F03 | Incident type | Fall / injury / behaviour / medication / alleged abuse / other | 是 | 🤖 | 只是记录分类，不是 SIRS 类型判定 |
| F04 | Near miss? | Yes / No | 是 | 🧑 人工 | |
| F05 | Description — what happened | 客观事实叙述 | 是 | 🤖 | r 164-25(1)(a)；"只写事实" |
| F06 | Harm caused / could reasonably have been caused | 可见伤害、住户自述 | 是 | 🗣️ | (a)(i)；不能弱化原话（PRD §6.6 第 5 条） |
| F07 | Consequences of harm (if known) | | 否 | 🧑 人工 | (a)(ii) |
| F08 | Is this a reportable incident? | Yes / No / Under assessment | 是 | 🧑 人工 | (b)；**careKind 不预填** |
| F09 | Date / time / place occurred (if known) | | 是 | 🗣️ | (c)；不知道就写 "Not known" |
| F10 | Date / time identified | 员工发现或得知的时间 | 是 | 🗣️ | (d)；也是 SIRS 计时起点候选 |
| F11 | Persons directly involved + contact | 住户、员工、访客 | 是 | 🤖 | (e)；联系方式从 CMS 带出 |
| F12 | Witnesses + contact | | 是 | 🗣️ | (f)；没有就写 "Nil witnesses" |
| F13 | Resident's own account | 住户原话 | 否 | 🗣️ | |
| F14 | Cognition / communication | 照录 care plan 已有信息 | 否 | 🧑 人工 | 影响 SIRS 评估（r 165A-25(3)） |
| F15 | Assessments undertaken | 例如跌倒后检查、生命体征 | 是 | 🗣️ | (g)；数值逐字照录 |
| F16 | Immediate actions taken | 安全、急救、清洁、分开当事人 | 是 | 🤖 | (h) |
| F17 | Support offered to affected persons | 含 advocate、语言服务 | 是 | 🤖 | r 164-40(1)(b) |
| F18 | Who was notified / when / how | RN、GP、supporter、CM、警方 | 是 | 🗣️ | 只写口述里明确说了的通知 |
| F19 | Consultation with affected persons; open disclosure | | 是 | 🧑 人工 | (i)、r 164-40(1)(b)(v) |
| F20 | Reports / findings provided to affected persons | | 否 | 🧑 人工 | (j) |
| F21 | Police report details (if reported) | 报警时间、事件号 | 条件 | 🧑 人工 | (m)；是否报警由 provider 决定 |
| F22 | Investigation required? details / outcome | | 是 | 🧑 人工 | (k)、r 164-45 |
| F23 | Contributing factors observed | 员工**看到**的环境或情况 | 否 | 🗣️ | 只照录观察，不写"原因是…" |
| F24 | Recorded by (name, role, contact) | | 是 | 🤖 | (l)；带出登录员工 |
| F25 | RN review & confirmation | 姓名、时间、修改差异 | 是 | 🧑 人工 | 逐条确认 |
| F26 | Linked records | progress note、post-fall、SIRS prep、complaint | 否 | 🤖 | 自动链接同一 Event |

## 5. 空白模板
```text
INCIDENT REPORT (IMS)                          IMS ref: ____________
Resident(s): ____________   Preferred name: ______   Room: ____   ID: ______
Incident type: ☐ Fall ☐ Injury ☐ Behaviour ☐ Medication ☐ Alleged/suspected abuse ☐ Other: ____
Near miss: ☐ Yes ☐ No
Occurred (if known): Date __/__/____  Time __:__  Place ____________
Identified: Date __/__/____  Time __:__  By ____________
What happened (facts only): ______________________________________________
Resident's own words: "__________________________________________________"
Harm caused / could reasonably have been caused: __________________________
Consequences of harm (if known): __________________________________________
Persons directly involved (name, role, contact): __________________________
Witnesses: ________________________________________________________________
Assessments undertaken (values as recorded): _______________________________
Immediate actions: ________________________________________________________
Support offered (incl. advocate / interpreter): ____________________________
Notified: RN __:__ · GP __:__ · Supporter __:__ · Care Manager __:__ · Police __:__ (ref ____)
Contributing factors observed (what staff saw): ___________________________
Reportable incident?  ☐ Yes ☐ No ☐ Under assessment  — decided by: ________ (RN/CM)
Consultation / open disclosure: ___________________________________________
Investigation required: ☐ Yes ☐ No   Details/outcome: ______________________
Recorded by: ______________ Role ____ Contact ______  Date/time __/__/____ __:__
RN confirmed: ______________ Date/time __/__/____ __:__
```

## 6. 示例（虚构）
> 全部人物、机构、房间号均为虚构合成数据，仅用于演示。Wattle Grove Residential Care（虚构，VIC）· Wattle wing。Mrs Edna Hall（虚构，88 岁）· DOB 03/02/1938 · WG-0412 · Room 12 · 使用四轮助行器。

**原话 → AI 草稿对照（片段）**
| 片段 | Priya（PCW，虚构）口述原话 | careKind 草稿 |
|---|---|---|
| S1 | "Edna in twelve, she called out, I went in straight away, it was ten past three. She's sitting on the bathroom floor next to the shower chair. Floor's wet." | At 15:10 on 18/10/2026, Mrs Edna Hall called out from her en-suite bathroom. Priya (PCW) entered immediately and found Mrs Hall sitting on the bathroom floor beside the shower chair. The floor was wet. |
| S2 | "She said 'My foot slipped on the wet floor when I reached for my towel. I didn't hit my head.'" | Mrs Hall said: "My foot slipped on the wet floor when I reached for my towel. I didn't hit my head." |
| S3 | "Right wrist is scraped, bleeding a little. She's talking normally. The bath mat wasn't there. I didn't move her, I pressed the bell for Daniel." | Mrs Hall's right wrist was scraped and bleeding a little. She was talking as she usually does. The non-slip bath mat was not in place. Priya did not move Mrs Hall and pressed the call bell for Daniel Reyes RN at 15:12. |

> 原话"talking normally"没有被改写成意识或神经学结论；"bath mat wasn't there"放在 Contributing factors observed，**不写成原因**；"skin tear / ISTAP type 1"是 RN 自己说的，不是 AI 从"scraped"推断的。

**填写后的记录**
```text
INCIDENT REPORT (IMS)                          IMS ref: WG-IMS-2026-0418 (fictional)
Resident: Mrs Edna Hall (fictional), 88, DOB 03/02/1938, WG-0412   Preferred name: Edna
  Room: 12, Wattle wing (fictional)
Incident type: Fall          Near miss: No
Occurred: 18/10/2026 approx. 15:10, en-suite bathroom, Room 12 (unwitnessed)
Identified: 18/10/2026 15:10 by Priya (PCW, fictional)
What happened: At 15:10 Mrs Hall called out from her en-suite bathroom. Priya entered immediately
  and found her sitting on the floor beside the shower chair. The floor was wet.
Resident's own words: "My foot slipped on the wet floor when I reached for my towel. I didn't hit my head."
Harm: Skin tear to right wrist, 3.0 x 1.0 cm, ISTAP type 1 (stated by Daniel Reyes RN), minor
  bleeding. Mrs Hall rated her wrist pain 4/10 at 15:25 and 2/10 at 17:30 (her own ratings).
Consequences of harm (if known): RN/CM to complete after Dr Brooks' review, 19/10/2026 morning round
Persons directly involved: Mrs Edna Hall; Priya (PCW); Daniel Reyes RN (shift RN) — contacts in CMS
Witnesses: Nil witnesses to the fall.
Assessments undertaken: Post-fall assessment by Daniel Reyes RN from 15:13 (GCS 15 at 15:15) —
  see post-fall record; observations recorded to 22:20, next set due 02:20.
Immediate actions: Priya stayed with Mrs Hall and did not move her. Daniel assessed her on the
  floor; assisted up with a mechanical lifter at 15:30 (Daniel and Priya); skin tear dressed at
  15:50; wound review due 21/10/2026. New non-slip mat fitted 16:30 (Daniel).
Support offered: Daniel stayed with Mrs Hall while she rested in her chair; she asked for her cardigan.
Notified: RN 15:12 (call bell; Daniel arrived 15:13) · GP Dr Amelia Brooks 15:45 · Daughter Karen
  Hall 15:55 · Care Manager Grace Liu 16:00 · Police: not applicable
Contributing factors observed: Floor wet near shower; non-slip bath mat not in place; towel on the
  far rail.
Reportable incident? Under assessment — see SIRS prep, decided by Grace Liu (CM)
Consultation / open disclosure: Daniel spoke with Mrs Hall 15:40 and Karen Hall 15:55 (Karen: "This
  is her second fall this year."). Karen to meet Grace Liu 19/10/2026 10:00.
Investigation required: Yes — Grace Liu to review why the bath mat was not in place.
Recorded by: Priya (PCW) via careKind dictation, 18/10/2026 15:58
RN confirmed: Daniel Reyes RN, 18/10/2026 16:20 (edited: added wound size and type from own assessment)
Linked: progress note · post-fall record · wound record · SIRS prep · family call 15:55 · complaint WG-CF-2026-0093
```

## 7. careKind 起草规则
- **可以从口述自动填**：F02、F03（记录分类）、F05、F09–F12、F16、F17、F24、F26；句子都附来源片段 ID（PRD §6.6 第 7 条）。
- **缺失显示"请填写"**：发生时间、地点、目击者、已通知的人和时间、住户原话（没说就留空，不编）。
- **必须 RN / CM 确认或填写**：F04、F07、F08、F14、F19–F22、F25；整份 Tier 3，RN 逐条确认。
- **禁止生成**：事件原因或根因（"due to"、"because"）；是否属于 reportable incident；SIRS 优先级；伤情诊断（如"fracture"、"head injury"，除非员工原话）；对员工过错的评价；治疗建议。
- 生成后显示提示："This incident may need to be assessed under SIRS — please use your facility procedure and the ACQSC decision support tool."（只提示，PRD §9 G6）。
