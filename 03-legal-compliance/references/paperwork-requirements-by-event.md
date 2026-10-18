Owner: Legal/Compliance · Status: Research draft · Last reviewed: 18/10/2026
> 运营参考，不是法律意见

# 按"触发事件"整理的 paperwork 要求（Paperwork requirements by event）

**这份文件回答什么**：residential aged care home 里**发生了某件事**以后，需要填哪些文书、谁起草、谁签、多久内完成、最少写什么、法律依据是什么，以及 careKind 怎么处理。
**和 taxonomy 的关系**：[`paperwork-taxonomy.md`](paperwork-taxonomy.md) 按**文书类型**分类（每种文书的字段、频率、AI 适合度、TGA 风险）；本文件按**事件**组织，同一种文书会在多个事件里出现。字段细节以 taxonomy 为准，这里只列"最小必填"。标注 `TX §x.y` 的地方指向 taxonomy 对应小节。
**范围**：residential care（registration category residential care），Aged Care Act 2024 和 Aged Care Rules 2025 自 01/11/2025 起生效后的口径。不覆盖 home care / CHSP。

## 0. 来源、简称和读法

### 0.1 本地原文（已用 `pdftotext -layout` 逐条核对）
| 简称 | 本地文件（`law-library/` 或 `paperwork-templates/`） | 引用方式 |
|---|---|---|
| **Act** | `law-library/aged-care-act-2024-compilation-2026-07-01.pdf`（Compilation No. 2） | `Act s16`，页码为文件内印刷页码 |
| **Rules** | `law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf`（Compilation No. 10，F2026C00802） | `Rules 164-25(1)`，页码为印刷页码 |
| **SQS** | `law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | `SQS 3.1.5` = action 编号；法定文本在 Rules s15-10 至 15-40 |
| **SIRS-QG** | `law-library/acqsc-reportable-incidents-sirs-quick-guide-changes-1-nov-2025.pdf`（"correct as of 1 November 2025"） | — |
| **Falls-G** | `paperwork-templates/acsqhc-falls-guidelines-residential-aged-care-2025.pdf`（CC BY-NC-ND 4.0） | Post-fall Management，第 27 页 |
| **RPSDM** | `paperwork-templates/health-consent-for-restrictive-practices-info-for-providers-2026.pdf` | — |
| **AN-ACC-P** | `paperwork-templates/health-an-acc-assessment-pathways-fact-sheet.pdf`（2024-12，新法前） | — |
| **MedGP** | `paperwork-templates/health-guiding-principles-medication-management-racf-2022.pdf`（CC BY 4.0） | Guiding Principle (GP) 编号 |

**Quality Standards 与 Rules 的对应**（Rules 第 84–93 页）：Standard 2 = Rules 15-15（Outcome 2.5 = 15-15(8)，2.6 = (9)–(11)，2.7 = (12)–(13)）；Standard 3 = 15-20（3.1 = (1)–(3)，3.3 = (6)–(7)）；Standard 4 = 15-25（4.2 = (4)–(5)）；Standard 5 = 15-30（5.3 = (5)–(7)，5.4 = (8)–(11)，5.5 = (12)，5.6 = (13)–(14)，5.7 = (15)–(17)）；Standard 6 = 15-35；Standard 7 = 15-40（7.2 Transitions = (3)–(4)）。Standard 5–7 只适用于 residential care 等类别（Rules 15-5）。

### 0.2 官方网页（2026-10-18 检索）
- Monthly Care Statements（health.gov.au）：https://www.health.gov.au/our-work/monthly-care-statements-for-residential-aged-care/about ；Voluntary guide v1.2（2026-05）：https://www.health.gov.au/sites/default/files/2026-05/voluntary-monthly-care-statements-guide.pdf
- COVID-19 outbreak reporting via My Aged Care provider portal（2024-09）：https://www.health.gov.au/sites/default/files/2024-09/support-portal-for-providers-reporting-a-covid-19-outbreak-or-exposure-in-residential-aged-care.docx
- Coroners Court of Queensland, *Deaths of aged care residents* fact sheet：https://www.coronerscourt.qld.gov.au/__data/assets/pdf_file/0010/883693/deaths-of-aged-care-residents-fact-sheet-2025.pdf （已下载读取全文）
- Services Australia form AC021（新入住通知，新法下 28 天）：https://www.servicesaustralia.gov.au/sites/default/files/2025-10/ac021-2511en-f.pdf （只看了检索摘要）

### 0.3 州差异
- 健康记录法、保存期、约束性措施替代决策人（RPSDM）、老年人虐待报告、工人筛查、疫苗：[`state-by-state-comparison.md`](state-by-state-comparison.md)（下文简写 **SBS**，带小节号）。
- 用药、同意（含 ACD）、死亡证明和 coroner 的州差异：`state-clinical-practice-rules.md`（另一份文件，正在编写，下文简写 **SCP**）。本文件只给简表，以 SCP 为准。

### 0.4 列的含义
- **起草 / 签署**：PCW = personal care worker / AIN；EN；RN；CM = clinical manager / care manager / DON；GP（或 NP）；Mgr = 机构管理层 / responsible person。"签署"指对内容负责并确认进入正式记录的人。实际分工以机构政策为准（⚠️ 各机构不同）。
- **AI 适合度**：沿用 taxonomy §0.1 口径（高 / 中 / 低）。
- **careKind 处理**（对应 PRD §6.5 的 Tier 和 §9 护栏）：
  - **自动起草**：AI 从口述起草；Tier 1 可由 PCW/EN 确认（机构允许时）。
  - **需 RN 签署**：AI 起草，但只有 RN 能确认（Tier 2 / Tier 3，Tier 3 逐条确认，护栏 G5）。
  - **只提示不起草**：careKind 不生成该文书正文，只提示"需要这份文书 / 时限 / 去哪里填"，或把已确认的事实摘要给人参考。
- 所有草稿都受 PRD §6.6 起草规则约束：只用原话、数值照录、每句附来源；不生成诊断、风险分级、治疗或用药建议（G2/G3）。

---

## 1. 入住（Admission / entry）

**触发**：older person 的 start day（Rules 用语）。入住前后会集中产生一批文书，大部分不是护士口述能产生的。

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Service agreement（服务协议） | Mgr / admissions | older person（或其授权人）+ provider | **start day 当天或之前**；14 天冷静期（start day 前）；ongoing residential 另有 28 天退出退款 | 收费项目；离院只限 Rules 149-60(1) 的情形；协助另觅住处；终止方式；收费政策 | Rules 148-65(1)–(4)、148-70(11)–(12)（第 198–203 页） | 合同/消费者法 ⚠️ | 低 | 只提示不起草 |
| Start notification（入住通知，approved form） | Mgr / admin | provider | ongoing residential：start day 后 **28 天内**交 System Governor 和 Commissioner（short-term / hospital transition：14 天） | 姓名；start day；approved residential care home | Rules 149-10(5)、149-15（第 207 页） | — | 低 | 只提示不起草 |
| Entry assessment / comprehensive clinical assessment（入住评估） | RN（含 PCW/EN 的观察输入）；GP 做医学评估 | RN | 入住时（"on commencement"）；具体天数 ⚠️ 新法无全国统一天数，按机构政策 | 需要、目标、偏好；风险和管理策略；临床风险、急性和慢性病；frailty 和沟通障碍；需要的器具；GP 综合医学评估的安排 | SQS 3.1.1、5.4.2(a)–(d)；Rules 15-20(1)–(2)、15-30(9) | — | 中（TX §3.1） | 需 RN 签署（叙述部分）；量表评分只照录员工说出的分数 |
| Care and services plan 初稿 | RN / CM | RN / CM；**副本给 older person** | **start day 当天或之前**（Rules 148-80(1)(a)） | 当前需求、目标、偏好；风险管理和预防策略；参与制定的人；复核时间 | Rules 148-80(1)、(4)（第 203–204 页，适用于所有 provider）；Rules 15-20(1)–(3)；SQS 3.1.4 | — | 中（TX §3.2） | 需 RN 签署；"策略"栏只写 RN 原话，没说就显示"请填写" |
| 用药清单 / medication reconciliation、过敏记录 | RN（与 GP、药剂师核对） | RN；医嘱由 GP | 入住时 | 当前全部药物和用药理由（含 PRN）；已知过敏和副作用 | SQS 5.3.1(e)、5.3.2(a)、5.3.3；MedGP GP10（reconciliation）、GP9（documentation） | 用药州法（SCP） | 低 | 只提示不起草（以 eNRMC / 用药系统为准） |
| Consent 记录（信息收集和共享、照片、AI 文书 / 录音告知） | Mgr / RN | older person 或授权代表 | 入住时，之后可随时撤回 | 同意范围；授权人身份；日期；撤回方式 | SQS 2.7.2(c)(d)；Rules 15-15(13)；`09-templates/resident-ai-notice.md` | 健康记录法（SBS §3.1）；监控设备法 ⚠️ 本地无资料 | 低 | 只提示不起草；careKind 的 `Consent` 实体只登记状态（PRD §6.2） |
| Advance care directive / ACP 收集记录 | RN（讨论记录）；ACD 本身由 older person 按州表单完成 | older person（ACD）；RN（讨论记录） | 入住时询问；状况变化和定期复核 | 是否有 ACD / ACP 文件及存放位置；substitute decision maker；价值观和意愿；转介时已共享给谁 | SQS 3.1.6(a)–(d) | ACD 表单和效力按州法（SCP；SBS §3.4） | 中（讨论记录）/ 不适用（ACD 本身）（TX §5.2） | 讨论记录：需 RN 签署；**ACD 本身不起草** |
| Supporter 登记 | admin | — | 入住时 | registered supporter 姓名和联系方式 | Rules 154-1000(1)(h)（第 243 页）；Act s29 | — | 低 | 只提示不起草 |
| AN-ACC 相关（palliative care status form 等） | GP / NP 确定姑息状态；admin 上传 | GP / NP | 入住即接受姑息照护时：姑息状态在 permanent entry 后 **14 天内**确定，表单在提交入住记录后 14 天内上传 | 姑息状态判定 | AN-ACC-P（2024-12，⚠️ 新法下入住记录已改为 start notification / Services Australia AC021，流程需核实） | — | 低（TX §3.4） | 只提示不起草；**不提供以资金分类为目标的写作建议** |
| 疫苗接种状态（流感、COVID-19） | admin / RN | — | 按日历年记录 | 住户是否自愿告知已接种（用于统计） | Rules 154-20、154-25（第 233–234 页） | 州公共卫生要求（SBS §3.9） | 低 | 只提示不起草 |

**要点**：入住当天前就要有 service agreement 和 care and services plan（Rules 148-65(1)、148-80(1)），而且每次更新都要给 older person 一份副本（148-80(4)）。careKind 在入住阶段的价值主要是把 RN 的入住访谈叙述整理到评估栏目里，不碰协议、通知和资金表单。

---

## 2. 每班日常（Every shift）

**触发**：每个班次。频率由机构政策和 care plan 决定，⚠️ 法律没有规定"每班必须写 progress note"。

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Progress notes | PCW / EN / RN（谁照护谁写） | 作者本人；Tier 2/3 内容由 RN 确认 | 当班（机构政策） | 住户识别信息；日期时间；记录人和角色；观察；护理措施；住户本人意见；变化；已通知谁；跟进 | SQS 2.7.2(b)、3.1.4(e)、5.4.5；Rules 154-1000(1)(d)（**progress notes 保留 7 年**，第 242–243 页）；Rules 154-1205(2)(b)（作为补贴核查记录，第 244 页） | 健康记录法、保存期（SBS §3.1、§3.2） | **高**（TX §1.1） | 自动起草（Tier 1）；Tier 2/3 需 RN 签署 |
| ADL / 照护记录（洗浴、如厕、翻身、口腔护理等） | PCW | PCW；异常由 RN 复核 | 当班 | 做了什么、什么时候、住户的反应、拒绝和原因 | SQS 3.2、5.5.3（失禁照护）、5.5.7（口腔）；Rules 15-20(4) | — | 高 | 自动起草（Tier 1） |
| 拒绝照护的记录 | PCW / RN | RN（如有临床影响） | 当班 | 拒绝了什么；住户原话；已提供的替代方案；已通知谁 | Rules 16-10(2)（第 96 页：residential 中**因住户拒绝服务而导致的事件不是 reportable incident**）；SQS 1.3（dignity of risk） | — | 高 | 自动起草；涉及临床风险时需 RN 签署 |
| Charts：food & fluid、体重、BGL、生命体征、排便 | PCW / EN / RN | 记录人 | 按 care plan / 医嘱 | 日期时间；数值和单位；测量人；异常通知了谁 | SQS 5.5.5、5.4.5；Rules 154-110（QI 记录 7 年） | — | 中（food & fluid）/ 低（数值表）（TX §4.7–4.8） | 口述数值写进 progress note；数值表"只照录、不报警"（G3） |
| Shift handover（ISBAR） | 交班人（RN / EN / PCW） | 交班人 + 接班人确认 | 每次换班 | 至少 3 个识别信息；Situation；Background；**交班人自己的** Assessment 和 Recommendation；责任交接 | SQS 3.3.1、3.3.2(d)；Rules 15-20(6)(b) | — | **高**（TX §1.2） | 自动起草；A 和 R 栏只用原话，没说就"请填写" |
| Monthly Care Statement（每月照护说明） | RN / CM | provider | 每月（**目前为自愿**，强制时间未定） | 当月健康状况和照护概况 | SQS 3.3.4(b)（"provide care statements to individuals in residential care homes"）；health.gov.au 指南 v1.2 | — | 中 ⚠️ | 只提示不起草（⚠️ 若以后要做汇总起草，先过 tga-boundary-check） |

**要点**：Rules 154-1000(1)(d) 明确把 "medical records, progress notes and other clinical records" 列为必须保存 **7 年**（从记录形成之日起）的记录。这修正了 `law-library/index.md` §1a 里"新 Rules 没有通用护理记录保留期"的说法（⚠️ 需律师确认与州法叠加后取较长者）。

---

## 3. 跌倒（Fall）

**触发**：任何跌倒，包括没有受伤和没人目击的跌倒（Falls-G 第 27 页："All falls, including those falls which result in minor or no injury, must be taken seriously"）。

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Post-fall record / clinical pathway | 发现人（PCW）+ RN 评估 | RN | 立即（"immediate response"）；神经观察按机构流程持续 | 发现时间地点；是否目击；住户自述；基线生命体征（员工报出的数值）；是否撞头、新发意识混乱；伤情；抗凝药（照录）；已通知 GP / 家属时间；转院 | SQS 5.5.4(b)(c)；Falls-G 第 27 页（撞头、新发混乱或**无人目击**时做神经观察）；`PT/qld-health-rcf-post-fall-clinical-pathway.pdf`（只参考字段，© QLD） | 公立机构的州流程（Vic SCP falls）⚠️ | 高（叙述）（TX §2.3） | 需 RN 签署（Tier 3，逐条确认） |
| Incident report（IMS） | 发现人 / RN | RN / CM | 及时（Rules 无小时数；机构政策） | Rules 164-25(1)(a)–(m) 全部 13 项（见 §5 表） | Rules 164-25（第 282 页）、164-40、164-45；SQS 2.5.1 | — | 高（TX §2.1） | 需 RN 签署；"是否 reportable"一栏留给人填 |
| Progress note + handover | PCW / RN | RN | 当班 | 同 §2 | 同 §2 | — | 高 | 需 RN 签署（Tier 3） |
| 家属 / GP 通知记录 | RN | RN | "timely" | 通知了谁、时间、方式、对方回应 | SQS 5.4.4(d)；Rules 164-40(1)(b)(iii)–(v)（open disclosure） | — | 高 | 自动起草，需 RN 签署 |
| Post-fall analysis + care plan review | RN / CM（多学科） | RN / CM | 跌倒后（机构政策） | 原因调查（环境、社会、临床、用药）；用药复核；更新跌倒预防措施 | Falls-G 第 27 页；SQS 3.1.5(e)、5.3.2(e)；Rules 164-45(1) | — | 中 | 只提示不起草（提示"可能需要复核 care plan"）；RN 口述的修改可起草 |
| SIRS notice（若属 reportable incident，如疑似 neglect 导致受伤） | RN / CM 整理；Mgr 提交 | provider（responsible person / 指定人员） | 见 §5 | 见 §5 | Act s16(1)(f)；Rules 165A-25 | — | 中 | **只提示**（G6）：显示"可能需要按 SIRS 评估"和计时 |
| QI 数据（falls and major injury） | 汇总自日常记录 | provider | 每季度 | 跌倒日期、重大伤害 | Rules 154-110；Falls-G 第 27 页；QI Manual Part A | — | 低 | 只提示不起草（保证原始记录可追溯） |

---

## 4. 用药事件与 PRN（Medication incident / PRN）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| 给药记录 / medication chart（eNRMC） | 给药人（RN / EN；按州法和机构政策 PCW 可协助） | 给药人 | 每次给药 | 按用药系统 | SQS 5.3.1；Rules 15-30(6)（给药前必须有处方；由 registered health practitioners 管理、监测、复核） | **用药授权按州法差异很大**（SCP） | 低 | **只提示不起草**（careKind 不替代用药系统） |
| PRN effectiveness note | 给药人 / 观察人 | RN | 每次 PRN 后复查时 | 给药原因（员工观察）；之前尝试的非药物措施；给药时间（以用药系统为准）；复查时间；效果；不良反应 | SQS 5.3.1(e)（含 PRN 的 clinical reasons）；MedGP §5 PRN（PRN 医嘱应含适应症和最大剂量）；`PT/acqsc-psychotropic-prn-stickers-guide.pdf` | SCP | 中（TX §4.5） | 需 RN 签署（Tier 2）；药名剂量不补全 |
| Medication incident report（漏给、给错、剂量、时间等） | 发现人 / RN | RN / CM | 及时 | 事件类型；涉及药物（与用药系统核对）；发现经过；对住户的影响；通知了谁（GP、药剂师）；即时措施；Rules 164-25(1) 字段 | Rules 15-30(7)（medicine-related adverse events 要监测和报告）；Rules 164-25；SQS 2.5.1、5.3.6 | SCP | 中（TX §2.4） | 需 RN 签署（Tier 3）；不写处理建议 |
| 用药复核记录 | GP / 药剂师；RN 记录 | GP | 用药相关不良事件后；以及入住、转院、每年 | 复核理由、结论（照录 GP 原话） | SQS 5.3.2(a)–(e) | — | 低 | 只提示不起草 |
| Adverse medicine / vaccine event 向 TGA 报告 | RN / CM | provider | ⚠️ 无法定小时数 | 按 TGA 报告表 | SQS 5.3.5 | — | 低 | 只提示不起草 |
| SIRS（若构成 neglect 等，或造成需治疗的伤害） | 见 §5 | 见 §5 | 见 §5 | 见 §5 | Act s16(1)(f)；Rules 165A-25 | — | 中 | 只提示 |
| 精神类 PRN 是否属于 chemical restraint | 见 §6 | | | | Rules 17-5(2) | | | |

---

## 5. SIRS reportable incident（任何事件里出现以下情形时）

**8 类 reportable incident**（Act s16(1)，第 45–46 页）：(a) unreasonable use of force；(b) unlawful sexual contact or inappropriate sexual conduct；(c) psychological or emotional abuse；(d) unexpected death；(e) stealing / financial coercion **by an aged care worker**；(f) neglect；(g) use of a restrictive practice **other than in accordance with the Rules**；(h) unexplained absence。定义细化见 Rules 16-5（第 94–96 页；例如 unexplained absence = 有合理理由报警的离开）。**不是 reportable**：residential 中因住户拒绝服务导致的事件（Rules 16-10(2)）。

**时限（已用 SIRS-QG 和 Rules 原文核对）**
| 节点 | 时限 | 依据 |
|---|---|---|
| 员工 → 管理者 / responsible person / 指定人员 | **as soon as possible** | Rules 165A-20（第 299 页） |
| 报警（有合理理由时） | 知悉后 **24 小时**内；之后才发现报警理由的，从发现理由起 24 小时 | Rules 164-40(2)–(3)（第 284 页） |
| **Priority 1** notice → ACQSC | 知悉后 **24 小时**内；24 小时内拿不到的信息在之后 **5 天**内补交（additional information） | Rules 165A-25(1)、(5)、(6)（第 299–301 页）；SIRS-QG 第 2 页 |
| **Priority 2** notice → ACQSC | 知悉后 **30 天**内（SIRS-QG："30 calendar days"） | Rules 165A-30(1)（第 301 页） |
| Significant new information | as soon as reasonably practicable | Rules 165A-40；SIRS-QG |
| Final report（Commissioner 要求时） | 首次通报后 **84 天**内，或 Commissioner 指定期限 | Rules 165A-45(2)（第 303 页） |

**P1 判定标准**（Rules 165A-25(2)；SIRS-QG）：造成需要**医疗或心理治疗**才能解决的身体或心理伤害或不适（治疗指只有 medical practitioner、NP、RN、psychologist、social worker 才能提供的治疗）；有合理理由报警；不法性接触或不当性行为；与照护相关的 unexpected death；需报警的 unexplained absence。认知障碍不能被视为"没有受影响"（165A-25(3)）。2025-11-01 起删除了"could reasonably have been expected to have caused"，不再要求预测最坏后果（SIRS-QG 第 1 页）。

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Incident record（IMS） | 发现人 / RN | RN / CM | 及时 | (a) 事件描述含每人受到的伤害和后果；(b) **是否 reportable**；(c) 发生时间日期地点；(d) 发现时间日期；(e) 直接相关人员姓名和联系方式；(f) 证人；(g) 评估；(h) 已采取的行动；(i) 与受影响者的沟通；(j) 是否提供了报告或结论；(k) 调查细节和结果；(l) **记录人姓名和联系方式**；(m) 报警细节。保留 7 年 | Rules 164-25(1)–(2)、154-150 | — | 高（TX §2.1） | 需 RN 签署（Tier 3）；(b)(g)(k) 留给人 |
| Priority 1 / Priority 2 notice（approved form，书面） | RN / CM 整理事实 | provider 指定的人（written，approved form） | 见上表 | provider 名称和联系方式；事件类型；每人的伤害和后果；即时措施（含安全措施、是否已报警或报告其他机构）；拟采取的措施；通报人姓名职位联系方式；时间日期地点；直接相关人员姓名；**受影响者的认知水平** | Rules 165A-25(4)、165A-30(2) | — | 中（TX §2.2） | **只提示不起草通报本身**（G6）；可把已确认的 incident 事实按 165A-25(4) 顺序排成"参考摘要"，由人复制、判断、提交 ⚠️ 是否允许做这个摘要需临床/法律顾问确认 |
| Additional information（P1）/ Significant new information / Final report | CM / Mgr | provider | 5 天 / 尽快 / 84 天 | approved forms（`PT/acqsc-sirs-notice-additional-information-priority-1-form.docx` 等，ACQSC 默认条款，**不复制版式**） | Rules 165A-25(6)、165A-40、165A-45 | — | 中 | 只提示不起草 |
| 影响评估（Impact assessment） | RN / CM | RN / CM | 可能需要一段时间观察（SIRS-QG 第 3 页） | 身体和心理影响；行为变化（退缩、害怕某种照护或某些人） | SIRS-QG；`PT/acqsc-sirs-impact-assessment-tool.pdf` | — | 中 | 只提示不起草（可以提示员工补充观察到的行为变化，**不评定等级**） |
| 报警记录 | Mgr / RN | — | 24 小时 | 报警时间、报告编号、报告内容 | Rules 164-40(2)、164-25(1)(m) | — | 低 | 只提示 |
| Open disclosure / 与受影响者和 supporter 的沟通 | RN / CM | RN / CM | 及时 | 沟通对象、内容、对方意见 | Rules 164-40(1)(b)(iii)–(v) | — | 高 | 自动起草，需 RN 签署 |
| 调查和改进记录 | CM / Mgr | Mgr | — | 能否预防；补救措施；处理得怎样；还需通知谁 | Rules 164-45(1)–(3)；`PT/acqsc-sirs-investigation-plan-template.docx`（只参考字段） | — | 低 | 只提示不起草（不做根因结论） |
| 涉及员工不当行为的记录副本 | Mgr | — | 持有副本之日起保留 **7 年** | — | Rules 154-915（第 242 页） | — | 低 | 只提示 |

---

## 6. 约束性措施的使用（Restrictive practices，含 chemical restraint）

**5 类**（Rules 17-5，第 98 页）：chemical、environmental、mechanical、physical restraint 和 seclusion。**Chemical restraint** = 主要目的为影响行为而使用药物；**不包括**为治疗已诊断的精神障碍、身体疾病或状况，或临终照护而开的药（17-5(2)）。不按 Rules 使用 = SIRS reportable incident（Act s16(1)(g)）。

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| 使用前评估（非 chemical） | 对住户有日常了解的 **approved health practitioner** | 同左 | 使用前 | 评估住户对自己或他人有伤害风险；评估使用是必要的；与他人及外部支持服务（如 DSA）的沟通 → 写进 BSP | Rules 162-20(1)（第 270 页） | — | 低 | 只提示不起草 |
| 使用前评估和处方（chemical restraint） | **medical practitioner 或 NP** | 同左；provider 要"satisfied" | 使用前 | 风险评估；必要性评估；处方；对处方的知情同意。BSP 必须记录 9 项：评估、决定、相关行为、必要原因、provider 给医生的信息、provider 确认已取得同意、**处方细节（药名、剂量、何时可用）**、与他人的沟通、外部支持服务 | Rules 162-25(1)(a)–(c)（第 270–271 页） | 用药/处方州法（SCP） | 低 | **只提示不起草**；绝不建议药物或剂量 |
| Informed consent 记录 | RN / CM 记录；同意人为本人或 **RPSDM** | 本人 / RPSDM | 使用前（紧急情况除外） | 同意的措施、使用方式、**持续时间、频率、预期结果**；同意人；若本人无能力：适用 6-20 的哪一项及原因、RPSDM 姓名 | Rules 162-15(1)(f)–(g)、162-55(f)–(h)；RPSDM | **州差异大**：VIC 专门法四层级、QLD 需 QCAT 委任、NSW enduring guardian、SA physical restraint 需 SACAT 等（SBS §3.4、表 B）；联邦 hierarchy 过渡期至 **01/12/2026** ⚠️ | 低 | 只提示不起草 |
| Behaviour support plan（BSP，属于 care and services plan） | RN / CM（咨询本人、supporter、相关 health practitioners） | RN / CM | 需要行为支持时即应有；**定期复核**，情况变化后尽快复核 | 162-50（背景、评估、行为、每次发生的日期时间持续时间、后果、相关事件、诱因、替代策略及效果、与本人或 supporter 的沟通）；162-55（拟使用时）；162-60（已使用时）；162-65（需持续使用时） | Rules 162-45 至 162-75（第 274–278 页）；SQS 3.2.7 | 无能力时咨询州法规定的决策人（162-75(1)(b)） | 中（TX §4.3） | 需 RN 签署（叙述和行为汇总）；**替代策略、是否使用措施由人决定** |
| 每次使用记录 | 实施人 / 观察人 | RN | 每次使用 | 开始时间；**每次持续时间**；频率；结果和是否达到预期；**是否符合同意范围**；PRN 式使用时：诱因行为和使用前尝试的替代策略；参与人员；外部支持；监测细节；复核结果 | Rules 162-60(a)–(f) | — | 中（TX §4.4） | 需 RN 签署（Tier 3） |
| 使用期间监测记录 | PCW / EN / RN | RN | 使用期间持续 | 痛苦或伤害迹象；副作用和不良事件；情绪行为变化；福祉、功能、ADL 变化；必要性的定期复核；chemical：把效果信息反馈给开药医生 | Rules 162-30(a)–(e)（第 271–272 页） | — | 中 | 需 RN 签署；只照录观察，不判断"副作用" |
| 紧急使用后的补记 | RN / CM | RN / CM | **as soon as practicable** | 相关行为；之前考虑或使用的替代策略；必要原因；后续照护；已通知 RPSDM 的记录；以及 162-20 / 162-25 要求的评估 | Rules 162-35（第 272 页）；162-15(2)–(3)（紧急时部分要求暂不适用，**只在紧急期间**） | — | 中 | 需 RN 签署 |
| Restrictive practices nominee 登记 | admin | — | 提名时 | 提名；被提名人是否同意；是否撤回同意 | Rules 162-40(3)（第 273 页） | SBS §3.4 | 低 | 只提示不起草 |
| SIRS（不按 Rules 使用时） | 见 §5 | | | | Act s16(1)(g) | | 中 | 只提示 |

**careKind 规则**：口述中出现约束、上锁、绑、镇静、"给了 PRN 让她安静"等内容时，提示"请确认 BSP、同意和监测记录"（PRD §14），只提醒，**不判定**是否违规、是否属于 chemical restraint。

---

## 7. 行为事件（Behaviours of concern）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Behaviour chart（ABC） | PCW / EN | 作者；RN 复核 | 每次发生时，或按 BSP 观察期 | 日期、时间、持续时间；前因；**具体行为（不贴标签）**；后果；使用过的非药物策略和效果；是否使用了约束 | Rules 162-50(d)–(g)（BSP 要记录每次发生）；SQS 5.6.3；`PT/dsa-behaviour-support-plan-template-*.pdf`（只参考字段） | — | **高**（TX §4.2） | 自动起草；涉及伤害或约束时需 RN 签署（Tier 3） |
| Progress note + handover | PCW / RN | RN | 当班 | 同 §2 | SQS 3.3.2(c) | — | 高 | 需 RN 签署（Tier 3） |
| BSP 复核 | RN / CM | RN / CM | 情况变化后尽快 | 见 §6 | Rules 162-70(b) | — | 中 | 只提示"可能需要复核 BSP"；RN 口述内容可起草 |
| Incident record（有伤害或住户之间的冲突时） | RN | RN | 及时 | Rules 164-25(1) | Rules 164-10 | — | 高 | 需 RN 签署 |
| SIRS（例如员工对住户使用不合理的力量、心理虐待） | 见 §5 | | | | Act s16(1)(a)(c) | | | 只提示 |

---

## 8. 病情恶化 / 转院（Clinical deterioration / transfer to hospital）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Deterioration / escalation record（ISBAR 电话） | 发现人 + RN | RN | 发现时 | 观察到的变化（原话）；生命体征（照录）；升级给谁（RN、GP、NP、000）和时间；接收方指示；结果 | SQS 3.3.2(c)、3.3.3、5.4.4(c)(d)、5.4.5；Rules 15-20(7)、15-30(11) | — | 中（TX §4.9） | 需 RN 签署；只整理**已决定**升级的内容，不判断紧急程度 |
| GP / 家属通知记录 | RN | RN | "timely" | 通知了谁、时间、内容 | SQS 5.4.4(d) | — | 高 | 自动起草，需 RN 签署 |
| Transfer-to-hospital 交接包 | RN | RN | 转院时 | 识别信息；当前情况；用药清单；ACD / ACP；supporter 联系方式；基线功能和沟通需求 | SQS 3.1.6(d)（ACP 在转院时共享）、5.3.1(b)（转院时可获得最新用药清单）、7.2.1(b)(d)；Rules 15-40(3)–(4) | — | 中 | 需 RN 签署（叙述部分）；用药清单和 ACD 只引用原件 |
| 住院 / 急诊使用记录 | RN / admin | — | 每次 | 日期、去向、原因 | SQS 7.2.1(a)（"use of hospitals or emergency departments are recorded and monitored"） | — | 低 | 只提示 |
| 返院后复核 | RN | RN | 返回时 | 照护是否需要调整；care plan 复核 | SQS 7.2.1(e)、3.1.5(d)、5.3.2(a)、5.4.5 | — | 中 | 只提示；RN 口述修改可起草 |
| Hospital leave 记录 | admin | — | 期间每天 | 起止日期 | Act s244(4)–(6)（第 271–272 页；连续 30 天以上为 extended hospital leave）；Rules 154-1000(1)(e)(iii) | — | 低 | 只提示 |
| AN-ACC 重新分类请求（住院 ≥5 天，或全麻 ≥2 天） | admin / CM | provider | — | — | AN-ACC-P（⚠️ 新法下需核实） | — | 低 | 只提示不起草 |

---

## 9. 压疮 / 伤口（Pressure injury / wound）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| 皮肤检查记录 | PCW 发现 + RN 检查 | RN | 常规全身检查（频率按机构和 QI 要求） | 部位；外观描述 | SQS 5.5.9(a)、5.5.3(d) | — | 中 | 自动起草（叙述），需 RN 签署（Tier 2） |
| Wound chart / 伤口评估 | RN（或伤口护士） | RN | 每次换药或评估 | 部位；类型；**分期（由合资格人员说出）**；大小（照录）；创面、渗液、周围皮肤；疼痛；敷料；照片（需同意）；下次评估日期 | SQS 5.5.9(b)；`PT/qld-health-racf-pathway-chronic-wound-assessment.pdf`、`PT/vic-health-standardised-care-process-pressure-injuries.pdf`（只参考，Vic 条款不允许转载改编） | 公立机构州流程 ⚠️ | 中（TX §4.1） | 需 RN 签署；**不推断分期，不算 Braden/Waterlow** |
| Care plan 复核（新风险） | RN | RN | 新风险出现时 | 预防策略（RN 原话） | SQS 3.1.5(e) | — | 中 | 只提示 |
| Incident / SIRS（若疑似 neglect，例如长期未翻身） | 见 §5 | | | | Act s16(1)(f)；Rules 16-5(10) | | | 只提示 |
| QI pressure injuries 数据 | 汇总 | provider | 每季度 | — | Rules 154-110 | — | 低 | 只提示 |

---

## 10. 感染 / 疫情（Infection / outbreak）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| 症状和隔离措施记录（个人） | PCW / RN | RN | 发现时；之后每班 | 症状和开始时间（原话）；检测；隔离 / 防护措施；通知了谁 | SQS 4.2.1(g)(h)、5.2.2；Rules 15-25(4)–(5)、15-30(4) | — | 中（TX §4.10） | 需 RN 签署（Tier 2）；**不推断"疑似 X 感染"** |
| Outbreak line list / 疫情管理记录 | IPC lead | IPC lead / CM | 疫情期间每天 | 病例名单、日期、状态 | SQS 4.2.1(a)（指定 IPC lead）、(g) | 州公共卫生法：须向公共卫生部门通报的疾病和方式不同 ⚠️（SBS §3.9 只覆盖疫苗） | 低 | 只提示不起草 |
| 向联邦卫生部通报 COVID-19 病例 / 疫情 | IPC lead / Mgr | provider | 发生时（⚠️ 现行时限需核实） | 初次疫情；每例住户和员工阳性；住户死亡；疫情结束 | health.gov.au 2024-09 provider guidance（My Aged Care provider portal）⚠️ 新法下是否仍适用需核实 | 同时向州公共卫生部门报告 | 低 | 只提示不起草 |
| 疫苗接种统计 | admin | provider | 按日历年记录；Commissioner / System Governor 要求时 **7 天内**报告 | 员工和住户总数、已告知接种人数 | Rules 154-10 至 154-25；166-10(4)（第 304 页） | 州员工疫苗要求（SBS §3.9） | 低 | 只提示 |
| 因疫情移房的记录 | RN / Mgr | Mgr | 移房时 | 原因（疫情等紧急情况） | Rules 149-70(1)(f)(i)（第 215 页） | — | 低 | 只提示 |

---

## 11. 投诉（Complaint / feedback）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Complaint record（投诉登记） | 接收人（任何员工）→ 投诉负责人 | CM / Mgr | 接收时登记；"as soon as practicable" 解决每个问题 | 投诉人和关系；日期渠道；**原话内容**；每个问题采取的行动；给投诉人的回应和理由；处理天数；改进措施；效果评估；相关培训。保留 7 年 | Rules 165-25(a)–(g)（第 289–290 页）、154-205(1)(a)–(h)（第 235 页）；SQS 2.6.1–2.6.6 | — | 高（TX §2.5） | 自动起草登记部分，需 CM / Mgr 确认；处理结论由人写 |
| 结果通知 + 外部渠道告知 | CM / Mgr | CM / Mgr | 结案时（匿名投诉除外） | 结果和理由；可以向 Complaints Commissioner 投诉的方式；independent aged care advocates 信息 | Rules 165-25(d)–(g) | — | 中 | 只提示不起草（提示必含要素） |
| Open disclosure（出了问题时） | CM | CM | 及时 | — | SQS 2.6.4 | — | 中 | 只提示 |
| 如投诉内容涉及 reportable incident | 见 §5 | | | | Act s16 | | | 只提示 |

---

## 12. 家属 / supporter 沟通（Family / supporter communication）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Family communication log | 沟通人（PCW / RN） | 作者；涉及临床信息时 RN | 沟通当天 | 日期时间；对象及关系（registered supporter / 决策人）；方式；内容；对方意见和要求；**住户是否同意分享**；跟进 | SQS 5.4.4(d)、3.1.3(b)、2.7.2(c)(d)；Act s29（给 supporter 信息）；Rules 15-30(17) | 健康记录法（SBS §3.1） | **高**（TX §1.3） | 自动起草；共享临床信息前提示核对同意状态 |
| 事件 / 变化后的通知记录 | RN | RN | "timely" | 同上 + 通知触发事件 | SQS 5.4.4(d)；Rules 164-40(1)(b)(iii)–(v) | — | 高 | 自动起草，需 RN 签署 |
| Care and services plan 副本交付记录 | RN / admin | — | 制定时、每次更新时、应要求时 | 交付对象和日期 | Rules 148-80(4) | — | 低 | 只提示（每次 care plan 更新后提醒交付） |

---

## 13. Care plan review / case conference

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Care and services plan review | RN / CM | RN / CM；副本给 older person | **"regularly"**，以及 3.1.5 的 6 种触发：需求或偏好变化 / 计划无效；ADL、心理、认知、身体功能或状况变化；家属照护能力变化；转院等 transition；新风险、变化或事件；照护责任变化 | 复核原因；变化内容；参与者；下次复核日期 | SQS 3.1.5(a)–(f)；Rules 15-20(3)、148-80(4)。**注意**：Rules 148-80(3)(c)"至少每 12 个月复核"只适用于 148-80(5)–(6) 列出的 home / community 类别，**不适用 residential**（第 204 页）；residential 以机构政策为准 ⚠️ | — | 中（TX §3.2） | 需 RN 签署；careKind 可提示"哪些事件可能触发复核"，**不生成新策略** |
| Case conference 纪要（含姑息病例会议） | RN / CM 记录 | 主持人（RN / CM） | 按需、定期或进入姑息阶段 | 参会者；议题；住户意愿；**会上实际做出的决定**；责任人和时限；summary 发给了谁 | SQS 3.1.2、5.4.1、5.4.4(a)(b)、5.7.2；`PT/palliaged-palliative-care-case-conference-pack.pdf`（许可 ⚠️，只参考字段） | — | **高**（TX §3.3） | 自动起草，需 RN 签署 |
| BSP 咨询记录 | RN / CM | RN / CM | 制定、复核、修订 BSP 时 | 咨询了谁（本人、supporter、州法决策人、相关 health practitioner、RPSDM）；以无障碍格式提供了计划 | Rules 162-75（第 278 页） | 州法决策人（SBS §3.4） | 中 | 需 RN 签署 |
| 年度用药复核 | GP / 药剂师 | GP | 每年（ongoing care） | — | SQS 5.3.2(a) | — | 低 | 只提示 |

---

## 14. 临终与死亡（End of life / death）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Palliative / end-of-life care notes | PCW / EN / RN | RN | 每班或更频繁 | 舒适措施；症状（原话）；口腔、眼部、皮肤、二便护理；家属在场和支持；精神文化需求；预期性用药的使用（照录） | SQS 5.7.3、5.7.4(a)–(e)；Rules 15-30(15)–(17) | — | **高**（TX §5.3） | 需 RN 签署（Tier 3）；**不判断"进入临终阶段"** |
| End-of-life care plan / ACP 复核 | RN / GP（与本人、supporter、SDM） | RN / GP | 识别到姑息需要时 | 意愿；拒绝或接受的治疗（原话）；希望在哪里接受照护 | SQS 5.7.1、5.7.2(a)–(c)、5.7.3(e) | ACD 效力按州（SCP） | 中 | 讨论记录可起草，需 RN 签署 |
| AN-ACC 紧急重新分类（approaching end of life） | admin / CM | provider | — | 需确认已有 end of life care plan 并已与住户和家属沟通 | AN-ACC-P ⚠️ 新法下需核实 | — | 低 | 只提示不起草 |
| 死亡记录（时间、发现人、通知） | RN | RN | 死亡时 | 死亡时间（RN 记录 / 确认 ⚠️ 谁可以 verify death 按州和机构政策）；在场人；已通知 GP、家属、管理者的时间 | SQS 5.7.3(h)（向 supporter 提供死亡和丧亲信息） | **verification of death 由谁做按州差异**（SCP） | 中 | 需 RN 签署 |
| Medical certificate of cause of death | **医生**（GP 或其他 medical practitioner） | 医生 | 按州 BDM 法 ⚠️ | — | 州 Births, Deaths and Marriages 法（SCP） | 是 | 不适用 | 只提示不起草 |
| Coroner 报告（如属 reportable death） | 报告人：医生 / provider / 警方（按州） | — | 按州法，通常"立即 / as soon as possible" ⚠️ | — | 见下方州简表 | 是 | 不适用 | 只提示不起草 |
| SIRS（unexpected death = 与照护相关、或未采取合理步骤预防的死亡，属 **P1**） | 见 §5 | | **24 小时** | | Act s16(1)(d)；Rules 16-5(8)、165A-25(2)(d) | | 中 | 只提示 |
| Cessation notification（approved form） | admin | provider | 停止提供服务后 **28 天内**（short-term 为 14 天） | 姓名；停止日期；**原因** | Rules 149-20(4)、149-25（第 207–208 页） | — | 低 | 只提示不起草 |

**Coroner 州简表**（只做提示，⚠️ 条文需逐州核对；详细见 SCP）
| 州/领地 | 法律 | 与 aged care 相关的常见报告情形 | 本地/官方核对状态 |
|---|---|---|---|
| QLD | Coroners Act 2003 s8 | 身份不明；violent / unnatural（如**跌倒受伤**或其并发症导致或明显促成死亡、食物团块阻塞气道）；suspicious；**health care related**（如吞咽风险或压疮管理不当、用药错误、延误治疗）；无法出具死因证明。住在 aged care **本身不等于** reportable，也**不是** "death in care"。跌倒相关死亡且医生愿意出具死因证明时，可由 provider 或医生用 **Form 1A** 报告；其他外因死亡打 Policelink 131 444 | ✅ Coroners Court of QLD fact sheet（Version 1, Nov 2019，文件名标 2025） |
| VIC | Coroners Act 2008 | unexpected、unnatural、violent 或因受伤导致的死亡；无死因证明等 ⚠️ | ⚠️ 未核实条文 |
| NSW | Coroners Act 2009 | violent / unnatural、sudden 且原因不明等 ⚠️ | ⚠️ 未核实条文 |
| WA | Coroners Act 1996 | ⚠️ | ⚠️ 未核实 |
| SA | Coroners Act 2003 | ⚠️ | ⚠️ 未核实 |
| TAS | Coroners Act 1995 | ⚠️ | ⚠️ 未核实 |
| ACT | Coroners Act 1997 | ⚠️ | ⚠️ 未核实 |
| NT | Coroners Act 1993 | ⚠️ | ⚠️ 未核实 |

---

## 15. 暂离 / 出院 / 离开机构（Leave / discharge / leaving the home）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Social leave 记录 | admin / RN | — | 每次 | 起止日期；**本财年累计天数**（全天离开计 1 天，每财年少于 52 天才算 social leave） | Act s244(7)（第 272 页）；Rules 154-1000(1)(e)(iii)（entry and leave arrangements） | — | 低 | 只提示（careKind 只在 progress note 里记录"住户外出"的事实） |
| 外出交接（药物、注意事项） | RN | RN | 离开时 | 带走的药物（照录用药系统）；联系人；预计返回时间 | SQS 7.2.1(b)(d)（"stays in the community"） | 用药州法（SCP） | 中 | 需 RN 签署（叙述部分） |
| 未经说明的离开（找不到人） | 发现人 / RN | RN / Mgr | 立即；有合理理由报警 → **P1 24 小时**、报警 24 小时 | 最后看到的时间地点；寻找经过；报警时间 | Act s16(1)(h)；Rules 16-5(11)、165A-25(2)(d)、164-40(2) | — | 高（叙述） | 需 RN 签署（Tier 3）；SIRS 只提示 |
| 要求住户离开的通知（security of tenure） | Mgr | provider | 离开日前**至少 14 天** | 决定；理由；离开日期；投诉、外部投诉、advocate 权利；**continuity of care plan 副本** | Rules 149-60、149-65（第 212–214 页） | — | 低 | 只提示不起草 |
| Continuity of care plan | Mgr / CM | provider | 决定要求离开时 | 替代住处；确保满足需求的步骤；记录如何转交；新 provider 开始日期；搬迁协助；退费和押金处理 | Rules 149-75(2)(a)–(h)（第 215–216 页） | — | 低 | 只提示不起草 |
| 向新 provider 转交记录 | admin | provider | 新 provider 请求后 **28 天内** | 154-1000 列出的记录（含 care plan、progress notes、临床记录） | Rules 149-80（第 216 页） | 健康记录法（SBS §3.1） | 低 | 只提示；careKind 支持按住户导出（taxonomy §7 第 8 条） |
| 房间调换记录 | RN / Mgr | Mgr | 调换时 | 依据（本人要求 / 同意 / 医学理由经评估 / 维修 / 紧急情况） | Rules 149-70（第 215 页） | — | 低 | 只提示 |
| Cessation notification | admin | provider | 28 天内 | 见 §14 | Rules 149-20、149-25 | — | 低 | 只提示 |

---

## 16. 新员工 / 工作人员记录（只列与临床文书相关的部分）

| 文书 | 起草 | 签署 | 时限 | 最小必填字段 | 依据 | 州差异 | AI 适合度 | careKind |
|---|---|---|---|---|---|---|---|---|
| Aged care worker record | HR | provider | 入职前 / 入职时；保持更新；保留至**最后一次更新后 7 年** | 全名、出生日期、地址；如何确认资质、技能、经验；能力发展机会；police certificate / 法定声明 / NDIS clearance 记录；确认人和确认日期 | Rules 154-905、154-910（第 241–242 页） | 工人筛查（SBS §3.7） | 不适用 | 不涉及（careKind 不存 HR 档案） |
| 专业注册核对（RN / EN 的 AHPRA 注册） | HR / CM | — | 入职和定期 | 注册状态和条件 | SQS 2.9（Rules 15-15(15)）；⚠️ Rules 中的具体条款需核实 | — | 不适用 | 不涉及；**careKind 的角色和"谁能确认 Tier 2/3"由机构管理员按实际资质配置**（PRD §6.5 TierRule） |
| 培训和督导记录（含 careKind 使用培训、AI 草稿审核职责） | CM / educator | — | 上线前 | 培训内容、日期、参加人 | SQS 2.9（Rules 15-15(16)）、2.5.4（报告事件的培训）；`07-marketing-ops/customer-success/pilot-playbook.md`（培训要点） | — | 不适用 | careKind 提供培训材料；记录由机构保存 |
| 员工疫苗统计 | HR | — | 按日历年 | 见 §10 | Rules 154-10、154-15 | SBS §3.9 | 不适用 | 不涉及 |
| 出勤记录（作为补贴核查记录） | 排班系统 | — | 7 年 | — | Rules 154-1205(2)(d) | — | 不适用 | 不涉及 |
| careKind 用户账号、角色、录音告知与同意 | 机构管理员 | 员工本人（告知 / 同意） | 首次使用前 | 角色；可确认的 Tier；声纹（可选、明示同意） | PRD §6.2 `Staff`；护栏 G8、G10；`04-security/access-control.md` | **工作场所监控法、监控设备法 ⚠️ 本地无资料**（legal-reference-map 缺口表） | 不适用 | 机构侧 paperwork，见 §18 |

---

## 17. 总表：一个事实 → 需要填的多张表（Say it once, file it everywhere）

PCW 说一次，careKind 拆出多份草稿；✅ = 自动起草（仍需确认），🔒 = 需 RN 签署，💡 = 只提示不起草。与 PRD §14 文书映射表一致，并补上法定时限提示。

| 员工口述的一个事实（示例，合成数据） | Progress note | Incident（IMS） | 专项记录 | 家属 / GP 通知 | Handover | 提示（不起草） |
|---|---|---|---|---|---|---|
| "Mrs A 早上 7 点被发现坐在床边地上，说想去厕所，左髋疼，没撞头" | 🔒 | 🔒（164-25 字段） | 🔒 post-fall record | 🔒 | 🔒 | 💡 神经观察按机构流程（无人目击）；💡 care plan / 跌倒预防复核；💡 "可能需要按 SIRS 评估"；💡 QI 跌倒数据 |
| "Mr B 下午很激动，推了另一位住户，我们带他去花园走了 15 分钟才平静" | 🔒 | 🔒 | 🔒 ABC chart → BSP 汇总 | 🔒（双方 supporter） | 🔒 | 💡 BSP 复核（162-70(b)）；💡 若有伤害评估是否 reportable |
| "给 Mrs C 吃了 PRN 的 X 药让她安静下来" | 🔒 | — | 🔒 PRN effectiveness note | — | 🔒 | 💡 "请确认 BSP、同意和监测记录"；💡 是否属于 chemical restraint 由人判断（17-5(2)）；💡 用药系统才是给药记录 |
| "Mr D 骶尾部有一块 2cm 红色破皮" | 🔒 | 视情况 | 🔒 wound chart（分期留空，由 RN 说出） | 🔒 | 🔒 | 💡 care plan 复核（新风险）；💡 QI 压疮数据 |
| "Mrs E 的女儿打电话，抱怨上周两次没给她洗澡" | 🔒（事实） | 视情况 | ✅ complaint record（原话） | ✅ communication log | — | 💡 165-25 结果通知和 Complaints Commissioner 告知；💡 若可能构成 neglect，按 SIRS 评估 |
| "Mr F 说他不想吃午饭，只喝了半杯茶" | ✅ | — | ✅ food & fluid（只记说出的量） | — | 有变化时 | 💡 拒绝服务的事件不属于 reportable incident（16-10(2)），但要记录拒绝和提供的替代 |
| "Mrs G 傍晚呼吸很急，RN 打电话给 GP，GP 说送医院" | 🔒 | — | 🔒 escalation record（ISBAR） | 🔒 | 🔒 | 💡 转院交接包（用药清单、ACD 引用原件）；💡 住院记录（7.2.1(a)）；💡 返院后复核 |
| "Mr H 凌晨 3 点走了，很安详，女儿在旁边" | 🔒 | — | 🔒 end-of-life note / 死亡记录 | 🔒 | 🔒 | 💡 死亡证明由医生出具；💡 是否 reportable death 按州法（§14）；💡 如非预期且与照护相关 → SIRS P1 24 小时；💡 cessation notification 28 天 |

**设计含义**：一个 Tier 3 事实最多同时生成 5 份草稿和 3–4 个提示。所有草稿共享同一组来源片段（PRD §6.2 `Draft` 的来源映射），改一份时要提示其他草稿可能需要同步修改（⚠️ 产品需求，未在 PRD 中定义）。

---

## 18. 试点机构上线需要的机构侧 paperwork 清单

这些是 **provider 和 careKind 之间**、以及 provider 对员工和住户要准备的文件，不是护理记录。依据 `rules/01-operations-rules.md` §2–§3 和 `pilot-playbook.md`。状态以链接文件为准，下表"仓库现状"为 18/10/2026 查看结果。

| # | 文件 | 谁准备 | 谁签 / 批准 | 何时 | 仓库现状 / 链接 | 依据 |
|---|---|---|---|---|---|---|
| 1 | Pilot Agreement（范围、期限、费用、成功标准、数据条款、退出） | careKind（律师起草） | provider 授权人 + Lightman | 试点前 | 🔴 未起草，见 [`../contracts-register.md`](../contracts-register.md) | 01-operations-rules §2–§3 |
| 2 | 书面成功标准 | careKind + provider Champion | 双方 | 第 -2 周启动会 | [`../../07-marketing-ops/customer-success/pilot-playbook.md`](../../07-marketing-ops/customer-success/pilot-playbook.md)（多项 `{{TBD}}`） | 01-operations-rules §3 |
| 3 | Data Processing Agreement / Privacy Schedule（子处理方、泄露通知、数据返还删除、不训练、境内存储） | careKind（律师） | 双方 | 与 Pilot Agreement 同时 | 🔴；大纲 [`../../09-templates/dpa-outline.md`](../../09-templates/dpa-outline.md) | Privacy Act APP 8、11；`../privacy-program.md` |
| 4 | Privacy Impact Assessment（MVP） | careKind | Lightman；向 provider 提供摘要 | 上线前 | 待办，见 [`../privacy-program.md`](../privacy-program.md) §5、§7 | OAIC PIA 指引（⚠️ 本地未下载） |
| 5 | Provider 自己的 PIA / 隐私政策更新（含 2026-12-10 起 APP 1.7–1.9 自动化决策披露） | provider | provider | 上线前 | careKind 可提供信息；见 `law-library/oaic-app-1-7-1-9-adm-transparency-flowchart-2026-09.pdf` | Privacy Act APP 1 ⚠️ 是否触发需核实 |
| 6 | 员工告知和同意（使用 AI 文书、录音、声纹可选；录音不用于绩效） | provider（careKind 提供模板） | 每位参与员工 | 培训前 | ⚠️ 仓库**没有**员工告知模板 `{{TBD: 员工告知模板}}` | 护栏 G8、G10；**工作场所监控法、监控设备法 ⚠️ 本地无资料** |
| 7 | 住户和家属告知（含退出方式），必要时取得同意 | provider（careKind 提供模板） | 住户或其授权代表 | 第 -2 周 | [`../../09-templates/resident-ai-notice.md`](../../09-templates/resident-ai-notice.md) | SQS 2.7.2(c)(d)；TGA digital scribes 页面（同意）；PRD §6.2 `Consent` |
| 8 | Vendor 安全 / 隐私尽调问卷回复 | careKind | Lightman | 应 provider 要求 | ⚠️ 无标准回复库 `{{TBD: 安全问卷标准回复}}`；参考 [`../../04-security/information-security-policy.md`](../../04-security/information-security-policy.md)、[`../../04-security/access-control.md`](../../04-security/access-control.md)、[`../../04-security/data-classification-and-retention.md`](../../04-security/data-classification-and-retention.md)；OAIC 选型清单 `law-library/oaic-checklist-selecting-an-ai-product-2024.pdf` | 01-operations-rules §2（只写已做到的事，路线图标"计划中"） |
| 9 | 子处理方清单（提供给 provider） | careKind | — | DPA 附件 | [`../../04-security/vendor-subprocessor-register.md`](../../04-security/vendor-subprocessor-register.md) | APP 8；DPA |
| 10 | 保险证书（PI、cyber、public liability） | careKind | — | 试点前 | [`../insurance.md`](../insurance.md) | 01-operations-rules §3 |
| 11 | 数据泄露响应安排（双方联系人、通知时限） | careKind + provider | 双方 | DPA 内 | [`../data-breach-response-plan.md`](../data-breach-response-plan.md) | NDB scheme；州 MNDB（SBS 表 A、§4.4） |
| 12 | 临床安全资料（危害日志摘要、评测结果、预期用途声明） | careKind | 临床顾问 + Lightman | 试点前 | [`../../06-app-development/clinical-safety/hazard-log.md`](../../06-app-development/clinical-safety/hazard-log.md)、[`clinical-safety-case.md`](../../06-app-development/clinical-safety/clinical-safety-case.md)、[`evaluation-plan.md`](../../06-app-development/clinical-safety/evaluation-plan.md)、[`../tga-samd-boundary.md`](../tga-samd-boundary.md)、[`../ai-governance.md`](../ai-governance.md) | Rules 15-30(1)–(2)（provider 的 clinical governance）；SQS 2.4 风险管理 |
| 13 | Provider 内部的流程更新：IMS / SIRS 流程不变的书面确认（careKind 不判定、不上报 SIRS） | provider | provider CM / DON | 上线前 | 培训要点见 pilot-playbook | 护栏 G6；Rules 164-20、165A-20 |
| 14 | 机构配置：TierRule（哪些类别 PCW 可确认）、模板选择、CMS 集成方式 | provider + careKind | provider CM | 第 -2 周 | PRD §6.5 | 护栏 G1、G5 |
| 15 | 基线测量记录（记录耗时、质量抽样） | careKind + provider | — | 第 -1 周 | pilot-playbook | 01-operations-rules §3 |
| 16 | careKind 现场人员：有效 police check、疫苗、遵守现场政策 | careKind | provider 现场负责人核验 | 进场前 | pilot-playbook；SBS §3.7、§3.9、§4.7 | 01-operations-rules §3；⚠️ 是否属于 Act s11(4) 的 aged care worker 需律师确认（`law-library/index.md` 待核实第 6 条） |
| 17 | ACQSC 相关：provider 是否需要就引入新系统通知 Commissioner（change in circumstances） | provider | provider | — | ⚠️ 需核实：Act s167 是否涵盖；一般认为引入文书软件不属于 | Act s167 ⚠️ |
| 18 | 支持 SLA 和支持访问授权流程 | careKind | 双方 | 试点前 | [`../../07-marketing-ops/customer-success/support.md`](../../07-marketing-ops/customer-success/support.md) | 01-operations-rules §4 |
| 19 | 试点结束：数据返还 / 删除证明；试点报告 | careKind | 双方 | 第 9–12 周 | contracts-register（合同终止后 `{{TBD: 30}}` 天） | DPA；Rules 154 的保存义务由 provider 承担（已导出到 CMS 的记录在 provider 系统里保存 7 年） |

---

## 19. 关键发现（给产品和销售）
1. **Progress notes 和临床记录保存 7 年有了明确条款**：Rules 154-1000(1)(d)（并见 154-1205(2)(b)）。careKind 不是记录的主存储，但导出到 CMS 前的草稿、审核链和更正记录要和 provider 的保存义务对齐（⚠️ careKind 自身保留期需在 DPA 里约定）。
2. **SIRS 时限链条**：员工"as soon as possible"上报 → 报警 24 小时（164-40(2)）→ P1 24 小时 + 5 天补充 → P2 30 天 → final report 84 天。careKind 的计时提示应从"知悉时间"开始，并显示全部节点（G6：只提示）。
3. **Care and services plan 必须在 start day 当天或之前制定，且每次更新都要给住户副本**（148-80(1)、(4)）；"至少每 12 个月复核"不适用 residential（148-80(5)），residential 只有"regularly"和 3.1.5 的触发条件。
4. **Chemical restraint 的 BSP 有 9 项法定记录**，处方和同意由 medical practitioner / NP 负责（162-25）；每次使用都要记持续时间、是否符合同意范围（162-60）。这是 careKind 最容易"写多了"的区域，只能提示。
5. **拒绝服务不是 reportable incident**（16-10(2)），但必须有清楚的拒绝记录，这是 careKind 自动起草的高价值点。

---

## 20. ⚠️ 待核实清单
1. 新法下 AN-ACC 入住记录（ACER）是否已被 start notification（Rules 149-10）和 Services Australia AC021 取代；palliative care status form 的 14 天时限是否仍适用（AN-ACC-P 为 2024-12 旧版）。
2. AN-ACC 重新分类触发条件（住院 ≥5 天 / 全麻 ≥2 天；6 / 12 个月）在新法下的条款位置。
3. Entry assessment 和 GP 综合医学评估有没有全国统一的完成天数（本地 Rules 和 SQS 未见）。
4. Residential care and services plan 的复核频率：除"regularly"外是否有其他法定或资金要求（Rules 148-80(3)(c) 只适用 home / community）。
5. Monthly Care Statements 何时转为强制，以及强制后的格式要求（health.gov.au 指南 v1.2，2026-05，目前自愿）。
6. 向 ACQSC 提交 P1 / P2 notice 的渠道（portal 名称）和 approved form 的当前版本。
7. careKind 把 incident 事实按 165A-25(4) 顺序排成"参考摘要"是否会被视为"代为通报"或影响 G6（需临床和法律顾问确认）。
8. 联邦 RPSDM hierarchy 过渡期（至 01/12/2026）是否再延期；NSW 2026-12 新框架（SBS §3.4）。
9. 现行 COVID-19 / 疫情向联邦卫生部通报的要求和时限（2024-09 指南），以及各州须通报疾病清单和方式。
10. 向 TGA 报告 adverse medicine / vaccine event（SQS 5.3.5）是否有时限。
11. Verification of death 可由谁完成（RN / 医生），以及死亡证明出具时限（各州 BDM 法，SCP）。
12. VIC、NSW、WA、SA、TAS、ACT、NT 的 reportable death 条文和条款号，以及 provider 自身是否有报告义务（只核实了 QLD）。
13. QLD Coroners Court fact sheet 文件名为 2025，文内版本为 "Version 1 – November 2019"，需确认是否有更新版。
14. Rules 中 RN / EN 专业注册核对的具体条款（Rules 152-35 等，未逐条读）。
15. 员工使用录音类 AI 的告知和同意：各州监控设备法、工作场所监控法（本地无资料，上线门槛）。
16. Provider 引入 careKind 是否触发 Act s167 change in circumstances 通知。
17. careKind 现场人员是否属于 Act s11(4) 的 aged care worker（工人筛查记录 154-905）。
18. Progress note 的频率：法律未规定"每班"，各机构政策和 CMS 默认设置需在试点中收集。
19. 154-1000 的 7 年保存与州健康记录法（VIC / NSW / ACT 成人 7 年、未成年到 25 岁）叠加后的实际保存期（SBS §3.2）。
20. Medication incident 是否有联邦层面的单独报告义务（除 IMS 和 SIRS 外）。
21. 机构侧"员工告知模板"和"安全问卷标准回复"尚未建立（`{{TBD}}`）。
22. 一个事实生成多份草稿时，修改一份是否要求同步其他草稿（产品需求，PRD 未定义）。
23. 各 Outcome 的 ACQSC 网页指南（ACQSC-SQS）对证据文书的最新期望（未在本次检索中逐页核对）。
24. QLD post-fall pathway、palliAGED case conference pack 等模板的具体许可（PT/index.md 中均标 ⚠️）；本文件只引用字段类别，未复制内容。
