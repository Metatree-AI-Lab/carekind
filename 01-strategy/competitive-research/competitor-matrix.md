Owner: Strategy · Status: Research draft · Last reviewed: 04/10/2026

# 竞品对比矩阵

图例：**威胁** 高 / 中 / 低（针对 careKind：澳洲 residential aged care、PCW/RN 口述或输入、AI 起草、RN 审核）。来源编号对应 [sources.md](sources.md)。"未公开"表示公开渠道找不到；"⚠️"表示有线索但需核实。所有"节省 X 小时"之类的数据均为厂商或机构自报。

## 一、澳洲养老 CMS（临床与护理管理系统）

| 公司 | 总部 | 产品 | 目标用户 | AI 功能（实际做什么） | 集成方式 | 定价 | 融资/规模 | AU 数据驻留 | TGA | 公开养老客户 | 威胁 | 来源 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **AlayaCare** | 加拿大 | AlayaCare Residential / Home | Residential + home care + NDIS | **AI Note Assistant**（浏览器口述生成结构化 care notes，2026-06 early access）；Form Assistant、Resident Insights 在计划中；Layla、AlayaFlow agents | 原生（system of record） | 未公开 | 累计约 3.44 亿融资；330+ ANZ 客户 | 未公开 ⚠️ | 未提及 | AnglicareSA、Ozcare、ermha365 | **高** | S19, S20, S23 |
| **Telstra Health**（含原 iCareHealth） | 澳洲 | Clinical Manager、CareKeeper、Corus | Residential | 报表（Care Insights）；与 RMIT 合作的 NLP 风险预测；GP 端 Smart Scribe；养老版 Corus **2028 年**才上线，"逐步"加入 AI 摘要 | 原生 | 未公开 | 80,000+ 床，220+ 家机构 | 未公开 ⚠️ | 未提及 | 未点名 | 中 | S9, S11, S13, S14, S15 |
| **Leecare** | 澳洲 | Platinum6 | Residential、home、残障，中小机构 | **暂无生成式 AI**；2025-07 表示在推进"several AI partnerships" | 原生 | 未公开 | 480+ 家机构，30,000+ 床 | 未公开 | — | 未点名 | 中 | S1, S3, S4 |
| **AutumnCare** | 澳洲（珀斯） | AutumnCare + Mobile | Residential | **未发现 AI** | 原生 | 未公开 | 未公开 | 未公开 | — | 未公开 | 中低 | S6, S7 |
| **Person Centred Software** | 英国（澳洲阿德莱德有办公室） | Clinical Care System（原 MCM） | Residential、退休村 | Speech-to-text（只转写）；未见生成式 AI | 原生 | 未公开 | 澳洲 150+ 院（2019 年数据 ⚠️） | 未公开 | — | Kalyra、Alexander Aged Care 等 | 中 | S16, S17, S18 |
| **Mirus Australia**（MirusPlus / ManAd Plus） | 澳洲 | MirusPlus（2026-03） | Residential | 有"AI 与数据"模块，具体功能未公开 ⚠️ | 原生 + API 模块 | 未公开 | 未公开 | 未公开 | — | 未公开 | 中低 | S32, S33, S34 |
| VCare | **新西兰**（基督城） | VCare Any-ware | Residential、退休村（以 NZ 为主） | 未见 AI | 原生 | 未公开 | NZ 大客户：Ryman、Summerset、BUPA、Metlifecare 等 | — | — | 主要是 NZ 客户 | 低 | S27, S28 |
| Lumary | 澳洲（阿德莱德） | Lumary AC（基于 Salesforce） | 居家为主 + NDIS | 预测分析、AI 报表；结构化笔记模板 | 原生 | 未公开 | 200,000+ 用户（自报） | 声称本地托管 | — | 未点名 | 低 | S35 |
| The Lookout Way | 澳洲 | Lookout Assist（2026-06） | **Home care** | 起草 care plan、临床摘要、交接摘要、临床建议、多语言；"six points of control" | 原生 | 未公开 | 未公开 | 未公开 | — | 未公开 | 中低 | S24, S25 |
| ShiftCare | 澳洲 | ShiftCare | NDIS + 居家养老 | AI Care Signals（风险和事故识别）、AI 摘要、笔记优化 | 原生 | 订阅制，无安装费 | 8,000+ 服务商（自报） | 未公开 ⚠️ | — | 未点名 | 低到中 | S36, S37 |
| Visualcare | 澳洲 | Visualcare | **居家**养老、NDIS | 官网未见 AI | 原生 | 未公开 | 600+ 服务商（第三方转述 ⚠️） | — | — | — | 低 | S30, S31 |
| MedTasker | 澳洲（Fitzroy） | Medtasker | **医院**任务协调 | 不是养老 CMS，也不是 AI 文档工具 | — | — | — | — | — | — | 低（建议从清单移除） | S29 |

