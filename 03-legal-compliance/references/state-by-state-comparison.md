Owner: Legal/Compliance · Status: Research draft · Last reviewed: 18/10/2026
> 运营参考，不是法律意见

# 州/领地差异对照（State-by-State Comparison）— 澳洲住宿养老（residential aged care）

范围：NSW、VIC、QLD、WA、SA、TAS、ACT、NT。重点是会影响 careKind（AI 文档助手，作为 vendor / contracted service provider 处理健康信息）的州/领地法律差异。联邦层面（Privacy Act 1988、Aged Care Act 2024、Aged Care Rules 2025）只在和州法相互作用时简要提及，详见 `../aged-care-regulatory.md` 和 `../privacy-program.md`。

标记约定：✅ 已生效 · ⏳ 已通过/待生效或改革中 · ⚠️ 需核实（官方页面未能直接确认，或信息可能已过时）

> **18/10/2026 复核说明**：本轮逐条复核了第 5 节的 ⚠️ 项，新增 3.10（监控设备法 / 工作场所监控）和 3.11（州政府 ICT / 网络安全 / 数据驻留）。本轮新增或复核的来源列在第 6 节（访问日期均为 18/10/2026）。3.4、3.5 的实质内容由 `state-clinical-practice-rules.md` 负责，本轮未改动。

---

## 1. 关键差异摘要

1. **州一级的私营部门健康信息法只有 3 个辖区：VIC、NSW、ACT。** VIC 的 *Health Records Act 2001* 不论组织规模都适用（没有小企业豁免）；NSW 的 HRIPA 适用于私营 health service provider，以及年营业额超过 300 万澳元、收集/持有/使用健康信息的组织；ACT 的 *Health Records (Privacy and Access) Act 1997* 公营和私营都适用。QLD、WA、SA、TAS、NT 的私营养老机构只受联邦 *Privacy Act 1988* 约束。
2. **州公营部门隐私法只有在我们卖给州政府运营的养老院时才相关**，而且一般通过合同"传导"到我们身上：VIC PDP Act s17 + VPDSS；QLD IP Act ch 2 pt 3（s35 binding）；WA PRIS Act（2026-07-01 起；CSP 只有在 State services contract 写入适用条款时才受约束，且没有小企业豁免）；SA PC012 IPPs Instruction；TAS PIP Act；NT Information Act；ACT Information Privacy Act 2014。VIC 有全国最大的公营住宿养老板块，所以 VIC 公营养老的合同条款（PDP Act s17 + VPDSS）是最可能先遇到的。
3. **州级强制数据泄露通报（MNDB）差别很大**：NSW（2023-11-28 起）✅；QLD（2025-07-01 起，地方政府 2026-07-01 起）✅；WA（PRIS 下的 notifiable information breach scheme 2027-01-01 起，是政府公布的日期，未见 proclamation 原文）⏳；VIC 没有针对个人的 MNDB，只有 OVIC 的 information security incident notification scheme ✅；SA、TAS、NT、ACT 没有一般性的法定 MNDB（ACT 只针对 TFN 信息 + 政策性自愿通报）。私营客户适用联邦 NDB scheme；联邦 Tranche 2 暴露稿拟增加"**72 小时内向 OAIC 提交声明**"（咨询 2026-09-18 截止，截至 18/10/2026 未见提交国会）⏳。QLD、NSW 的 MNDB 义务在 agency 身上，**不直接落在 CSP 身上**，但 CSP 持有的数据发生泄露，视为 agency 的泄露（QLD OIC 指引）。
4. **约束性措施（restrictive practices）同意规则正在变化，这是最紧迫的辖区差异。** 联邦 RPSDM 层级（hierarchy）是过渡措施，适用期延长到 **2026-12-01**；VIC 已有专门法（*Aged Care Restrictive Practices Substitute Decision-maker Act 2024* (Vic)，2025-07-01 起生效）；QLD 由 QCAT/Public Guardian 处理（Practice Direction No. 2 of 2026）；NSW 的 *Guardianship Regulation 2026* 增加了 enduring guardian 的 restrictive practice 职能，另有报道称 2026 年 12 月起有新框架 ⚠️；SA 的 Advance Care Directives Act 新 Part 5A 于 2026-07-09 起生效，且 physical restraint 须经 SACAT 授权 ⚠️。
5. **护士配比法只管公营**：VIC 的 *Safe Patient Care Act 2015* 适用于公营住宿养老；QLD 公营 RACF 依 *Hospital and Health Boards Regulation 2023* 执行最低 DRCH 3.65 小时和技能组合比例。私营养老统一适用联邦 care minutes（215/44）和 24/7 RN 要求。SA 的 *Nurse and Midwife to Patient Ratios Act 2025*、WA 和 ACT 的配比只覆盖公立医院（ACT 含医院内的 acute aged care 病房），不覆盖住宿养老。
6. **工资税（payroll tax）起征点差距大**：ACT 175 万澳元（2026-07-01 起下调）、NT 250 万、SA 150 万、QLD 130 万、TAS 125 万、NSW 120 万、VIC 100 万、WA 100 万。
7. **疫苗/入场要求**：COVID 公共卫生令基本都已撤销；联邦层面是"providers 必须给员工提供免费流感疫苗并记录"的项目；州公营机构对员工另有强制规定（如 VIC Secretary Directions、NSW Health Category A）。访客/承包商的要求按设施政策执行，差别大，需逐家确认 ⚠️。NSW *PD2026_004*（2026-02-25）要求 Category A 人员（**含承包商**，明确覆盖 NSW Health 运营的 MPS 和养老院）每年 6 月 1 日前接种季节性流感疫苗。
8. **没有任何州对老年人虐待（elder abuse）设一般性的强制报告义务**；住宿养老统一走联邦 SIRS。NSW ADC、SA ASU 等州机构的职能都明确不调查付费养老服务提供者。
9. **（新增）州政府 ICT 采购普遍要求澳洲境内托管健康信息**：WA Data Offshoring 指引把健康信息列为 Tier 1（必须在澳洲托管）；QLD IS18 v10（2026-06-17）要求 agency 在境外存储/处理 HIGH/MEDIUM 信息前先报告；ACT Cyber Security Policy V3.5 要求 OFFICIAL: Sensitive 个人隐私信息"should be hosted in Australia"；NSW Cyber Security Policy 2026–27 要求管理第三方风险，agency 须在 24 小时内向 Cyber Security NSW 报告事件。见 3.11。
10. **（新增）录音（Shift Capture）受各州监控设备法约束，规则不统一**：参与方本人录音在 QLD、VIC、NT 一般不构成 listening device 罪行；NSW、WA、SA、TAS、ACT 原则上须全体主要参与方同意，或落入"保护合法利益"等狭窄例外。但无论哪种模式，设备录到的**护士不是参与方的对话**（住户之间、同事之间）都需要相关人员同意；VIC、NT、QLD、SA 还限制传播录音。NSW、ACT 的工作场所监控法要求提前 14 天书面通知员工，但不覆盖录音（录音归监控设备法）。见 3.10。

---

## 2. 主对照表

### 表 A：隐私 / 健康信息 / 数据泄露

| 主题 | NSW | VIC | QLD | WA | SA | TAS | ACT | NT |
|---|---|---|---|---|---|---|---|---|
| 私营部门健康信息州法 | HRIPA 2002 ✅（私营 HSP + 营业额 >$3m 的组织；s4 排除 Cth small business operator） | Health Records Act 2001 ✅（公私皆适用，无小企业豁免） | 无（私营受 Privacy Act 1988 约束） | 无 | 无 | 无 | Health Records (Privacy and Access) Act 1997 ✅（公私） | 无 |
| 健康记录最低保存期（私营 HSP） | 成人：最后一次服务后 7 年；未成年：到 25 岁（s25） | 成人：7 年；未成年：到 25 岁，取较晚者（HPP 4） | 无州法最低期限；私营只适用 APP 11.2（不再需要时销毁或去标识化）；公营依 QSA 保存表 | 同 QLD | 同 QLD | 同 QLD | ✅ 成人：最后一次服务后 7 年；未成年：到 25 岁（Sch 1 Principle 4.1 cl 2–3，R32 原文已核实）；适用于任何 "record keeper" | 同 QLD |
| 州公营隐私法 | PPIP Act 1998（+ HRIPA） | PDP Act 2014（IPPs）+ VPDSS；健康信息适用 HRA | IP Act 2009（QPPs 2025-07-01 起）✅ | PRIS Act 2024（IPPs 2026-07-01 起）✅ | IPPs Instruction（PC012，行政指令，非法律） | PIP Act 2004 | Information Privacy Act 2014（TPPs） | Information Act 2002（IPPs） |
| Contracted service provider 机制 | 合同约束；HRIPA 无外包条款，非 HSP vendor 营业额 >$3m 即直接适用（s4、s9、s11）✅ | PDP Act s17 合同绑定 IPPs；VPDSS Standard 8 责任不能经合同转移；健康信息：HRA s12 只管 State contract，provider 违规同时归责于 outsourcing organisation ✅ | s35 须"采取合理步骤"绑定 CSP | ✅ CSP 属于 IPP entity（s14），但只有 State services contract 写入适用条款时才受约束；无小企业豁免 | 合同必须要求 CSP 遵守 IPPs 并允许审计 | 与 custodian 签有合同的私营组织受约束 | 适用于部分 ACT 政府 CSP（含分包） | 适用于 contract service provider ⚠️ |
| 州级强制泄露通报 | MNDB ✅ 2023-11-28（agency 义务） | 无针对个人的 MNDB；OVIC 安全事件通报 ✅ | MNDB ✅ 2025-07-01，地方政府 ✅ 2026-07-01；30 天内评估；义务在 agency，一般不直接适用于 CSP | ⏳ 2027-01-01 | 无（须报告 Privacy Committee 的行政要求） | 无（TLRI 2024 建议引入，未见法案） | 无（仅 TFN；政策性自愿通报 OAIC）；未见改革法案 | 无（NT Information Commissioner 2023 年报建议引入，未见法案） |
| 州政府 ICT / 数据驻留（见 3.11） | Cyber Security Policy 2026–27；agency 24h 内报告事件；Cloud 合同数据出 NSW 须客户同意 | VPDSS V2.0 Standard 8；HRA HPP 9 | IS18 v10（2026-06-17）：境外存储/处理 HIGH/MEDIUM 信息前须报告 | Data Offshoring 指引：健康信息属 Tier 1，须在澳洲托管 | SACSF V2.0（2026-03-23 起须合规）；OFFICIAL: Sensitive 建议境内 | Cyber Security Policy V1.1；Cloud Policy 2020 允许经风险评估后岛外托管 ⚠️ | Cyber Security Policy V3.5：个人隐私信息应在澳洲托管，上云前须安全评估 | 政策未公开 ⚠️ |
| 监管机构 | IPC NSW | OVIC；健康信息归 Health Complaints Commissioner | OIC QLD | WA Information Commissioner（2025-07-01 设立） | Privacy Committee of SA | Ombudsman Tasmania | OAIC（代行 ACT 职能）/ ACT HRC（健康记录） | NT Information Commissioner |

### 表 B：照护 / 同意 / 人员

