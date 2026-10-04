Owner: Legal/Compliance · Status: Research draft · Last reviewed: 04/10/2026
> 运营参考，不是法律意见

# 州/领地差异对照（State-by-State Comparison）— 澳洲住宿养老（residential aged care）

范围：NSW、VIC、QLD、WA、SA、TAS、ACT、NT。重点是会影响 careKind（AI 文档助手，作为 vendor / contracted service provider 处理健康信息）的州/领地法律差异。联邦层面（Privacy Act 1988、Aged Care Act 2024、Aged Care Rules 2025）只在和州法相互作用时简要提及，详见 `../aged-care-regulatory.md` 和 `../privacy-program.md`。

标记约定：✅ 已生效 · ⏳ 已通过/待生效或改革中 · ⚠️ 需核实（官方页面未能直接确认，或信息可能已过时）

---

## 1. 关键差异摘要

1. **州一级的私营部门健康信息法只有 3 个辖区：VIC、NSW、ACT。** VIC 的 *Health Records Act 2001* 不论组织规模都适用（没有小企业豁免）；NSW 的 HRIPA 适用于私营 health service provider，以及年营业额超过 300 万澳元、收集/持有/使用健康信息的组织；ACT 的 *Health Records (Privacy and Access) Act 1997* 公营和私营都适用。QLD、WA、SA、TAS、NT 的私营养老机构只受联邦 *Privacy Act 1988* 约束。
2. **州公营部门隐私法只有在我们卖给州政府运营的养老院时才相关**，而且一般通过合同"传导"到我们身上：VIC PDP Act s17 + VPDSS；QLD IP Act ch 2 pt 3（s35 binding）；WA PRIS Act（2026-07-01 起适用于 contracted service providers）；SA PC012 IPPs Instruction；TAS PIP Act；NT Information Act；ACT Information Privacy Act 2014。VIC 有全国最大的公营住宿养老板块，所以 VIC 公营养老的合同条款（PDP Act s17 + VPDSS）是最可能先遇到的。
3. **州级强制数据泄露通报（MNDB）差别很大**：NSW（2023-11-28 起）✅；QLD（2025-07-01 起，地方政府 2026-07-01 起）✅；WA（PRIS 下的 notifiable information breach scheme 预计 2027-01-01 起）⏳；VIC 没有针对个人的 MNDB，只有 OVIC 的 information security incident notification scheme ✅；SA、TAS、NT、ACT 没有一般性的法定 MNDB（ACT 只针对 TFN 信息 + 政策性自愿通报）。私营客户适用联邦 NDB scheme。
4. **约束性措施（restrictive practices）同意规则正在变化，这是最紧迫的辖区差异。** 联邦 RPSDM 层级（hierarchy）是过渡措施，适用期延长到 **2026-12-01**；VIC 已有专门法（*Aged Care Restrictive Practices Substitute Decision-maker Act 2024* (Vic)，2025-07-01 起生效）；QLD 由 QCAT/Public Guardian 处理（Practice Direction No. 2 of 2026）；NSW 的 *Guardianship Regulation 2026* 增加了 enduring guardian 的 restrictive practice 职能，另有报道称 2026 年 12 月起有新框架 ⚠️；SA 的 Advance Care Directives Act 新 Part 5A 于 2026-07-09 起生效，且 physical restraint 须经 SACAT 授权 ⚠️。
5. **护士配比法只管公营**：VIC 的 *Safe Patient Care Act 2015* 适用于公营住宿养老；QLD 公营 RACF 依 *Hospital and Health Boards Regulation 2023* 执行最低 DRCH 3.65 小时和技能组合比例。私营养老统一适用联邦 care minutes（215/44）和 24/7 RN 要求。
6. **工资税（payroll tax）起征点差距大**：ACT 175 万澳元（2026-07-01 起下调）、NT 250 万、SA 150 万、QLD 130 万、TAS 125 万、NSW 120 万、VIC 100 万、WA 100 万。
7. **疫苗/入场要求**：COVID 公共卫生令基本都已撤销；联邦层面是"providers 必须给员工提供免费流感疫苗并记录"的项目；州公营机构对员工另有强制规定（如 VIC Secretary Directions、NSW Health Category A）。访客/承包商的要求按设施政策执行，差别大，需逐家确认 ⚠️。
8. **没有任何州对老年人虐待（elder abuse）设一般性的强制报告义务**；住宿养老统一走联邦 SIRS。NSW ADC、SA ASU 等州机构的职能都明确不调查付费养老服务提供者。

---

## 2. 主对照表

### 表 A：隐私 / 健康信息 / 数据泄露

| 主题 | NSW | VIC | QLD | WA | SA | TAS | ACT | NT |
|---|---|---|---|---|---|---|---|---|
| 私营部门健康信息州法 | HRIPA 2002 ✅（私营 HSP + 营业额 >$3m 的组织） | Health Records Act 2001 ✅（公私皆适用，无小企业豁免） | 无（私营受 Privacy Act 1988 约束） | 无 | 无 | 无 | Health Records (Privacy and Access) Act 1997 ✅（公私） | 无 |
| 健康记录最低保存期（私营 HSP） | 成人：最后一次服务后 7 年；未成年：到 25 岁（s25） | 成人：7 年；未成年：到 25 岁，取较晚者（HPP 4） | 联邦无法定期限 ⚠️；公营依 QSA 保存表 | 同左 ⚠️ | 同左 ⚠️ | 同左 ⚠️ | 7 年 / 25 岁 ⚠️（条文措辞未能直接核实） | 同左 ⚠️ |
| 州公营隐私法 | PPIP Act 1998（+ HRIPA） | PDP Act 2014（IPPs）+ VPDSS；健康信息适用 HRA | IP Act 2009（QPPs 2025-07-01 起）✅ | PRIS Act 2024（IPPs 2026-07-01 起）✅ | IPPs Instruction（PC012，行政指令，非法律） | PIP Act 2004 | Information Privacy Act 2014（TPPs） | Information Act 2002（IPPs） |
| Contracted service provider 机制 | 合同约束 ⚠️ | s17 合同绑定 IPPs；VPDSS 责任不能经合同转移 | s35 须"采取合理步骤"绑定 CSP | IPP entity 包括部分 CSP | 合同必须要求 CSP 遵守 IPPs 并允许审计 | 与 custodian 签有合同的私营组织受约束 | 适用于部分 ACT 政府 CSP（含分包） | 适用于 contract service provider ⚠️ |
| 州级强制泄露通报 | MNDB ✅ 2023-11-28 | 无针对个人的 MNDB；OVIC 安全事件通报 ✅ | MNDB ✅ 2025-07-01（地方政府 2026-07-01） | ⏳ 2027-01-01 | 无（须报告 Privacy Committee 的行政要求） | 无 | 无（仅 TFN；政策性自愿通报 OAIC） | 无 ⚠️ |
| 监管机构 | IPC NSW | OVIC；健康信息归 Health Complaints Commissioner | OIC QLD | WA Information Commissioner（2025-07-01 设立） | Privacy Committee of SA | Ombudsman Tasmania | OAIC（代行 ACT 职能）/ ACT HRC（健康记录） | NT Information Commissioner |

