Owner: Legal/Compliance · Status: Research draft · Last reviewed: 04/10/2026
> 运营参考，不是法律意见

# 澳洲 residential aged care 护理文书类型分类（Paperwork taxonomy）

**范围**：residential aged care home 里 RN / EN / PCW / AIN 日常要完成的文书。用于 careKind（员工口述 → AI 起草 → 护士审核）的产品范围划定和 TGA 风险分级。
**法规背景**：Aged Care Act 2024 和 Aged Care Rules 2025 已于 **2025-11-01** 生效，Strengthened Aged Care Quality Standards 同日生效（来源：ACQSC quick guide https://www.agedcarequality.gov.au/sites/default/files/media/reportable-instances-sirs-guide.pdf ；Standards 文件第 4 页 "have been in effect since 1 November 2025" https://www.health.gov.au/resources/publications/strengthened-aged-care-quality-standards ）。
**参考文件**：本地副本在 `paperwork-templates/` 目录下，见 `paperwork-templates/index.md`。

## 0. 主要来源及简称

| 简称 | 来源 |
|---|---|
| **SQS** | Strengthened Aged Care Quality Standards – November 2025, https://www.health.gov.au/resources/publications/strengthened-aged-care-quality-standards （下文 "SQS 3.1.5" 指 action 编号） |
| **ACQSC-SQS** | ACQSC 对各 Outcome 的网页指南，例如 https://www.agedcarequality.gov.au/strengthened-quality-standards/care-and-services/assessment-and-planning |
| **SIRS-QG** | ACQSC, Reportable incidents and SIRS – quick guide to changes from 1 Nov 2025, https://www.agedcarequality.gov.au/sites/default/files/media/reportable-instances-sirs-guide.pdf |
| **SIRS-RES** | ACQSC SIRS provider resources, https://www.agedcarequality.gov.au/for-providers/serious-incident-response-scheme/sirs-provider-resources |
| **RP-DoH** | Restrictive practices in aged care – a last resort, https://www.health.gov.au/topics/aged-care/providing-aged-care-services/training-and-guidance/restrictive-practices-in-aged-care-a-last-resort |
| **RPSDM** | Restrictive Practices Substitute Decision Maker fact sheet (2026-02), https://www.health.gov.au/sites/default/files/2026-02/consent-for-restrictive-practices-information-for-aged-care-providers.pdf |
| **QI-A** | QI Program Manual Part A (Nov 2025), https://www.health.gov.au/sites/default/files/2025-10/national-aged-care-quality-indicator-program-manual-part-a.pdf |
| **MedGP** | Guiding Principles for Medication Management in RACFs (2022), https://www.health.gov.au/resources/publications/guiding-principles-for-medication-management-in-residential-aged-care-facilities |
| **GACL-3** | Guide to Aged Care Law Ch.3（记录保存义务）, https://www.health.gov.au/resources/publications/guide-to-aged-care-law/chapter-3-registered-providers-aged-care-workers-and-aged-care-digital-platform-operators/obligations-that-apply-to-all-providers |
| **RESP** | Responsibilities of residential aged care providers, https://www.health.gov.au/our-work/residential-aged-care/responsibilities-of-providers |
| **TGA-DS** | TGA Digital scribes (last updated 30 Jan 2026), https://www.tga.gov.au/products/medical-devices/software-and-artificial-intelligence-ai/overview/types-software-based-medical-devices/digital-scribes |

## 0.1 AI 起草适合度和 TGA 风险的评级口径

依据 TGA-DS 原文：只把临床对话"transcribe and translate ... into written records without performing analysis or interpretation" **不算** medical device；如果"analyses or interprets ... generating a diagnosis, differential diagnosis or treatment recommendation not explicitly stated by the healthcare practitioner"，**就是** medical device，必须先列入 ARTG。TGA 的 medical device 定义还包括 "monitor, predict, provide a prognosis"。

| 评级 | 含义 |
|---|---|
| **AI 适合度 高** | 内容基本是员工自己观察和叙述的事实，结构固定。AI 负责整理、规范措辞、提示缺失字段 |
| **AI 适合度 中** | 可以起草叙述部分，但有法定判断或同意要素，必须由 RN 或管理者做决定，AI 不能代填 |
| **AI 适合度 低** | 核心是临床评分、诊断、分级或治疗决策；或者是结构化数值表，口述没有优势 |
| **TGA 风险 低** | 纯文档化，所有内容都来自员工原话 |
| **TGA 风险 中** | 容易出现功能蔓延（例如"建议"升级、自动套阈值），需要产品护栏 |
| **TGA 风险 高** | 打分、风险预测、分诊、诊断、治疗或用药建议，很可能构成 SaMD |

