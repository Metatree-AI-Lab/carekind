# 转院交接摘要（Hospital transfer summary）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。careKind **不决定是否转院**，只整理已确认的事实，供 RN 交给 ambulance / ED。用药清单、ACD 和 ACP 文件**引用原件**（附件），不重新抄写。

## 1. 用途与触发事件
- 用途：转院（计划或紧急）时的一页式交接摘要：识别信息、为什么转院（谁决定）、当前观察、基线功能和沟通、感染状态、意愿和文件、supporter 联系方式、随行物品；以及返院时的复核提示。
- 触发事件：PRD §14 **病情变化 / 升级**、**跌倒**（GP 决定转院时）、伤害。000 紧急情况下先处理住户，摘要可以事后补全。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | Shift RN 口述；careKind 从已确认记录汇总 |
| 谁审核签署 | 转院 RN；转院决定由 GP / NP / ambulance 或 RN 按机构程序作出并记录 |
| 风险 Tier | **Tier 3**（病情变化，PRD §6.5）——只有 RN 确认 |
| 时限 | 转院时随住户交接；返院后复核照护（SQS 7.2.1(e)） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 转院流程：记录和监测住院 / 急诊使用；连续性；本人和 supporters 参与决定；向接收方提供及时、最新、完整信息；返院后复核 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 7.2.1(a)–(e)，第 48 页 | 字段结构 |
| 转运时可获得最新用药清单 | 同上 | 5.3.1(b)，第 35 页 | 附用药系统打印件 |
| ACP 文件在 transitions 时共享 | 同上 | 3.1.6(d)，第 25 页 | 附件 |
| 交接和转运使用结构化沟通 | 同上 | 3.3.2(d)，第 27 页 | ISBAR 顺序 |
| 转院文书与 careKind 边界 | `03-legal-compliance/references/paperwork-requirements-by-event.md`；`03-legal-compliance/references/paperwork-taxonomy.md` | §8；§4.9 | 不判断紧急程度 |
| ACSQHC transfer-to-hospital envelope | 只有链接 | `03-legal-compliance/references/paperwork-templates/index.md` D5 | ⚠️ 未下载，未参考 |

**州差异提示**：ACD 名称和替代决策者称谓按州不同（`03-legal-compliance/references/state-clinical-practice-rules.md`）；州卫生系统可能有自己的转院表单 ⚠️ 本地无资料。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| H01 | Identifiers | 姓名、DOB、ID、Medicare（按机构） | 是 | 🤖 | 从 CMS 带出 |
| H02 | Transfer date/time · to · mode | | 是 | 🗣️ | |
| H03 | Decision to transfer — by whom · their words | | 是 | 🗣️ | 逐字照录 |
| H04 | Situation (what staff observed) | | 是 | 🤖 | 只用原话事实 |
| H05 | Observations (as recorded) | 时间 + 数值 | 是 | 🗣️ | 不标异常 |
| H06 | Baseline (usual function, cognition, communication) | 来自 care plan | 是 | 🤖 | 引用来源 |
| H07 | Infection status / precautions | 已确认的事实 | 是 | 🧑 人工 | 不推断病名 |
| H08 | Allergies | 引用 CMS | 是 | 🧑 人工 | |
| H09 | Medicines | "Current list from medication system attached" | 是 | 🧑 人工 | 不重录 |
| H10 | ACD / ACP documents & SDM | 附件 + 联系方式 | 是 | 🧑 人工 | |
| H11 | Resident's / supporter's wishes about this transfer | 原话 | 否 | 🗣️ | |
| H12 | Supporter notified | | 是 | 🗣️ | |
| H13 | Items sent | 助听器、眼镜、假牙、助行器 | 否 | 🗣️ | |
| H14 | Facility contact for handback | | 是 | 🤖 | |
| H15 | On return: review needed | | 否 | 🧑 人工 | SQS 7.2.1(e) |
| H16 | RN confirmation | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
HOSPITAL TRANSFER SUMMARY
Resident: ______________ DOB __/__/____ ID ______ Medicare ______
Transfer: __/__/____ __:__ to ______________ by ☐ Ambulance ☐ Other ______
Decision to transfer: by ______________ — "__________________________________"
Situation (observed): _____________________________________________________
Observations (as recorded): __:__ ________________________________________
Baseline (from care plan): _________________________________________________
Infection status / precautions: ____________________________________________
Allergies (from CMS): _____________________________________________________
Medicines: current list from medication system attached ☐
ACD / ACP: ☐ attached (title, date) ______  SDM: ______ contact ______
Wishes about this transfer: "______________________________________________"
Supporter notified: ______ __:__
Items sent: ☐ hearing aids ☐ glasses ☐ dentures ☐ walker ☐ other ______
Facility contact: ______________ phone ______
On return: review care plan / medicines ☐
RN confirmed: ______________ __/__/____ __:__
```

## 6. 示例（虚构）
> Mrs Lucia Romano（虚构，90 岁，DOB 14/09/1936，WG-0321，Room 5, Grevillea wing），在 `incident-infection-outbreak-log.md` 的 line list 上。新增虚构人物：Sofia Romano（女儿，虚构）。转院 RN：Oliver Grant RN（night RN，虚构）。

**原话 → AI 草稿对照（片段）**
| 片段 | Oliver Grant RN 口述 | careKind 草稿 |
|---|---|---|
| S1 | "Lucia's sleepier than usual, she's not kept fluids down since midnight, vomited twice more. Dr Brooks said 'please transfer her to ED for assessment and fluids, I'll ring the ED registrar.'" | Situation: Mrs Romano has been sleepier than usual (Oliver Grant RN) and has not kept fluids down since midnight; vomited twice more overnight. Decision to transfer: Dr Amelia Brooks (GP), 05:45 — "Please transfer her to ED for assessment and fluids. I'll ring the ED registrar." |

> "sleepier than usual" 保留员工原话，没有改写成"decreased level of consciousness"或"dehydrated"。

**填写后的记录**
```text
HOSPITAL TRANSFER SUMMARY
Resident: Mrs Lucia Romano (fictional), 90   DOB 14/09/1936   ID WG-0321   Medicare: in CMS
Transfer: 18/10/2026 06:35 to local public hospital ED (fictional) by ambulance (arrived 06:20)
Decision to transfer: Dr Amelia Brooks (GP), 05:45 by phone — "Please transfer her to ED for assessment
  and fluids. I'll ring the ED registrar."