### 表 B：照护 / 同意 / 人员

| 主题 | NSW | VIC | QLD | WA | SA | TAS | ACT | NT |
|---|---|---|---|---|---|---|---|---|
| 监护法庭 | NCAT | VCAT | QCAT | SAT | SACAT | TASCAT | ACAT | NTCAT |
| 约束性措施 SDM 机制（州法） | Guardianship Act 1987 + Guardianship Regulation 2026（enduring guardian 新增 RP 职能）；据报 2026-12 起有新框架 ⚠️ | 专门法：Aged Care RP SDM Act 2024 (Vic) ✅ 2025-07-01，四层级 | QCAT 委任 guardian 或 Public Guardian；PD 2 of 2026 ✅ | Guardian / enduring guardian 须有相应授权（OPA 2026-07 立场）⚠️ | ACD Act 2013 SDM；physical restraint 须 SACAT 授权 ⚠️；Part 5A 2026-07-09 起 | ⚠️ 未核实 | ⚠️ 未核实 | ⚠️ 未核实 |
| 联邦 RPSDM hierarchy 是否可用 | 仅在州法无明确机制或法庭委任严重延迟时使用；适用期到 2026-12-01（全国统一）⏳ | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 |
| 一般性 elder abuse 强制报告 | 无（ADC 受理社区报告） | 无 | 无 | 无 | 无（ASU 受理报告） | 无 | 无 | 无 ⚠️ |
| 护士配比法（公营养老） | 无（私营/公营均按联邦 care minutes）⚠️ | Safe Patient Care Act 2015 ✅ | HHB Regulation 2023：DRCH 3.65h，RN ≥30%、护士 ≥50% ✅ | 无 ⚠️ | 无 ⚠️ | 无 ⚠️ | 无 ⚠️ | 无 ⚠️ |
| 工人筛查（养老） | 联邦统一：police certificate（≤3 年）或 NDIS worker screening clearance（各州签发） | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 |
| 公营机构员工流感疫苗强制 | NSW Health Category A（6/1–9/30） | Secretary Directions（公营养老，每年 8/15 前） | 曾有 HED / CHO directions（大部分已撤销）⚠️ | ⚠️ | ⚠️ | ⚠️ | ⚠️ | ⚠️ |

### 表 C：工资税与工伤保险

| 辖区 | 年度起征点 | 税率（概要） | 工伤保险 |
|---|---|---|---|
| NSW | $1,200,000（2024-25 至 2026-27 不变） | 5.45% | icare NSW |
| VIC | $1,000,000（2025-07-01 起） | 4.85%（regional 1.2125%）；$3m–$5m 之间扣除额递减 | WorkSafe Victoria |
| QLD | $1,300,000 | 4.75%（≤$6.5m）/ 4.95%（>$6.5m）；>$10m 另征 mental health levy | WorkCover Queensland（监管：WorkSafe QLD） |
| WA | $1,000,000（在 $1m–$7.5m 之间递减） | 5.5% | WorkCover WA |
| SA | $1,500,000 | $1.5m–$1.7m 浮动，>$1.7m 4.95% | ReturnToWorkSA |
| TAS | $1,250,000 | 4%（$1.25m–$2m）/ 6.1%（>$2m） | WorkSafe Tasmania（私营保险公司承保） |
| ACT | **$1,750,000（2026-07-01 起）** | 6.75%（<$20m）起 | WorkSafe ACT（私营保险公司承保） |
| NT | $2,500,000（2025-07-01 起） | 5.5% | NT WorkSafe（私营保险公司承保） |

---

## 3. 分主题详述

### 3.1 健康信息法（Health records laws）

**Victoria — Health Records Act 2001 (HRA)** ✅
- 适用于公营和私营组织，包括 health service provider 以及收集健康、残障、养老信息的各类组织；**"no 'small business' exemption"**。来源：https://www.health.vic.gov.au/legislation/health-records-act
- 投诉和健康信息隐私泄露由 Health Complaints Commissioner (HCC) 处理（HCC 有面向 providers 的隐私泄露报告页面，但不属于法定 MNDB）。来源：https://hcc.vic.gov.au/providers/health-records-providers ；https://hcc.vic.gov.au/providers/privacy-breaches
- **对 vendor 的含义**：HRA 适用于"持有"健康信息的组织，careKind 处理 VIC 居民的健康信息时，很可能直接受 HRA 约束（不论规模），同时受 Privacy Act 1988（如适用）约束。⚠️ 需律师确认 careKind 作为纯处理方（processor）的适用方式，以及 HRA 中 contracted service provider 条款的具体编号。
- 最近的变化是 *Health Records Regulations 2023*（2023-08-18 起生效），没有看到实质性改革在推进。来源同上。