> 下表中的"TGA 风险"是 careKind 内部的初步判断，**不是** TGA 的认定。⚠️ 需要监管顾问确认。

---

## 1. 日常记录

### 1.1 Progress notes（护理/进展记录）
- **常见字段**：住户识别信息（姓名、房间号、ID）；日期和时间；记录人和角色；观察（ADL、情绪、行为、进食饮水、睡眠、皮肤、排泄）；护理措施；住户本人的意见和偏好；变化或异常；已通知的人（RN、GP、家属）；后续跟进。
- **频率**：每班或按需（机构政策决定，⚠️ 没有全国统一频率）；发生变化或事件时立即记录。
- **法规依据**：SQS 2.7.2（信息准确完整，并能在需要时提供给相关人员）；SQS 3.1（care and services plan 必须指导服务，并在变化时复核）；SQS 3.3（关键信息要沟通）；SQS 5.4.5（监测临床状况）；ACQSC-SQS 把 progress notes 列为评估证据。GACL-3：提供者必须保存"services they delivered and the people they delivered them to"的记录。
- **AI 适合度**：**高**（careKind 的核心场景）。
- **TGA 风险**：**低**。前提是只整理员工原话，不写入员工没说过的临床解释（例如员工说"她今天很迷糊"，AI 不能改写成"疑似谵妄"）。

### 1.2 Shift handover（交接班记录，常用 ISBAR）
- **常见字段**：Identify（至少 3 个住户识别信息、交接人）；Situation（当前情况）；Background（相关病史和背景）；Assessment（**交班人自己的**评估）；Recommendation（**交班人提出的**下一步要求）；风险；责任交接确认。来源：SA Health ISBAR fact sheet https://www.sahealth.sa.gov.au/wps/wcm/connect/8a8b26804896068a9cb8fc7675638bd8/15111.3-+Clinical+Handover+Fact+Sheet+(V1)WebS.pdf?MOD=AJPERES
- **频率**：每次换班；转院或转科时。
- **法规依据**：SQS 3.3.2(d)（"handover or transitions of care occur between aged care workers"时必须使用结构化沟通系统）；SQS 3.1.6(d)（转介时要共享 advance care planning 文件）。
- **AI 适合度**：**高**。可以从本班 progress notes 汇总出交接草稿。
- **TGA 风险**：**低到中**。A 和 R 两栏最容易让 AI 自己写出"建议"，必须只用员工的原话，或者留空让员工填写。

### 1.3 Family / supporter communication log（家属沟通记录）
- **常见字段**：日期和时间；联系对象及其和住户的关系（registered supporter / 代理决策人）；沟通方式；讨论内容；对方的意见和要求；是否得到住户同意可以分享信息；后续跟进。
- **频率**：按需；发生事件或变化时必须通知。
- **法规依据**：SQS 5.4.4(d)（"timely notification to ... the individual's supporters ... when clinical incidents or changes occur"）；SQS 3.1.3（在知情同意下向 supporters 沟通评估结果）；SQS 2.7.2(c)(d)（信息共享需要同意）。
- **AI 适合度**：**高**。
- **TGA 风险**：**低**。

---

## 2. 事件与合规报告

### 2.1 Incident report（内部事件报告，记入 IMS）
- **常见字段**：事件类型；日期、时间、地点；涉及的人（住户、员工、访客）；**客观事实叙述**；即时处理措施；可见伤害和影响；通知了谁（RN、GP、家属、管理者），何时通知；证人；是否可能属于 SIRS reportable incident（由人判断）；调查和后续行动。可参考 ACQSC Investigation plan template https://www.agedcarequality.gov.au/sites/default/files/media/annexure-a-investigation-plan-template.docx
- **频率**：每次事件或 near miss 发生后。
- **法规依据**：SQS 2.5.1（"incident management system to record, investigate, respond to and manage incidents and near misses"）；RESP（"have an incident management system in place"）；SIRS-RES。
- **AI 适合度**：**高**（叙述和字段整理）。
- **TGA 风险**：**低**。但不要让 AI 推断原因或给出"根因"结论（这是调查环节，需要人来做）。

