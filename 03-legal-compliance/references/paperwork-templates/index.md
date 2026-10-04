Owner: Legal/Compliance · Status: Research draft · Last reviewed: 04/10/2026
> 运营参考，不是法律意见

# Paperwork templates & reference forms — 索引

用途：给 careKind 产品/合规团队参考的澳洲 residential aged care 官方（或权威公共来源）表单、模板、指南、工具。全部于 2026-10-04 通过 curl 下载，下载后用 `file` 和文件大小确认是真实的 PDF/DOCX。文件夹总大小约 35MB。

**使用规则（重要）**
- 这些文件**仅供内部研究**。大多数 Commonwealth 和州政府文件只允许"个人/机构内部、非商业"使用，未经许可**不要把原文或版式直接放进产品里**。我们可以参考字段结构（事实和数据结构一般不受版权保护，⚠️ 但如何处理仍需法律确认），用自己的语言和设计重写。
- "日期/版本"一栏优先采用文件内写明的版本；没写的用 PDF 元数据 CreationDate，并标注"(元数据)"。
- 版权条款来源：ACQSC https://www.agedcarequality.gov.au/copyright ；health.gov.au https://www.health.gov.au/using-our-websites/copyright ；Vic Health https://www.health.vic.gov.au/copyright （2026-10-04 查阅）。QLD Health 的版权页返回 403，未能核实。