**NSW — Health Records and Information Privacy Act 2002 (HRIPA)** ✅
- 适用于身为 health service provider，或收集、持有、使用健康信息的 "organisations"（公营机构或 private sector person）。私营组织中，营业额超过 300 万澳元的受约束；health service provider 不论规模都受约束。15 条 Health Privacy Principles (HPPs)。来源：https://www.ipc.nsw.gov.au/privacy/nsw-privacy-laws/hrip ；https://www.ipc.nsw.gov.au/resources/fact-sheet-health-privacy-principles-hpps
- **对 vendor 的含义**：careKind 营业额 ≤300 万澳元、且本身不是 health service provider 时，可能不直接受 HRIPA 约束；但客户（养老院是 HSP）会通过合同要求我们遵守 HPPs。⚠️ "private sector person"的小企业界定需核对 HRIPA s4 原文。
- 法律文本：https://legislation.nsw.gov.au/view/whole/html/inforce/current/act-2002-071

**ACT — Health Records (Privacy and Access) Act 1997** ✅
- 适用于 ACT 的公营和私营 health service providers / record keepers；健康记录相关投诉由 ACT Human Rights Commission（Health Services Commissioner）处理。来源：https://www.hrc.act.gov.au/health ；法律：https://www.legislation.act.gov.au/a/1997-125
- ⚠️ 未能直接核实条文对 vendor（非 HSP 的 record keeper）的适用范围。

**QLD — Information Privacy Act 2009**（只管公营）✅
- *Information Privacy and Other Legislation Amendment Act 2023* (IPOLA)：QPPs 取代 IPPs/NPPs，适用于所有 agencies；MNDB 于 **2025-07-01** 起生效，地方政府延后到 2026-07-01。来源：https://www.oic.qld.gov.au/government/ipola ；https://statements.qld.gov.au/statements/99263
- 私营养老机构不受 IP Act 约束，适用联邦 Privacy Act。

**WA — Privacy and Responsible Information Sharing Act 2024 (PRIS Act)**（只管公营 + CSP）✅/⏳
- Part 1 于 2024-12-06 生效；大部分隐私条款（11 条 IPPs，含 IPP 9 境外披露、IPP 10 自动化决策）于 **2026-07-01** 起生效；notifiable information breach scheme 预计 **2027-01-01** 起。适用于 WA 公营部门以及"some contracted service providers to government"。来源：https://www.wa.gov.au/organisation/office-of-the-information-commissioner/privacy-western-australia ；https://www.wa.gov.au/organisation/office-of-the-information-commissioner/personal-information-collected-and-after-1-july-2026
- 注意 **IPP 10（自动化决策）**：如向 WA 公营养老销售，AI 起草功能的透明度要求可能被触发 ⚠️。

**SA / TAS / NT**：没有私营部门健康信息州法，私营养老受 Privacy Act 1988 约束。公营部门见 3.3。

**与联邦 Privacy Act 1988 的关系**
- 所有提供 health service 且持有健康信息的组织，不论是否小企业都受 Privacy Act 约束（包括提供养老服务过程中的活动）。来源：https://www.oaic.gov.au/privacy/privacy-guidance-for-organisations-and-government-agencies/organisations/small-business ；https://www.oaic.gov.au/privacy/your-privacy-rights/health-information/what-is-a-health-service-provider
- careKind 本身是否算 "health service provider" 存在不确定性（我们不提供诊疗，只做文档）。如不算、且营业额 ≤300 万澳元，可能落入小企业豁免 ⚠️。建议依 s6EA 主动 opt-in，或至少以合同方式承诺遵守 APPs（详见第 4 节）。
- 联邦改革：*Privacy Amendment (Personal Data Protection) Bill 2026* 暴露稿（含 72 小时内向 Commissioner 通报 eligible data breach 等）⏳。来源：https://consultations.ag.gov.au/rights-and-protections/privacy-reform/user_uploads/exposure-draft-bill-2026.pdf （⚠️ 是否已提交议会需核实；小企业豁免是否取消需核实）
- 州法与联邦法并行适用：在 VIC/NSW/ACT，私营养老院可能同时受 Privacy Act 和州健康记录法约束（双重合规）。

### 3.2 保存期限（Retention）

| 来源 | 规则 | 链接 |
|---|---|---|
| VIC HRA（HPP 4） | 不得删除，除非：未成年时收集的信息，已满 25 岁；**或**最后一次服务后已超过 7 年，取较晚者 | https://hcc.vic.gov.au/providers/health-records-providers |
| NSW HRIPA s25 | 私营 HSP：成人信息自最后一次服务起保存 7 年；未成年时收集的，保存到 25 岁 | https://www.ipc.nsw.gov.au/resources/fact-sheet-guide-retention-and-storage-health-information-nsw-private-health-service-providers |
| ACT HR(P&A) Act | 7 年 / 25 岁（同类规则）⚠️ 搜索摘要的措辞与"最低保存期"相反，需核对原文 | https://www.legislation.act.gov.au/a/1997-125 |
| VIC 公营 | PROV 的 PROS 11/06 Patient Information RDA | https://prov.vic.gov.au/recordkeeping-government/document-library/pros-1106-patient-information |
| NSW / QLD / WA / SA / TAS / NT 公营 | 各州档案机构的 health/patient records disposal schedule（如 NSW State Records GDA17、QLD Health Sector (Clinical Records) Retention and Disposal Schedule）⚠️ 具体期限未核实 | — |
| WA PRIS 与档案 | State Records Office 发布了 PRIS 与 record keeping 的指引 | https://www.wa.gov.au/organisation/state-records-office-of-western-australia/privacy-and-responsible-information-sharing-act-2024-and-record-keeping-obligations |
| 联邦（简述） | Aged Care Act/Rules：事件记录保存 7 年；前 registered provider 在注销后仍须保存相关记录 7 年；工人筛查记录 7 年 | https://www.health.gov.au/resources/publications/guide-to-aged-care-law/chapter-7-information-management/keeping-records?language=en ；https://www.agedcarequality.gov.au/for-providers/serious-incident-response-scheme/incident-management-systems/recording-incidents |