| 主题 | NSW | VIC | QLD | WA | SA | TAS | ACT | NT |
|---|---|---|---|---|---|---|---|---|
| 监护法庭 | NCAT | VCAT | QCAT | SAT | SACAT | TASCAT | ACAT | NTCAT |
| 约束性措施 SDM 机制（州法） | Guardianship Act 1987 + Guardianship Regulation 2026（enduring guardian 新增 RP 职能）；据报 2026-12 起有新框架 ⚠️ | 专门法：Aged Care RP SDM Act 2024 (Vic) ✅ 2025-07-01，四层级 | QCAT 委任 guardian 或 Public Guardian；PD 2 of 2026 ✅ | Guardian / enduring guardian 须有相应授权（OPA 2026-07 立场）⚠️ | ACD Act 2013 SDM；physical restraint 须 SACAT 授权 ⚠️；Part 5A 2026-07-09 起 | ⚠️ 未核实 | ⚠️ 未核实 | ⚠️ 未核实 |
| 联邦 RPSDM hierarchy 是否可用 | 仅在州法无明确机制或法庭委任严重延迟时使用；适用期到 2026-12-01（全国统一）⏳ | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 |
| 一般性 elder abuse 强制报告 | 无（ADC 受理社区报告） | 无 | 无 | 无 | 无（ASU 受理报告） | 无 | 无 | 无 ⚠️ |
| 护士配比法（公营养老） | 无住宿养老配比；Public Health Act 2010 s104 要求 "nursing home" 24 小时有 RN ⚠️（现行条文未打开）；safe staffing levels 是医院政策 | Safe Patient Care Act 2015 ✅ | HHB Regulation 2023：DRCH 3.65h，RN ≥30%、护士 ≥50% ✅ | 无（公立医院配比是政策 + 企业协议，2025-07-21 起，不含养老） | 无（*Nurse and Midwife to Patient Ratios Act 2025* 只适用于公立医院）⚠️ 生效日期待核 | 无（EBA 谈判中） | 无住宿养老配比（Safe Care Staffing Framework 覆盖医院 acute aged care 病房） | 无 ⚠️（未深入查） |
| 工人筛查（养老） | 联邦统一：police certificate（≤3 年）或 NDIS worker screening clearance（≤5 年，各州签发）；统一的新筛查"不早于 2026 年"、须与州/领地协商，未公布上线日期 ⏳ | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 | 同左 |
| 公营机构员工流感疫苗强制 | ✅ PD2026_004：NSW Health Category A（含承包商、MPS、NSW Health 养老院）每年 6/1 前接种 | Secretary Directions（公营/教会卫生服务运营的养老，每年 8/15 前）⚠️ 2026 年是否仍有效未核实 | 无强制（HED 02/20 流感指令已撤销；HED 01/16 管 MMR/水痘/百日咳）| WA Health MP 0132/20 流感疫苗项目（仅 WA Health 机构） | SA Health 疫苗可预防疾病政策（Category A/B/C，含承包商；仅 SA Health） | 未见强制 ⚠️ | 建议，不强制 | 未见强制 ⚠️ |

### 表 C：工资税与工伤保险

| 辖区 | 年度起征点 | 税率（概要） | 工伤保险 |
|---|---|---|---|
| NSW | $1,200,000（2024-25 至 2026-27 不变） | 5.45% | icare NSW |
| VIC | $1,000,000（2025-07-01 起，SRO 页面 2026-09-29 更新仍适用）✅ | 4.85%（regional 1.2125%）；$3m–$5m 之间扣除额递减；>$10m / >$100m 另有附加税 | WorkSafe Victoria |
| QLD | $1,300,000 | 4.75%（≤$6.5m）/ 4.95%（>$6.5m）；>$10m 另征 mental health levy | WorkCover Queensland（监管：WorkSafe QLD） |
| WA | $1,000,000（在 $1m–$7.5m 之间递减） | 5.5% | WorkCover WA（监管；approved private insurers 承保）⚠️ |
| SA | $1,500,000 | $1.5m–$1.7m 浮动，>$1.7m 4.95% | ReturnToWorkSA |
| TAS | $1,250,000 | 4%（$1.25m–$2m）/ 6.1%（>$2m） | WorkSafe Tasmania（私营保险公司承保） |
| ACT | **$1,750,000（2026-07-01 起；之前为 $2,000,000）** ✅ | 6.75%（$1.75m–$20m）起，最高 8.75%（>$150m） | WorkSafe ACT（监管；approved insurers 承保） |
| NT | $2,500,000（2025-07-01 起） | 5.5%；NT 公布"2026-07-01 起对大雇主适用新税率"⚠️ 页面 403 未能打开 | NT WorkSafe（approved insurers 承保） |

---

## 3. 分主题详述

### 3.1 健康信息法（Health records laws）

**Victoria — Health Records Act 2001 (HRA)** ✅
- 适用于公营和私营组织，包括 health service provider 以及收集健康、残障、养老信息的各类组织；**"no 'small business' exemption"**。来源：https://www.health.vic.gov.au/legislation/health-records-act
- 投诉和健康信息隐私泄露由 Health Complaints Commissioner (HCC) 处理（HCC 有面向 providers 的隐私泄露报告页面，但不属于法定 MNDB）。来源：https://hcc.vic.gov.au/providers/health-records-providers ；https://hcc.vic.gov.au/providers/privacy-breaches
- **对 vendor 的含义（18/10/2026 核对 Authorised Version No. 050，amendments as at 01/05/2026）** ✅：s11(1) 适用于任何"is a health service provider or collects, holds or uses health information"的私营主体，**没有小企业豁免**；所以 careKind 持有 VIC 居民健康信息时 **直接受 HRA 约束**。s12 "Effect of outsourcing" 只适用于 **State contract**（与公营机构的合同）下的 outsourced service provider（含分包商，s3(2)）：如 HPP 无法对 provider 执行，provider 的违规同时视为 outsourcing organisation 的违规。私营养老合同不是 State contract，careKind 直接依 s11 受约束。⚠️ 仍需律师确认作为纯处理方的具体义务边界。
- 最近的变化是 *Health Records Regulations 2023*（2023-08-18 起生效）；health.vic.gov.au 页面 2026-04-29 更新，未提到 HRA 修订；18/10/2026 未查到专门修订 HRA 的 2026 年法案（*Health Legislation Amendment (Regulatory Reform) Bill 2026* 2026-06-02 提出，是否涉及 HRA ⚠️ 未核实）。来源见第 6 节。

**NSW — Health Records and Information Privacy Act 2002 (HRIPA)** ✅
- 适用于身为 health service provider，或收集、持有、使用健康信息的 "organisations"（公营机构或 private sector person）。私营组织中，营业额超过 300 万澳元的受约束；health service provider 不论规模都受约束。15 条 Health Privacy Principles (HPPs)。来源：https://www.ipc.nsw.gov.au/privacy/nsw-privacy-laws/hrip ；https://www.ipc.nsw.gov.au/resources/fact-sheet-health-privacy-principles-hpps
- **对 vendor 的含义（18/10/2026 核对现行版本，version from 30/09/2026）** ✅：s4 "organisation means a public sector agency or a private sector person"；"private sector person" **不包括 Privacy Act 1988 意义上的 small business operator**（Cth s6D：年营业额 ≤$3m；但提供 health service 并持有健康信息的不算 small business operator）。s11(1)：适用于"every organisation that is a health service provider or that collects, holds or uses health information"；s9："holds" 包括占有或控制（不论文件是否在 NSW 境外）。HRIPA 没有专门的外包条款。结论：careKind 营业额 ≤$3m 且不是 HSP 时，**不直接受 HRIPA 约束**；超过 $3m（或被认定为 HSP）后直接受约束。客户（养老院是 HSP）仍会通过合同要求我们遵守 HPPs。
- s25（retention）只适用于身为 health service provider 的 private sector person：成人 7 年、未成年到 25 岁；删除时须记录姓名、所涵盖期间和日期（s25(2)）；转移而不留副本时须记录接收方名称和地址（s25(3)）。
- 法律文本：https://legislation.nsw.gov.au/view/whole/html/inforce/current/act-2002-071

**ACT — Health Records (Privacy and Access) Act 1997** ✅
- 适用于 ACT 的公营和私营 health service providers / record keepers；健康记录相关投诉由 ACT Human Rights Commission（Health Services Commissioner）处理。来源：https://www.hrc.act.gov.au/health ；法律：https://www.legislation.act.gov.au/a/1997-125
- ✅（18/10/2026 核对 R32 原文，effective 16/11/2025）**"record keeper means an entity that has possession or control of a health record"**（Dictionary）。所以 careKind 只要"占有或控制"ACT 消费者的健康记录（含副本），就可能是 record keeper，直接受 Principle 4（安全、保存、销毁）约束，不论是否为 HSP。
- Principle 4.1 cl 2–3：record keeper 必须保存、不得销毁健康记录，除非 (a) Territory 法律要求或允许；(b) 成人最后一次服务后 7 年 / 未成年到 25 岁；(c) 已按 *Electronic Transactions Act 2001* s11(2)(b) 生成可用的电子副本；(d) 监控录像。Principle 4.2：须维护销毁/转移记录登记册（登记条目保存 7 年）。Principle 4.3 cl 2：**非 HSP 实体**在信息不再需要时须采取合理步骤销毁或永久去标识化。
- s11(3)：健康记录"kept or located in the ACT"的，record keeper 须按法律允许消费者查阅。
- ⚠️ 待律师确认：careKind 作为非 HSP 的 record keeper，同时适用 Principle 4.1 cl 2（不得销毁）和 4.3 cl 2（不再需要时销毁）时如何协调。初步理解：定稿写回客户系统后，我们端的副本可依 4.3 cl 2 删除，并记入 4.2 登记册。

**QLD — Information Privacy Act 2009**（只管公营）✅
- *Information Privacy and Other Legislation Amendment Act 2023* (IPOLA)：QPPs 取代 IPPs/NPPs，适用于所有 agencies；MNDB 于 **2025-07-01** 起生效，地方政府延后到 2026-07-01。来源：https://www.oic.qld.gov.au/government/ipola ；https://statements.qld.gov.au/statements/99263
- 私营养老机构不受 IP Act 约束，适用联邦 Privacy Act。
- 地方政府的 MNDB 已按计划于 2026-07-01 起适用（OIC 新闻 2026-06-23）✅。

**WA — Privacy and Responsible Information Sharing Act 2024 (PRIS Act)**（只管公营 + CSP）✅/⏳
- Part 1 于 2024-12-06 生效；大部分隐私条款（11 条 IPPs，含 IPP 9 境外披露、IPP 10 自动化决策）于 **2026-07-01** 起生效；notifiable information breach scheme 预计 **2027-01-01** 起。适用于 WA 公营部门以及"some contracted service providers to government"。来源：https://www.wa.gov.au/organisation/office-of-the-information-commissioner/privacy-western-australia ；https://www.wa.gov.au/organisation/office-of-the-information-commissioner/personal-information-collected-and-after-1-july-2026
- 注意 **IPP 10（自动化决策）**：如向 WA 公营养老销售，AI 起草功能的透明度要求可能被触发 ⚠️。
- **18/10/2026 复核**：OIC 页面（2026-09-29 更新）仍写"Government has stated"2026-07-01 / 2027-01-01，未引用 proclamation；OIC 投诉表写明 2026-07-01 起受理针对 public entities 及其 CSP 的 PRIS 投诉，二手资料也确认已于 2026-07-01 起生效 ✅。breach scheme 2027-01-01 仍是政府公布的日期 ⏳（未见 proclamation 原文 ⚠️）。
- **CSP 规则**（OIC "Resource 2: How PRIS applies to Contracted Service Providers"，2026-06-29，v01）：CSP 是依 State services contract 为 public entity 提供服务的实体，**含分包商**（s8）；CSP 属于 IPP entity（s14）；只有当 State services contract 写入"Part 2、IPPs 及适用的 privacy code 适用于 CSP"的条款时，CSP 才须遵守（2026-07-01 前签的合同有该条款也有效）。据 Clayton Utz（二手），**PRIS 没有小企业豁免**。来源见第 6 节。

**SA / TAS / NT**：没有私营部门健康信息州法，私营养老受 Privacy Act 1988 约束。公营部门见 3.3。

