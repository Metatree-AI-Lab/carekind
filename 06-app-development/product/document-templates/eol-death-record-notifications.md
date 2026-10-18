# 死亡记录与通知（Death record & notifications）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。careKind **只记录事实和通知**。"expected death 还是 reportable death""是否报告 coroner""是否属于 SIRS unexpected death"都由 GP / RN / CM 按州法律和机构程序决定；州规则见 `03-legal-compliance/references/state-clinical-practice-rules.md`，**本模板不写死任何州的判断标准**。

## 1. 用途与触发事件
- 用途：记录住户死亡的时间、发现情况、在场人员、谁 verify death、谁被通知以及何时、遗体和遗物交接、对 supporters 的支持，以及需要人工完成的外部通知（死亡证明、coroner、SIRS、cessation notification）的状态。
- 触发事件：PRD §14 **临终照护**；以及任何住户死亡（包括非预期）。非预期死亡同时打开 `incident-report-ims.md` 和 `incident-sirs-assessment-prep.md`。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | 在场 RN 口述；careKind 起草 |
| 谁审核签署 | RN；死亡证明（medical certificate of cause of death）由**医生**完成；coroner 报告由按州法规定的人完成 |
| 风险 Tier | **Tier 3**（PRD §6.5 临终）——只有 RN 逐条确认 |
| 时限 | 死亡时记录；coroner 报告按州法（通常"立即 / 尽快"⚠️）；SIRS unexpected death 属 **P1：24 小时**（Rules r 165A-25(2)(d)，印刷页 300）；cessation notification 停止服务后 **28 天内**（Rules r 149-25(b)，印刷页 208） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| unexpected death 属 reportable incident | `03-legal-compliance/references/law-library/aged-care-act-2024-compilation-2026-07-01.pdf` | s16(1)(d)，印刷页 46 | 提示人工评估 |
| unexpected death 的含义（未采取合理步骤预防；因所提供或未提供的服务导致） | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 16-5(8)，印刷页 95 | 只列给人参考 |
| unexpected death 属 P1 | 同上 | r 165A-25(2)(d)，印刷页 299–300 | 24 小时时钟 |
| Cessation notification：姓名、停止日期、原因；28 天 | 同上 | r 149-20(4)、149-25，印刷页 207–208 | 只提示不起草 |
| 向 supporters 提供临终过程和丧亲信息 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 5.7.3(h)，第 41 页 | 支持字段 |
| 死亡相关文书、coroner 州简表 | `03-legal-compliance/references/paperwork-requirements-by-event.md` | §14 | ⚠️ 多数州条文未核实 |
| verification of death、死亡证明、coroner | `03-legal-compliance/references/state-clinical-practice-rules.md` | 按州 | ⚠️ 以该文件为准 |

**州差异提示**：谁可以 verify death（RN / 医生）、死亡证明时限、哪些死亡须报告 coroner、报告方式都按州不同。模板字段只记录"谁做了、何时、依据哪份州规则"，判断由人完成。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| D01 | Resident | | 是 | 🤖 | |
| D02 | Circumstances found | 谁发现、何时、在哪 | 是 | 🗣️ | 只写观察 |
| D03 | Present at time of death | | 否 | 🗣️ | |
| D04 | Time of death (as recorded by verifying clinician) | | 是 | 🧑 人工 | |
| D05 | Death verified by · role · time | | 是 | 🧑 人工 | 按州和机构政策 ⚠️ |
| D06 | Palliative status documented before death | 引用 GP / RN 既有记录 | 是 | 🧑 人工 | 只引用，不判断 |
| D07 | GP / medical practitioner notified · time | | 是 | 🗣️ | |
| D08 | Medical certificate of cause of death | 谁负责、状态 | 是 | 🧑 人工 | 医生 |
| D09 | Coroner — reportable under state law? | Yes / No / Seeking advice + 谁决定 | 是 | 🧑 人工 | **careKind 不预填** |
| D10 | SIRS — unexpected death assessment | 见 SIRS prep | 是 | 🧑 人工 | 不预填 |
| D11 | Supporters notified · who · time · their words | | 是 | 🗣️ | |
| D12 | Care Manager / management notified | | 是 | 🗣️ | |
| D13 | Wishes after death followed | 宗教、文化、着装、陪伴 | 否 | 🗣️ | |
| D14 | Funeral director · transfer time | | 否 | 🗣️ | |
| D15 | Personal belongings | 交给谁、清单位置 | 否 | 🗣️ | |
| D16 | Pharmacy / medicines, other services notified | | 否 | 🧑 人工 | |
| D17 | Cessation notification | 由 admin 完成的状态 | 是 | 🧑 人工 | 28 天 |
| D18 | Bereavement support offered | | 否 | 🗣️ | |
| D19 | RN confirmation | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
DEATH RECORD & NOTIFICATIONS
Resident: ______________ Room: ____ ID: ______
Found / circumstances: __________________________________________________
Present: _______________________________________________________________
Time of death (as recorded by verifying clinician): __/__/____ __:__
Verified by: ______________ Role ____ Time __:__ (per facility policy / state rules)
Palliative status documented before death (reference): ___________________
GP notified: __:__ by ______
Medical certificate of cause of death: responsible ______ status ______
Coroner (state law): ☐ Not reportable ☐ Reportable — reported __:__ by ______ ref ____ ☐ Seeking advice
  Decided by: ______________ Basis (state rules reference): ____________