### 3.3 州公营部门隐私（卖给州政府运营的养老院时）

- **VIC — PDP Act 2014 + VPDSS**：s17 允许外包合同把 contracted service provider 按与 outsourcing organisation "同样方式、同样程度"绑定到 IPPs，责任随之转移；但 **VPDSS 信息安全义务不能通过合同转移**，Part 4 机构负责人须确保第三方不违反 protective data security standard（OVIC 指引引用 s88）。数据出境适用 IPP 9。OVIC 有 Information Security Incident Notification Scheme（不是针对个人的 MNDB）。健康信息仍适用 HRA。来源：https://ovic.vic.gov.au/privacy/resources-for-organisations/outsourcing-in-the-victorian-public-sector/ ；https://ovic.vic.gov.au/wp-content/uploads/2025/03/Outsourcing-in-the-Victorian-public-sector-Updated-resource.pdf ；https://ovic.vic.gov.au/book/ipp-9-transborder-data-flows/
- **NSW — PPIP Act 1998**：Part 6A 的 MNDB 自 **2023-11-28** 起适用于所有受 PPIP Act 约束的公营机构；疑似泄露须在 30 天内完成评估，须"立即"通报 Privacy Commissioner，并"尽快"通知受影响个人。来源：https://www.ipc.nsw.gov.au/resources/guide-mandatory-notification-data-breach-scheme-guide-managing-data-breaches-accordance-ppip-act ；https://www.ipc.nsw.gov.au/resources/fact-sheet-mandatory-notification-data-breach-scheme
- **QLD — IP Act 2009**：ch 2 pt 3 要求 agency 采取合理步骤把 CSP 绑定到 QPPs、s33 境外披露规则以及 QPP code；未绑定的，由 agency 对 CSP 的违规负责。MNDB 2025-07-01 起。⚠️ 被绑定的 CSP 是否直接承担 MNDB 义务，OIC 页面返回 403，未能核实。来源：https://www.oic.qld.gov.au/guidelines/for-government/guidelines-privacy-principles/application-of-the-ip-act/who-does-the-ip-act-apply-to ；https://www.oic.qld.gov.au/government/privacy/contractors-privacy
- **WA — PRIS Act 2024**：见 3.1；CSP 属于 IPP entity 的一部分；OIC 有专门的 CSP 指引。来源：https://www.wa.gov.au/organisation/office-of-the-information-commissioner/privacy-western-australia
- **SA — IPPs Instruction（PC012 / Cabinet Administrative Instruction 1/89）**：涉及披露个人信息的服务合同，必须要求 CSP 像 agency 一部分那样遵守 IPPs，并包含审计/核查条款；发生泄露须通知 Privacy Committee。来源：https://www.dpc.sa.gov.au/resources-and-publications/premier-and-cabinet-circulars/DPC-Circular-Information-Privacy-Principles-IPPS-Instruction.pdf ；网络安全供应商要求另见 SACSF：https://www.security.sa.gov.au/cyber-security/tiles-for-cs/sacsf/sacsf-guideline-3.0-engaging-suppliers
- **TAS — Personal Information Protection Act 2004**：personal information custodians 包括在某些情况下为州提供服务的组织；与 custodian 签有收集/使用/存储个人信息合同的私营组织受约束；**没有** data breach 报告要求（TLRI 2024 年建议引入）。来源：https://www.ombudsman.tas.gov.au/personal-information-protection ；https://www.utas.edu.au/__data/assets/pdf_file/0014/1710320/TLRI_Privacy-Final-Report-No-33.pdf 。注意：2026-09 通过的 "Mandatory Notifications Bill" 是 *Integrity Commission Amendment*（公职人员不当行为通报），**与数据泄露无关**。来源：https://www.premier.tas.gov.au/latest-news/2026/september/mandatory-notifications-bill-passes-parliament
- **NT — Information Act 2002**：10 条 IPPs；Information Commissioner 可做隐私审计、发 compliance notice；有 contract service provider 概念。⚠️ 未见法定 MNDB。来源：https://infocomm.nt.gov.au/privacy ；https://infocomm.nt.gov.au/about-us/the-information-act
- **ACT — Information Privacy Act 2014**：13 条 TPPs；适用于部分 ACT 政府 contracted service providers（含分包商）；只有 TFN 信息泄露需强制通报，其余是政策性自愿通报 OAIC。来源：https://www.hrc.act.gov.au/complaints/complaints-about-breaches-of-privacy/the-act-information-privacy-act ；https://www.treasury.act.gov.au/capital-framework/privacy

### 3.4 约束性措施 / 监护 / 替代决策

**联邦框架**：Aged Care Rules 2025 规定，RPSDM 首先是依老人接受服务所在州/领地的法律被委任、可以对约束性措施给出知情同意的个人或机构。只有在以下情况才可以使用联邦 hierarchy：老人无能力、州法下没有已委任的 RPSDM、并且州法没有明确的委任机制（或已申请委任但严重延迟）。层级依次为：(1) restrictive practices nominee；(2) 伴侣；(3) 入住前作为无偿照护者的亲友；(4) 不是照护者的亲友；(5) 依州法委任的 medical treatment authority。**该 hierarchy 是过渡措施，适用期已延长到 2026-12-01。** 来源：https://www.health.gov.au/topics/aged-care/providing-aged-care-services/training-and-guidance/restrictive-practices-in-aged-care-a-last-resort ；https://www.health.gov.au/sites/default/files/2026-02/consent-for-restrictive-practices-information-for-aged-care-providers.pdf ；https://www.health.gov.au/sites/default/files/2026-02/restrictive-practices-substitute-decision-maker-decision-tree_0.pdf （⚠️ health.gov.au 页面抓取超时，以上内容来自官方搜索摘要；2026-12-01 之后是否再延期需核实）