## A. SIRS / 事件管理（Incident management）

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| A1 | Reportable incidents and SIRS – A quick guide to changes from 1 Nov 2025 | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/reportable-instances-sirs-guide.pdf | acqsc-sirs-quick-guide-changes-1-nov-2025.pdf | guide | ACQSC 默认条款（内部、非商业）⚠️ 需核实 | "correct as of 1 November 2025" | 新法下 P1/P2 定义和时限（24h + 5 天；30 天）、新术语（"older person"、"registered provider"、"aged care workers"），incident 模板应使用这些术语 |
| A2 | Serious Incident Response Scheme – Guidelines for residential aged care providers | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/SIRS-guidelines-for-residential-aged-care-providers.pdf | acqsc-sirs-guidelines-residential-providers-v1-8-2022.pdf | guide | ACQSC 默认条款 ⚠️ | Version 1.8, Oct 2022（文件里有免责声明：正在按新 Act 更新） | 8 类 reportable incident 的详细定义和示例；做 incident 分类提示词时参考。**已过时的部分以 A1 为准** |
| A3 | SIRS reportable incidents workflow (residential) | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/reportable-incidents-workflow_1.pdf | acqsc-sirs-reportable-incidents-workflow-residential.pdf | tool（流程图） | ACQSC 默认条款 ⚠️ | 2025-10-29 (元数据) | 事件发生 → 确保安全 → 记入 IMS → 判断是否 reportable → P1/P2。可以作为 incident 草稿后的"下一步提示"逻辑 |
| A4 | SIRS – Notice of additional information (Priority 1) form | ACQSC | https://www.agedcarequality.gov.au/resource-library/sirs-notice-additional-information-form-priority-1 | acqsc-sirs-notice-additional-information-priority-1-form.docx | form（approved form） | ACQSC 默认条款 ⚠️ | 修改于 2025-10-29 (元数据)；引用 Aged Care Rules 2025 s165A-25 | Section A–C 字段（provider/service、notice number、联系人、补充信息）。7.6MB，因为内嵌了图片 |
| A5 | SIRS – Notice of additional information (Priority 2) form | ACQSC | https://www.agedcarequality.gov.au/resource-library/sirs-notice-additional-information-form-priority-2 | （只给链接，未下载） | form | 同上 | s165A-30 | 结构和 A4 相同；6.7MB，为节省空间未下载 |
| A6 | SIRS – Notice of significant new information form | ACQSC | https://www.agedcarequality.gov.au/resource-library/notice-significant-new-information-form | （只给链接） | form | 同上 | s165A-40 | 结构相同；未下载 |
| A7 | SIRS – Final report on reportable incident form | ACQSC | https://www.agedcarequality.gov.au/resource-library/final-report-reportable-incident-form | （只给链接） | form | 同上 | s165A-45 | 结构相同；未下载 |
| A8 | Investigation plan template (Annexure A) | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/annexure-a-investigation-plan-template.docx | acqsc-sirs-investigation-plan-template.docx | template | ACQSC 默认条款 ⚠️ | 2022-05 (元数据) | 字段非常完整：alleged victim / subject of allegation、事件摘要（"only facts"）、时间地点、第一知情员工、证人、外部机构。是 incident report 数据模型的好参考 |
| A9 | SIRS notification example response – Neglect | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/sirs-notification-example-response-neglect.pdf | acqsc-sirs-notification-example-response-neglect.pdf | guide（填写示例） | ACQSC 默认条款 ⚠️ | Feb 2022 | 列出了 portal 的提问（事件类型、受害人、认知水平、是否住在 secure unit、详细描述、身体/心理影响等级……）。原文强调："requires more than simply transcribing the details taken from progress notes" → AI 只能帮忙整理事实，判断和分析要由人来做 |
| A10 | Impact Assessment Tool | ACQSC | https://www.agedcarequality.gov.au/resource-library/impact-assessment-tool | acqsc-sirs-impact-assessment-tool.pdf | tool | ACQSC 默认条款 ⚠️ | 2024-06-21 发布，2026-03-04 更新 | 身体/心理影响的提示清单（包括认知障碍或不能说话的人）。可以用来提示员工补充观察到的影响，但**不要让 AI 去评定影响等级** |
| A11 | Reportable incidents: Neglect (fact sheet) | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/sirs_reportable_incidents_neglect_nov_2025.pdf | acqsc-sirs-reportable-incidents-neglect-fact-sheet-nov-2025.pdf | guide | ACQSC 默认条款 ⚠️ | Nov 2025 | 新法下 neglect 的定义（包括 systemic pattern）。和 progress note 里的"漏做护理"记录有关 |
| A12 | Recording incidents in an incident management system | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/recording_incidents_in_sirs_provider_fact_sheet_19_03_2021.pdf | acqsc-recording-incidents-in-ims-fact-sheet-2021.pdf | guide | ACQSC 默认条款 ⚠️ | 2021-03-19 | IMS 应该记录的字段清单（旧法时期，⚠️ 需对照新 Rules） |
| A13 | Effective incident management system checklist | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/effective-incident-management-system-checklist.pdf | acqsc-effective-incident-management-system-checklist.pdf | tool（checklist） | ACQSC 默认条款 ⚠️ | 2022-06 (元数据) | IMS 程序要求；careKind 和客户 IMS 对接时作为需求清单 |
| A14 | SIRS decision support tool（在线） | ACQSC | https://www.agedcarequality.gov.au/sirs/decision-support-tool/ | acqsc-sirs-decision-support-tool-summary.md | tool（HTML） | ACQSC 默认条款 | 2021-10-01；页面写着正在按新法更新 | 只作链接引导，不要复制它的判定逻辑 |