Situation (observed): Sleepier than usual since about 04:00 (Oliver Grant RN). Not kept fluids down since
  midnight; vomited at 01:10 and 04:30, about half a cup each time. Lucia at 05:30: "I'm so tired, love."
Observations (as recorded, 05:30, Oliver Grant RN): BP 104/62, HR 98, RR 20, SpO2 95% room air,
  Temp 37.6 °C, BGL 5.4 mmol/L
Baseline (care plan): walks with a frame and one staff member; speaks Italian and English; usually chats
  with staff at breakfast; independent with eating.
Infection status / precautions: On the Grevillea wing line list WG-OB-2026-03 (outbreak declared by IPC lead
  17/10/2026 11:00); contact precautions; faecal specimen 17/10/2026 09:30, result pending.
Allergies (from CMS): Nil known (recorded by admitting RN 2023)
Medicines: current list from eNRMC attached (printed 05:55)
ACD / ACP: ACP record 04/08/2026 attached — Lucia's words: "If it can be fixed, take me to hospital."
  SDM: Sofia Romano (daughter) — title per VIC rules recorded in CMS; contact in CMS
Wishes about this transfer: Lucia: "Okay, if the doctor says." Sofia (phone 05:55): "Yes, please take her."
Supporter notified: Sofia Romano 05:55 by Oliver Grant RN — "I'll meet her at the hospital."
Items sent: glasses, dentures, rosary, walker stayed at the facility
Facility contact: Wattle Grove Grevillea wing RN station (number in facility profile)
On return: review care plan and medicines ☑ — flagged for Grace Liu (CM)
RN confirmed: Oliver Grant RN 18/10/2026 06:30
```

## 7. careKind 起草规则
- **可以从口述自动填**：H01、H02、H03（照录）、H04、H05（照录）、H06（引用 care plan）、H11–H14。
- **缺失显示"请填写"**：转院决定人和原话、过敏、ACD / ACP 附件、supporter 通知。
- **必须 RN 确认或填写**：H07–H10、H15、H16。
- **禁止生成**：是否需要转院、紧急程度；临床印象（"?sepsis""dehydrated"）；用药清单或剂量；ACD 内容的解读；任何数值异常标记。