**各州情况**
- **VIC**：*Aged Care Restrictive Practices Substitute Decision-maker Act 2024* (Vic) 于 2025-07-01 生效。四层级：Tier 1 nominee → Tier 2 temporary SDM（按配偶/伴侣、主要照护者、成年子女、父母、兄弟姐妹的顺序自动产生）→ Tier 3 VCAT 委任 → Tier 4 VCAT 作为最后手段。Provider 须在 behaviour support plan 或管理系统中记录 temporary SDM。另有 *Medical Treatment Planning and Decisions Act 2016*（医疗决定/预立指示）和 *Guardianship and Administration Act 2019*。来源：https://www.health.vic.gov.au/restrictive-practices-substitute-decision-maker-in-aged-care ；https://www.health.vic.gov.au/residential-aged-care/substitute-decision-making-restrictive-practices ；https://www.vcat.vic.gov.au/case-types/aged-care/apply
- **QLD**：用于影响伤害行为的约束性措施不属于 health care matter，一般的 health care 委任不足以授权；须由 QCAT 委任 guardian（可申请 Public Guardian）。QCAT 发布了 Practice Direction No. 2 of 2026 和关于 Aged Care Act 2024 的 FAQ。来源：https://www.qcat.qld.gov.au/case-types/decision-making-for-adults-with-impaired-capacity/restrictive-practices ；https://www.qcat.qld.gov.au/__data/assets/pdf_file/0007/886282/FAQs-RP-Aged-Care-Act-2024-Cth.pdf ；https://www.publicguardian.qld.gov.au/understanding-guardianship/request-a-decision/restrictive-practices-aged-care-resident
- **NSW**：NCAT 可以给 guardian 授予 restrictive practices 职能；*Guardianship Regulation 2026* 的 enduring guardian 表格新增了"同意/拒绝使用 restrictive practice"职能。另据二手资料，2026 年 12 月起有新的 restrictive practices 法律框架 ⚠️（未找到官方来源）。来源：https://legislation.nsw.gov.au/view/whole/html/inforce/current/sl-2026-0437 ；https://ncat.nsw.gov.au/documents/factsheets/gd_factsheet_restrictive_practices_and_guardianship.pdf
- **SA**：*Advance Care Directives Act 2013* 下的 SDM；*Statutes Amendment (Health and Wellbeing) Act 2025* 新增 Part 5A（医院出院转入住宿养老的安置/拘留路径；据二手资料 2026-07-09 起生效 ⚠️）。OPA SA 资料称：对非 NDIS 参与者的养老院居民，SDM 不能授权 physical restrictive practices，须由 SACAT 授权 ⚠️。来源：https://opa.sa.gov.au/guardianship/restrictive-practices ；https://www.legislation.sa.gov.au/_legislation-documents/lz/v/a/2025/statutes-amendment-health-and-wellbeing-act-2025_69/2025.69.un.pdf
- **WA**：OPA 2026-07 立场声明：须由拥有 plenary 或明确有限授权的 guardian / enduring guardian 同意；普通治疗同意层级本身不授予 RP 权限 ⚠️。来源：https://www.wa.gov.au/system/files/2026-07/opa-position-statement-2.pdf
- **TAS / ACT / NT**：⚠️ 未核实是否已立法引入明确的 RPSDM 机制。相关法律：TAS *Guardianship and Administration Act 1995*（TASCAT）；ACT *Guardianship and Management of Property Act 1991*、*Medical Treatment (Health Directions) Act 2006*（ACAT）；NT *Guardianship of Adults Act 2016*、*Advance Personal Planning Act 2013*（NTCAT）。

### 3.5 老年人虐待强制报告

- 没有找到任何州/领地对 elder abuse 设一般性强制报告义务 ⚠️（建议律师最终确认）。住宿养老统一适用联邦 **SIRS**：8 类 reportable incidents（含 inappropriate use of restrictive practices、neglect、unexplained absence）；Priority 1 须 24 小时内报告，5 天内补充；Priority 2 须 30 天内报告；2025-11-01 起随新 Act 调整。来源：https://www.agedcarequality.gov.au/providers/serious-incident-response-scheme/reportable-incidents/about-reportable-incidents ；https://www.agedcarequality.gov.au/sites/default/files/media/reportable-instances-sirs-guide.pdf
- **NSW Ageing and Disability Commission**（2019-07-01 成立，依 *Ageing and Disability Commissioner Act 2019*）：受理家庭/社区中熟人造成的虐待、忽视、剥削，**不调查付费服务提供者**，与 ACQSC 合作。来源：https://ageingdisabilitycommission.nsw.gov.au/about-us/what-we-do.html
- **SA Adult Safeguarding Unit**（*Ageing and Adult Safeguarding Act 1995*）：受理"relevant adults"疑似受虐报告；对养老服务提供者的投诉应转 ACQSC。来源：https://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/about+us/department+for+health+and+wellbeing/office+for+ageing+well/adult+safeguarding+unit/adult+safeguarding+unit ；https://dhs.sa.gov.au/how-we-help/ageing-well/support-for-adult-safety-and-wellbeing/get-help-if-you-are-concerned-about-abuse-or-mistreatment

### 3.6 护士配比