## B. 限制性措施（Restrictive practices）与行为支持（Behaviour support）

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| B1 | Behaviour support plans – a fact sheet for residential aged care providers | ACQSC | https://www.agedcarequality.gov.au/sites/default/files/media/fact-sheet-behaviour-support-plans.pdf | acqsc-behaviour-support-plans-fact-sheet.pdf | guide | ACQSC 默认条款 ⚠️ | Version 1.8, Sep 2021（基于旧的 Quality of Care Principles） | BSP 必须包含的内容（行为描述、触发因素、替代策略、同意、监测、复核）。⚠️ 法律依据已经换成 Aged Care Rules 2025 |
| B2 | Behaviour Support Plan template – restrictive practices version | Dementia Support Australia (HammondCare; Australian Government funded) | https://www.dementia.com.au/resource-hub/behaviour-support-plan-restrictive-practices | dsa-behaviour-support-plan-template-restrictive-practices.pdf | template（可编辑 PDF） | 文件里没有许可声明 ⚠️ 需核实 | 2021-08 (元数据)；引用旧 QoC Principles s15HC–15HE | BSP 字段结构：个人信息、行为（"describe the behaviour, not the label"）、日期/时间/持续时间/触发因素、策略和效果、限制性措施细节、同意、监测 |
| B3 | Behaviour Support Plan template – no restrictive practices | Dementia Support Australia | https://www.dementia.com.au/resource-hub/behaviour-support-plan-no-restrictive-practices | dsa-behaviour-support-plan-template-no-restrictive-practices.pdf | template | ⚠️ 需核实 | 2021-08 (元数据) | 没有使用限制性措施时的 BSP 版本 |
| B4 | Restrictive Practices Substitute Decision Maker – registered provider fact sheet | Dept of Health, Disability and Ageing | https://www.health.gov.au/sites/default/files/2026-02/consent-for-restrictive-practices-information-for-aged-care-providers.pdf | health-consent-for-restrictive-practices-info-for-providers-2026.pdf | guide / checklist | © Commonwealth；health.gov.au 条款（内部、非商业） | 2026-02 | 新法下的同意清单（Aged Care Rules 2025 s6-20 hierarchy；Ch1 Pt7、Ch4 Pt9）：同意必须记录在 BSP 和 care and services plan 里 |
| B5 | Decision-Making Tool: Supporting a restraint free environment in residential aged care | Dept of Health and Ageing（由 ACQSC 托管） | https://www.agedcarequality.gov.au/media/87628 | acqsc-restraint-free-decision-making-tool-residential.pdf | tool | © Commonwealth 2012，只允许内部非商业使用 | 2012（较旧） | 限制性措施的替代策略和评估流程 |
| B6 | Psychotropic self-assessment tool – template | ACQSC | https://www.agedcarequality.gov.au/media/91297 | acqsc-psychotropic-medications-self-assessment-tool-template.docx | template | ACQSC 默认条款 ⚠️ | Version 2.1, 2021-09-21 | 精神类药物登记字段（包括 PRN、是否属于 chemical restraint、同意）。只作参考，careKind 不应参与用药决策 |
| B7 | Psychotropic medication PRN stickers guide | ACQSC | https://www.agedcarequality.gov.au/media/87556 | acqsc-psychotropic-prn-stickers-guide.pdf | guide | ACQSC 默认条款 ⚠️ | 2020-01 (元数据) | PRN 精神类药物每次使用要记录的内容（原因、尝试过的替代措施、效果）→ 对应"PRN effectiveness note"的字段 |

