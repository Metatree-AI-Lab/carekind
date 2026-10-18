# SIRS 评估与通报准备（SIRS assessment & notification prep）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。
> **边界（PRD §9 G6）**：careKind 只做两件事——①把已经由 RN 确认的事实按通报所需信息的顺序排好；②按人填写的"知悉时间"显示时限倒计时。**"是否 reportable""属于哪一类""Priority 1 还是 2"一律 `🧑 RN/CM 决定`**；通报由机构指定人员在 ACQSC 指定渠道（本地 ACQSC workflow 写的是 My Aged Care Provider Portal ⚠️ 需核实现行渠道）自己完成，careKind 不代为提交、不连接门户。

## 1. 用途与触发事件
- 用途：一份内部工作底稿，帮助 RN / Care Manager 按机构 SIRS 程序和 ACQSC decision support tool 自己评估，并在时限内准备通报所需的事实。它**不是** ACQSC 的 approved form，也不复制其版式。
- 触发事件（PRD §14）：**跌倒**、**伤害 / 疑似虐待或忽视**、限制性措施、失踪（unexplained absence）、临终（可能的 unexpected death）——这些类别的 incident 草稿确认后，careKind 显示"可能需要按 SIRS 评估"提示（PRD §7.3 E），并可打开本底稿。
- 8 类 reportable incident（Act s16(1)）：unreasonable use of force；unlawful sexual contact or inappropriate sexual conduct；psychological or emotional abuse；unexpected death；stealing or financial coercion by an aged care worker；neglect；use of a restrictive practice other than in accordance with the Rules；unexplained absence。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | careKind 从**已确认**的 incident report / post-fall record 中整理事实；RN 补充 |
| 谁审核签署 | 是否 reportable、类型、优先级：**RN / Care Manager（按机构 SIRS 程序指定的人）**；通报：provider 指定人员 |
| 风险 Tier | **Tier 3**（PRD §6.5）——只有 RN 能确认事实部分；判定部分只能由指定人员填写 |
| 时限 | 见下表（已核对本地原文） |

**时限（本地文件核实）**
| 节点 | 时限 | 本地依据 |
|---|---|---|
| 员工 → responsible person / 主管 / 指定人员 | as soon as possible | Rules r 165A-20，印刷页 299；r 164-20(g)，印刷页 281 |
| 报警（有合理理由时） | 知悉后 24 小时内；之后才知道报警理由的，从知道理由起 24 小时 | Rules r 164-40(2)–(3)，印刷页 284 |
| **Priority 1** notice | provider 知悉后 **24 小时内** | Rules r 165A-25(1)，印刷页 299；SIRS quick guide 第 2 页 |
| P1 补充信息 | 24 小时内拿不到的信息，在 **24 小时开始后 5 天内**补交（或 Commissioner 另定） | Rules r 165A-25(5)–(6)，印刷页 300–301；quick guide 第 2 页（"within the following 5 days"） |
| **Priority 2** notice | provider 知悉后 **30 天内**（quick guide："30 calendar days"） | Rules r 165A-30(1)，印刷页 301；quick guide 第 2 页 |
| Significant new information | as soon as reasonably practicable | Rules r 165A-40，印刷页 302 |
| Final report（Commissioner 要求时） | 首次通报后 **84 天内**，或 Commissioner 指定期限 | Rules r 165A-45(2)，印刷页 303 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| reportable incident 定义 | `03-legal-compliance/references/law-library/aged-care-act-2024-compilation-2026-07-01.pdf` | s16(1)，印刷页 45–46 | 类型清单 |
| 各类定义细化；不属于 reportable 的情形（住户拒绝服务） | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 16-5、r 16-10(2)，印刷页 94–96 | 只列给人参考 |
| P1 定义；认知障碍不得视为"没受影响"；通报所需信息 | 同上 | r 165A-25(2)–(4)，印刷页 299–300 | 本底稿第 B 部分按 (4)(a)–(h) 排序 |
| P2 通报所需信息 | 同上 | r 165A-30(2)，印刷页 301–302 | 同上 |
| 2025-11-01 起的变化：P1 删除"could reasonably have been expected to have caused"；"medical or psychological treatment"指只有 medical practitioner、NP、RN、psychologist、social worker 才能提供的治疗；neglect 新定义；新术语 | `03-legal-compliance/references/law-library/acqsc-reportable-incidents-sirs-quick-guide-changes-1-nov-2025.pdf` | 第 1–4 页 | 草稿用新术语 |
| 流程：确保安全 → 记入 IMS → 判断是否 reportable → P1 / P2；渠道 | `03-legal-compliance/references/paperwork-templates/acqsc-sirs-reportable-incidents-workflow-residential.pdf` | 第 1 页 | 只作"下一步"提示 |
| 决策工具（不复制其逻辑） | `03-legal-compliance/references/paperwork-templates/acqsc-sirs-decision-support-tool-summary.md` | — | 只链接 |
| 影响评估提示（不评定等级） | `03-legal-compliance/references/paperwork-templates/acqsc-sirs-impact-assessment-tool.pdf` | — | 提示员工补充观察到的影响 |
| 文书清单与时限汇总 | `03-legal-compliance/references/paperwork-requirements-by-event.md` | §5 | ⚠️ 该文件已提示：careKind 是否可以输出"按 165A-25(4) 排序的事实摘要"需临床 / 法律顾问确认 |