- **VIC**：*Safe Patient Care (Nurse to Patient and Midwife to Patient Ratios) Act 2015* 适用于指定的公营卫生服务，包括公营住宿养老（含 aged high care residential wards）；VIC 是第一个在公营住宿养老实行护士-住民配比的州。来源：https://www.health.vic.gov.au/nursing-and-midwifery/nursing-and-midwifery-legislation-and-regulation ；https://content.legislation.vic.gov.au/sites/default/files/2025-04/15-51aa011-authorised.pdf
- **QLD**：公营 RACF 自 2019-12 起执行最低 daily resident care hours (DRCH)；*Hospital and Health Boards Regulation 2023*：平均 DRCH 3.65 小时，RN ≥30%，护士 ≥50%；适用设施列于 Schedule 6。来源：https://www.legislation.qld.gov.au/view/whole/pdf/inforce/current/sl-2023-0100 ；https://www.performance.health.qld.gov.au/statewide-performance/prevention-early-intervention-and-primary-health-care/aged-care
- **其他州**：未发现针对住宿养老的州配比法 ⚠️。
- **联邦（简述）**：care minutes 全行业平均每位住民每天 215 分钟，其中 RN 44 分钟（2024-10-01 起）；每家养老院 24/7 至少一名 RN 在岗。来源：https://www.health.gov.au/our-work/care-minutes-registered-nurses-aged-care/care-minutes?language=en ；https://www.health.gov.au/our-work/care-minutes-registered-nurses-aged-care/24-7-rns
- **对产品的意义**：careKind 主打"节省文档时间"，与 care minutes（文档、护理计划等非面对面时间也计入）和 VIC/QLD 公营配比直接相关。卖点应表述为"释放直接照护时间"，不能暗示可以用来减少人手。

### 3.7 工人筛查

- 2025-11-01 起（新 Act）：仍然二选一 —— 不超过 3 年、未记录特定罪行的 **police certificate**，或 **NDIS Worker Screening Clearance**。在 16 岁后曾是其他国家公民/永久居民的，需另附 statutory declaration。Provider 须保存筛查记录 7 年。Police certificate 全国通用。来源：https://www.health.gov.au/topics/aged-care-workforce/screening-requirements?language=en ；https://www.health.gov.au/sites/default/files/2026-03/aged-care-worker-screening-guidance-material_0.pdf
- **改革状态**：联邦曾就 Aged Care Worker Regulation Scheme 咨询（含统一的养老工人筛查）。⚠️ 是否已立法、何时上线需核实。来源：https://consultations.health.gov.au/medicare-benefits-and-digital-health-division/aged-care-worker-regulation-scheme-consultation/results/agedcareworkerregulationscheme-finalreport.pdf
- NDIS worker check 由各州机构签发（如 NSW Office of the Children's Guardian、VIC Worker Screening Unit），通常需要 NDIS 注册雇主发起，careKind 一般不符合条件 ⚠️。因此 **national police certificate 是 careKind 员工的现实选择**。
- Working with Children Check：住宿养老一般不需要，除非涉及儿童（如多用途/MPS 设施或访客儿童项目）⚠️。

### 3.8 工资税与工伤保险（只列起征点和链接）

| 辖区 | 来源 |
|---|---|
| NSW $1.2m，5.45% | https://www.revenue.nsw.gov.au/taxes-duties-levies-royalties/payroll-tax/lodge-and-pay-returns/thresholds-and-rates |
| VIC $1.0m，4.85% | https://sro.vic.gov.au/about-us/rates-and-statistics/current-rates/payroll-tax-current-rates （⚠️ 页面未单列 2026-27，标注为"from 1 July 2025 onward"） |
| QLD $1.3m，4.75%/4.95% | https://qro.qld.gov.au/payroll-tax/calculate/rates-thresholds/ |
| WA $1.0m（至 $7.5m 递减），5.5% | https://www.wa.gov.au/government/multi-step-guides/payroll-tax-employer-guide/calculation-payroll-tax-employer-guide （页面更新于 2026-06-02） |
| SA $1.5m，4.95% | https://www.revenuesa.sa.gov.au/forms-and-publications/documents/guides-to-legislation/guide-to-legislation-payroll-tax/2025-26-guide-to-legislation-payroll-tax （⚠️ 2026-27 未单独核实） |
| TAS $1.25m，4%/6.1% | https://www.sro.tas.gov.au/payroll-tax/rates-thresholds |
| ACT $1.75m（2026-07-01 起），6.75% 起 | https://www.revenue.act.gov.au/about-the-act-revenue-office/news/act-budget-2026-27-updates ；https://www.revenue.act.gov.au/business-taxes-and-levies/payroll-tax/calculating-payroll-tax |
| NT $2.5m，5.5% | https://treasury.nt.gov.au/dtf/territory-revenue-office/payroll-tax/payroll-tax-rates-and-thresholds |

注意：起征点按"全澳工资总额"计算后在各州按比例分摊，并有 grouping 规则；在多个州雇人时，每个州都要单独评估。

工伤保险：icare NSW https://www.icare.nsw.gov.au/ · WorkSafe Victoria https://www.worksafe.vic.gov.au/ · WorkCover Queensland https://www.worksafe.qld.gov.au/ （WorkCover QLD 承保：https://www.workcoverqld.com.au/）· WorkCover WA https://www.workcover.wa.gov.au/ · ReturnToWorkSA https://www.rtwsa.com/ · WorkSafe Tasmania https://worksafe.tas.gov.au/ · WorkSafe ACT https://www.worksafe.act.gov.au/ · NT WorkSafe https://worksafe.nt.gov.au/ （⚠️ 这些链接凭机构官方域名列出，本轮未逐一打开核实）

### 3.9 疫苗 / 入场要求（截至 2026-10）