### 2.2 SIRS notification（向 ACQSC 通报 reportable incident）及后续表单
- **8 类 reportable incident**：unreasonable use of force；unlawful sexual contact or inappropriate sexual conduct；psychological or emotional abuse；unexpected death；stealing or financial coercion by a staff member；neglect；inappropriate use of restrictive practices；unexplained absence（来源 SIRS-QG，以及 ACQSC workflow https://www.agedcarequality.gov.au/sites/default/files/media/reportable-incidents-workflow_1.pdf ）。
- **时限**：P1 在知悉后 **24 小时**内报告，缺失信息在随后 **5 天**内补交；P2 在 **30 个日历日**内报告；significant new information 在"as soon as reasonably practicable"时通报（SIRS-QG）。
- **常见字段**（来自 portal 提问示例，ACQSC neglect example https://www.agedcarequality.gov.au/sites/default/files/media/sirs-notification-example-response-neglect.pdf ，2022 年版）：事件类型；受害人信息；认知水平；是否住在 secure unit；详细描述；身体和心理影响及其等级；以及 subject of allegation、已采取的措施等（⚠️ 新法下 portal 字段和提交渠道需核实）。后续表单（additional information P1/P2、significant new information、final report）依据 Aged Care Rules 2025 s165A-25/-30/-40/-45（SIRS-RES）。
- **法规依据**：Aged Care Act 2024 s166（ACQSC final report 表单引用）；Aged Care Rules 2025 Pt 165A（同上）；SQS 2.5.5。
- **AI 适合度**：**中**。可以把 incident report 里的事实整理成符合 portal 提问顺序的草稿。ACQSC 明确说好的通报"requires more than simply transcribing the details taken from progress notes"（同一份 example），所以 P1/P2 判定、影响评估和对原因的分析**必须由人完成**。
- **TGA 风险**：**低**（这不是治疗用途）。但合规风险高：AI 不能自动判断"是否需要报告"或"P1 还是 P2"，只能提示"请按 ACQSC decision support tool / 机构流程评估"。

### 2.3 Falls post-incident record（跌倒后记录）
- **常见字段**：发现时间和地点；是否有人目击；住户自述；即时检查结果（RR、SpO2、BP、HR、GCS、体温、BGL）；是否撞到头；疼痛；可见伤害；是否在服用抗凝药；神经观察（按机构流程）；通知 GP 和家属的时间；转院；跌倒原因的**观察记录**；care plan 复核。来源：QLD Health RCF Post-Fall Clinical Pathway https://www.health.qld.gov.au/__data/assets/pdf_file/0023/431537/fall-rcf-post.pdf
- **频率**：每次跌倒；之后按流程做后续观察。
- **法规依据**：SQS 5.5.4（"delivering effective and timely post falls care; monitoring falls and injuries and reviewing the reasons"）；QI-A 的 falls and major injury 指标（每季度提交）；ACSQHC Falls Guidelines for RACS 2025 https://www.safetyandquality.gov.au/resources/falls-guidelines-australian-residential-aged-care-services
- **AI 适合度**：**高**（叙述部分）；生命体征数值只能逐项照录员工报出的数字。
- **TGA 风险**：**低到中**。不要自动判断"是否需要转院"，也不要根据数值自动报警或分诊（这属于 monitor/triage）。

### 2.4 Medication incident report（用药事件报告）
- **常见字段**：事件类型（漏给、给错药、剂量错误、时间错误等）；涉及的药物；发现经过；对住户的影响；通知了谁（RN、GP、药剂师）；即时措施。
- **频率**：每次事件。
- **法规依据**：SQS 5.3.1（安全用药系统，包括准确的用药记录）；SQS 2.5.1；MedGP（用药事件管理）。
- **AI 适合度**：**中**。可以起草叙述，但药名、剂量必须和用药系统核对，不能由 AI 补全。
- **TGA 风险**：**低到中**。绝不能给出处理建议（例如"建议观察 X 小时"）。