**州差异提示**：SIRS 是联邦制度，各州相同。涉及报警、coroner（unexpected death）、成年人保护机构时按州不同：`03-legal-compliance/references/state-by-state-comparison.md` §3.5；`03-legal-compliance/references/state-clinical-practice-rules.md`（coroner）。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| A01 | Linked IMS reference | | 是 | 🤖 | 只能链接已确认的 incident |
| A02 | Time first staff member became aware | 来自 incident 记录 | 是 | 🗣️ | |
| A03 | Time provider became aware (clock start) | 计时起点 | 是 | 🧑 人工 | 默认显示 A02（最保守），RN/CM 修改须写理由。⚠️ "provider becomes aware" 的认定需法律确认 |
| A04 | Countdown | P1 24h · P1 +5 天 · P2 30 天 | — | 🤖 | 纯时间计算，基于 A03；不代表需要通报 |
| B01 | Provider name & contact | | 是 | 🤖 | 机构配置 |
| B02 | Description incl. harm to each person & consequences | 照录已确认事实 | 是 | 🤖 | r 165A-25(4)(b) |
| B03 | Immediate actions incl. safety, police / other bodies | | 是 | 🤖 | (4)(c) |
| B04 | Further actions proposed | | 否 | 🧑 人工 | (4)(d) |
| B05 | Person giving notice (name, position, contact) | | 是 | 🧑 人工 | (4)(e) |
| B06 | Time, date, place (if known) | | 是 | 🤖 | (4)(f) |
| B07 | Persons directly involved | | 是 | 🤖 | (4)(g) |
| B08 | Level of cognition (if known) | 照录 care plan 已有信息 | 否 | 🧑 人工 | (4)(h) |
| B09 | Observed impact (physical / psychological) | 员工观察、住户原话 | 否 | 🗣️ | 可以持续补充；**不评定等级** |
| C01 | Reportable incident? | Yes / No / Further information needed | 是 | 🧑 人工 | **RN/CM 决定** |
| C02 | Incident type(s) under s16(1) | | 条件 | 🧑 人工 | |
| C03 | Priority | P1 / P2 | 条件 | 🧑 人工 | |
| C04 | Reasoning | 决定人自己写 | 是 | 🧑 人工 | careKind 不起草 |
| C05 | Decided by · date/time | | 是 | 🧑 人工 | |
| D01 | Police notified? time · reference | | 条件 | 🧑 人工 | |
| D02 | Notice lodged by · date/time · notice reference | | 条件 | 🧑 人工 | 机构在门户完成 |
| D03 | Follow-up due | P1 补充信息、significant new information、final report | 条件 | 🧑 人工 | 计时显示基于人填写的日期 |

## 5. 空白模板
```text
SIRS ASSESSMENT & NOTIFICATION PREP (internal working document — not an ACQSC form)
Linked IMS ref: ________
A. Clock
  First staff aware: __/__/____ __:__   Provider aware (clock start, RN/CM): __/__/____ __:__
  Reason if different from first staff awareness: _____________________________
  If P1 → notice due by: __/__/____ __:__ · additional information due by: __/__/____ __:__
  If P2 → notice due by: __/__/____
B. Facts (confirmed, in notice order)
  Provider / contact: ________________________________________________
  Description & harm to each person / consequences: ____________________
  Immediate actions (safety; police / other bodies): ____________________
  Further actions proposed: __________________________________________
  Person giving notice: ______________ Position ______ Contact ______
  Time / date / place: __________   Persons directly involved: ___________
  Level of cognition (if known, from care plan): _______________________
  Observed impact (staff observations / resident's words, with dates): ____
C. Decision (RN / Care Manager only)
  Reportable incident: ☐ Yes ☐ No ☐ Further information needed
  Type(s): ____________   Priority: ☐ P1 ☐ P2
  Reasoning (decision-maker's own words): ______________________________
  Decided by: ____________ Role ____ __/__/____ __:__
D. Actions
  Police: ☐ N/A ☐ Notified __:__ ref ______
  Notice lodged by ________ __/__/____ __:__ via ________ ref ________
  Follow-up due: _________________________________________________
```