- **联邦**：ACQSC 的 mandatory flu vaccination program —— providers 须为员工和志愿者提供免费年度流感疫苗并保存记录；*Australian Immunisation Handbook* 建议所有住民、员工、志愿者、访客每年接种流感疫苗。访客指引：身体状况良好、无呼吸道症状，强烈鼓励入场前做 RAT、鼓励戴口罩，感染后至少 7 天且无症状才可探访。来源：https://www.agedcarequality.gov.au/resource-library/mandatory-flu-vaccination-program ；https://immunisationhandbook.health.gov.au/recommendations/healthcare-workers-carers-and-household-contacts-of-people-in-high-risk-groups-are-recommended-to-receive-influenza-vaccine-every-year ；https://www.health.gov.au/topics/aged-care/managing-infectious-respiratory-disease/managing-COVID-19-in-aged-care
- **NSW**：对 RACH 员工（包括来访的 agency 人员、志愿者）"强烈建议"接种流感疫苗；NSW Health 自身 Category A 岗位在流感季（6/1–9/30）为强制。访客：强烈建议接种。COVID 公共卫生令已结束 ⚠️（具体撤销日期未核实）。来源：https://www.health.nsw.gov.au/Infectious/Influenza/Pages/care-facilities.aspx ；https://www1.health.nsw.gov.au/pds/ActivePDSDocuments/PD2026_004.pdf ；https://www.health.nsw.gov.au/Infectious/covid-19/Pages/racf-latest-advice.aspx
- **VIC**：Secretary Directions（2022-04-08 起）要求指定 healthcare workers 每年 8/15 前接种流感疫苗，适用于公营医院/卫生服务运营的住宿养老，对象是有直接面对面接触的人员。访客 RAT 相关指引可能已过时 ⚠️。来源：https://www.health.vic.gov.au/immunisation/vaccination-for-healthcare-workers ；https://www.health.vic.gov.au/publications/management-of-acute-respiratory-infection-outbreaks-including-covid-19-and-influenza
- **QLD**：COVID 疫苗相关 CHO directions 大多已撤销；Queensland Health 员工另受 Health Employment Directives 约束 ⚠️。来源：https://www.health.qld.gov.au/system-governance/legislation/cho-public-health-directions-under-expanded-public-health-act-powers/revoked/covid-19-vaccination-requirements-for-workers-in-residential-aged-care-and-disability-accommodation-services-direction
- **WA / SA / TAS / ACT / NT**：⚠️ 未逐一核实；预期以设施政策和州卫生部门员工政策为准。

---

## 4. 对 careKind 的影响

### 4.1 作为 vendor 适用哪些隐私制度

| 客户类型 / 所在州 | careKind 直接适用 | 通过合同传导 |
|---|---|---|
| 私营/NFP 养老院（全国） | Privacy Act 1988（如不是 HSP 且营业额 ≤$3m，可能豁免 ⚠️ → 建议 s6EA opt-in） | APPs、NDB 配合义务、客户的 Aged Care Act 信息管理义务 |
| + VIC | **HRA 2001（无小企业豁免，大概率直接适用）** | HPPs |
| + NSW | HRIPA（营业额 >$3m 或被认定为 HSP 时直接适用）⚠️ | HPPs、s25 保存期 |
| + ACT | HR(P&A) Act ⚠️ | — |
| VIC 公营养老（PSRACS） | HRA | **PDP Act s17 绑定 IPPs + VPDSS 安全控制 + OVIC 事件通报配合** |
| NSW 公营（LHD 运营的 MPS 等） | HRIPA | PPIP Act、MNDB 配合（30 天评估） |
| QLD 公营 RACF | — | IP Act s35 绑定 QPPs + s33 境外披露 + MNDB 配合 |
| WA 公营 | PRIS（作为 CSP）✅ 2026-07-01 起 | IPP 9 境外、IPP 10 自动化决策；2027-01-01 起 breach scheme |
| SA / TAS / NT / ACT 公营 | TAS PIP Act（合同 custodian）、ACT TPPs（CSP） | SA PC012 审计条款、NT IPPs |

### 4.2 VIC 公营养老预计会出现的合同条款
- PDP Act s17 条款：绑定 IPPs（同样方式、同样程度），约定责任转移。
- VPDSS：须配合机构的 Protective Data Security Plan 和安全评估；数据安全分级（BIL）；事件须及时报告，便于机构向 OVIC 通报；审计权；分包限制；合同结束时归还/销毁数据。
- HRA：健康信息适用 HPPs（包括 HPP 9 跨境转移）。
- 预计会有 **数据驻留（data residency）要求**：存储和 LLM 推理都在澳洲境内，禁止或限制境外访问（IPP 9 / HPP 9）。⚠️ 具体是否为硬性要求取决于各卫生服务的采购模板。

### 4.3 数据驻留
- 默认：所有客户数据（音频、转写、草稿）都在澳洲区域存储和处理；LLM 子处理方须提供 AU 区域或零数据保留承诺；子处理方清单向客户披露。这样能同时满足 IPP 9（VIC）、QLD s33、WA IPP 9、APP 8，是最省事的统一做法。

### 4.4 泄露通报多制度矩阵（我们要为客户提供的支持）

| 客户 | 法定制度 | 时限 | careKind 合同承诺建议 |
|---|---|---|---|
| 私营（全国） | 联邦 NDB（Privacy Act Part IIIC） | 30 天内评估；若改革通过可能改为 72 小时 ⏳ | 发现后 **24 小时内**通知客户 |
| NSW 公营 | PPIP Part 6A MNDB | 30 天评估，"立即"通报 | 24 小时 |
| QLD 公营 | IP Act MNDB | ⚠️ 具体时限需核实 | 24 小时 |
| VIC 公营 | OVIC Information Security Incident Notification；健康信息可报 HCC（自愿） | ⚠️ | 24 小时 + 配合 VPDSS 事件流程 |
| WA 公营 | PRIS breach scheme 2027-01-01 起 ⏳ | ⚠️ | 24 小时 |
| SA 公营 | PC012：通知 Privacy Committee | — | 24 小时 |
| TAS / NT / ACT 公营 | 无法定 MNDB（ACT 只限 TFN） | — | 24 小时 + 自愿通报配合 |
| 同时属于 SIRS 事件 | Aged Care Act SIRS（P1 24 小时） | — | 如果 AI 草稿/转写揭示 reportable incident，产品应提示护士按 SIRS 流程处理，但 **不替客户判断**。 |

统一 24 小时通知客户的承诺可以覆盖所有制度。详细流程见 `../data-breach-response-plan.md`。

### 4.5 保存期设计
- careKind 不是 record of truth：定稿进入客户的临床系统，客户负责 7 年 / 25 岁的保存义务（VIC HRA、NSW HRIPA s25、ACT）。
- 我们端：原始音频和中间转写实行最短保存（如 30 天内删除，可由客户配置），定稿草稿镜像按客户指示保存或删除；合同终止时导出后删除。
- 删除功能须支持客户的法定期限：不得在客户的法定期限内删除"唯一副本"，所以产品必须保证定稿先写回客户系统，再删除我们这端的数据。
- 未成年情况在住宿养老中极少，但 VIC/NSW 的 25 岁规则应在配置中保留 ⚠️。