SIRS unexpected death assessment: ☐ Done — see SIRS prep ref ____ (decided by ______)
Supporters notified: ______ (relationship ____) __:__  Their words: "__________"
Care Manager notified: ______ __:__
Wishes after death followed: ___________________________________________
Funeral director: ______________ transfer __:__
Belongings: given to ______ on __/__/____ (list location ______)
Pharmacy / other services notified: ____________________________________
Cessation notification: ☐ To admin __/__/____ (due within 28 days)
Bereavement support offered: ___________________________________________
RN confirmed: ______________ __/__/____ __:__
```

## 6. 示例（虚构）
> Mr George Whitfield（虚构，93 岁，WG-0198，Room 3, Wattle wing），见 `eol-palliative-care-notes.md`。Oliver Grant RN（night RN，虚构）。机构在 VIC。

**原话 → AI 草稿对照（片段）**
| 片段 | Oliver Grant RN 口述 | careKind 草稿 |
|---|---|---|
| S1 | "Ruth called me at three thirty-five, she'd stayed the night. George had stopped breathing. I checked him at three forty, no breathing, no pulse, verified at three forty. Ruth was holding his hand." | 03:35 — Ruth Whitfield (daughter), who had stayed overnight, called Oliver Grant RN and said George had stopped breathing. Oliver Grant RN: "I checked him at 03:40, no breathing, no pulse, verified at 03:40." Ruth was holding George's hand. |

> 草稿没有写"expected death"——D06 只引用 Dr Brooks 10/10/2026 的姑息记录；D09 coroner 一栏由 RN / GP 自己填写。

**填写后的记录**
```text
DEATH RECORD & NOTIFICATIONS
Resident: Mr George Whitfield (fictional), 93   Room: 3, Wattle wing   ID: WG-0198
Found / circumstances: 03:35 on 17/10/2026 Ruth Whitfield, who stayed overnight, called Oliver Grant RN
  to say George had stopped breathing.
Present: Ruth Whitfield (daughter)
Time of death (as recorded by verifying clinician): 17/10/2026 03:40
Verified by: Oliver Grant RN (fictional), 03:40 — per Wattle Grove procedure and VIC rules in
  state-clinical-practice-rules.md ⚠️
Palliative status documented before death: Dr Brooks' note 10/10/2026; ACP record 10/10/2026
GP notified: 07:30 by Oliver Grant RN, as Dr Brooks asked in her 16/10/2026 instructions ("overnight,
  call me in the morning unless Ruth wants me sooner")
Medical certificate of cause of death: Dr Amelia Brooks — "I'll complete it this morning." (07:30)
Coroner (state law): Not reportable — decided by Dr Amelia Brooks (GP) 07:30; basis recorded in GP note
SIRS unexpected death assessment: Done — Grace Liu (CM) 17/10/2026 08:30: not a reportable incident;
  reasoning in IMS (fictional demonstration only)
Supporters notified: Ruth present at the time of death. Ruth: "I'll ring my brother myself."
Care Manager notified: Grace Liu 07:45 (phone)
Wishes after death followed: George's Anglican prayer card placed with him; window opened (Ruth's request);
  Ruth stayed with him until 06:00.
Funeral director: Ironbark Funeral Care (fictional) — transfer 09:15
Belongings: given to Ruth Whitfield on 18/10/2026 (list scanned to CMS)
Pharmacy / other services notified: community pharmacy 08:30 (Grace Liu); allied health appointments
  cancelled (admin)
Cessation notification: To admin 17/10/2026 (due within 28 days)
Bereavement support offered: facility bereavement information given to Ruth 06:00; chaplain call 17/10 11:00
RN confirmed: Oliver Grant RN 17/10/2026 07:50
```

## 7. careKind 起草规则
- **可以从口述自动填**：D01–D03、D07、D11–D15、D18（照录）。
- **缺失显示"请填写"**：D04、D05、D08、D09、D10、D17。
- **必须 RN / GP / CM 填写**：D04–D06、D08–D10、D16、D17、D19。
- **禁止生成**：死亡原因；"expected / unexpected / reportable / not reportable"任何判断；是否报告 coroner 或 SIRS；verify death 的结论；任何州的法律标准文字（只链接州规则文件）。
- 住户死亡后，careKind 提示："Check your state rules and facility procedure for verification of death, coroner reporting and SIRS assessment." ——只提示。