## C. 临床护理文档（跌倒、压疮/伤口、疼痛、病情恶化、行为）

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| C1 | Preventing Falls and Harm from Falls in Older People: Best Practice Guidelines for Australian RACS | ACSQHC | https://www.safetyandquality.gov.au/resources/falls-guidelines-australian-residential-aged-care-services | acsqhc-falls-guidelines-residential-aged-care-2025.pdf | guide | **CC BY-NC-ND 4.0**（文件内声明） | 2025 | 跌倒风险评估和跌倒后处理的证据基础 |
| C2 | Preventing falls in residential aged care services – fact sheet | ACSQHC | https://www.safetyandquality.gov.au/sites/default/files/2025-06/fact-sheet-preventing-falls-in-residential-aged-care-services.pdf | acsqhc-preventing-falls-racs-fact-sheet-2025.pdf | guide | © ACSQHC 2025；推测是 CC BY-NC-ND ⚠️ | 2025 | 概要版 |
| C3 | Residential Care Facility / MPHS Post-Fall Clinical Pathway | Queensland Health | https://www.health.qld.gov.au/__data/assets/pdf_file/0023/431537/fall-rcf-post.pdf | qld-health-rcf-post-fall-clinical-pathway.pdf | form（临床路径表单） | © State of Queensland (Queensland Health) 2025；具体许可 ⚠️ 需核实 | 2025 | **跌倒后记录的字段非常好**：日期/发现时间、RR/SpO2/BP/HR/GCS/体温/BGL、是否撞到头、神经观察、通知 GP 和家属、variance 记录 |
| C4 | Recognition of the deteriorating resident (RACF clinical pathway) | Queensland Health | https://www.health.qld.gov.au/__data/assets/pdf_file/0018/1152216/16.Recognition-of-the-deteriorating-resident.pdf | qld-health-racf-pathway-recognition-deteriorating-resident.pdf | tool（生命体征分区） | Queensland Health ⚠️ 需核实 | 2022-09 (元数据) | 说明红/黄区阈值属于**临床判断工具**。careKind 不应自动套用阈值做分诊（会有 SaMD 风险），只记录数值和员工的描述 |
| C5 | Chronic wound assessment & management (RACF clinical pathway) | Queensland Health | https://www.health.qld.gov.au/__data/assets/pdf_file/0030/1243785/48.Chronic-wound-assessment-and-management.pdf | qld-health-racf-pathway-chronic-wound-assessment.pdf | tool | ⚠️ 需核实 | 2023-07 (元数据) | 伤口评估要素（原因、渗液、创面组织、疼痛、营养），可以作为伤口记录字段 |
| C6 | Pain assessment and management (RACF clinical pathway) | Queensland Health | https://www.health.qld.gov.au/__data/assets/pdf_file/0028/1118782/40.Pain.pdf | qld-health-racf-pathway-pain-assessment.pdf | tool | ⚠️ 需核实 | 2023-10 (元数据) | 疼痛评估流程，包括认知障碍住户 |
| C7 | Behaviours of concern (RACF clinical pathway) | Queensland Health | https://www.health.qld.gov.au/__data/assets/pdf_file/0028/1119853/22.Behaviours-of-concern.pdf | qld-health-racf-pathway-behaviours-of-concern.pdf | tool | ⚠️ 需核实 | 2023-09 (元数据) | 行为记录和升级流程 |
| C8 | Abbey Pain Scale（fillable） | palliAGED (CareSearch, Flinders University；Australian Government funded) | https://www.palliaged.com.au/Portals/5/Documents/Fillable-Forms/Abbey-Pain-Scale_Information-sheet-PA.pdf | palliaged-abbey-pain-scale-fillable.pdf | form / tool | 量表原作者为 Abbey J. et al.；文件没有许可声明 ⚠️ 需核实 | 2022-09 (元数据) | 6 项、每项 0–3 分。**计分属于评估工具**：AI 只能把员工说出的各项观察填进去，不能根据叙述推断分数（见 taxonomy） |
| C9 | Pressure injuries – Standardised care process | Vic Dept of Health (DHHS) | https://www.health.vic.gov.au/sites/default/files/migrated/files/collections/factsheets/s/scp-pressure-injuries-pdf.pdf | vic-health-standardised-care-process-pressure-injuries.pdf | guide | © State of Victoria；网站条款不允许转载/改编 | Mar 2018 | 压疮预防/管理流程、记录要求（面向公立 RACS） |
| C10 | Falls – Standardised care process | Vic Dept of Health | https://www.health.vic.gov.au/sites/default/files/2022-12/standardise-care-falls.PDF | vic-health-standardised-care-process-falls.pdf | guide | © State of Victoria | Aug 2022 | 跌倒流程，跌倒后记录要求 |
| C11 | QUT Pressure Injury Flow Chart | QUT | https://cms.qut.edu.au/__data/assets/pdf_file/0008/451763/flow-chart-pressure-injury.pdf | （下载被 403 拦截，只给链接） | tool | ⚠️ | — | QLD 临床路径里引用的压疮分期流程图 |
| C12 | Braden / Waterlow 风险量表 | 各州卫生部门表单（例如 SA Health MR95、WACHS MR124） | https://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/clinical+resources/clinical+programs+and+practice+guidelines/infection+and+injury+management/pressure+injuries/pressure+injury+prevention+and+management | （未下载） | tool | Braden Scale 有版权（Braden & Bergstrom）⚠️；Waterlow 版权 ⚠️ | — | **careKind 不应自动计算这类风险分数**（属于 risk scoring，TGA 风险较高）。International Pressure Injury Guideline (2019) 需要付费，没有下载 |

