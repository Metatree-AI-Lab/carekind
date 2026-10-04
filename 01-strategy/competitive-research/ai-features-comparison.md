Owner: Strategy · Status: Research draft · Last reviewed: 04/10/2026

# AI 能力对比

图例：✅ = 公开资料明确声称（**不等于已验证效果**）；🟡 = 计划中、early access 或仅部分具备；❌ = 公开资料明确没有或不支持；? = 公开资料没有提到（未公开）。来源编号对应 [sources.md](sources.md)。

## 1. 核心文档能力

| 能力 | Heidi | AlayaCare Res. | Notive | Aria Care | AccuNote | AgedCareAI | Lookout Assist | PCS | Regis 自建 | Uniting Buddy |
|---|---|---|---|---|---|---|---|---|---|---|
| 语音口述（dictation） | ✅ S40 | ✅ 浏览器麦克风 S20 | ✅ S60 | ✅ S61 | ✅ S62 | ✅ Whisper S64 | ? | ✅ 仅转写 S17 | ❌（只做汇总）S69 | ✅ S70 |
| Ambient 环境录音 | ✅ S46 | ? | ? | ? | ? | ? | ? | ❌ | ❌ | ? |
| 文字或要点输入后起草 | ✅ | ? | ? | ✅ S61 | ? | ✅ Canvas S64 | ? | ❌ | — | ? |
| Progress notes 起草 | ✅ S40 | 🟡 early access S20 | ✅ S60 | ✅ S61 | ✅ S62 | ? | ? | ❌ | ❌ | ✅ S70 |
| **事故报告起草** | ✅ S40 | ? | 🟡 只自动标记事故 S60 | ✅ S61 | ? | ? | ? | ❌（可语音录入）S17 | ❌ | ? |
| 交接（handover）摘要 | ✅ SBAR S41 | ? | ✅ 结构化交接 S60 | ✅ S61 | ? | ? | ✅ S24 | ❌ | ✅ 汇总 S69 | ? |
| Care plan 起草或更新 | ✅ S40 | 🟡 Resident Insights 标出变化 S20 | ? | 🟡 目标追踪 S61 | ? | ? | ✅ S24 | ❌ | ❌ | ? |
| 养老专用模板 | ✅ falls risk、伤口、家属更新 S40 | ✅ 推测（嵌入表单）S19 | ✅ 情绪、营养、皮肤、活动 S60 | ✅ NDIS 和养老 S61 | ? | ? | ✅ 31 个评估量表 S24 | ✅ 图标化 S17 | ✅ 按临床问题归类 S68 | ? |
| 家属沟通文本 | ✅ family letters S40 | ? | ? | ✅ family story S61 | ? | ? | ? | ? | ❌ | ? |
| 风险或缺失项提示 | ? | 🟡 S20 | ✅ RN 跟进标记 S60 | ✅ S61 | ✅ review prompts S63 | ? | ✅ 临床建议 S24 | ❌ | ✅ 感染、疼痛等 S68 | ? |
| 面向 RN 的笔记汇总 | ? | 🟡 S20 | ✅ 班次进度看板 S60 | ? | ? | ✅ Insights S64 | ✅ S24 | ❌ | ✅ 核心功能 S69 | ? |
| 政策和程序问答 | ✅ S40 | ✅ Layla S19 | ? | ? | ? | ✅ AskMe S64 | ? | ❌ | ❌ | ✅ S70 |

## 2. 多语言（对澳洲 CALD 护工群体最关键）

| 产品 | 多语言口述 | 输出语言 | 说明 | 来源 |
|---|---|---|---|---|
| Heidi | ✅ 用员工母语口述 | 输出英文 | 通用平台声称支持 110 种语言 | S40 |
| Uniting Buddy | ✅ Hindi、Nepali、Indonesian、Mandarin、Cantonese | 自动翻译 | 语种按护工构成挑选，对 careKind 有直接参考价值 | S70 |
| Aria Care | ? | ✅ 翻译、Easy Read | | S61 |
| Lookout Assist | ✅（"multi-language support"） | ? | 细节未公开 | S24 |
| Access Smart Notes | ✅ 识别多种口音 | 英文 | | S72 |
| Notive / AccuNote / AlayaCare / PCS | ? | ? | 未提及 | S60, S62, S20, S17 |

## 3. 人工审核 UX 与治理

