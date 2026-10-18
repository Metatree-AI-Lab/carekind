# 投诉与反馈记录（Complaint & feedback record）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。投诉内容**原话照录**，不润色、不缩短、不改变语气；处理结论由人写。

## 1. 用途与触发事件
- 用途：登记 older person、supporter、员工或访客提出的投诉、反馈或表扬，跟踪每个问题的处理、回应、外部渠道告知和改进，满足机构 complaints and feedback management system 的记录要求。
- 触发事件：PRD §14 **家属来访或沟通**（沟通中提出不满或建议）；以及任何事件后的投诉。若投诉内容涉及可能的 reportable incident（例如疑似忽视），同时打开 `incident-report-ims.md` 和 `incident-sirs-assessment-prep.md`。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | 接收投诉的任何 aged care worker 口述；careKind 起草登记部分 |
| 谁审核签署 | 登记：接收人 + Shift RN（涉及临床内容时）；处理、回应和关闭：Care Manager / 投诉负责人 |
| 风险 Tier | PRD §6.5 未单列。默认：涉及伤害、疑似虐待或忽视 → **Tier 3**；其他 → **Tier 2**（⚠️ 待 PO 确认） |
| 时限 | 每个问题 "as soon as practicable" 解决（Rules r 165-25(b)）；机构内部确认 / 回复天数按机构政策；记录保存 **7 年**（r 154-205(2)） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 投诉处理：尽快解决每个问题；符合 Statement of Rights 的处理方式；告知结果和理由；告知可向 Complaints Commissioner 投诉、advocate 信息 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 165-25(a)–(g)，印刷页 289–290 | 字段 C08–C14 |
| 反馈处理（含与住户 / supporter 协商） | 同上 | r 165-30，印刷页 290–291 | 类型 = Feedback 时适用 |
| 提供 advocate、语言服务支持；不得让投诉人受不利影响；open disclosure | 同上 | r 165-35(1)–(2)，印刷页 291 | C07、C12 |
| 投诉和反馈记录须保存的内容（性质、行动、回应、改进、效果评估、解决天数、培训）及 7 年保存 | 同上 | r 154-205(1)–(2)，印刷页 235 | C15–C18 |
| 向 Complaints Commissioner 投诉可以口头、书面、匿名 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol2-compilation-2026-08-01.pdf` | r 361-10，印刷页 261 | 外部渠道告知内容 |
| Outcome 2.6b 投诉与反馈管理（个人） | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 2.6.1–2.6.6，第 18–19 页 | 及时处理 + open disclosure |
| ACQSC 联系电话（供机构告知） | `03-legal-compliance/references/law-library/acqsc-reportable-incidents-sirs-quick-guide-changes-1-nov-2025.pdf` | 第 4 页（1800 951 822） | ⚠️ 投诉专线是否同号需核实 |
| 字段与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md`；`03-legal-compliance/references/paperwork-requirements-by-event.md` | §2.5；§11 | 没有官方登记模板 |

**州差异提示**：投诉制度是联邦的。若投诉涉及健康信息访问或隐私，州健康记录法可能另有投诉渠道（如 VIC Health Complaints Commissioner），见 `03-legal-compliance/references/state-by-state-comparison.md` §3.1。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| C01 | Reference | | 是 | 🧑 人工 | |
| C02 | Type | Complaint / Feedback / Compliment | 是 | 🧑 人工 | AI 可按原话预选，人确认 |
| C03 | Received date / time · channel | 当面、电话、邮件、意见卡 | 是 | 🗣️ | |
| C04 | Received by | | 是 | 🤖 | |
| C05 | Raised by · relationship | 匿名可留空 | 否 | 🗣️ | 匿名时不追问身份 |
| C06 | About (resident / service area) | | 是 | 🤖 | 本班名单内匹配 |
| C07 | Resident's consent / involvement | 代表住户投诉时，住户本人是否知情、意见 | 否 | 🧑 人工 | r 165-30(2)(b) |
| C08 | Complaint in their own words | **原话照录** | 是 | 🗣️ | 不改写 |
| C09 | Issues raised (one per line) | 把原话拆成问题清单 | 是 | 🤖 | 每条附原话片段；人确认 |
| C10 | What the person wants to happen | 原话 | 否 | 🗣️ | |
| C11 | Immediate response / action | | 是 | 🗣️ | |
| C12 | Support offered | advocate、interpreter、无障碍格式 | 是 | 🗣️ | r 165-35(1)(a) |
| C13 | External options explained | Complaints Commissioner、independent advocate——是否告知、何时 | 是 | 🧑 人工 | r 165-25(e)–(g) |
| C14 | Linked incident / SIRS | | 否 | 🧑 人工 | 是否需要 SIRS 评估由 RN/CM 决定 |
| C15 | Action per issue · owner · due | | 是 | 🧑 人工 | |
| C16 | Open disclosure conversation | 谁、何时、说了什么 | 条件 | 🧑 人工 | |
| C17 | Outcome & reasons given to the person | | 是 | 🧑 人工 | r 165-25(d) |
| C18 | Days to resolve · improvements · effectiveness review · training | | 是 | 🧑 人工 | r 154-205(1)(e)–(h) |
| C19 | Closed by · date | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
COMPLAINT / FEEDBACK RECORD                          Ref: ____________
Type: ☐ Complaint ☐ Feedback ☐ Compliment
Received: __/__/____ __:__  Channel: ☐ In person ☐ Phone ☐ Email ☐ Card ☐ Other  By: ________
Raised by: ______________ Relationship: ______ ☐ Anonymous
About: Resident ______________ / Service area ______________
Resident aware / involved (if raised on their behalf): _____________________
In their own words: "_____________________________________________________"
Issues raised:
  1. __________________________________ (source: "____")
  2. __________________________________ (source: "____")