## D. 交接班（Handover）与沟通

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| D1 | ISBAR – Clinical Handover Fact Sheet（"Customise ISBAR for your clinical context"） | SA Health | https://www.sahealth.sa.gov.au/wps/wcm/connect/8a8b26804896068a9cb8fc7675638bd8/15111.3-+Clinical+Handover+Fact+Sheet+(V1)WebS.pdf?MOD=AJPERES | sa-health-isbar-clinical-handover-fact-sheet.pdf | guide / tool | 文件同时写了 "© Dept for Health and Ageing SA. All rights reserved" 和 ausgoal CC 链接，说法矛盾 ⚠️ 需核实 | Feb 2016 (FIS 15111.3) | ISBAR 结构（Identify 至少 3 个识别信息 / Situation / Background / Assessment / Recommendation）+ "为你的场景定义最小数据集"→ 可以直接作为 handover 草稿结构。⚠️ 其中 "Assessment / Recommendation" 只能来自员工本人的话 |
| D2 | ISBAR 页面 | SA Health | https://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/clinical+resources/clinical+programs+and+practice+guidelines/safety+and+wellbeing/communicating+for+safety/isbar+-+identify+situation+background+assessment+and+recommendation | （只给链接） | guide（HTML） | — | — | 还有 lanyard card 和电话交接版本 |
| D3 | Clinical handover（Communicating for Safety） | ACSQHC | https://www.safetyandquality.gov.au/our-work/communicating-safety/clinical-handover | （只给链接） | guide（HTML） | ACSQHC | — | 介绍 structured handover 框架（iSoBAR/ISBAR/SBAR/SHARED）；适用于医院，aged care 可以参考 |
| D4 | NSW CEC – Recognise and respond to deterioration | Clinical Excellence Commission | https://cec.health.nsw.gov.au/safety-essentials/deterioration | （只给链接） | guide（HTML） | NSW | PD2025_014 | 面向 NSW 公立医院；aged care 只作参考 |
| D5 | Aged Care Transfer-to-Hospital Envelope with Template | ACSQHC（National Clinical Handover Initiative 2007–09） | https://www.safetyandquality.gov.au/publications-and-resources/resource-library/aged-care-transfer-hospital-envelope-template | （页面没能用 curl 解析，只给链接） | template | ⚠️ | 2007–09（较旧） | 转院交接的字段 |

## E. 护理计划、病例会议、姑息/临终护理

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| E1 | Case Conference Resource Pack（palliative care） | palliAGED / CareSearch (Flinders University) | https://www.caresearch.com.au/Portals/20/Documents/Case-Conference-Pack.pdf | palliaged-palliative-care-case-conference-pack.pdf | form / template | 文件没有许可声明 ⚠️ 需核实 | Oct 2022 | case conference checklist、邀请函、会议 summary 表 → care plan review / case conference 记录的字段 |
| E2 | Strengthened Quality Standards – Assessment and planning（Outcome 3.1 指南，网页） | ACQSC | https://www.agedcarequality.gov.au/strengthened-quality-standards/care-and-services/assessment-and-planning | （只给链接） | guide（HTML） | ACQSC 默认条款 | 现行 | care and services plan 的要求（3.1.4）、复核触发条件（3.1.5）、advance care planning（3.1.6） |
| E3 | Strengthened Aged Care Quality Standards – November 2025 | Dept of Health, Disability and Ageing | https://www.health.gov.au/resources/publications/strengthened-aged-care-quality-standards | （只给链接；这是法规原文，应该放在 law-library） | standard | © Commonwealth ⚠️ | Nov 2025 版，PDF 上传于 2026-08 | taxonomy 中所有 Outcome 编号都来自这份文件 |