## 二、AI 医疗书记员（AI scribes）

| 公司 | 总部 | 产品 | 目标用户 | AI 功能 | 集成方式 | 定价 | 融资/规模 | AU 数据驻留 | TGA | 公开养老客户 | 威胁 | 来源 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **Heidi Health** | 澳洲 | Heidi / Heidi II agents | 医生、护士；**设有 aged care 解决方案页** | care notes、事故报告、care plan、家属信、SBAR 交接；母语口述后输出英文；政策问答；离线；computer-use agent | 复制粘贴 + 部分 EMR + computer use | 官网分 Free / Clinician / Practice / Enterprise，价格不显示；第三方称约 $150/月 ⚠️ | Series C 后约 9 亿美元估值，合计融资约 3.4 亿美元 | 有 AU/NZ 驻留选项 | 刻意避开诊断和处方功能 | **Metlifecare（NZ）** 4 家护理院 | **高** | S40–S49 |
| Lyrebird Health | 澳洲 | Lyrebird | GP、专科为主 | ambient 病历生成、信件、口述、学习用户风格 | Best Practice、Genie、Cerner、FHIR | 未公开 | 1,200 万（5,000 万估值） | 仅在澳洲处理和存储 | 有 TGA 解读博客 | 未公开 | 低到中 | S50–S53 |
| Microsoft Dragon Copilot | 美国 | Dragon Copilot（含护理版） | 医院医生和护士 | ambient 转 flowsheet，可预览和编辑 | 医院 EHR | 未公开 | — | 未公开 | — | 无（但 Regis 用 Copilot Studio 自建） | 中 | S54–S56 |
| Abridge | 美国 | Abridge | 美国医院系统 | ambient；与 Mayo、Epic 合作开发护理 flowsheet 功能 | Epic 等 | 未公开 | 150+ 家医疗系统 | 未见澳洲业务 | — | — | 低 | S57 |
| Tandem Health | 瑞典/欧洲 | Tandem | 欧洲诊所和 NHS | ambient 病历、转诊、摘要；ISO 13485 | Accurx 等 | 未公开 | 1 亿美元融资；14 个欧洲市场 | 未见澳洲业务 | — | — | 低 | S58 |
| Telstra Health Smart Scribe | 澳洲 | Smart Scribe | GP | 问诊转病历、信件，临床人员审核后保存 | MedicalDirector | 未公开 | — | 未公开 | — | — | 见 Telstra Health | S14 |
| TeleScribe | 澳洲 | TeleScribe | 临床人员（含护士，列出 aged care 专科） | 笔记、care plan、交接、观察摘要 | 未说明 | **$79/月** | 未公开 | 澳洲托管 | — | — | 低 | S59 |

## 三、养老和护理专用 AI 文档工具