What they would like to happen: "________________________________________"
Immediate response: ______________________________________________________
Support offered (advocate / interpreter / format): __________________________
External options explained (Complaints Commissioner, advocate): ☐ Yes __/__/____ by ______
Linked incident / SIRS prep: ________
ACTIONS
| Issue | Action | Owner | Due | Done |
|-------|--------|-------|-----|------|
Open disclosure: ____________ __/__/____  Summary: _______________________
Outcome & reasons given to the person: _____________ on __/__/____ by ______
Days to resolve: ___  Improvements: __________  Effectiveness review due: __/__/____
Training delivered: __________________________________________________
Closed by: ______________ __/__/____
```

## 6. 示例（虚构）
> 承接 Mrs Edna Hall（虚构，WG-0412，Room 12 Wattle wing）跌倒事件。Karen Hall（女儿，虚构）19/10/2026 10:00 来访时向 Grace Liu（CM）提出。

**原话 → AI 草稿对照（片段）**
| 片段 | Grace Liu（CM）口述（含 Karen 原话） | careKind 草稿 |
|---|---|---|
| S1 | "Karen came in at ten, she's upset. Her words: 'Mum's bath mat has been missing since Friday. I told a carer on Friday. I want to know why nobody replaced it. And her towel's always hung on the far rail where she can't reach it. This is her second fall this year.'" | In their own words (Karen Hall, 19/10/2026 10:00): "Mum's bath mat has been missing since Friday. I told a carer on Friday. I want to know why nobody replaced it. And her towel's always hung on the far rail where she can't reach it. This is her second fall this year." |
| S2 | (同上) | Issues raised: 1. Non-slip bath mat missing since Friday 16/10/2026 (source: "missing since Friday"). 2. Report made to a carer on Friday was not acted on (source: "I told a carer on Friday"). 3. Towel placed out of Mrs Hall's reach (source: "far rail where she can't reach it"). |

> "she's upset" 是 Grace 的观察，草稿没有加到 Karen 的原话里，也没有写成"family member was aggressive"之类的评价。"second fall this year" 保留在原话里，没有被拆成"falls trend"问题。

**填写后的记录**
```text
COMPLAINT / FEEDBACK RECORD                         Ref: WG-CF-2026-0093 (fictional)
Type: Complaint
Received: 19/10/2026 10:00  Channel: In person  By: Grace Liu, Care Manager (fictional)
Raised by: Karen Hall (fictional)  Relationship: daughter, registered supporter
About: Resident Mrs Edna Hall (fictional), WG-0412, Room 12 / Wattle wing bathroom safety
Resident aware / involved: Mrs Hall was present. She said: "Karen's right, I did ask for a new mat."
In their own words: "Mum's bath mat has been missing since Friday. I told a carer on Friday. I want
  to know why nobody replaced it. And her towel's always hung on the far rail where she can't reach
  it. This is her second fall this year."
Issues raised:
  1. Non-slip bath mat missing since Friday 16/10/2026 (source: "missing since Friday")
  2. Friday report to a carer not acted on (source: "I told a carer on Friday")
  3. Towel placed out of Mrs Hall's reach (source: "far rail where she can't reach it")
What they would like to happen: "I want someone to tell me what happened and make sure it's checked."
Immediate response: Grace apologised. Confirmed a new non-slip mat was fitted 18/10/2026 16:30 by
  Daniel Reyes RN; towel moved to the rail beside the shower chair during the meeting.
Support offered: Facility complaints brochure given, including independent advocate contact details.
  Karen declined an advocate at this stage.
External options explained: Yes 19/10/2026 by Grace Liu — how to contact the Aged Care Quality and
  Safety Commission (brochure section)
Linked incident / SIRS prep: WG-IMS-2026-0418 — SIRS prep decision by Grace Liu 19/10/2026 11:30
ACTIONS
| Issue | Action                                                         | Owner         | Due        | Done       |
|-------|----------------------------------------------------------------|---------------|------------|------------|
| 1     | Bathroom safety items added to Wattle wing AM/PM checklist     | Grace Liu     | 20/10/2026 |            |
| 2     | Review how Friday's report was handled; reporting refresher    | Grace Liu     | 23/10/2026 |            |
| 3     | Towel placement added to Mrs Hall's care plan                  | Sunita Rao RN | 19/10/2026 | 19/10/2026 |
Open disclosure: Grace Liu with Karen Hall and Mrs Hall, in person, 19/10/2026 10:00–10:25.
  Summary: Grace explained what is known so far, apologised, and agreed to call Karen by 23/10/2026.
Outcome & reasons given to the person: CM to complete at closure
Days to resolve: CM to complete   Improvements: checklist (issue 1)   Effectiveness review due: 20/11/2026
Training delivered: CM to complete
Closed by: open
```

## 7. careKind 起草规则
- **可以从口述自动填**：C03、C04、C06、C08（原话）、C09（拆问题，每条附原话片段，人确认）、C10–C12。
- **缺失显示"请填写"**：投诉人和关系（匿名除外）、原话、是否告知外部渠道、住户本人是否知情。
- **必须 RN / CM 确认或填写**：C01、C02、C05 的关系核对、C07、C13–C19。
- **禁止生成**：投诉是否"成立 / 不成立"；道歉之外的责任认定；对投诉人的评价（"aggressive""difficult"）；替机构承诺具体结果；是否需要 SIRS 通报；改进措施内容（只照录 CM 原话）。
- 原话里出现 "rough with her""hit""took money""left her for hours" 等描述时，显示"This may need incident and SIRS assessment"——**只提示，不判定**。