**与联邦 Privacy Act 1988 的关系**
- 所有提供 health service 且持有健康信息的组织，不论是否小企业都受 Privacy Act 约束（包括提供养老服务过程中的活动）。来源：https://www.oaic.gov.au/privacy/privacy-guidance-for-organisations-and-government-agencies/organisations/small-business ；https://www.oaic.gov.au/privacy/your-privacy-rights/health-information/what-is-a-health-service-provider
- careKind 本身是否算 "health service provider" 存在不确定性（我们不提供诊疗，只做文档）。如不算、且营业额 ≤300 万澳元，可能落入小企业豁免 ⚠️。建议依 s6EA 主动 opt-in，或至少以合同方式承诺遵守 APPs（详见第 4 节）。
- 联邦改革：*Privacy Amendment (Personal Data Protection) Bill 2026* 暴露稿 ⏳。来源：https://consultations.ag.gov.au/rights-and-protections/privacy-reform/user_uploads/exposure-draft-bill-2026.pdf
  - **18/10/2026 复核**：AG 咨询页确认暴露稿 2026-08-31 发布、2026-09-18 截止，"remains subject to further consideration by government"；截至 18/10/2026 未查到提交国会的记录 ⏳。
  - **72 小时**：本地 Consultation Paper（`law-library/ag-privacy-reform-consultation-paper-2026-08-exposure-draft.pdf` p.24）确认：entity 须在"becoming aware of reasonable grounds to believe"发生 eligible data breach 后 **72 小时内** 向 Commissioner 提交声明；30 天评估义务不变；无法提交完整声明时可先交不完整声明；未在 72 小时内提交任何声明可被处以 infringement notice ✅（草案内容）。
  - **Controller / processor**（Consultation Paper Schedule 6，pp.36–37）：processor 按 controller 的 documented instructions 处理信息时，其行为视为 controller 的行为；但 **processor 仍直接负责 APP 1 和 APP 11**；超出指示时 processor 直接负责全部适用 APPs。这对 careKind 的 DPA 设计很关键（见 4.10）。
  - **小企业豁免**：Consultation Paper 未提及取消；HSF Kramer（二手）称草案未处理小企业豁免 → 按"不取消"规划 ⚠️（草案正文未逐条核对）。
- 州法与联邦法并行适用：在 VIC/NSW/ACT，私营养老院可能同时受 Privacy Act 和州健康记录法约束（双重合规）。

### 3.2 保存期限（Retention）

| 来源 | 规则 | 链接 |
|---|---|---|
| VIC HRA（HPP 4） | 不得删除，除非：未成年时收集的信息，已满 25 岁；**或**最后一次服务后已超过 7 年，取较晚者 | https://hcc.vic.gov.au/providers/health-records-providers |
| NSW HRIPA s25 | 私营 HSP：成人信息自最后一次服务起保存 7 年；未成年时收集的，保存到 25 岁 | https://www.ipc.nsw.gov.au/resources/fact-sheet-guide-retention-and-storage-health-information-nsw-private-health-service-providers |
| ACT HR(P&A) Act | ✅ Sch 1 Principle 4.1 cl 2–3：record keeper 须保存、不得销毁，除非成人最后一次服务后已满 7 年 / 未成年时收集的已满 25 岁（或有其他例外，见 3.1）；Principle 4.2 须维护销毁/转移登记册 | https://www.legislation.act.gov.au/DownloadFile/a/1997-125/current/PDF/1997-125.PDF （R32，effective 16/11/2025） |
| QLD / WA / SA / TAS / NT 私营 | 无州法最低保存期；适用 Privacy Act APP 11.2（不再需要时销毁或去标识化，除非法律或法院命令要求保留）+ Aged Care Act/Rules 的记录义务 | 见 `law-library/privacy-act-1988-compilation-2026-06-04.pdf` |
| VIC 公营 | PROV 的 PROS 11/06 Patient Information RDA | https://prov.vic.gov.au/recordkeeping-government/document-library/pros-1106-patient-information |
| NSW / QLD / WA / SA / TAS / NT 公营 | 各州档案机构的 health/patient records disposal schedule（如 NSW State Records GDA17、QLD Health Sector (Clinical Records) Retention and Disposal Schedule）⚠️ 具体期限本轮仍未核实（未逐一打开各档案机构页面）。对 careKind 的影响有限：公营客户的定稿保存在客户系统，期限由客户承担 | — |
| WA PRIS 与档案 | State Records Office 发布了 PRIS 与 record keeping 的指引 | https://www.wa.gov.au/organisation/state-records-office-of-western-australia/privacy-and-responsible-information-sharing-act-2024-and-record-keeping-obligations |
| 联邦（简述） | Aged Care Act/Rules：事件记录保存 7 年；前 registered provider 在注销后仍须保存相关记录 7 年；工人筛查记录 7 年 | https://www.health.gov.au/resources/publications/guide-to-aged-care-law/chapter-7-information-management/keeping-records?language=en ；https://www.agedcarequality.gov.au/for-providers/serious-incident-response-scheme/incident-management-systems/recording-incidents |

### 3.3 州公营部门隐私（卖给州政府运营的养老院时）

- **VIC — PDP Act 2014 + VPDSS**：s17 允许外包合同把 contracted service provider 按与 outsourcing organisation "同样方式、同样程度"绑定到 IPPs，责任随之转移；但 **VPDSS 信息安全义务不能通过合同转移**，Part 4 机构负责人须确保第三方不违反 protective data security standard（OVIC 指引引用 s88）。数据出境适用 IPP 9。OVIC 有 Information Security Incident Notification Scheme（不是针对个人的 MNDB）。健康信息仍适用 HRA。来源：https://ovic.vic.gov.au/privacy/resources-for-organisations/outsourcing-in-the-victorian-public-sector/ ；https://ovic.vic.gov.au/wp-content/uploads/2025/03/Outsourcing-in-the-Victorian-public-sector-Updated-resource.pdf ；https://ovic.vic.gov.au/book/ipp-9-transborder-data-flows/
- **NSW — PPIP Act 1998**：Part 6A 的 MNDB 自 **2023-11-28** 起适用于所有受 PPIP Act 约束的公营机构；疑似泄露须在 30 天内完成评估，须"立即"通报 Privacy Commissioner，并"尽快"通知受影响个人。来源：https://www.ipc.nsw.gov.au/resources/guide-mandatory-notification-data-breach-scheme-guide-managing-data-breaches-accordance-ppip-act ；https://www.ipc.nsw.gov.au/resources/fact-sheet-mandatory-notification-data-breach-scheme
- **QLD — IP Act 2009**：ch 2 pt 3 要求 agency 采取合理步骤把 CSP 绑定到 QPPs、s33 境外披露规则以及 QPP code；未绑定的，由 agency 对 CSP 的违规负责。MNDB 2025-07-01 起。**18/10/2026 复核**：OIC "Contractors and data breaches" 指引（据搜索摘要，页面本身被 Cloudflare 拦截）称，MNDB 义务"generally"**不适用于** CSP；但 CSP 占有的个人信息发生泄露，也可能构成 **agency 的** eligible data breach（IP Act s13 "held" 包括 possession or control）。agency 须在 **30 天内** 完成评估（可书面通知 Commissioner 延期），确认后"as soon as practicable"通知 Commissioner 和个人，并通过 OIC agency portal 报告 ✅（摘要级，⚠️ 条文号未核对）。所以合同里通常会要求 CSP 立即通知 agency 并配合评估。来源：https://www.oic.qld.gov.au/guidelines/for-government/guidelines-privacy-principles/application-of-the-ip-act/who-does-the-ip-act-apply-to ；https://www.oic.qld.gov.au/government/privacy/contractors-privacy
- **WA — PRIS Act 2024**：见 3.1；CSP 只有在 State services contract 写入适用条款时才受 IPPs 约束（OIC Resource 2，2026-06-29）。来源：https://www.wa.gov.au/organisation/office-of-the-information-commissioner/privacy-western-australia ；https://www.wa.gov.au/organisation/office-of-the-information-commissioner/how-pris-applies-contracted-service-providers
- **SA — IPPs Instruction（PC012 / Cabinet Administrative Instruction 1/89）**：涉及披露个人信息的服务合同，必须要求 CSP 像 agency 一部分那样遵守 IPPs，并包含审计/核查条款；发生泄露须通知 Privacy Committee。来源：https://www.dpc.sa.gov.au/resources-and-publications/premier-and-cabinet-circulars/DPC-Circular-Information-Privacy-Principles-IPPS-Instruction.pdf ；网络安全供应商要求另见 SACSF：https://www.security.sa.gov.au/cyber-security/tiles-for-cs/sacsf/sacsf-guideline-3.0-engaging-suppliers
- **TAS — Personal Information Protection Act 2004**：personal information custodians 包括在某些情况下为州提供服务的组织；与 custodian 签有收集/使用/存储个人信息合同的私营组织受约束；**没有** data breach 报告要求（TLRI 2024 年建议引入）。来源：https://www.ombudsman.tas.gov.au/personal-information-protection ；https://www.utas.edu.au/__data/assets/pdf_file/0014/1710320/TLRI_Privacy-Final-Report-No-33.pdf 。注意：2026-09 通过的 "Mandatory Notifications Bill" 是 *Integrity Commission Amendment*（公职人员不当行为通报），**与数据泄露无关**。来源：https://www.premier.tas.gov.au/latest-news/2026/september/mandatory-notifications-bill-passes-parliament
- **NT — Information Act 2002**：10 条 IPPs；Information Commissioner 可做隐私审计、发 compliance notice；有 contract service provider 概念。未见法定 MNDB：NT Information Commissioner 2023 年报建议设立法定强制通报制度，18/10/2026 未查到相关法案（⚠️ 未逐页查 NT Legislative Assembly 法案列表）。来源：https://infocomm.nt.gov.au/privacy ；https://infocomm.nt.gov.au/about-us/the-information-act
- **ACT — Information Privacy Act 2014**：13 条 TPPs；适用于部分 ACT 政府 contracted service providers（含分包商）；只有 TFN 信息泄露需强制通报，其余是政策性自愿通报 OAIC。18/10/2026 未查到 ACT MNDB 改革法案或咨询（⚠️ 仅搜索，未逐页查 ACT Legislative Assembly）。来源：https://www.hrc.act.gov.au/complaints/complaints-about-breaches-of-privacy/the-act-information-privacy-act ；https://www.treasury.act.gov.au/capital-framework/privacy

### 3.4 约束性措施 / 监护 / 替代决策

> 详见 `state-clinical-practice-rules.md`（临床 / 同意主题由该文件维护；本节保留 04/10/2026 版本，未在本轮复核）。

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
- **其他州（18/10/2026 复核）**：仍未发现针对住宿养老的州配比法。
  - **NSW**：*Public Health Act 2010* s104 要求 "nursing home" 任何时候都有 RN 在岗；2016、2020、2022 年试图把 "nursing home" 对齐联邦用语的修正案均未见通过 ⚠️（现行条文未能打开）。NSW safe staffing levels 是医院的政策/劳资安排（到 2027-07 分阶段，MPS 在后期阶段，未立法）。
  - **SA**：*Nurse and Midwife to Patient Ratios Act 2025*（2025-11-05 assent）只适用于公立 incorporated hospitals，不含私营医院和养老；生效日期据 Legislation SA 索引为 2026-08-22 ⚠️（未打开官方页面）。
  - **WA**：公立医院内外科病房配比（白天 1:4 / 夜间 1:7，2025-07-21 起）是政策 + 企业协议，不含养老 ✅（health.wa.gov.au）。
  - **ACT**：企业协议 + Safe Care Staffing Framework，Phase 1 含医院内的 acute aged care inpatient units（1:4 / 夜间 1:6），不是住宿养老。
  - **TAS**：无立法配比，ANMF 在 EBA26 谈判中推动。**NT**：未发现 ⚠️（未深入查）。