### 2.5 Complaints / feedback record（投诉与反馈记录）
- **常见字段**：投诉人及其关系；日期；渠道；投诉内容（原话）；即时回应；open disclosure；处理过程和结果；是否告知外部投诉渠道。
- **频率**：按需。
- **法规依据**：SQS Outcome 2.6a / 2.6b（投诉和反馈管理）；GACL-3（必须保存"complaints and feedback, including how they manage and resolve these"的记录，并且要有投诉管理系统）。
- **AI 适合度**：**高**（记录和整理）。
- **TGA 风险**：**低**。

---

## 3. 评估与计划

### 3.1 Admission / entry assessment（入住评估）及 ACER
- **常见字段**：基本信息；病史；用药；过敏；功能和 ADL；认知；沟通需求；文化、语言、宗教、性别认同；风险（跌倒、压疮、营养、吞咽）；目标和偏好；代理决策人；advance care planning 状态。行政方面：为每位住户创建 Aged Care Entry Record（RESP）。
- **频率**：入住时；之后定期复评，需要变化时也要复评。
- **法规依据**：SQS 3.1.1、3.1.4；SQS 5.4.2（"comprehensive clinical assessment on commencement ... at regular intervals and when needs change"）；SQS 6.2.1（营养评估）。
- **AI 适合度**：**中**。可以把访谈叙述整理到各个栏目，但量表评分和风险分级必须由合资格人员完成。
- **TGA 风险**：**中**。如果 AI 根据叙述推断"高跌倒风险"或"营养不良风险"，就进入 predict/risk scoring 范围。

### 3.2 Care and services plan（护理计划）及复核
- **常见字段**：需求、目标、偏好；每项风险对应的管理策略；预防性护理；参与制定的人；住户是否已收到或可以查看；复核日期和复核原因。
- **频率**：定期复核，并且在以下情况复核：需求变化、计划无效、功能或认知恶化、家属照护能力变化、转介、新风险或事件、照护责任变化（SQS 3.1.5）。
- **法规依据**：SQS 3.1（尤其 3.1.4 / 3.1.5）；ACQSC-SQS assessment and planning 指南。BSP 必须是 care and services plan 的一部分（RP-DoH）。
- **AI 适合度**：**中**。可以根据 progress notes 和事件提示"可能需要复核哪一节"，并起草修改的文字。**护理策略的选择属于临床决策**，必须由 RN 决定。
- **TGA 风险**：**中**。AI 不能自行生成新的干预措施或治疗策略。只把 RN 口述的修改写成文字，风险较低。

### 3.3 Case conference / care plan review meeting（病例会议，含姑息护理病例会议）
- **常见字段**：参会者（住户、家属、代理决策人、GP、RN、allied health）；讨论议题；住户的意愿；达成的共识和决定；责任人和时限；summary 发给了谁。来源：palliAGED Case Conference Pack https://www.caresearch.com.au/Portals/20/Documents/Case-Conference-Pack.pdf
- **频率**：按需或定期；进入姑息阶段时。
- **法规依据**：SQS 3.1.2（基于持续沟通和合作）；SQS 5.4.1（共同设定照护目标）；SQS 5.7.2（姑息护理阶段支持住户和家属）。
- **AI 适合度**：**高**（会议纪要）。
- **TGA 风险**：**低**。前提是只记录会上实际做出的决定。

### 3.4 AN-ACC 相关资料
- **说明**：AN-ACC 评估由**独立的 AN-ACC 评估员**完成。机构可以申请重新分类，入住时即接受姑息护理的住户需提交 palliative care status form（AN-ACC Reference Manual https://www.health.gov.au/resources/publications/an-acc-reference-manual-and-an-acc-assessment-tool ；assessment pathways fact sheet https://www.health.gov.au/resources/publications/an-acc-assessment-pathways-fact-sheet ）。护理记录是佐证材料。
- **相关记录**：功能、认知、行为、压疮、跌倒史、姑息状态等日常记录。
- **法规依据**：同上。另外，care minutes 工人须知明确，为申请 AN-ACC 重新评估所做的资金相关工作**不计入** care minutes（https://www.health.gov.au/resources/publications/care-minutes-in-residential-aged-care-information-for-workers ）。
- **AI 适合度**：**低**。careKind 不应提供"让分类更高"的写作建议，这有资金合规和夸大记录的风险。
- **TGA 风险**：**低**（资金用途，不是治疗用途），但**合规和声誉风险高**。

---

## 4. 临床监测图表