| 公司 | 总部 | 产品 | 目标用户 | AI 功能 | 集成方式 | 定价 | 融资/规模 | AU 数据驻留 | TGA | 公开养老客户 | 威胁 | 来源 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **Notive** | 澳洲（阿德莱德） | Notive | **Residential**（SA、VIC） | 语音生成班次笔记和结构化交接；自动标记事故和 RN 跟进事项；班次进度看板 | 未说明（推测独立工具） | Pilot 阶段，7 天试用 | 未公开 | 悉尼；语音不保留 | — | "Founding facilities"，未点名 | **高** | S60 |
| **Aria Care** | 新西兰 | Aria | NDIS、小型服务商、aged care | 笔记、交接、事故草稿、翻译、Easy Read、缺失项检测 | 复制粘贴 | $19 到 $699/月（币种 ⚠️） | 未公开 | 未披露 | — | — | 中 | S61 |
| **AccuNote** | 澳洲 | AccuNote | 养老 + NDIS | 语音笔记、progress note 生成和检查 | 未说明 | 14 天试用 | 未公开 | 澳洲服务器，不用于训练 | — | — | 中 | S62, S63 |
| **AgedCareAI** | 澳洲（悉尼） | 9 模块套件（含 Whisper 语音） | Residential + 居家 + 社区 | 语音文档、表单、政策问答、洞察 | 叠加在现有系统上（未点名） | 未公开 | 未公开 | 未公开 | — | — | 中 | S64 |
| **Regis RegiCare Assist**（自建） | 澳洲 | RegiCare Assist | Regis 自用（72 院） | **汇总**笔记和交接，按临床问题归类，68 页压到 3 页 | 手动上传；计划与 CMS 集成 | 不销售 | 约 150 名员工在用 | Regis 自有安全环境 | — | Regis | 中到高（自建替代） | S68, S69 |
| **Uniting Buddy**（自建） | 澳洲 | Buddy | Uniting 居家和社区护工 | **多语言**口述转笔记、翻译、政策指引 | 内部系统 | 不销售 | 1,200+ 用户 | 未公开 | — | Uniting + 5 家合作机构 | 中 | S70 |
| Sparks Scribe | 澳洲（QLD） | Sparks Scribe | 独立 NDIS 支持工作者 | 语音转班次笔记、事故报告 | Xero | $15 / $20 / $39 每月（含 GST） | — | 澳洲 | — | — | 低 | S65 |
| NDISNotes | 澳洲 | NDISNotes | NDIS（**不做养老**） | 笔记和事故报告起草 | PDF 导出 | 未公开 | — | 悉尼 | — | — | 低 | S66 |
| SupportNotes | 澳洲 | 12 个生成器（含 Aged Care Progress Note、ISBAR） | 支持工作者、护士 | 把零散笔记改写成规范笔记 | 无 | 免费 + Pro | — | 声称在澳洲 | — | — | 低 | S67 |
| PointClickCare Vox Advantage | 北美 | Vox Advantage | 美加 SNF、长期护理 | 原生 ambient 文档 + 同意 + 签署 | 原生 | 未公开 | 美国最大养老 EHR | 不适用 | — | — | 低（参照） | S71 |
| Access Smart Notes | 英国 | Smart Notes | 英国护理院 + NHS | 语音口述、AI 质量优化、审批 | 原生（Access Care Planning） | 按护工或床位计年费 | — | 不适用 | — | — | 低（参照） | S72, S73 |
| Birdie SmartPlans | 英国 | SmartPlans | 英国居家护理 | 录下评估对话，起草 care plan 答案并引用原文；高风险问题不给 AI 建议 | 原生 | £3.50/录音小时 | 1,200+ 服务商 | 不适用 | — | — | 低（参照） | S74 |
| CareForAll AI | 英国 | CareForAll | 英国护理院和居家 | 语音优先笔记、事故和安全保障报告 | 原生 | 未公开 | — | 英国托管 | — | — | 低 | S75 |
| CareTrust AI | 新加坡 | Nursing Home OS | 新加坡护理院 | 起草 care plan、交接摘要、风险预测，人工批准 | 原生 | 未公开 | 50+ 院（自报） | 不适用 | — | — | 低（参照） | S76 |
| 日本：ハナスト（ExaWizards）、ワイズマン 音声記録AI、Milmo Recorder、AmiVoice | 日本 | 介护记录语音 AI | 日本介护设施 | 免手持口述，自动生成介护记录；与介护软件联动 | 原生或联动 | 未公开 | ハナスト称每人每天节省 40 分钟（自报） | 不适用 | — | — | 低（参照） | S77 |

## 四、相邻领域（简述）

| 公司 | 总部 | 类别 | 说明 | 与 careKind 的关系 | 来源 |
|---|---|---|---|---|---|
| PainChek | 澳洲 | AI 疼痛评估（面部识别） | 自称在 60%+ 的澳洲 residential 机构获授权；与 CMS 的集成覆盖约 80% 床位（约 18 万） | **集成打法的样板**；可能是合作伙伴而不是竞争对手 | S80, S9 |
| SOFIHUB | 澳洲 | 雷达跌倒检测 | 不用摄像头和音频，检测跌倒并通知员工 | 事件来源，可触发 careKind 起草事故报告 | S81 |
| HSC Technology / Talius | 澳洲 | 传感器跌倒风险 | 与 Whiddon、CSIRO 合作的 BEST CARE 可行性研究 | 同上 | S82 |
| Ally Cares | 英国 | 夜间声学监测 | 声称卧室跌倒减少 63%（自报）；已与 Nourish 集成；未见澳洲业务 | 同上 | S83 |
| Andromeda（Abi） | 澳洲 | 陪伴机器人 | 支持 90 种语言，部署在"数十家"澳洲养老机构 | 无直接竞争 | S84 |

## 原候选清单的更正
- **iCare Health**：2014 年已被 Telstra Health 收购，归入 Telstra Health（S15）。
- **Mobile Care Monitoring**：是 Person Centred Software 的产品名（S18）。
- **Lookout Way、Visualcare**：属于 home care 平台，不是 residential 临床系统（S24, S30）。
- **VCare**：总部在新西兰，以 NZ 客户为主（S27）。
- **MedTasker**：医院任务协调平台，与养老文档无关，建议移除（S29）。
- **建议补充**：Mirus Australia（MirusPlus/ManAd）、Notive、Aria Care、AccuNote、AgedCareAI、ShiftCare、Lumary，以及机构自建项目（Regis、Uniting）。