### 4.6 约束性措施文档模板（对辖区敏感）
- 2026-12-01 是关键日期：联邦 hierarchy 过渡期结束（除非再延期 ⚠️）。模板不能硬编码"联邦五级 hierarchy"。
- 模板字段建议：所在州/领地；同意来源类型（VIC Tier 1–4 / QCAT 委任 guardian / NSW guardian 或 enduring guardian 的 RP 职能 / SA SDM 或 SACAT / 联邦 hierarchy 级别）；委任文件引用；同意日期和有效期；behaviour support plan 链接；监测和复查记录。
- AI 只负责起草记录，**不判断谁有权同意、不建议使用约束性措施**；草稿中缺少同意来源时应标黄提示护士核对。
- 涉及 inappropriate use of restrictive practices 的内容会触发 SIRS，模板中应提示护士按机构流程处理。

### 4.7 员工访问现场（筛查 / 疫苗）
- 所有会进入设施的 careKind 员工（实施、培训、客户成功）：持有不超过 3 年的 **National Police Certificate**（如曾在海外居住，另备 statutory declaration）；每年接种流感疫苗并保留证明；COVID 疫苗按设施要求；入场前做 RAT、有症状不进入。
- 如被客户认定为 "aged care worker"（经 registered provider 聘用/承包），客户要保存我们员工的筛查记录 7 年，我们要配合提供。
- VIC 公营设施：有直接接触的人员可能落入 Secretary Directions 的流感疫苗要求 ⚠️；NSW Health 运营的设施可能要求 Category A 合规 ⚠️。
- 原则上远程交付优先；现场访问以不接触住民、不接触纸质病历为原则。

### 4.8 随增长出现的工资税
- 现阶段远低于所有起征点。首次触发大概在全澳工资总额达到 100 万澳元时（VIC/WA 最低）。如总部在 VIC，应在工资总额约 80 万澳元时开始按月监控。
- 远程员工分布在多个州会产生多州登记义务；grouping 规则会把关联公司合并计算。
- 每个有员工的州都要投保工伤保险（NSW icare、VIC WorkSafe 等；TAS/ACT/NT 通过私营保险公司）。

### 4.9 进入市场的优先级建议
1. **私营/NFP 养老院（NSW、VIC、QLD）**：全国统一的联邦框架 + VIC HRA / NSW HRIPA 的 HPPs 合同条款，合规门槛最低、市场最大。
2. **VIC 公营 PSRACS**：全国最大的州营养老板块；需提前准备 VPDSS 合规包（安全控制映射、事件响应、AU 驻留）和 s17 条款立场。周期长，但一旦通过就有示范效应。
3. **QLD 公营 RACF**：IP Act s35 + MNDB，流程较成熟；QLD 配比制度让"节省文档时间"的价值主张很清楚。
4. **WA 公营**：等 PRIS 运行稳定（2026-07 起）以及 2027-01 的 breach scheme 后再进入；需关注 IPP 10（自动化决策）对 AI 起草的解读。
5. **SA / TAS / ACT / NT**：规模小；SA 的 PC012 审计条款、ACT 的 HR(P&A) Act 需单独评估。

---

## 5. ⚠️ 需核实清单

1. careKind 是否构成 Privacy Act 下的 "health service provider"；小企业豁免是否适用；是否做 s6EA opt-in。
2. 联邦 *Privacy Amendment (Personal Data Protection) Bill 2026* 的立法进度（72 小时通报、小企业豁免）。
3. NSW HRIPA 中 "private sector person" 的小企业界定（s4 原文），以及对纯数据处理方的适用。
4. VIC HRA 对 contracted service provider 的具体条款编号和适用方式。
5. ACT HR(P&A) Act 保存期条文的原始措辞，以及对非 HSP record keeper 的适用。
6. 各州公营健康记录 disposal schedule 的具体期限（NSW GDA17、QLD Health Sector (Clinical Records) RDS、WA、SA、TAS、NT）。
7. QLD 被绑定 CSP 是否直接承担 MNDB 义务，以及 QLD MNDB 的具体时限。
8. WA PRIS breach scheme 2027-01-01 的生效时间是否已正式确定。
9. NT、ACT 是否有正在推进的 MNDB 改革；TAS PIP Act 改革进度（TLRI 2024 建议）。
10. 联邦 RPSDM hierarchy 在 2026-12-01 之后是否再延期。
11. NSW 2026-12 起的 restrictive practices 新框架（官方来源和是否适用于养老）。
12. SA Part 5A 的生效日期（二手资料称 2026-07-09），以及"physical restraint 须 SACAT 授权"的现行有效性。
13. TAS、ACT、NT 的 RPSDM 立法状态；WA OPA 立场声明的法律效力。
14. 各州是否确实都没有 elder abuse 一般性强制报告（律师最终确认）。
15. VIC/QLD 以外是否有任何州对公营住宿养老实行配比（NSW、SA、TAS 等）。
16. 联邦 Aged Care Worker Regulation Scheme / 统一养老工人筛查的立法和上线时间；careKind 员工是否算客户的 "aged care worker"。
17. VIC 现行访客 RAT 指引是否仍有效；VIC Secretary Directions 对承包商/vendor 的适用。
18. NSW COVID 公共卫生令的撤销历史和日期；QLD、WA、SA、TAS、ACT、NT 现行的员工/访客疫苗要求。
19. VIC、SA 的 2026-27 工资税起征点（官方页面只写 2025-26 或"from 1 July 2025 onward"）；ACT 2026-27 之前的起征点（预计为 $2m，未核实）。
20. 工伤保险机构链接本轮未逐一打开核实。
21. health.gov.au 多个页面抓取超时，相关内容依据官方页面的搜索摘要，正式引用前需人工打开核对。