### 4.1 Pressure injury / wound chart（压疮和伤口记录）
- **常见字段**：部位；类型（压疮、皮肤撕裂、慢性伤口）；分期（由合资格人员判断）；大小；创面组织；渗液；周围皮肤；疼痛；敷料和处理（按医嘱或伤口计划）；照片（需同意）；下次评估日期。参考 QLD 慢性伤口路径 https://www.health.qld.gov.au/__data/assets/pdf_file/0030/1243785/48.Chronic-wound-assessment-and-management.pdf 和 Vic 标准化护理流程 https://www.health.vic.gov.au/sites/default/files/migrated/files/collections/factsheets/s/scp-pressure-injuries-pdf.pdf
- **频率**：每次换药或评估；QI 要求每个报告期对每位住户做一次全身观察评估（QI-A 第 8 章）。
- **法规依据**：SQS 5.5.9（预防和管理压疮与伤口）；SQS 5.5.3(d)（皮肤完整性）；QI-A pressure injuries 指标。
- **AI 适合度**：**中**。叙述性描述适合；分期、测量值必须由员工明确说出，AI 不能从描述推断分期。**Braden/Waterlow 风险评分不应由 AI 计算**。
- **TGA 风险**：**中到高**（自动分期或风险评分 = 诊断或风险预测）。

### 4.2 Behaviour chart（行为观察记录，例如 ABC 记录）
- **常见字段**：日期、时间、持续时间；前因（Antecedent）；行为本身（"describe the behaviour, not the label"）；后果（Consequence）；使用过的非药物策略和效果；是否使用了限制性措施。来源：DSA BSP 模板 https://www.dementia.com.au/resource-hub/behaviour-support-plan-restrictive-practices
- **频率**：每次行为发生时；或者按 BSP 要求的观察期。
- **法规依据**：SQS 5.6（认知障碍）；SQS 3.2.6（失智症照护系统）；BSP 的监测要求（RP-DoH）。
- **AI 适合度**：**高**。口述能节省大量时间，AI 可以帮助把"标签化"描述改成具体行为描述。
- **TGA 风险**：**低**。但不要让 AI 推断原因（例如"可能是疼痛导致"），这属于临床解释。

### 4.3 Behaviour Support Plan（BSP，行为支持计划）
- **常见字段**：住户背景和生活史；行为描述；已知触发因素；最佳实践替代策略（使用过的和效果）；如果使用限制性措施：类型、使用情境、频率、持续时间、监测方式、复核时间；知情同意（住户本人或 RPSDM）；复核记录。
- **频率**：评估认为需要限制性措施时、使用限制性措施时、定期复核时（DSA 模板引用了旧 QoC Principles s15HC–HE 的触发点；新法下的条款编号 ⚠️ 需核实，见 Aged Care Rules 2025 Ch4 Pt9）。
- **法规依据**：RP-DoH（"Providers must also have a Behaviour Support Plan (BSP) in place and implement the BSP as part of the older person's Care and Services Plan"）；SQS 3.2.7；RPSDM。
- **AI 适合度**：**中**。可以起草背景和行为描述，并汇总 behaviour chart。**是否使用限制性措施、选择哪种替代策略，属于临床和法律决定**。
- **TGA 风险**：**中**。AI 不能建议具体策略或药物。

### 4.4 Restrictive practice consent & monitoring records（限制性措施同意与监测记录）
- **常见字段**：限制性措施类型（chemical、environmental、mechanical、physical、seclusion，共 5 类，RP-DoH）；使用前尝试过的替代策略及结果；同意人（住户本人或 RPSDM）、同意范围（情境、频率、持续时间）、复核时间；每次使用的记录（时间、持续时间、原因、监测、效果、不良影响）；撤销同意的记录。来源：RPSDM checklist。
- **频率**：每次使用时；按同意书和 BSP 定期复核。
- **法规依据**：RP-DoH；RPSDM（"If the RPSDM does give informed consent, ensure it is documented in the older person's Behaviour Support Plan and care and services plan"）；Aged Care Rules 2025 s6-20、Ch1 Pt7、Ch4 Pt9（经 RPSDM 引用）；SIRS 中的"inappropriate use of restrictive practices"；QI-A 第 9 章（限制性措施指标，不含 chemical restraint）。
- **AI 适合度**：**中**。可以起草每次使用记录的叙述部分；"同意是否有效"必须由人核实。
- **TGA 风险**：**低到中**。合规风险高：如果没有同意或 BSP 却出现限制性措施记录，AI 应提示人工复核（只提示，不判定违规）。