## F. 用药（Medication）

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| F1 | Guiding Principles for Medication Management in Residential Aged Care Facilities | Dept of Health and Aged Care | https://www.health.gov.au/resources/publications/guiding-principles-for-medication-management-in-residential-aged-care-facilities | health-guiding-principles-medication-management-racf-2022.pdf | guide | **CC BY 4.0**（文件内声明） | 2022 版（PDF 2025-05 重新上传） | PRN 用药记录要求（适应症、最大剂量、效果）；用药事件报告。careKind 只做叙述性的 PRN effectiveness note，**不碰药物医嘱和用药表（eNRMC）** |

## G. 资金与质量数据（AN-ACC、QI Program、care minutes、提供者责任）

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| G1 | National Aged Care Quality Indicator Program Manual – Part A | Dept of Health, Disability and Ageing | https://www.health.gov.au/resources/publications/national-aged-care-quality-indicator-program-manual-part-a-0 | health-qi-program-manual-part-a-2025-10.pdf | guide（数据定义） | © Commonwealth 2025，自定义条款：内部、非商业、只能原样复制（另有 ICD-10-AM 和 QCE-ACC/QOL-ACC 第三方 IP） | November 2025 | 14 个 QI 的采集方法（压疮全身检查、限制性措施、体重、跌倒和重大伤害、用药、ADL、失禁、住院、员工、消费者体验、生活质量、allied health 等），每季度结束后第 21 天前通过 GPMS 提交。careKind 可以帮忙确保 progress note 里有可追溯的原始事实（例如跌倒的日期和伤情） |
| G2 | QI Program Manual 4.0 – Part B（CQI 工具） | Dept of Health and Aged Care | https://www.health.gov.au/sites/default/files/2025-04/national-aged-care-mandatory-quality-indicator-program-manual-4-0-part-b.pdf | （只给链接，约 7MB） | tool | © Commonwealth ⚠️ | Apr 2025（新法实施前） | 每个 QI 的持续改进工具 |
| G3 | AN-ACC Reference Manual including AN-ACC Assessment Tool | Dept of Health | https://www.health.gov.au/resources/publications/an-acc-reference-manual-and-an-acc-assessment-tool | health-an-acc-reference-manual-and-assessment-tool.pdf | tool / guide | **CC BY 4.0**（文件内声明） | 2021-04-01 | AN-ACC 评估由**独立评估员**完成；护理记录（如跌倒史、认知、行为、压疮、ADL）是评估时的佐证。careKind 不应做"AN-ACC 分类优化" |
| G4 | Residential aged care funding assessment pathways (fact sheet) | Dept of Health and Aged Care | https://www.health.gov.au/resources/publications/an-acc-assessment-pathways-fact-sheet | health-an-acc-assessment-pathways-fact-sheet.pdf | guide | © Commonwealth ⚠️ | 2024-12 | 三种评估路径（入住时即接受姑息护理 → Class 1，需在 14 天内上传 palliative care status form；临终；自然衰退后重新分类） |
| G5 | Care minutes in residential aged care – information for workers | Dept of Health, Disability and Ageing | https://www.health.gov.au/resources/publications/care-minutes-in-residential-aged-care-information-for-workers | health-care-minutes-information-for-workers.pdf | guide | © Commonwealth ⚠️ | 2026-06 | 原文："writing up care plans or organising a referral ... counts as direct care activities"；但为了申请 AN-ACC 重新评估所做的资金相关工作**不计入** → 和 careKind 的价值主张有关（节省文书时间 ≠ 减少 care minutes） |
| G6 | Care minutes and 24/7 RN requirements – guides for registered providers | Dept of Health, Disability and Ageing | https://www.health.gov.au/resources/publications/care-minutes-and-247-registered-nurse-requirements-guides-for-registered-providers-of-residential-care-homes | （只给链接，约 2MB） | guide | © Commonwealth | May 2026 版 | care minutes 的完整定义（Appendix 2 列出哪些活动可以计入） |
| G7 | Responsibilities of residential aged care providers + Guide to Aged Care Law（记录保存） | Dept of Health, Disability and Ageing | https://www.health.gov.au/our-work/residential-aged-care/responsibilities-of-providers | health-provider-responsibilities-and-record-keeping-summary.md | guide（HTML 摘要） | © Commonwealth | 2025-12-23 / 2025-10-28 | 提供者责任清单和记录保存义务 |