- **联邦（简述）**：care minutes 全行业平均每位住民每天 215 分钟，其中 RN 44 分钟（2024-10-01 起）；每家养老院 24/7 至少一名 RN 在岗。2026 年未见数值调整；EN 时间最多可计入 RN 目标的 10%；2026-04-01 起 MM1 养老院的 care minutes supplement 与实际达成情况挂钩（据 2026-05 provider guide 摘要 ⚠️）。来源：https://www.health.gov.au/our-work/care-minutes-registered-nurses-aged-care/care-minutes?language=en ；https://www.health.gov.au/our-work/care-minutes-registered-nurses-aged-care/24-7-rns
- **对产品的意义**：careKind 主打"节省文档时间"，与 care minutes（文档、护理计划等非面对面时间也计入）和 VIC/QLD 公营配比直接相关。卖点应表述为"释放直接照护时间"，不能暗示可以用来减少人手。

### 3.7 工人筛查

- 2025-11-01 起（新 Act）：仍然二选一 —— 不超过 3 年、未记录特定罪行的 **police certificate**，或 **NDIS Worker Screening Clearance**。在 16 岁后曾是其他国家公民/永久居民的，需另附 statutory declaration。Provider 须保存筛查记录 7 年。Police certificate 全国通用。来源：https://www.health.gov.au/topics/aged-care-workforce/screening-requirements?language=en ；https://www.health.gov.au/sites/default/files/2026-03/aged-care-worker-screening-guidance-material_0.pdf
- NDIS Worker Screening Clearance 有效期最长 5 年（police certificate 不超过 3 年）。CHSP 自 2025-11-01 起有更严格的取消资格罪行清单（居家服务，与住宿养老无直接关系）。来源：https://www.health.gov.au/sites/default/files/2025-10/appendix_d_-_chsp_worker_screening_guidelines.pdf
- **改革状态（18/10/2026 复核）⏳**：联邦计划推出与 NDIS 对齐的更严格筛查，最终安排须与州/领地协商，"不早于 2026 年"开始；ACQSC *Managing Worker Risk Policy*（2026-01）只提到这一意向，未给日期。National worker registration scheme 仍在设计阶段（2025 咨询收到 600 多份意见），**未立法、无上线日期**。任务说明中提到的"2026-07-01 aged care worker screening"未找到官方来源 ⚠️。来源：https://www.agedcarequality.gov.au/sites/default/files/media/managing-worker-risk-policy.pdf ；https://www.theweeklysource.com.au/national-aged-care-worker-registration-scheme-one-step-closer/ （二手）；原咨询报告：https://consultations.health.gov.au/medicare-benefits-and-digital-health-division/aged-care-worker-regulation-scheme-consultation/results/agedcareworkerregulationscheme-finalreport.pdf
- NDIS worker check 由各州机构签发（如 NSW Office of the Children's Guardian、VIC Worker Screening Unit），通常需要 NDIS 注册雇主发起，careKind 一般不符合条件 ⚠️。因此 **national police certificate 是 careKind 员工的现实选择**。
- Working with Children Check：住宿养老一般不需要，除非涉及儿童（如多用途/MPS 设施或访客儿童项目）⚠️。

### 3.8 工资税与工伤保险（只列起征点和链接）

| 辖区 | 来源 |
|---|---|
| NSW $1.2m，5.45% | https://www.revenue.nsw.gov.au/taxes-duties-levies-royalties/payroll-tax/lodge-and-pay-returns/thresholds-and-rates |
| VIC $1.0m，4.85% | https://www.sro.vic.gov.au/about-us/rates-and-statistics/current-rates/payroll-tax-current-rates （✅ 页面 2026-09-29 更新，仍为"from 1 July 2025 onward"，即 2026-27 适用同一标准） |
| QLD $1.3m，4.75%/4.95% | https://qro.qld.gov.au/payroll-tax/calculate/rates-thresholds/ |
| WA $1.0m（至 $7.5m 递减），5.5% | https://www.wa.gov.au/government/multi-step-guides/payroll-tax-employer-guide/calculation-payroll-tax-employer-guide （页面更新于 2026-06-02） |
| SA $1.5m，4.95% | https://www.revenuesa.sa.gov.au/forms-and-publications/documents/guides-to-legislation/guide-to-legislation-payroll-tax/2025-26-guide-to-legislation-payroll-tax （⚠️ 2026-27 仍未在 RevenueSA 官方页面核实：页面返回 403；聚合网站摘要显示仍为 $1.5m / 4.95%） |
| TAS $1.25m，4%/6.1% | https://www.sro.tas.gov.au/payroll-tax/rates-thresholds |
| ACT $1.75m（2026-07-01 起；之前 $2.0m ✅），6.75% 起 | https://www.revenue.act.gov.au/about-the-act-revenue-office/news/act-budget-2026-27-updates ；https://www.revenue.act.gov.au/business-taxes-and-levies/payroll-tax/calculating-payroll-tax ；https://www.revenue.act.gov.au/business-taxes-and-levies/payroll-tax/about-payroll-tax |
| NT $2.5m，5.5% | https://treasury.nt.gov.au/dtf/territory-revenue-office/payroll-tax/payroll-tax-rates-and-thresholds ；另有"2026-07-01 起大雇主新税率"公告 ⚠️（403 未打开）：https://treasury.nt.gov.au/dtf/territory-revenue-office/whats-new/new-payroll-tax-rate-for-large-employers-from-1-july-2026 |

注意：起征点按"全澳工资总额"计算后在各州按比例分摊，并有 grouping 规则；在多个州雇人时，每个州都要单独评估。

工伤保险：icare NSW https://www.icare.nsw.gov.au/ · WorkSafe Victoria https://www.worksafe.vic.gov.au/ · WorkCover Queensland https://www.worksafe.qld.gov.au/ （WorkCover QLD 承保：https://www.workcoverqld.com.au/）· WorkCover WA https://www.workcover.wa.gov.au/ · ReturnToWorkSA https://www.rtwsa.com/ · WorkSafe Tasmania https://worksafe.tas.gov.au/ · WorkSafe ACT https://www.worksafe.act.gov.au/ · NT WorkSafe https://worksafe.nt.gov.au/ （⚠️ 这些链接凭机构官方域名列出，18/10/2026 仍未逐一打开核实）。承保模式（18/10/2026，多为常识级，⚠️）：NSW icare（Nominal Insurer，SIRA 监管）、VIC WorkSafe、QLD WorkCover Queensland、SA ReturnToWorkSA 为政府承保；WA、TAS、ACT、NT 由 approved / licensed private insurers 承保（ACT 名单见 https://www.worksafe.act.gov.au/workers-compensation/approved-insurers ，NT 见 https://worksafe.nt.gov.au/workers-compensation/insurers ，均为摘要级）。

### 3.9 疫苗 / 入场要求（截至 2026-10）

- **联邦**：ACQSC 的 mandatory flu vaccination program —— providers 须为员工和志愿者提供免费年度流感疫苗并保存记录；*Australian Immunisation Handbook* 建议所有住民、员工、志愿者、访客每年接种流感疫苗。访客指引：身体状况良好、无呼吸道症状，强烈鼓励入场前做 RAT、鼓励戴口罩，感染后至少 7 天且无症状才可探访。来源：https://www.agedcarequality.gov.au/resource-library/mandatory-flu-vaccination-program ；https://immunisationhandbook.health.gov.au/recommendations/healthcare-workers-carers-and-household-contacts-of-people-in-high-risk-groups-are-recommended-to-receive-influenza-vaccine-every-year ；https://www.health.gov.au/topics/aged-care/managing-infectious-respiratory-disease/managing-COVID-19-in-aged-care
- **联邦补充（18/10/2026）**：这是"提供"（offer）免费疫苗的义务，不是员工强制接种；Aged Care Rules 2025 有疫苗记录（ss154-10 至 154-25）和报告（ss166-10 至 166-25）条款，"offer free" 的具体条文号 ⚠️ 未定位（`law-library/aged-care-rules-2025-vol*-compilation-2026-08-01.pdf` 待查）。
- **NSW**：对私营 RACH 员工（包括来访的 agency 人员、志愿者）"强烈建议"接种流感疫苗；访客强烈建议接种。✅ **PD2026_004**（2026-02-25 发布，取代 PD2024_015）：NSW Health 的 Category A 人员（**含承包商**；明确包括 NSW Health 运营的 Multipurpose services 和 residential aged care homes）每年 **6 月 1 日前** 须接种季节性流感疫苗；COVID 疫苗为强烈建议，不强制。✅ 最后一项养老相关 COVID 公共卫生令（Care Services Order (No 3) 2022）于 **2022-11-30 23:59** 结束（据 NSW Health PHO 页面摘要）。来源：https://www.health.nsw.gov.au/Infectious/Influenza/Pages/care-facilities.aspx ；https://www1.health.nsw.gov.au/pds/ActivePDSDocuments/PD2026_004.pdf ；https://www.health.nsw.gov.au/Infectious/covid-19/Pages/racf-latest-advice.aspx
- **VIC**：Secretary Directions（2022-04-08 起）要求指定 healthcare workers 每年 8/15 前接种流感疫苗，适用于公营医院/卫生服务运营的住宿养老，对象是有直接面对面接触的人员。养老方面只覆盖公营或教会（denominational）卫生服务运营的住宿养老。2025 年未见修改，2026 年的行业培训材料仍引用该要求，但 2026 年是否仍有效 ⚠️ 未在官方页面确认。访客 RAT 相关指引可能已过时 ⚠️。来源：https://www.health.vic.gov.au/immunisation/vaccination-for-healthcare-workers ；https://www.health.vic.gov.au/publications/immunisation-guidelines-for-health-care-workers ；https://www.health.vic.gov.au/publications/management-of-acute-respiratory-infection-outbreaks-including-covid-19-and-influenza
- **QLD**：COVID 养老 directions 和 HED 02/20（流感）已撤销或"not current"；HED 01/16（MMR、水痘、百日咳等疫苗可预防疾病）仍有效；流感为建议，不强制（摘要级）。来源：https://www.health.qld.gov.au/system-governance/legislation/cho-public-health-directions-under-expanded-public-health-act-powers/revoked/covid-19-vaccination-requirements-for-workers-in-residential-aged-care-and-disability-accommodation-services-direction ；https://www.health.qld.gov.au/__data/assets/pdf_file/0029/444872/vaccination-of-healthcare-workers.pdf
- **WA**：MP 0132/20 Staff Member Influenza Vaccination Program Policy 是 WA Health 机构的强制要求（2024-05-30 修订），不覆盖私营养老（摘要级）。来源：https://health.wa.gov.au/About-us/Policy-frameworks/Public-Health/Mandatory-requirements/Communicable-Disease-Control/Immunisation/Staff-Member-Influenza-Vaccination-Program-Policy
- **SA**：SA Health 疫苗可预防疾病政策（Category A/B/C）覆盖 SA Health、LHN、SA Ambulance 的员工、**承包商**、学生、志愿者；COVID 强制已于 2024-07 取消（摘要级）。来源：https://www.sahealth.sa.gov.au/wps/wcm/connect/Public+Content/SA+Health+Internet/Clinical+Resources/Clinical+Programs+and+Practice+Guidelines/Immunisation+for+health+professionals/Health+care+worker+immunisation+and+screening+requirements
- **ACT**：建议养老员工和志愿者每年接种流感疫苗，不强制（摘要级）。来源：https://www.act.gov.au/health/vaccines-and-immunisations/influenza-vaccinations/influenza-vaccinations-for-aged-care-workers
- **TAS / NT**：未发现现行强制要求 ⚠️；以设施政策为准。

### 3.10 监控设备法 / 工作场所监控（录音）（18/10/2026 新增）