### 4.5 PRN medication effectiveness notes（PRN 用药效果记录）
- **常见字段**：给药原因（员工观察到的情况）；给药前尝试过的非药物措施；给药时间（以用药系统为准）；复查时间；效果描述；不良反应。精神类 PRN 还要记录是否属于 chemical restraint。来源：ACQSC PRN stickers guide https://www.agedcarequality.gov.au/media/87556
- **频率**：每次 PRN 给药后。
- **法规依据**：SQS 5.3.1(e)（"documentation of a current, accurate and reliable record of all medicines and the clinical reasons for the treatment, including pro re nata (PRN) medicines"）；MedGP 关于 PRN 的章节；RP-DoH。
- **说明**：用药医嘱和给药签名通常在 medication chart 或 eNRMC 系统里（⚠️ eNRMC 的普及程度和监管要求需核实）。**careKind 不应替代用药系统**。
- **AI 适合度**：**中**（只做叙述部分）。
- **TGA 风险**：**中**。绝不能建议是否给药、剂量或换药。

### 4.6 Pain assessment（疼痛评估，例如 Abbey Pain Scale）
- **常见字段**（Abbey）：6 项观察（vocalisation、facial expression、body language、behavioural change、physiological change、physical changes），每项 0–3 分；总分区间（0–2 无痛，3–7 轻度，8–13 中度，14+ 重度）；疼痛类型；日期、时间、签名。来源：palliAGED Abbey Pain Scale https://www.palliaged.com.au/Portals/5/Documents/Fillable-Forms/Abbey-Pain-Scale_Information-sheet-PA.pdf
- **频率**：入住时、怀疑疼痛时、干预后复评（⚠️ 具体频率由机构政策决定）。
- **法规依据**：SQS 5.5.8（"assessing the individual's pain including where the individual experiences challenges in communicating their pain"）；SQS 5.7.3（姑息阶段的症状管理）。
- **AI 适合度**：**低到中**。AI 可以把员工逐项说出的分数和观察填进表里；**不能从叙述推断各项分数或总分**。
- **TGA 风险**：**高**（如果 AI 自动打分，就是在做评估或监测）。

### 4.7 Weight / BGL / vital signs charts（体重、血糖、生命体征表）
- **常见字段**：日期和时间；数值；单位；测量条件；测量人；异常时通知了谁。
- **频率**：按 care plan 和医嘱；体重按 QI 要求在指定时间点测量（QI-A 第 10–11 章：significant 和 consecutive unplanned weight loss）。
- **法规依据**：SQS 5.5.5（营养，"unplanned weight loss or gain"）；SQS 5.4.5（监测临床状况）；QI-A。
- **AI 适合度**：**低**（结构化数值，表单或设备直接录入更合适）。可以在 progress note 里记录员工口述的数值。
- **TGA 风险**：**中到高**。如果 AI 套用阈值自动标红或报警（例如 QLD 恶化路径里的红/黄分区 https://www.health.qld.gov.au/__data/assets/pdf_file/0018/1152216/16.Recognition-of-the-deteriorating-resident.pdf ），就进入 monitor/triage 范围。

### 4.8 Food & fluid charts（饮食和液体摄入记录）
- **常见字段**：日期、餐次和时间；提供的食物或液体及质地（IDDSI 等级，⚠️ 由机构标准决定）；摄入量（估计比例或毫升数）；拒食和原因；协助程度。
- **频率**：对有风险的住户每餐或全天记录（按 care plan）。
- **法规依据**：SQS 5.5.5；SQS Outcome 6.2 / 6.3；SQS 5.5.2（吞咽安全）。
- **AI 适合度**：**中**（口述"早餐吃了一半，喝了 150ml 茶"可以转成结构化数据）。
- **TGA 风险**：**低**（只照录）；如果自动判断"脱水风险"，风险就升到中到高。