## H. AI / 数字书记员（Digital scribe）监管

| # | Title | Publisher | URL | Local file | Type | Licence / copyright | Date / version | 对 careKind 的用处 |
|---|---|---|---|---|---|---|---|---|
| H1 | Digital scribes | TGA | https://www.tga.gov.au/products/medical-devices/software-and-artificial-intelligence-ai/overview/types-software-based-medical-devices/digital-scribes | tga-digital-scribes-guidance-summary.md | guide（HTML 摘要） | © Commonwealth ⚠️ | Last updated 30 Jan 2026 | "只转录/整理"不算 medical device；"生成员工没有明确说过的诊断或治疗建议"就是 medical device |
| H2 | AI Safety Scenario – Ambient scribe | ACSQHC | https://www.safetyandquality.gov.au/sites/default/files/2025-08/ai-safety-scenario-ambient-scribe.pdf | acsqhc-ai-safety-scenario-ambient-scribe-2025.pdf | guide | © ACSQHC 2025；推测是 CC BY-NC-ND ⚠️ | Version 1.0, Aug 2025 | ambient scribe 的风险场景（遗漏、幻觉、同意、审核） |
| H3 | AI Clinical Use Guide – Guidance for clinicians | ACSQHC | https://www.safetyandquality.gov.au/sites/default/files/2025-08/ai-clinical-use-guide.pdf | acsqhc-ai-clinical-use-guide-2025.pdf | guide | © ACSQHC 2025 ⚠️ | Version 1.0, Aug 2025 | 临床人员使用 AI 前、中、后的责任，可以用来写客户培训材料 |

## 已知缺口（没有找到免费的官方模板）
- **Progress note**：没有全国统一的官方模板。要求分散在 Strengthened Quality Standards（2.7、3.1、3.3、5.4、5.5）和 ACQSC 指南中。各机构使用自己的 clinical care software 模板（具体有哪些厂商、字段结构如何，⚠️ 需另做竞品调研）。
- **Food/fluid、BGL、体重、生命体征表**：没有全国模板。体重的采集口径参考 QI 手册（G1）。
- **Advance care directive**：表单按州法律区分。可以参考 Advance Care Planning Australia（https://www.advancecareplanning.org.au ，⚠️ 未下载）。
- **感染/疫情**：ACSQHC *The Aged Care Infection Prevention and Control Guide*（Aug 2024）https://www.safetyandquality.gov.au/sites/default/files/resources/attachments/The-Aged-Care-Infection-Prevention-and-Control-Guide.pdf （文件较大，没有下载）。
- **投诉**：没有官方的投诉登记模板。依据是 Outcome 2.6 以及 Guide to Aged Care Law 里的记录义务。
- **NSW CEC / WA Health / Safer Care Victoria**：没有找到专门针对 residential aged care、可以免费下载的 ISBAR 表单；QLD Health 的 RACF 工具索引页被 Cloudflare 拦截，只能通过直接的 PDF 链接下载。