| 产品 | 审核人 | 审核机制 | 审计 | 来源 |
|---|---|---|---|---|
| Heidi | 临床人员（Metlifecare 为 RN） | 草稿 "ready for your review"；agent 禁止写入操作 | ? | S40, S46, S48 |
| Notive | **护工（carer）** | 审核并批准后锁定，锁定后不可编辑 | ✅ 时间戳，防篡改 | S60 |
| Lookout Assist | 有人始终在环（human in the loop） | "six points of control"：输入校验、锁定 prompt、受限工具、输出审核、审计日志 | ✅ | S24 |
| PointClickCare Vox | 护理团队 | 每条笔记必须签署；内置居民同意 | ? | S71 |
| Birdie SmartPlans | 评估员 | 每条建议需主动签署；**高风险问题不给 AI 建议**；引用原文 | ✅ 永久保留转写稿 | S74 |
| Access Smart Notes | 护工 | review、edit、approve | ✅ | S72 |
| CareTrust AI | 员工 | "humans approve everything" | ? | S76 |
| Aria Care | 用户 | "always review before use"（免责声明式） | ? | S61 |
| Regis RegiCare Assist | RN | 预设 prompt 点选；RN 仍需阅读全文 | ? | S68, S69 |
| **careKind（对照）** | **RN** | 每份草稿都经护士审核后才保存；不诊断、不建议治疗 | 待设计 | 任务简报 |

**观察**：Birdie 的"按风险分级，高风险问题不给 AI 建议"和 Lookout 的"six points of control"是目前公开资料中最成熟的两种治理设计。careKind 的"RN 审核每一份草稿"与 Notive 的"护工自审"形成对比，**PCW 起草、RN 审核的两级流程**在公开竞品里没有看到明确产品化，这是可以差异化的点。

## 4. 集成与部署

| 模式 | 代表 | 优点 | 缺点 | 来源 |
|---|---|---|---|---|
| CMS 原生内置 | AlayaCare、PointClickCare、Access、Lookout、ShiftCare | 直接写入 system of record，零切换 | 只服务自家客户 | S20, S71, S72, S24, S36 |
| 叠加层（overlay）或 agent 操作 UI | AgedCareAI、Heidi computer use | 不依赖 API | 稳定性和合规审计存在风险 | S64, S48 |
| 复制粘贴的独立工具 | Aria、Heidi（常规用法）、Notive（推测） | 上线快 | 双重录入，机构 IT 和合规会抵触 | S61, S40, S60 |
| 机构自建 | Regis、Uniting | 完全可控 | 成本高；Regis 仍需手动上传 | S68, S69, S70 |
| 合作集成（样板） | PainChek：与 CMS 的集成覆盖约 80% 床位 | 借助渠道分发 | 需要逐家谈判 | S80 |

## 5. 数据驻留与监管姿态

| 产品 | AU 数据驻留 | 训练数据承诺 | 语音保留 | TGA 姿态 | 来源 |
|---|---|---|---|---|---|
| Heidi | ✅ 有 AU/NZ 选项 | ? | ? | 刻意不做诊断和处方 | S40, S48 |
| Lyrebird | ✅ 仅在澳洲 | ✅ 不用于训练外部模型 | 不存储音频（第三方转述） | 发布过解读文章 | S50, S53 |
| Notive | ✅ 悉尼 | ? | ✅ 转写后立即删除 | ? | S60 |
| AccuNote | ✅ 澳洲服务器 | ✅ 不用于训练 | ? | ? | S62 |
| Sparks Scribe / NDISNotes / TeleScribe | ✅ 澳洲 | ? | TeleScribe 称音频不落盘 | ? | S65, S66, S59 |
| Aria Care | ❌ 未披露 | ? | ? | ? | S61 |
| AlayaCare / Telstra Health / Leecare | ? | ? | ? | ? | — |

**监管背景**：TGA 于 2025-08 发布 digital scribe 指引。只做转写或翻译的软件一般不算医疗器械；如果生成医生没有明确说出的诊断、鉴别诊断或治疗建议，就属于医疗器械，需要列入 ARTG（S53, S91）。careKind 的"不诊断、不建议治疗"定位与这条边界一致。但要注意，"clinical suggestions"（Lookout）、"recommended care plans"（AlayaCare Clinical Agent）这类功能可能接近边界（S24, S19）。另外，行业顾问指出，Aged Care Quality and Safety Commission 越来越多地退回明显由 AI 生成的文件，用公共 AI 工具处理居民信息也有隐私风险（S92）。这说明"专用、合规、留痕"的 AI 工具相对通用 ChatGPT 有明确价值。