### 4.9 Clinical deterioration / escalation record（病情恶化与升级记录）
- **常见字段**：观察到的变化（员工原话）；生命体征；升级给谁（RN、GP、NP、000）及时间；接收方的指示；结果。
- **频率**：每次发现恶化时。
- **法规依据**：SQS 3.2.5（识别恶化并"respond to, and escalate, risks in a timely manner"）；SQS 3.3（"risks ... changes and deterioration ... are escalated and communicated"）；SQS 5.4.4(c)(d)、5.4.5。
- **AI 适合度**：**中**。AI 可以把升级过程整理成 ISBAR 格式，方便 RN 打电话给 GP。
- **TGA 风险**：**高**（如果 AI 判断"需要升级"或"紧急程度"）。只整理员工已经决定要升级的内容，风险较低。

### 4.10 Infection / outbreak records（感染与疫情记录）
- **常见字段**：症状和开始时间；检测；隔离措施；通知（公共卫生部门，按州规定）；病例名单（line list）；员工和住户疫苗接种记录。
- **频率**：发生时，疫情期间每天。
- **法规依据**：SQS 4.2、5.2；RESP（"keep records of their vaccinations"）；ACSQHC Aged Care IPC Guide https://www.safetyandquality.gov.au/sites/default/files/resources/attachments/The-Aged-Care-Infection-Prevention-and-Control-Guide.pdf （⚠️ 未下载，具体要求需核实）。
- **AI 适合度**：**中**（叙述部分）。
- **TGA 风险**：**中**（如果 AI 推断"疑似某种感染"，就是诊断）。

---

## 5. 转介、姑息与临终

### 5.1 GP / allied health referral（转介记录）
- **常见字段**：转介对象；原因（员工观察到的情况）；相关背景；紧急程度（**由 RN 决定**）；住户同意；结果和反馈。
- **频率**：按需。
- **法规依据**：SQS 3.2.4（"timely and appropriate referrals ... to registered health practitioners and allied health professionals"）；SQS 5.4.3。care minutes 工人须知：组织 allied health 转介属于可计入的 direct care。
- **AI 适合度**：**高**（起草转介信）。
- **TGA 风险**：**低到中**。不能写入员工没说过的"临床印象"或"建议治疗"。

### 5.2 Advance care directive / advance care planning record（预先医疗指示记录）
- **常见字段**：是否有 ACD 或 ACP 文件及存放位置；代理决策人；住户的价值观和意愿；复核日期；转介时已共享给谁。
- **频率**：入住时、状况变化时、定期复核时。
- **法规依据**：SQS 3.1.6（ACP 流程，"stored, managed, used and shared ... including at transitions of care"）；SQS 5.7.2(c)（姑息阶段复核 ACP）。ACD 表单按州法律区分（⚠️ 各州表单未下载）。
- **AI 适合度**：**中**（可以记录讨论过程；**ACD 本身是法律文件，AI 不应起草**）。
- **TGA 风险**：**低**，但法律风险高。

### 5.3 End-of-life / palliative care notes（姑息和临终护理记录）
- **常见字段**：舒适度措施；症状（疼痛、呼吸、躁动、分泌物）；口腔护理、眼部护理、皮肤护理；家属在场情况和支持；精神和文化需求；预期性用药的使用（照录）；死亡时间和通知。
- **频率**：每班或更频繁。
- **法规依据**：SQS 5.7（姑息和临终护理，包括 5.7.4 "in the last days of life"）；AN-ACC 姑息路径（见 3.4）。
- **AI 适合度**：**高**（叙述性记录）。
- **TGA 风险**：**低到中**。不能判断"进入临终阶段"（这是临床判断）。

---

## 6. 机构层面的数据（护理人员提供原始记录）

### 6.1 QI Program data（质量指标数据）
- **说明**：14 个指标，包括 pressure injuries、restrictive practices、unplanned weight loss、falls and major injury、medication management、ADL、incontinence care、hospitalisation、workforce、consumer experience、quality of life、allied health 等。每个季度结束后第 21 天前通过 GPMS 提交（QI-A 第 2.2 节）。
- **护理人员相关**：日常记录（跌倒、压疮全身检查、体重、限制性措施的使用）是 QI 数据的来源。
- **AI 适合度**：**低**（数据汇总和提交是管理端工作）。careKind 可以确保日常记录有可追溯的原始事实，方便以后统计。
- **TGA 风险**：**低**（统计用途）。