> 用途：这是整班录音（Shift Capture：护士随身录自己的口述，可能录到住户、同事的对话）的上线门槛，也是 `rules/legal-reference-map.md` 列出的本地资料缺口。下表除 WA 外均按官方现行版本原文核对（WA 已读原文，但未确认是最新 compilation ⚠️）。完整 URL 见第 6 节。

**表 D：参与方录音 private conversation 的同意规则**

| 辖区 | 法律（核对版本） | 罪行条款 | 参与方本人能否不经他人同意录音 | 主要例外 | 传播/公开限制 | 最高刑罚（个人） |
|---|---|---|---|---|---|---|
| NSW | *Surveillance Devices Act 2007*（2026-08-14 版） | s7(1)(b) | **不能**：须全体 principal parties 同意（s7(3)(a)） | s7(3)(b)：一名 principal party 同意，且 (i) 录音为保护其 lawful interests 所合理必需，或 (ii) 不是为了向非参与方传播；s7(2)(c) 无意中听到 | s11（只管违法录音；例外 s11(2)、s14A） | 100 PU 或 5 年；法人 500 PU |
| VIC | *Surveillance Devices Act 1999*（v048，2025-12-10） | s6(1)：只禁止录"to which the person is not a party"的对话 | **能**（推定） | 仅执法/令状 | **s11 覆盖所有经设备取得的记录，包括合法录音**；例外：每一方同意、为公共利益或保护 lawful interests 合理必需、法律或纪律程序 | 2 年 / 240 PU；法人 1200 PU |
| QLD | *Invasion of Privacy Act 1971* | s43(1) | **能**（s43(2)(a)） | 电话中无意听到 | s45：参与方不得传播，除非给其他参与方、全体同意、法律程序，或合理必需（公共利益、职责、lawful interests） | 40 PU 或 2 年 |
| WA | *Surveillance Devices Act 1998*（02-g0-00 版 ⚠️） | s5(1)(b) | **不能** | s5(3)(c) 每一名 principal party 同意；s5(3)(d) 一名同意且为保护其 lawful interests 合理必需；s5(2)(e) 无意听到；Part 5 公共利益 | s9（例外 s9(2)） | $5,000 或 12 个月；法人 $50,000 |
| SA | *Surveillance Devices Act 2016*（2023-09-21 版） | s4(1)(b) | **不能** | s4(2)(a)(i) 全体 principal parties 同意；s4(2)(a)(ii) 为保护**录音者本人** lawful interests 合理必需；s4(2)(f) 无意听到 | s9：基于 lawful interests 例外取得的材料只能给参与方、经每一方同意、给调查者、用于程序、给媒体或经法官命令（罚 $10,000） | $15,000 或 3 年；法人 $75,000 |
| TAS | *Listening Devices Act 1991*（authorised 2019-02-14 版） | s5(1)(b) | **不能** | s5(3)：全体 principal parties 同意，或一名同意且为保护其 lawful interests 合理必需 / 不是为了向非参与方公开；s5(2)(d) 无意听到 | s9（违法录音）、s10（参与方的记录） | 一般罚则 40 PU（⚠️ s5 罚则措辞不清） |
| ACT | *Listening Devices Act 1992*（R10，2022-02-11） | s4(1)(b) | **不能** | s4(3)：每一名 principal party 同意，或一名同意且合理相信为保护 lawful interests 所必需 / 不是为了向非参与方公开；s4(2)(b) 无意听到 | s5（参与方的记录）、s6、s7（持有） | 50 PU（s4）；s5 另加 6 个月 |
| NT | *Surveillance Devices Act 2007*（2026-06-01 版） | s11(1)：只禁止录"to which the person is not a party"的对话 | **能** | s43 公共利益紧急使用 | **s15 覆盖所有经设备取得的记录**；例外：每一方同意、为公共利益或保护 lawful interests 合理必需、法律或纪律程序 | 250 PU 或 2 年 |

**关键解读（运营参考，不是法律意见）**
- **"一方同意"只保护参与方本人。** 护士录自己的口述没有问题；但设备录到的住户之间、同事之间、住户与家属之间的对话，护士**不是参与方** → 在 8 个辖区都属于录他人的 private conversation，原则上需要这些人的同意。
- "无意中听到"（unintentional hearing）例外针对的是**听到**，不能用来覆盖有意的连续录音。
- "保护 lawful interests 合理必需"例外解释很窄，不能当作产品的常规依据。
- 即使录音合法，**VIC s11、NT s15、QLD s45、SA s9 也限制把录音/内容传播给第三方**——把录音或转写发给 careKind（vendor）、上传云端，都可能落入"communicate or publish"，需要每一方同意或落入例外 ⚠️（须律师确认 vendor 处理是否构成 communicate）。
- **联邦 statutory tort**（Privacy Act 1988 Sch 2，2025-06-10 起）："intruding upon seclusion" 明确包括"listening to or recording"他人的私人活动，须为故意或轻率（cl 7）。所有辖区都适用，与州同意规则无关。来源：`law-library/privacy-act-1988-compilation-2026-06-04.pdf`。

**表 E：工作场所监控（员工告知）**

| 辖区 | 法律 | 覆盖的监控 | 告知要求 | 禁区 |
|---|---|---|---|---|
| NSW | *Workplace Surveillance Act 2005*（2026-03-28 版）✅ | camera、computer、tracking；**不含** listening device（s3 定义的注释；录音归 SDA，s4(3)） | s10：开始前至少 **14 天**书面通知（员工同意时可更短；email 可以）；写明类型、方式、开始日期、是否连续/持续 | s15：更衣室、卫生间 |
| ACT | *Workplace Privacy Act 2011*（2021-06-23 起的版本）✅ | optical、data、tracking device（s11）；**不含** listening device（录音归 ACT LDA） | s13：至少 **14 天**书面通知（可约定更短；可以是雇主政策） | s41：卫生间、更衣室、淋浴间、育婴室、祈祷室、医务室等（50 PU）；s42：员工不在工作时不得监控 |
| VIC | *Surveillance Devices Act 1999* Part 2A ✅ | optical **和 listening** device | 没有一般性的告知制度 | s9B：卫生间、盥洗室、更衣室、哺乳室禁止使用（2 年 / 240 PU）；s9C 禁止传播此类记录 |
| QLD / WA / SA / TAS / NT | 无一般性工作场所监控法 | — | 适用 SDA / 一般雇佣法 + 联邦 Privacy Act（员工记录豁免只适用于雇主本身） | — |

**改革动态（2025–2026）**
- **VIC**：议会 Economy and Infrastructure Committee 工作场所监控调查报告（2025-05-13，29 项发现、18 项建议）；政府回应（页面 2025-11-18 更新）原则上支持 15 项并表示将制定新法，未见法案，也未专门提到录音 ⏳。二手资料称可能立法规定相称性和 14 天通知 ⚠️。
- **NSW**：Legislative Council "Future of work"（工作场所监控与自动化）调查有政府回应（摘要级）；未见 WSA 修正。*WHS Amendment (Digital Work Systems) Bill* 据二手资料 2026-02-12 通过、2026-02-18 assent，生效日期待定 ⚠️（未在 legislation.nsw.gov.au 核对）。
- **QLD**：QLRC 2020 年报告建议取代 *Invasion of Privacy Act 1971*；DJAG 2023-04 咨询文件提出分阶段改革，未见法案 ⏳。
- VLRC / NSW LRC / TLRI：未查到 2025–2026 年的监控设备法新报告（仅搜索，不能下定论）。

### 3.11 州政府 ICT / 网络安全 / 数据驻留（卖给州政府运营的养老院时）（18/10/2026 新增）

> 这些是**政府机构的内部政策**，不直接约束 careKind，但会通过采购评估和合同条款传导给 SaaS 供应商。"已核实"表示打开了官方页面/PDF；"摘要"表示只看到搜索摘要。完整 URL 见第 6 节。

| 辖区 | 文件（版本/日期） | 传导给 SaaS 供应商的要求 | 核实程度 |
|---|---|---|---|
| NSW | *NSW Cyber Security Policy 2026–2027*；Circular DCS-2025-04（2025-08-04 起） | MR 1.10：agency 须识别和管理第三方供应商风险；MR 3.3–3.10 为 Essential Eight；agency 须在 **24 小时内**向 Cyber Security NSW 报告事件（DCS-2025-04）；DCS-2025-01 限制有 FOCI（外国所有、控制或影响）风险的产品 | 政策与 MR 页面已核实；circular 摘要 |
| NSW 合同 | ICT Purchasing Framework：ICTA/MICTA（≥$1m 或高风险）、Core&（<$1m、低风险）；ICTA 模板 2024-12 | ICTA cl 21 Security、cl 22 Security incident notification、人员背景审查；旧 Digital.NSW Cloud 合同 cl 9.4：数据存放在 **NSW 以外** 须客户同意 | 摘要；ICTA 事件通知时限 ⚠️ 未读到 |
| NSW Health | PD2020_046 Electronic Information Security（2020-12-09；复审日 2023-12-09 已过） | 适用于承包商、服务商和第三方 | 摘要；⚠️ 是否已被取代未核实 |
| VIC | *VPDSS V2.0*（2019-10-28，仍现行）；Implementation Guidance V2.4（约 2026-01） | **Standard 8（Third Party Arrangements）**：agency 须确保 CSP 安全处理信息并遵守 VPDSS，责任不能经合同转移；预计有合同条款、第三方登记、全生命周期保证；事件报 OVIC。健康信息另适用 HRA **HPP 9**（出 VIC 须接收方受实质相似法律约束，或经同意等）。未见 VIC Health 或全政府层面的云端驻留强制规定 | 标准页面已核实；Standard 8 文本和 HPP 9 为摘要 |
| QLD | *Information and cyber security policy (IS18)* **v10.0.0（2026-06-17）**（取代 v9.0.0，2025-02） | 基于 ISO 27001 的 ISMS；Essential Eight（agency 自定成熟度目标）；与关键程度相称的安全保证（会向供应商要证据）；**在澳洲境外存储/处理 HIGH/MEDIUM impact 信息前，须先向 Cyber Security Unit 报告**；年度报告 9/30 截止 | 已核实 |
| WA | *2026 WA Cyber Security Policy*（页面 2026-10-07 更新；2024 版仍列出）；*Data Offshoring Governance* 指引（2025-06）；Premier's Circular 2025/13 | 2024 版 cl 3.4：采购中评估供应商信息安全风险。Offshoring：健康信息属 "sensitive personal information" = **Tier 1：须在澳洲托管（最好两处）**、静态和传输加密、评估 FOCI、人员须有 police clearance、MFA、99.9% 可用性；Tier 2/3 只能出境到 Five Eyes。PRIS IPP 9 跨境披露 | 页面和 offshoring PDF 已核实；2026 版政策正文未读 ⚠️ |
| SA | *SACSF V2.0*（Cabinet 2025-06-23 批准；agency 须在 2026-03-23 前合规）；供应商 Guideline 2.0；Ruling 2.1（境外数据） | 合作前评估供应商风险；供应商须证明合同约定的控制措施；OCIO 建议 OFFICIAL: Sensitive 和 PROTECTED 数据留在澳洲，偏好澳洲所有的供应商；出境须 Accountable Authority 接受风险 | 摘要（网站 403） |
| TAS | *Tasmanian Government Cyber Security Policy*（2022 更新，V1.1）；Cyber Security Strategy 2024–2028；Cloud Policy（2020） | 基于风险；2020 Cloud Policy 取消了 2015 年的"岛内托管"规则：经风险评估（含网络安全和主权）后可岛外托管，条件相当时优先岛内 | 摘要（403）；⚠️ 2025–26 新版本未核实 |
| ACT | *ACT Government Cyber Security Policy* **V3.5（2025-11-10）**（ACT Protective Security Framework 下） | §4.3：含 OFFICIAL: Sensitive – Personal Privacy 信息的云服务 **"should be hosted in Australia"**，除非采取处理措施且业务系统负责人接受剩余风险；健康信息须让 ACT Cyber Security Centre 参与；Territory 数据上云前须做 CISO 认可的强制安全评估（Government Critical 等系统），每 3 年复审；云服务须在 DCBR 登记，含供应商安全联系人；§13.4 供应商访问控制 | 已核实（PDF） |
| NT | DCDD 网络安全政策和云策略**未公开** | 未见公开的 offshoring 规则；预计按合同逐案要求 | 摘要 ⚠️ |
| 联邦（常被引用） | Hosting Certification Framework（PSPF Policy 11）；IRAP；Essential Eight | HCF 目前只认证数据中心和云服务商，不认证 SaaS → careKind 应部署在 HCF 认证的云区域（如 AWS/Azure Sydney）并引用其认证；IRAP 没有州政策强制，但安全问卷常要求；Essential Eight 在 NSW、QLD 对 agency 强制，其他州常要求供应商说明成熟度（通常 ML2）。Home Affairs 2025-07 就 HCF 更新咨询，结果未查到 | 摘要 |

