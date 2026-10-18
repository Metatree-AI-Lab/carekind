# GP / allied health 转介（GP / allied health referral）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。转介理由只写**员工观察到的情况**；"紧急程度"由 RN 决定；不写员工没说过的临床印象或建议治疗。

## 1. 用途与触发事件
- 用途：起草给 GP、NP、physiotherapist、dietitian、speech pathologist、podiatrist、dentist、specialist services 等的转介，并记录住户同意、发送和反馈。
- 触发事件（PRD §14）：**跌倒**、**疼痛 / 皮肤 / 临床观察**、**病情变化 / 升级**、饮食饮水、情绪或行为；care plan 复核或病例会议的行动项。紧急情况（需要 000）不走本模板。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | RN 口述（或 PCW 观察 + RN 决定转介）；careKind 起草转介信 |
| 谁审核签署 | 转介的 RN；GP 转专科以 GP 自己的转介为准 |
| 风险 Tier | **Tier 2**（PRD §6.5）；随敏感事件发起的转介按事件 Tier 3 路由 |
| 时限 | "timely and appropriate"（SQS 3.2.4）；具体紧急程度由 RN 选择 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 及时、恰当的转介（registered health practitioners、allied health、My Aged Care 复评） | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 3.2.4(a)(b)，第 26 页 | 转介对象字段 |
| 转介和联系相关 practitioners 与服务 | 同上 | 5.4.3，第 37 页 | |
| 结构化沟通；本人同意下向他人告知评估结果 | 同上 | 3.3.1，第 27 页；3.1.3(b)，第 24 页 | 同意字段 |
| 跌倒后多学科评估（主题参考） | `03-legal-compliance/references/paperwork-templates/acsqhc-falls-guidelines-residential-aged-care-2025.pdf` | 第 27 页 | 不复制措辞 |
| 转介文书与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md` | §5.1 | 紧急程度由 RN 决定 |
| 共享健康信息 | `03-legal-compliance/privacy-program.md` | — | 只发必要信息 |

**州差异提示**：转介本身无明显州差异；健康信息共享受州健康记录法影响（`03-legal-compliance/references/state-by-state-comparison.md` §3.1）。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| G01 | Referral to (service / practitioner) | | 是 | 🧑 人工 | |
| G02 | Resident identifiers | 至少 3 项 | 是 | 🤖 | |
| G03 | Referred by · role · contact | | 是 | 🤖 | |
| G04 | Reason for referral (observed) | 员工观察、住户原话、数值 | 是 | 🤖 / 🗣️ | 不写诊断性印象 |
| G05 | What the resident wants (own words) | | 否 | 🗣️ | |
| G06 | Relevant background | 只引用已确认记录 | 否 | 🤖 | 链接来源 |
| G07 | Question for the clinician | RN 原话 | 是 | 🧑 人工 | 没说就"请填写" |
| G08 | Urgency | RN 选择 | 是 | 🧑 人工 | |
| G09 | Resident consent to referral & information sharing | | 是 | 🧑 人工 | |
| G10 | Communication / access needs | 听力、语言、interpreter | 否 | 🤖 | |
| G11 | Sent · date/time · method | | 是 | 🧑 人工 | |
| G12 | Outcome / feedback received | 照录对方报告 | 否 | 🗣️ | |
| G13 | Care plan update needed | | 否 | 🧑 人工 | |

## 5. 空白模板
```text
REFERRAL
To: ______________________ (service / practitioner)
Resident: ______________ DOB __/__/____ Room ____ ID ______
Referred by: ______________ Role ____ Contact ______  Date __/__/____
Reason for referral (what staff observed / resident's words): _______________
What the resident would like: "_____________________________________________"
Relevant background (linked records): _____________________________________
Question for you (RN): ____________________________________________________
Urgency (RN): ☐ Same day ☐ Within 72 hours ☐ Routine ☐ Other: ______
Consent: ☐ Resident agrees ☐ Decision-maker agrees (name ______) — recorded by ______
Communication / access needs: _____________________________________________
Sent: __/__/____ __:__ via ________   Feedback received: __/__/____ ________
Care plan update needed: ☐ Yes ☐ No
```

## 6. 示例（虚构）
> 承接 Mrs Edna Hall（虚构）跌倒。新增虚构人物：Sam Patel（physiotherapist，虚构）。

**原话 → AI 草稿对照（片段）**
| 片段 | Daniel Reyes RN 口述 | careKind 草稿 |
|---|---|---|
| S1 | "Referral to Sam for Edna. She fell in the bathroom today reaching for her towel. She's been using her four-wheeled walker, a bit unsteady getting up from her chair this week according to the PCWs. Within seventy-two hours. She said yes." | Reason for referral: Mrs Hall had an unwitnessed fall in her ensuite bathroom at approx. 15:10 on 18/10/2026; she said she slipped reaching for her towel. PCWs report she has been "a bit unsteady getting up from her chair" this week. She uses a four-wheeled walker. Urgency (RN): within 72 hours. Consent: Mrs Hall agrees. |

> 草稿没有加 "high falls risk" 或 "requires walking frame"；"Question for you" 只在 Daniel 说了之后填写。

**填写后的记录**
```text
REFERRAL
To: Sam Patel, Physiotherapist (fictional), Wattle Grove allied health team
Resident: Mrs Edna Hall (fictional)  DOB 03/02/1938  Room 12, Wattle wing (fictional)  ID WG-0412 (fictional)
Referred by: Daniel Reyes RN (fictional), shift RN, Wattle wing  Date 18/10/2026
Reason for referral: Unwitnessed fall in her ensuite bathroom approx. 15:10 on 18/10/2026; she said
  she slipped reaching for her towel. Skin tear to right wrist, dressed. PCWs report she has been "a bit
  unsteady getting up from her chair" this week. Uses a four-wheeled walker.
What the resident would like: "I'd like someone to look at my walking. I want to keep showering myself."
Relevant background: post-fall record 18/10/2026; care plan (mobility section)
Question for you (Daniel's words): "Can you review her walking and getting up from the chair, and
  whether her walker is still right for her?"
Urgency (RN): Within 72 hours
Consent: Resident agrees — recorded by Daniel Reyes RN 18/10/2026 17:00
Communication / access needs: wears glasses; prefers afternoon appointments
Sent: 18/10/2026 17:10 via CMS allied health referral queue
Feedback received: [pending]
Care plan update needed: Yes — after physiotherapy review (care plan review 19/10/2026)
```

## 7. careKind 起草规则
- **可以从口述自动填**：G02、G03、G04（只用观察和原话）、G05、G06（链接已确认记录）、G10。
- **缺失显示"请填写"**：G07 问题、G08 紧急程度、G09 同意。
- **必须 RN 确认或填写**：G01、G07–G09、G11、G13。
- **禁止生成**：临床印象或诊断（"?fracture""query delirium"）；治疗、助行器、用药建议；紧急程度；未经同意附加与转介无关的健康信息。
