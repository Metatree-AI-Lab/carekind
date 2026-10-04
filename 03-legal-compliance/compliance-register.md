# 合规总表 (Compliance Register)

Owner: Lightman（兼 Privacy Officer）· Status: Active · Last reviewed: 04/10/2026 · 复核频率：每季度 + 法规变化时

状态图例：🔴 未开始 · 🟡 进行中 · 🟢 完成 · ⚪ 暂不适用（附触发条件）

## A. 公司与税务
| # | 法律 / 机构 | 我们的义务 | 何时适用 | Owner | 状态 |
|---|---|---|---|---|---|
| A1 | Corporations Act 2001 / ASIC | 注册 Pty Ltd；董事义务（勤勉、诚信、不在资不抵债时交易）；保存公司记录 7 年；年度审查费；变更 28 天内通知 | 立即 | 创始人 | 🔴 |
| A2 | Director ID (ABRS) | 每位董事在任命前申请 | 立即 | 每位董事 | 🔴 |
| A3 | ABN / TFN (ABR, ATO) | 申请 | 立即 | 创始人 | 🔴 |
| A4 | GST (A New Tax System (GST) Act 1999) | 年营业额 ≥ $75k 必须注册；注册后开 tax invoice、报 BAS | 达到门槛或自愿 | 创始人 / 会计 | 🔴 |
| A5 | 记录保存 (ATO) | 税务记录保存 5 年 | 立即 | 会计 | 🔴 |
| A6 | PAYG withholding + Single Touch Payroll | 有员工时注册 PAYG W、通过 STP 申报工资 | **已有员工 → 立即** | Lightman | 🔴 |
| A7 | Payroll tax (VIC, State Revenue Office) | 澳洲工资总额超过 VIC 年度门槛时须注册 ⚠️ 核实当年门槛 | 工资总额达门槛 | 会计 | ⚪ |
| A8 | R&D Tax Incentive | 财年结束后 10 个月内向 AusIndustry 注册活动；做好同期记录 | 有合格研发支出 | 创始人 / 会计 | 🟡 从第一天开始记录 |

## B. 隐私与数据
| # | 法律 / 机构 | 我们的义务 | 何时适用 | Owner | 状态 |
|---|---|---|---|---|---|
| B1 | Privacy Act 1988 + 13 APPs (OAIC) | 处理住户健康信息 = sensitive information。**无论营业额多少都按完全受 APPs 约束运营**（小企业豁免不适用于提供健康服务并持有健康信息的机构，且客户合同会要求）⚠️ 需律师确认我们的具体定性 | 处理任何真实住户数据前 | Privacy Officer | 🔴 |
| B2 | Notifiable Data Breaches scheme | 疑似泄露 30 天内完成评估；符合条件的泄露尽快通知 OAIC 和受影响个人 | 同上 | Privacy Officer | 🔴 |
| B3 | Privacy and Other Legislation Amendment Act 2024 | 严重侵犯隐私的法定侵权诉讼（2025-06 起）；**隐私政策须披露使用个人信息的自动化决策（2026-12-10 起）** | 已生效 / 即将生效 | Privacy Officer | 🔴 |
| B4 | 州健康记录法 | **VIC（我们的注册地）: Health Records Act 2001 — 立即适用**，由 Health Complaints Commissioner 监管；NSW: Health Records and Information Privacy Act 2002；ACT: Health Records (Privacy and Access) Act 1997。按客户所在州叠加适用（如 VIC 成人健康记录保留至少 7 年） | 客户在这些州 | Privacy Officer | 🔴 |
| B5 | APP 8 跨境披露 | 若数据（含 LLM 推理调用）出境，我们对境外接收方的违规承担责任 → **默认全部在澳洲境内处理** | 选型时 | CTO | 🔴 |
| B6 | Spam Act 2003 | 营销邮件需同意、标明身份、可退订 | 发营销邮件前 | Marketing | 🔴 |
| B8 | WA Privacy and Responsible Information Sharing Act 2024 | **2026-07-01 起适用于为 WA 公共部门提供服务的承包商** | 卖给 WA 公立机构时 | Privacy Officer | ⚪ |
| B9 | 州公共部门隐私与数据泄露制度 | VIC 公立 aged care：PDP Act s17 合同条款 + VPDSS 安全标准；NSW、QLD 有州级强制数据泄露通知制度（WA 预计 2027 年） | 卖给州立 / 公立 aged care 时 | Privacy Officer | ⚪ |
| B10 | APP 1.7–1.9 自动化决策透明度 | **2026-12-10 生效**；Tranche 2 改革征求意见稿已于 2026-08-31 发布，尚未提交议会 | 2026-12-10 前 | Privacy Officer | 🔴 |
| B7 | My Health Records Act 2012 | 仅在接入 My Health Record 时适用（数据不得出境） | ⚪ 暂不集成 | — | ⚪ |