**小结**：健康信息实际上在所有辖区都要求澳洲境内托管（WA Tier 1 和 QLD"出境前报告"最严格；VIC HPP 9、ACT 政策指向同一方向；NSW 合同要求数据出 NSW 须同意）。每个辖区都要预期合同前的安全评估。

---

## 4. 对 careKind 的影响

### 4.1 作为 vendor 适用哪些隐私制度

| 客户类型 / 所在州 | careKind 直接适用 | 通过合同传导 |
|---|---|---|
| 私营/NFP 养老院（全国） | Privacy Act 1988（如不是 HSP 且营业额 ≤$3m，可能豁免 ⚠️ → 建议 s6EA opt-in） | APPs、NDB 配合义务、客户的 Aged Care Act 信息管理义务 |
| + VIC | **HRA 2001 s11（无小企业豁免，直接适用）✅** | HPPs |
| + NSW | HRIPA：营业额 ≤$3m 且不是 HSP 时属 small business operator，**不直接适用**；超过 $3m 或被认定为 HSP 时直接适用 ✅（s4、s9、s11） | HPPs、s25 保存期 |
| + ACT | HR(P&A) Act：careKind 占有或控制健康记录即为 "record keeper"，Principle 4（安全、保存、销毁登记）直接适用 ✅ | — |
| 所有州（录音功能） | 各州监控设备法 + 联邦 statutory tort（见 3.10、4.11） | 客户的员工告知义务（NSW/ACT 工作场所监控法不含录音，但客户政策通常要求告知） |
| VIC 公营养老（PSRACS） | HRA（State contract 下还适用 s12 外包归责） | **PDP Act s17 绑定 IPPs + VPDSS Standard 8 安全控制 + OVIC 事件通报配合** |
| NSW 公营（LHD 运营的 MPS 等） | HRIPA | PPIP Act、MNDB 配合（30 天评估）；NSW Cyber Security Policy 第三方要求；PD2026_004 疫苗（现场人员） |
| QLD 公营 RACF | — | IP Act s35 绑定 QPPs + s33 境外披露 + MNDB 配合（CSP 不直接承担 MNDB，但泄露算 agency 的）；IS18 v10 出境前报告 |
| WA 公营 | PRIS（作为 CSP，**仅当合同写入适用条款**）✅ 2026-07-01 起；无小企业豁免 | IPP 9 境外、IPP 10 自动化决策；2027-01-01 起 breach scheme；Data Offshoring Tier 1 境内托管 |
| SA / TAS / NT / ACT 公营 | TAS PIP Act（合同 custodian）、ACT TPPs（CSP） | SA PC012 审计条款、NT IPPs |

### 4.2 VIC 公营养老预计会出现的合同条款
- PDP Act s17 条款：绑定 IPPs（同样方式、同样程度），约定责任转移。
- VPDSS：须配合机构的 Protective Data Security Plan 和安全评估；数据安全分级（BIL）；事件须及时报告，便于机构向 OVIC 通报；审计权；分包限制；合同结束时归还/销毁数据。
- HRA：健康信息适用 HPPs（包括 HPP 9 跨境转移）。
- 预计会有 **数据驻留（data residency）要求**：存储和 LLM 推理都在澳洲境内，禁止或限制境外访问（IPP 9 / HPP 9）。⚠️ 具体是否为硬性要求取决于各卫生服务的采购模板。
- VPDSS **Standard 8（Third Party Arrangements）**：预计要求登记第三方安排、全生命周期安全保证（准入评估 → 运行期复核 → 退出时归还/销毁）。

### 4.3 数据驻留
- 默认：所有客户数据（音频、转写、草稿）都在澳洲区域存储和处理；LLM 子处理方须提供 AU 区域或零数据保留承诺；子处理方清单向客户披露。这样能同时满足 IPP 9（VIC）、QLD s33、WA IPP 9、APP 8，是最省事的统一做法。
- **18/10/2026 补充（见 3.11）**：州政府 ICT 政策让"境内托管"从"最省事"变成了**进入公营市场的硬门槛**：WA Data Offshoring 指引把健康信息列为 Tier 1（须在澳洲托管，最好两处，并须 police-cleared 人员、MFA、99.9% 可用性）；QLD IS18 v10 要求 agency 在境外处理 HIGH/MEDIUM 信息前报告；ACT V3.5 要求个人隐私信息在澳洲托管并做上云前评估；NSW Cloud 合同要求数据出 NSW 须客户同意（⚠️ 注意是"出 NSW"而不是"出澳洲"：部署在 AWS/Azure Sydney 区域可满足，Melbourne 区域需取得同意）。
- 建议：主区域 Sydney + 灾备区域 Melbourne（都是 HCF 认证的云区域）；在安全资料包里写明各子处理方的 HCF / IRAP 状态；评估 LLM 供应商的 FOCI 风险（NSW DCS-2025-01、WA）。

### 4.4 泄露通报多制度矩阵（我们要为客户提供的支持）

| 客户 | 法定制度 | 时限 | careKind 合同承诺建议 |
|---|---|---|---|
| 私营（全国） | 联邦 NDB（Privacy Act Part IIIC） | 现行：30 天内评估，确认后尽快通知；Tranche 2 草案拟加 **72 小时内向 OAIC 提交声明**（可先交不完整声明）⏳ | 发现后 **24 小时内**通知客户（为客户留出 72 小时窗口的 2/3） |
| NSW 公营 | PPIP Part 6A MNDB（agency 义务） | 30 天评估，"立即"通报；另外 agency 须在 **24 小时内**向 Cyber Security NSW 报告网络安全事件（DCS-2025-04） | **尽快，最迟 12 小时**（客户自身有 24 小时网络事件时限）⚠️ 以 ICTA cl 22 为准 |
| QLD 公营 | IP Act ch 3A MNDB（agency 义务；CSP 持有数据的泄露算 agency 的） | 30 天内评估（可书面延期），确认后"as soon as practicable"通知 OIC 和个人 | 24 小时 + 配合评估 |
| VIC 公营 | OVIC Information Security Incident Notification；健康信息可报 HCC（自愿） | ⚠️ OVIC 时限本轮未核实 | 24 小时 + 配合 VPDSS 事件流程 |
| WA 公营 | PRIS breach scheme 2027-01-01 起 ⏳ | ⚠️ 时限待正式指引 | 24 小时 |
| SA 公营 | PC012：通知 Privacy Committee；SACSF 供应商事件报告 | — | 24 小时 |
| TAS / NT / ACT 公营 | 无法定 MNDB（ACT 只限 TFN） | — | 24 小时 + 自愿通报配合 |
| 录音涉及的第三方 | 监控设备法下的违法录音/传播不是"泄露通报"制度，但误录、误传可能同时构成 eligible data breach | — | 发现误录非护士本人的对话：按事件处理，删除并记录 |
| 同时属于 SIRS 事件 | Aged Care Act SIRS（P1 24 小时） | — | 如果 AI 草稿/转写揭示 reportable incident，产品应提示护士按 SIRS 流程处理，但 **不替客户判断**。 |

统一 24 小时通知客户的承诺可以覆盖大多数制度；**NSW 公营客户**因自身有 24 小时网络事件报告时限，合同里很可能要求更短（建议内部 SLA 定为 12 小时内初报）。如联邦 72 小时制度通过，24 小时承诺仍够用，但事件响应必须能在 24 小时内给出声明所需的内容（泄露描述、信息类型、建议个人采取的步骤、已采取的减害措施）。详细流程见 `../data-breach-response-plan.md`。

### 4.5 保存期设计
- careKind 不是 record of truth：定稿进入客户的临床系统，客户负责 7 年 / 25 岁的保存义务（VIC HRA、NSW HRIPA s25、ACT）。
- 我们端：原始音频和中间转写实行最短保存（如 30 天内删除，可由客户配置），定稿草稿镜像按客户指示保存或删除；合同终止时导出后删除。
- 删除功能须支持客户的法定期限：不得在客户的法定期限内删除"唯一副本"，所以产品必须保证定稿先写回客户系统，再删除我们这端的数据。
- 未成年情况在住宿养老中极少，但 VIC/NSW/ACT 的 25 岁规则应在配置中保留。
- **ACT 特别注意（18/10/2026）**：careKind 占有或控制健康记录即为 "record keeper"；删除我们端的副本时，应依 Principle 4.3 cl 2（非 HSP 不再需要时销毁）执行，并按 Principle 4.2 记入**销毁/转移登记册**（消费者、期间、日期；登记保存 7 年）。NSW s25(2)–(3) 对 HSP 也有类似的删除/转移记录要求。建议产品删除功能统一生成删除日志（不含健康内容），满足两地要求 ⚠️（律师确认）。

### 4.6 约束性措施文档模板（对辖区敏感）
- 2026-12-01 是关键日期：联邦 hierarchy 过渡期结束（除非再延期 ⚠️）。模板不能硬编码"联邦五级 hierarchy"。
- 模板字段建议：所在州/领地；同意来源类型（VIC Tier 1–4 / QCAT 委任 guardian / NSW guardian 或 enduring guardian 的 RP 职能 / SA SDM 或 SACAT / 联邦 hierarchy 级别）；委任文件引用；同意日期和有效期；behaviour support plan 链接；监测和复查记录。
- AI 只负责起草记录，**不判断谁有权同意、不建议使用约束性措施**；草稿中缺少同意来源时应标黄提示护士核对。
- 涉及 inappropriate use of restrictive practices 的内容会触发 SIRS，模板中应提示护士按机构流程处理。

### 4.7 员工访问现场（筛查 / 疫苗）
- 所有会进入设施的 careKind 员工（实施、培训、客户成功）：持有不超过 3 年的 **National Police Certificate**（如曾在海外居住，另备 statutory declaration）；每年接种流感疫苗并保留证明；COVID 疫苗按设施要求；入场前做 RAT、有症状不进入。
- 如被客户认定为 "aged care worker"（经 registered provider 聘用/承包），客户要保存我们员工的筛查记录 7 年，我们要配合提供。
- VIC 公营设施：有直接接触的人员可能落入 Secretary Directions 的流感疫苗要求（每年 8/15 前）⚠️；**NSW Health 运营的 MPS / 养老院：PD2026_004 明确包括承包商，Category A 须每年 6/1 前接种流感疫苗** ✅；SA Health 政策也覆盖承包商。
- 统一的新养老工人筛查尚未上线 ⏳；在此之前 National Police Certificate（≤3 年）仍是现实选择。WA 公营 Tier 1 托管还要求能接触数据的人员有 police clearance（见 3.11），所以**能访问生产数据的工程师也应办 police certificate**。
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
6. **（18/10/2026 补充）Shift Capture 的上线顺序**：如果要整班录音，QLD、VIC、NT 的参与方录音规则相对宽松，但 3.10 的分析表明，**录到非护士本人参与的对话在所有州都有风险**。所以产品设计（只录护士本人）比选州更重要；NSW、WA、SA、TAS、ACT 在没有完成律师意见前不应开放"环境录音"模式。