## 6. 示例（虚构）
> 承接 `incident-report-ims.md` 的虚构跌倒事件（Mrs Edna Hall，WG-0412，18/10/2026 15:10）。**示例里的 reportable / Priority 判断和理由由虚构 Care Manager 作出，只演示字段怎么填，不是对同类事件的判定参考。**

**原话 → AI 草稿对照（片段）**
| 片段 | 原话 | careKind 底稿 |
|---|---|---|
| S6（Grace Liu CM 口述，19/10 10:40） | "Karen came in at ten. Her words: 'Mum's bath mat has been missing since Friday. I told a carer on Friday. I want to know why nobody replaced it.'" | Further information: At 10:00 on 19/10/2026 Karen Hall (daughter) told Grace Liu (CM): "Mum's bath mat has been missing since Friday. I told a carer on Friday. I want to know why nobody replaced it." |

> careKind 只把这句话加进事实，并显示"新信息已加入，请决定人复核 C 部分"；**没有**把它归类为 neglect。

**填写后的底稿**
```text
SIRS ASSESSMENT & NOTIFICATION PREP              Linked IMS ref: WG-IMS-2026-0418 (fictional)
A. Clock
  First staff aware: 18/10/2026 15:10 (Priya, PCW)
  Provider aware (clock start): 18/10/2026 15:10 — Grace Liu (CM) kept the default
  If P1 → notice due by 19/10/2026 15:10 · additional information due by 23/10/2026 15:10
  If P2 → notice due by 17/11/2026
B. Facts (confirmed by Daniel Reyes RN 18/10/2026 16:20; updated 19/10/2026)
  Provider: Wattle Grove Residential Care (fictional, VIC) — contact in facility profile
  Description & harm: Mrs Edna Hall (fictional), 88, was found sitting on her en-suite bathroom floor
    at 15:10, unwitnessed. She said: "My foot slipped on the wet floor when I reached for my towel.
    I didn't hit my head." Skin tear to right wrist 3.0 x 1.0 cm, ISTAP type 1 (RN); pain 4/10 at
    15:25, 2/10 at 17:30 (own ratings). Consequences: Dr Brooks reviewed on 19/10/2026 morning round —
    see GP's own note.
  Immediate actions: Not moved until assessed by RN (arrived 15:13); mechanical lifter 15:30; skin
    tear dressed 15:50; post-fall observations to 22:20 and overnight; new bath mat 16:30.
    Police / other bodies: none.
  Further actions proposed (Grace Liu): review of Friday report and bathroom safety checks; care plan
    review 19/10/2026; physiotherapy referral.
  Person giving notice: Grace Liu, Care Manager — contact in facility profile
  Time / date / place: approx. 15:10, 18/10/2026, en-suite bathroom, Room 12, Wattle wing (fictional)
  Persons directly involved: Mrs Edna Hall; Priya (PCW); Daniel Reyes RN
  Level of cognition (care plan): "Independent with decisions; mild short-term memory changes"
  Observed impact: 16:20 "watching TV, chatting" (Daniel). 18/10 15:55 Karen: "This is her second
    fall this year." 19/10 10:00 Karen's statement above.
C. Decision (Grace Liu, CM)
  Reportable incident: Yes   Type: neglect (alleged)   Priority: P2
  Reasoning (Grace Liu's own words): "Karen reports the missing mat was raised with staff on Friday
    and not actioned. Treating as an allegation of neglect until reviewed. The skin tear was dressed —
    first aid only; Dr Brooks this morning did not need any further treatment, so I have not classed
    it as P1."
  Decided by: Grace Liu, Care Manager, 19/10/2026 11:30
D. Actions
  Police: N/A
  Notice lodged by Grace Liu 19/10/2026 14:10 via the provider portal — reference recorded in IMS
  Follow-up due: significant new information as soon as reasonably practicable (Grace Liu)
```

## 7. careKind 起草规则
- **可以自动整理**：A01、A02、A04（纯时间计算）、B01–B03、B06、B07、B09——只从**已确认**的记录复制，不加新事实；新信息加入后标记"请决定人复核"。
- **缺失显示"请填写"**：A03 计时起点、B04、B05、B08、C 部分全部、D 部分全部。
- **必须 RN / CM 填写**：A03、C01–C05、D01–D03。
- **禁止生成**：是否 reportable、incident 类型、P1 / P2、"建议通报 / 无需通报"、影响等级、对原因或过错的分析、C04 理由文字；也不能用"可能是 neglect""符合 P1"之类的措辞暗示结论。
- 界面文字示例："Time since provider became aware: 2 h 15 min. If your assessment is Priority 1, the notice is due by 19/10/2026 15:10." 倒计时只是时钟，**不随事实内容变化颜色或级别**。
- 不连接、不预填 ACQSC 门户；不把底稿描述为"SIRS notification"。