## C. Aged care 与健康监管
| # | 法律 / 机构 | 我们的义务 | 何时适用 | Owner | 状态 |
|---|---|---|---|---|---|
| C1 | Aged Care Act 2024 + Aged Care Rules 2025 (ACQSC) | 直接义务在 provider；我们通过合同承接。Rules 要求事件、投诉、合规、worker screening 记录**保存 7 年**；照护记录没有统一的保存期，要结合州法律。详见 aged-care-regulatory.md | 签第一个客户前 | 创始人 | 🔴 |
| C2 | Strengthened Aged Care Quality Standards | 产品功能要帮助（至少不妨碍）provider 满足 Standard 2（组织治理、信息管理）、3、5（临床照护记录） | 产品设计时 | 产品 | 🔴 |
| C3 | Aged care worker screening / police checks | 进入 aged care home 的员工（访谈、培训、试点现场支持）需要有效的 police certificate（及客户要求的疫苗接种证明等）⚠️ 核实新法下 worker screening 具体要求 | 第一次进入现场前 | HR | 🔴 |
| C4 | Therapeutic Goods Act 1989 (TGA) | 保持产品在 SaMD 范围之外；功能变更须过边界审查。详见 tga-samd-boundary.md | 每个功能上线前 | 产品 + 临床顾问 | 🟡 |
| C6 | 监控设备法（Surveillance Devices Act 1999 (Vic)、Surveillance Devices Act 2007 (NSW) 等）+ 工作场所监控法（NSW Workplace Surveillance Act 2005、ACT Workplace Privacy Act 2011） | 整班录音可能录到护士不在场的私人谈话；员工录音需要告知。**本地资料库还没有原文** | Shift Capture 上线前 | Lightman + 律师 | 🔴 |
| C5 | AHPRA / NMBA 指引 | 护士对其记录负专业责任；AHPRA《Meeting your professional obligations when using AI in healthcare》(2024) → 产品必须支持审核、透明、知情同意 | 产品设计时 | 产品 | 🟡 |

## D. AI 与消费者保护
| # | 法律 / 机构 | 我们的义务 | 何时适用 | Owner | 状态 |
|---|---|---|---|---|---|
| D1 | Australian Consumer Law (Competition and Consumer Act 2010) | 不做误导性陈述（包括 AI 能力、节省时间、"合规保证"）；消费者保障条款；不公平合同条款（2023-11 起对小企业合同可罚款） | 任何营销 / 合同 | 创始人 | 🔴 |
| D2 | 国家 AI 政策：Voluntary AI Safety Standard 已被 **Guidance for AI Adoption（2025-10，6 项实践）** 取代；**National AI Plan（2025-12）不再推进强制性 guardrails** | 目前没有独立的 AI 法；自愿采纳 6 项实践，客户尽调时会问 | 立即（自愿） | CTO | 🟡 |
| D3 | 反歧视 / Disability Discrimination Act 1992 | 产品无障碍（目标 WCAG 2.2 AA）；口音/方言识别公平性评测 | 产品设计时 | 产品 | 🔴 |

## E. 雇佣与安全
| # | 法律 / 机构 | 我们的义务 | 何时适用 | Owner | 状态 |
|---|---|---|---|---|---|
| E1 | Fair Work Act 2009 + NES + Modern Awards | 合同、最低标准、Fair Work Information Statement、记录保存、right to disconnect | **已有员工 → 立即** | Lightman | 🔴 |
| E2 | Superannuation Guarantee | 12%（2025-07-01 起）；Payday Super（2026-07-01 起随工资发放支付）⚠️ 核实细则 | **已有员工 → 立即** | 会计 | 🔴 |
| E3 | **Occupational Health and Safety Act 2004 (Vic)** + OHS Regulations（VIC 未采用全国统一的 WHS 法） | 安全工作环境，含心理社会风险；VIC 已出台心理健康相关 OHS 规定 ⚠️ 核实生效日期与要求 | **已有员工 → 立即** | Lightman | 🔴 |
| E4 | Workers' compensation — **WorkSafe Victoria (WorkCover)** | 雇主须在 WorkSafe 注册投保（工资低于一定金额且未雇学徒的情况可能有豁免 ⚠️ 核实） | **已有员工 → 立即** | Lightman | 🔴 |
| E5 | 雇员 vs 承包商 | 按 Fair Work Act 新定义（2024-08 起看实际关系整体）判断；避免 sham contracting | 雇第一个承包商时 | HR | ⚪ |
| E6 | 移民/工作签证 | 雇用前核实工作权利 (VEVO) | **已有员工 → 立即** | Lightman | 🔴 |

## F. 网络安全
| # | 法律 / 机构 | 我们的义务 | 何时适用 | Owner | 状态 |
|---|---|---|---|---|---|
| F1 | Cyber Security Act 2024 — 勒索软件赎金支付报告 | 年营业额 > $3M 的企业支付赎金后 72 小时内报告 | 达门槛 | CTO | ⚪ |
| F2 | ASD Essential Eight | 非强制，但客户（尤其政府资助 provider）常要求；目标 Maturity Level 1 → 2 | 第一个客户前 | CTO | 🔴 |
| F3 | ISO/IEC 27001 / SOC 2 | 非强制；大型 provider 采购常要求 → 路线图 | 12–18 个月内 | CTO | ⚪ |

> 法律原文、监管指引、文书模板与各州对比：[`references/`](references/)

## G. 暂不适用但需要关注
| 法律 | 触发条件 |
|---|---|
| Modern Slavery Act 2018 | 合并收入 ≥ $100M |
| Corporations Act whistleblower policy 强制要求 | 成为公众公司或大型私营公司（仍建议早期建立举报渠道） |
| SOCI Act 2018（关键基础设施） | 一般不适用于小型健康科技供应商 |
| 财务报告 / 审计 | 成为大型私营公司或有外部股东要求 |

## 复核日志
| 日期 | 复核人 | 变化 |
|---|---|---|
| 04/10/2026 | Claude（草稿） | 初版 |
| 04/10/2026 | Claude | 并入调研结果：D2 已确认；新增 B8–B10；C1 补充保存期 |
| 04/10/2026 | Claude | 注册地确认为 VIC：B4/E3/E4/A7 改为 VIC 法规 |
| 04/10/2026 | Claude | 已有 3 名员工（Lin、Gary、Windston）→ A6、E1–E4、E6 改为立即适用 |