### 4.10 给客户的合同条款清单（vendor 义务汇总，18/10/2026）

| 条款 | 内容 | 依据 |
|---|---|---|
| 角色与指示 | careKind 是 processor / service provider，只按客户的**书面（documented）指示**处理；指示须写明处理目的 | Tranche 2 草案 controller/processor 框架 ⏳；WA PRIS CSP 条款；QLD s35 |
| 直接义务 | 即使是 processor，careKind 仍直接负责 **APP 1（透明）和 APP 11（安全、销毁）**；VIC HRA s11、ACT HR(P&A) Act（record keeper）直接适用 | Consultation Paper Sch 6；HRA s11；ACT Dictionary |
| 绑定条款 | VIC 公营：PDP Act s17 绑定 IPPs；WA 公营：State services contract 写入 PRIS Part 2 / IPPs 适用条款；QLD：绑定 QPPs + s33；SA：PC012 IPPs + 审计权 | 3.3 |
| 数据驻留 | 存储、处理、LLM 推理都在澳洲；数据出 NSW（NSW 公营）须事先同意；子处理方清单 + 变更提前通知 | 3.11；HPP 9；IPP 9 |
| 安全 | Essential Eight 成熟度声明（目标 ML2）；ISO 27001 / IRAP 路线图（如实写"计划中"）；HCF 认证云区域；FOCI 声明 | NSW MR 3.3–3.10；QLD IS18；ACT V3.5 |
| 事件通知 | 发现后 24 小时内通知（NSW 公营建议 12 小时内初报）；配合客户 30 天评估和 72 小时声明（如适用） | 4.4 |
| 审计与评估 | 允许客户审计和上线前安全评估；ACT 每 3 年复审 | SA PC012；ACT V3.5 |
| 人员 | 能接触数据的人员 police certificate；现场人员按设施要求接种疫苗 | 3.7、3.9；WA Tier 1 |
| 保存与删除 | 定稿先写回客户系统再删除；删除/转移登记（ACT Principle 4.2、NSW s25(2)–(3)）；合同终止时归还或销毁 | 4.5 |
| 录音（如启用 Shift Capture） | 客户负责员工告知和住户/家属告知；careKind 负责默认只录护士本人、过滤非护士语音、不保留原始音频 | 3.10、4.11 |
| 不训练 | 不用客户数据训练模型（已有铁律） | `rules/01-operations-rules.md` §2 |

### 4.11 Shift Capture（整班录音）的影响（18/10/2026）

1. **只录护士本人**：默认模式应是"按键/唤醒后录护士口述"，而不是环境连续录音。护士是参与方的对话（护士对设备口述）在所有州都不构成录他人对话；连续环境录音会录到护士不是参与方的对话，在 8 个辖区都需要相关人员同意。
2. **声纹过滤 / 非护士语音丢弃**：在设备端或最早的处理环节丢弃非注册护士的语音，并且**不保存原始音频**。⚠️ 注意：这可以降低风险，但**不能消除**"录音"本身的行为——设备一旦捕获了他人的对话，就可能已经构成 recording；过滤只能减少后续的传播和保存。声纹本身是生物特征信息（Privacy Act 下的 sensitive information），需要护士同意，参见 `rules/legal-reference-map.md` 中的"生物特征信息"缺口。
3. **传播限制**：VIC s11、NT s15、QLD s45、SA s9 限制传播录音内容；把音频上传给 careKind 处理是否构成 "communicate"，须律师意见 ⚠️。在得到意见前，优先设备端转写、只上传护士本人口述的文本。
4. **员工告知**：NSW/ACT 的工作场所监控法不覆盖录音，但客户作为雇主仍应书面告知护士（录什么、何时录、谁能看、保存多久），建议参照 14 天书面通知的标准；VIC 禁止在卫生间、更衣室、哺乳室等使用 listening device（s9B），产品应提供"禁区自动暂停"或明确的手动暂停。
5. **住户/家属告知**：在入住告知和隐私声明中说明护士可能使用口述记录设备；**不能把告知当成同意**——NSW、WA、SA、TAS、ACT 需要 principal parties 同意，认知障碍住户也无法有效同意。所以设计必须以"不录他人对话"为前提，告知只是补充。
6. **上线门槛**：Shift Capture 上线前须有律师书面意见（至少覆盖 NSW、VIC、QLD 三个首批州）和 DPIA；营销不能说"录下一切、自动记录"。

---

## 5. ⚠️ 需核实清单（18/10/2026 复核状态）

状态：✅ 已解决 · ◐ 部分解决 · ⚠️ 仍未解决 · ➡️ 移交 `state-clinical-practice-rules.md`

1. ⚠️ careKind 是否构成 Privacy Act 下的 "health service provider"；小企业豁免是否适用；是否做 s6EA opt-in。——属法律判断，须律师意见。注意：NSW HRIPA 的适用也取决于这一点（s4 引用 Cth s6D）。
2. ◐ 联邦 Tranche 2：暴露稿已于 2026-08-31 发布、2026-09-18 截止；72 小时声明要求已在本地 Consultation Paper p.24 确认；截至 18/10/2026 未见提交国会；小企业豁免据二手资料未处理（草案正文未逐条核对）。
3. ✅ NSW HRIPA s4："private sector person" 不包括 Cth small business operator；s9 "holds" 含占有或控制；s11 适用于持有健康信息的组织；无外包条款（现行版本 2026-09-30 原文）。
4. ✅ VIC HRA：s11 直接适用于私营持有者；s12 "Effect of outsourcing" 只管 State contract（Authorised Version No. 050 原文）。
5. ✅ ACT HR(P&A) Act：Principle 4.1 cl 2–3 的保存期原文、"record keeper" 定义（R32 原文）。◐ 新问题：非 HSP record keeper 同时适用 4.1 cl 2 与 4.3 cl 2 时如何协调，须律师确认。
6. ⚠️ 各州公营健康记录 disposal schedule 的具体期限——本轮未逐一打开各档案机构页面；对 careKind 影响有限（定稿保存在客户系统）。
7. ✅（摘要级）QLD：MNDB 义务一般不直接适用于 CSP，CSP 持有数据的泄露可构成 agency 的 eligible data breach；agency 30 天内评估、确认后尽快通知。⚠️ OIC 页面被 Cloudflare 拦截，条文号未核对。
8. ◐ WA PRIS breach scheme 2027-01-01：OIC 页面（2026-09-29 更新）仍是"政府已表示"，未见 proclamation 原文。IPPs 已于 2026-07-01 起实施（OIC 投诉受理 + 二手资料）。
9. ◐ NT、ACT、TAS 的 MNDB：均未查到改革法案（NT 2023 年报、TAS TLRI 2024 均为建议）；未逐页查各议会法案列表。
10. ➡️ 联邦 RPSDM hierarchy 在 2026-12-01 之后是否再延期。
11. ➡️ NSW 2026-12 起的 restrictive practices 新框架。
12. ➡️ SA Part 5A 生效日期与 SACAT 授权要求。
13. ➡️ TAS、ACT、NT 的 RPSDM 立法状态；WA OPA 立场声明的法律效力。
14. ➡️ 各州 elder abuse 一般性强制报告（律师最终确认）。
15. ✅ VIC/QLD 以外没有州对公营住宿养老实行配比：SA 2025 年配比法只管公立医院；WA、ACT 是医院政策/企业协议；TAS 无。⚠️ 剩余：NSW Public Health Act s104 现行条文、SA 配比法生效日期、NT。
16. ◐ 统一养老工人筛查：未立法、无上线日期（"不早于 2026 年"，须与州/领地协商）。⚠️ careKind 员工是否算客户的 "aged care worker" 仍须按合同和 Aged Care Act 定义判断。任务中提到的"2026-07-01 aged care worker screening"未找到官方来源。
17. ◐ VIC Secretary Directions：只覆盖公营/教会卫生服务运营的养老；2026 年是否仍有效、对承包商的适用 ⚠️ 未在官方页面确认；访客 RAT 指引 ⚠️ 未复核。
18. ✅ NSW：最后的养老 COVID 公共卫生令 2022-11-30 结束；PD2026_004 覆盖承包商。◐ 其他州：QLD 无强制；WA、SA 只管州卫生部门机构；ACT 建议；⚠️ TAS、NT 未找到。
19. ◐ VIC 2026-27 ✅（SRO 2026-09-29 页面）；ACT 2026-07-01 前为 $2m ✅；⚠️ SA 2026-27 官方页面 403 未核实；⚠️ NT 2026-07-01 起大雇主新税率未打开。
20. ⚠️ 工伤保险机构链接与承保模式仍主要是常识级，未逐一打开。
21. ⚠️ health.gov.au 多个页面本轮仍抓取超时（screening requirements、care minutes），正式引用前需人工打开。
22. （新）⚠️ 监控设备法：把录音上传给 vendor 处理是否构成 VIC s11 / NT s15 / QLD s45 / SA s9 下的 "communicate or publish"；WA SDA 1998 是否为最新 compilation；TAS s5 罚则。须律师意见。
23. （新）⚠️ 3.11 中：NSW ICTA cl 22 的事件通知时限、NSW Health PD2020_046 是否已被取代、WA 2026 Cyber Security Policy 正文、SA 页面（403）、TAS 和 NT 现行政策。
24. （新）⚠️ NSW *WHS Amendment (Digital Work Systems) Act 2026* 的生效日期和是否影响 AI 工具在工作场所的使用（只见二手资料）。

---

## 6. 2026-10-18 复核来源

访问日期均为 18/10/2026。标注：**原文** = 打开了官方现行文本；**页面** = 打开了官方网页；**摘要** = 只看到搜索摘要（页面 403 / Cloudflare / 超时）；**二手** = 非政府来源。

### 6.1 健康信息与隐私
- NSW HRIPA 2002（现行，version from 30/09/2026）原文：https://legislation.nsw.gov.au/view/whole/html/inforce/current/act-2002-071
- VIC Health Records Act 2001，Authorised Version No. 050 原文：https://content.legislation.vic.gov.au/sites/default/files/2026-04/01-2aa050-authorised.pdf
- VIC Health Records Act 页面（2026-04-29 更新）：https://www.health.vic.gov.au/legislation/health-records-act
- VIC Parliament Hansard 2026-06-02（Health Legislation Amendment (Regulatory Reform) Bill 2026，摘要）：https://www.parliament.vic.gov.au/parliamentary-activity/hansard/hansard-details/HANSARD-2145855009-35656
- ACT HR(P&A) Act 1997 R32（effective 16/11/2025）原文：https://www.legislation.act.gov.au/DownloadFile/a/1997-125/current/PDF/1997-125.PDF
- Privacy Act 1988 s6D（本地 compilation）：`law-library/privacy-act-1988-compilation-2026-06-04.pdf`
- AG Privacy Reform 咨询页面：https://consultations.ag.gov.au/rights-and-protections/privacy-reform/
- Tranche 2 Consultation Paper（本地，p.24 72 小时；pp.36–37 controller/processor）：`law-library/ag-privacy-reform-consultation-paper-2026-08-exposure-draft.pdf`
- HSF Kramer，Tranche 2 分析（二手，摘要）：https://www.hsfkramer.com/insights/2026-09/the-draft-tranche-2-privacy-act-reforms-whats-there-whats-new-and-whats-missing
- QLD OIC "Contractors and data breaches"（摘要）：https://www.oic.qld.gov.au/guidelines/for-government/guidelines-privacy-principles/data-breaches/contractors-and-data-breaches
- QLD OIC MNDB 指引（摘要）：https://www.oic.qld.gov.au/guidelines/for-government/guidelines-privacy-principles/data-breaches/mandatory-notification-of-data-breach
- QLD OIC 地方政府 MNDB 新闻 2026-06-23（摘要）：https://www.oic.qld.gov.au/about-us/news-events/mndb-scheme-for-local-government-from-1-july-2026
- WA OIC Privacy in WA（页面，2026-09-29 更新）：https://www.wa.gov.au/organisation/office-of-the-information-commissioner/privacy-western-australia
- WA OIC Personal information collected on and after 1 July 2026（页面）：https://www.wa.gov.au/organisation/office-of-the-information-commissioner/personal-information-collected-and-after-1-july-2026
- WA OIC Resource 2: How PRIS applies to Contracted Service Providers（摘要）：https://www.wa.gov.au/organisation/office-of-the-information-commissioner/how-pris-applies-contracted-service-providers
- Clayton Utz，WA PRIS CSP（二手，摘要）：https://www.claytonutz.com/insights/2025/november/wa-pris-laws-is-your-business-a-contracted-service-provider-if-so-what-now
- PM Lawyers，WA PRIS 2026-07-01 起实施（二手，摘要）：https://www.pmlawyers.com.au/blog/2026/07/health-blog/western-australias-privacy-reforms-begin-on-1-july-2026/
- NSW IPC MNDB 资料（摘要）：https://www.ipc.nsw.gov.au/resources/guide-guide-regulatory-action-under-mndb-scheme
- NT Information Commissioner 2023 年报（摘要）：https://infocomm.nt.gov.au/__data/assets/pdf_file/0011/1290791/OIC-AR-final-2023.pdf