### 6.2 Care minutes / 24/7 RN 记录
- **说明**：提供者必须达到 care minutes 目标，并保证 24/7 至少一名 RN 在岗（RESP）。写 care plan、组织转介可以计入 direct care（care minutes 工人须知）。
- **AI 适合度**：不适用（排班和工时系统负责）。

---

## 7. 产品设计启示（Design implications）

1. **"只整理、不解释"作为硬性规则**（依据 TGA-DS）：输出中的每一句临床内容都必须能追溯到员工的原话或已有记录。可以考虑在审核界面显示"来源片段"，并对 AI 新增的措辞做高亮。禁止生成诊断、鉴别诊断、风险分级、分诊级别和治疗或用药建议。
2. **评分类工具（Abbey、Braden/Waterlow、生命体征红黄区、跌倒风险）一律"员工输入、AI 照录"**。AI 不推断分数，不套阈值报警。如果以后要做这类功能，必须先做 TGA SaMD 分类评估和 ARTG 规划（⚠️ 需监管顾问确认）。
3. **ISBAR 的 A 和 R 栏、care plan 的"策略"栏、BSP 的"替代策略"栏**是最容易出现功能蔓延的地方。默认留空或只用员工原话；如果员工没有说，就显示"请填写"，而不是让 AI 补上。
4. **SIRS 流程中的"提示而非判定"**：incident 草稿里可以出现"此事件可能需要按 SIRS 评估（P1 时限 24 小时）"之类的提示，并链接 ACQSC decision support tool。但 P1/P2 判定、影响评估和原因分析都留给人。使用新法术语（"older person"、"registered provider"、"aged care workers"、"unexplained absence"，来源 SIRS-QG）。
5. **客观叙述规范**：参考 DSA 的"describe the behaviour, not the label"和 ACQSC investigation plan 的"Include only facts"。AI 可以把评判性或标签化的措辞改写成可观察的描述，但不能添加员工没有观察到的事实。
6. **数值字段的严格照录**：药名、剂量、生命体征、摄入量等，必须和员工口述完全一致。语音识别置信度低时，必须让员工确认，不能"合理补全"。用药信息以 eNRMC 或用药系统为准，careKind 不写用药记录本身。
7. **同意与限制性措施的关联提醒**：如果叙述中提到约束、上锁、镇静等内容，提示"请确认 BSP 和同意记录"（依据 RP-DoH、RPSDM）。只提醒，不判定是否违规。
8. **审核与审计追踪**：每份草稿记录口述人、审核护士、修改差异和时间戳，以支持 SQS 2.7.2(b)（"accuracy and completeness"）以及 GACL-3 的记录义务。住户和 supporter 有权访问个人信息，系统需要支持按住户导出。
9. **知情同意和透明度**：TGA-DS 要求向住户说明使用了 digital scribe 并取得同意（⚠️ 页面针对 healthcare practitioner，aged care 中 PCW 使用的情形需核实）；SQS 2.7.2(c) 要求取得收集和使用信息的同意。产品需要提供住户和家属告知材料，并支持退出。
10. **不要碰 AN-ACC "优化"**：不提供以资金分类为目标的写作建议，避免夸大记录的合规风险。
11. **价值主张的表述**：care minutes 工人须知把写 care plan 列为 direct care 活动，所以"节省文书时间"不等于"减少 care minutes"。对外宣传时，⚠️ 不要声称能"帮助达到 care minutes 目标"，除非经过法律确认。
12. **优先级建议**（适合度高且 TGA 风险低）：progress notes → shift handover → incident report → behaviour chart → family communication → case conference 纪要 → 转介信。然后是中等适合度的：SIRS 草稿、BSP 叙述部分、PRN 效果记录、伤口叙述。评分和数值表不在 MVP 范围内。

## 8. 待核实事项（⚠️）
- 新法下 SIRS 通报的提交渠道和 portal 字段（2022 年的示例写的是 "MyAgedCare portal"）。
- Aged Care Rules 2025 中 BSP 和限制性措施记录的具体条款编号（DSA 模板仍引用旧 QoC Principles）。
- 现行提供者的记录保存期限（Guide to Aged Care Law 只写了 former providers 要保存 7 年）。
- TGA digital scribe 指南对非 registered health practitioner（PCW/AIN）使用者的适用性。
- 各州卫生部门资料（QLD、SA、Vic）的具体许可条款。
- eNRMC 在 residential aged care 的推广状态和相关要求。