### 6.2 监控设备法 / 工作场所监控（3.10）
- NSW Surveillance Devices Act 2007（2026-08-14 版）原文：https://legislation.nsw.gov.au/view/whole/html/inforce/current/act-2007-064
- NSW Workplace Surveillance Act 2005（2026-03-28 版）原文：https://legislation.nsw.gov.au/view/whole/html/inforce/current/act-2005-047
- VIC Surveillance Devices Act 1999（v048）原文：https://content.legislation.vic.gov.au/sites/default/files/2025-12/99-21aa048-authorised.pdf
- QLD Invasion of Privacy Act 1971 原文：https://www.legislation.qld.gov.au/view/whole/html/inforce/current/act-1971-050
- WA Surveillance Devices Act 1998（02-g0-00，⚠️ 未确认为最新）原文：https://www.legislation.wa.gov.au/legislation/prod/filestore.nsf/FileURL/mrdoc_45890.htm/$FILE/Surveillance%20Devices%20Act%201998%20-%20%5B02-g0-00%5D.html
- SA Surveillance Devices Act 2016（2023-09-21 版）页面与原文：https://www.legislation.sa.gov.au/lz?path=/c/a/surveillance%20devices%20act%202016 ；https://www.legislation.sa.gov.au/_legislation-documents/lz/c/a/surveillance-devices-act-2016/current/2016.2.un.rtf
- TAS Listening Devices Act 1991 原文：https://www.legislation.tas.gov.au/view/whole/html/inforce/current/act-1991-021
- ACT Listening Devices Act 1992（R10）原文：https://www.legislation.act.gov.au/DownloadFile/a/1992-57/current/PDF/1992-57.PDF
- ACT Workplace Privacy Act 2011 原文：https://www.legislation.act.gov.au/DownloadFile/a/2011-4/current/PDF/2011-4.PDF
- NT Surveillance Devices Act 2007（2026-06-01 版）原文：https://legislation.nt.gov.au/api/sitecore/Act/PDF?id=12191
- VIC 政府工作场所监控调查回应（页面，2025-11-18 更新）：https://www.vic.gov.au/workplace-surveillance
- 联邦 statutory tort（Privacy Act Sch 2）：`law-library/privacy-act-1988-compilation-2026-06-04.pdf`

### 6.3 州政府 ICT / 网络安全 / 数据驻留（3.11）
- NSW Cyber Security Policy（页面）：https://www.digital.nsw.gov.au/policy/cyber-security/cyber-security-policy ；Mandatory Requirements（页面）：https://www.digital.nsw.gov.au/policy/cyber-security/cyber-security-policy/mandatory-requirements
- NSW DCS-2025-04（摘要）：https://arp.nsw.gov.au/dcs-2025-04-cyber-security-nsw-directive-targeted-initiatives-for-nsw-government
- NSW ICTA 模板 2024-12（摘要）：https://www.info.buy.nsw.gov.au/__data/assets/word_doc/0009/993906/ICT-Purchasing-Framework-ICTA-agreement_December2024.docx
- Digital.NSW Cloud Framework customer contract（摘要）：https://www.info.buy.nsw.gov.au/__data/assets/pdf_file/0005/870728/Digital.NSW-Cloud-Framework-customer-contract.pdf ；head agreement（摘要）：https://www.info.buy.nsw.gov.au/__data/assets/pdf_file/0005/870719/Digital.NSW-Cloud-Framework-head-agreement.pdf
- NSW Health PD2020_046（摘要；PDF 404）：https://www1.health.nsw.gov.au/pds/Pages/doc.aspx?dn=PD2020_046
- OVIC VPDSS 标准（页面）：https://ovic.vic.gov.au/information-security/standards/ ；Standard 8 审计报告（摘要）：https://ovic.vic.gov.au/regulatory-action/audit-report-standard-8-of-the-victorian-protective-data-security-standards/
- VIC HPP 9（摘要）：https://health.vic.gov.au/rights-and-advocacy/rights-and-privacy-principles
- QLD IS18 v10.0.0（页面）：https://forgov.qld.gov.au/information-and-communication-technology/qgea-policies-standards-and-guidelines/information-security-policy-is18-2018
- WA Cyber Security Policy（页面）：https://www.wa.gov.au/government/publications/2024-wa-government-cyber-security-policy ；2024 PDF（摘要）：https://www.wa.gov.au/system/files/2024-12/wacybersecuritypolicy.pdf
- WA Data Offshoring Governance（原文）：https://www.wa.gov.au/system/files/2025-06/dataoffshoringgovernancewithwadataoffshoringposition.pdf
- SA SACSF（摘要）：https://www.security.sa.gov.au/cyber-security/sacsf ；Ruling 6：https://security.sa.gov.au/cyber-security/sacsf/sacsf-ruling-6-implementation-of-the-sacsf-v2.0 ；供应商指引：https://security.sa.gov.au/cyber-security/sacsf/suppliers-using-the-south-australian-cyber-security-framework ；Ruling 2.1：https://security.sa.gov.au/cyber-security/sacsf/sacsf-ruling-2.1-offshore-data-storage-and-processing
- TAS DPAC 政策（摘要）：https://www.dpac.tas.gov.au/divisions/digital_strategy_and_services/policies ；Cyber Security Policy V1.1：https://www.dpac.tas.gov.au/__data/assets/pdf_file/0023/254912/Tasmanian-Government-Cyber-Security-Policy-V1.1.pdf
- ACT Cyber Security Policy V3.5（原文）：https://www.act.gov.au/__data/assets/pdf_file/0006/2837121/Cyber-Security-Policy.pdf
- NT DCDD（摘要）：https://dcdd.nt.gov.au/digital-government
- Hosting Certification Framework（摘要）：https://www.hostingcertification.gov.au/framework ；HCF 更新咨询（摘要）：https://www.homeaffairs.gov.au/cyber-security-subsite/files/invitation-to-consultation.pdf

### 6.4 护士配比、筛查、疫苗、工资税
- SA Nurse and Midwife to Patient Ratios Act 2025（摘要）：https://www.legislation.sa.gov.au/_legislation-documents/lz/v/a/2025/nurse-and-midwife-to-patient-ratios-act-2025_44/2025.44.un.pdf
- WA Health 配比（页面）：https://www.health.wa.gov.au/News/2025/Nurse-midwife-to-patient-ratios-to-enhance-health-care
- ACT 配比（摘要）：https://www.act.gov.au/health/providing-health-care-in-the-act/nurses-and-midwives/nurse-and-midwife-patient-ratios
- NSW safe staffing（摘要）：https://www.nsw.gov.au/media-releases/nsw-public-hospitals-to-begin-safe-staffing-roll-out
- NSW RN in nursing homes（摘要）：https://www.parliament.nsw.gov.au/bill/files/3779/Second%20Print.pdf
- TAS（摘要）：https://www.premier.tas.gov.au/latest-news/2026/august/more-nurses,-midwives-and-doctors,-less-locums
- Care minutes provider guide 2026-05（摘要）：https://www.health.gov.au/sites/default/files/2026-05/care-minutes-and-24-7-registered-nurse-requirements-guides-for-registered-providers-of-residential-care-homes.pdf
- 养老工人筛查（摘要）：https://www.health.gov.au/topics/aged-care-workforce/screening-requirements?language=en ；CHSP 筛查指引：https://www.health.gov.au/sites/default/files/2025-10/appendix_d_-_chsp_worker_screening_guidelines.pdf ；ACQSC Managing Worker Risk Policy 2026-01：https://www.agedcarequality.gov.au/sites/default/files/media/managing-worker-risk-policy.pdf
- 工人注册计划（二手）：https://www.theweeklysource.com.au/national-aged-care-worker-registration-scheme-one-step-closer/
- NSW PD2026_004（原文）：https://www1.health.nsw.gov.au/pds/ActivePDSDocuments/PD2026_004.pdf ；NSW 公共卫生令（摘要）：https://www.health.nsw.gov.au/Infectious/covid-19/Pages/public-health-orders.aspx
- VIC 医护人员疫苗指南（摘要）：https://www.health.vic.gov.au/publications/immunisation-guidelines-for-health-care-workers
- QLD 医护疫苗（摘要）：https://www.health.qld.gov.au/__data/assets/pdf_file/0029/444872/vaccination-of-healthcare-workers.pdf
- WA MP 0132/20（摘要）：https://health.wa.gov.au/About-us/Policy-frameworks/Public-Health/Mandatory-requirements/Communicable-Disease-Control/Immunisation/Staff-Member-Influenza-Vaccination-Program-Policy
- SA Health 疫苗要求（摘要）：https://www.sahealth.sa.gov.au/wps/wcm/connect/Public+Content/SA+Health+Internet/Clinical+Resources/Clinical+Programs+and+Practice+Guidelines/Immunisation+for+health+professionals/Health+care+worker+immunisation+and+screening+requirements
- ACT 养老工人流感疫苗（摘要）：https://www.act.gov.au/health/vaccines-and-immunisations/influenza-vaccinations/influenza-vaccinations-for-aged-care-workers
- 联邦疫苗协同函（摘要）：https://www.agedcarequality.gov.au/sites/default/files/media/joint-letter-to-residential-aged-care-board-chairs-on-winter-preparedness.pdf
- VIC SRO 工资税（页面，2026-09-29 更新）：https://www.sro.vic.gov.au/about-us/rates-and-statistics/current-rates/payroll-tax-current-rates
- ACT 工资税（页面）：https://www.revenue.act.gov.au/business-taxes-and-levies/payroll-tax/about-payroll-tax
- TAS 工资税（摘要）：https://www.sro.tas.gov.au/payroll-tax/rates-thresholds
- NT 大雇主新税率（摘要，403）：https://treasury.nt.gov.au/dtf/territory-revenue-office/whats-new/new-payroll-tax-rate-for-large-employers-from-1-july-2026
- ACT / NT 工伤保险承保人（摘要）：https://www.worksafe.act.gov.au/workers-compensation/approved-insurers ；https://worksafe.nt.gov.au/workers-compensation/insurers

> 运营参考，不是法律意见。
