Owner: Strategy · Status: Research draft · Last reviewed: 04/10/2026

# Heidi Health

**威胁等级：高**

| 字段 | 内容 | 来源 |
|---|---|---|
| 公司 | Heidi Health | S40 |
| 总部/国家 | 澳大利亚墨尔本 | S44 |
| 产品 | Heidi（AI scribe / "AI care partner"），设有专门的 "Heidi for aged care" 解决方案页；2026-09 发布 Heidi II agent 平台 | S40, S48 |
| 目标用户 | 医生、护士、专职医疗人员；养老页面明确写到 residential care 和 home care 两种场景 | S40, S41 |
| AI 功能 | 语音口述、转写、免手持远程录音片段；生成 care notes、incident reports、family letters、care plans；有预置养老模板（care notes、falls risk、伤口记录、家属更新）；可用员工母语口述、输出英文；可基于机构的 policy/procedure 在床旁回答问题；支持离线。护士版另有 SBAR 交接和护理计划 | S40, S41 |
| Agent 功能 | Heidi II 可以执行多步行政任务（chart prep、转诊、随访）。没有 EMR 集成时，用 computer use 方式"接管键盘和鼠标"。官方称禁止写入操作和诊断、处方这类受 TGA 监管的功能，所有操作需临床人员审核。首发地区为 AU/NZ/US/CA | S48 |
| 集成方式 | 养老页面没有列出与任何养老 CMS 的集成（⚠️ 需核实）。通用做法是复制粘贴、少量 EMR 集成，再加上 computer-use agent | S40, S48 |
| 定价 | 官网定价页分 Free / Clinician / Practice / Enterprise 四档，**页面不显示价格**。第三方称 Clinician 档 2026-02 涨到约 $150/用户/月（币种及真实性 ⚠️ 需核实） | S42, S49 |
| 融资/规模 | 2025-10 完成 Series B 6,500 万美元（估值 4.65 亿美元）。2026-09 完成 Series C 1 亿美元（Blackbird 领投），另获 General Catalyst 2.4 亿美元非稀释性增长资金，合计约 3.4 亿美元（约 A$4.75 亿），估值约 9 亿美元（约 A$12.6 亿）。媒体报道 ARR 约 5,000 万，累计支持 1.75 亿次就诊（自报） | S43, S44, S45 |
| AU 数据驻留/隐私 | 养老页面称提供 AU/NZ、UK、Canada 数据驻留选项，并提到 ISO 认证（未写具体标准） | S40 |
| TGA | 官方表示当前功能刻意避开诊断、处方，以免被认定为医疗器械；CEO 承认未来可能进入受监管范围 | S48 |
| 养老客户 | **Metlifecare（新西兰）**：在 Parkside Village Care Home 做了 4 个月试点，12 名 RN 参与，之后扩展到另外 3 家护理院；护士审核后才写入记录系统。养老页面上有 Rachel Hollis 等个人证言（机构名未完整展示）。尚未确认澳洲 residential aged care 机构的公开签约（⚠️ 需核实） | S46, S40 |
| 其他澳洲客户 | Metro South Health（昆士兰）在全服务范围推广，试点中 92% 的临床人员表示行政时间减少 | S47 |

## 事实与营销声明的区分
- **已核实（第三方媒体）**：融资金额、Metlifecare 试点、Metro South 推广。
- **营销声明**：护士版"平均每班节省 45 分钟"、"98% 护士节省时间"（S41）；"190 个国家、110 种语言"。

## 优势
- 资金极其充足，品牌在澳洲临床圈认知度高，已明确把 aged care 当作一个解决方案线（S40, S43）。
- 功能面跟 careKind 高度重叠：progress/care notes、incident reports、care plans、handover、母语口述（S40, S41）。
- 有 AU 数据驻留，计划分 Free 到 Enterprise 多档，可以自下而上让员工自发使用。

## 劣势 / 缺口
- 是通用临床产品，养老只是其中一个垂直方向；核心设计围绕"临床人员—患者问诊"，**不是**围绕 PCW（personal care worker）与 RN 的分级审核流程（推断，⚠️ 需验证产品实际流程）。
- 养老页面没有公开与 Leecare、AutumnCare、Telstra Health 等 CMS 的集成（S40）。
- 主打 ambient 录音，需要征得居民同意；在认知障碍居民比例高的环境中，同意流程更复杂（Metlifecare 案例中明确提到"with resident's consent"，S46）。

## 对 careKind 的威胁判断
**高。** Heidi 是澳洲本土、资金最雄厚、已公开进入养老场景（NZ residential 已扩展部署）的 AI scribe，功能清单与 careKind MVP 几乎完全重叠。careKind 若想差异化，必须靠 residential 专属流程：PCW 到 RN 的审核链、对接 SIRS 的事故报告结构、多班次交接、与 CMS 的写回集成，以及面向 CALD 护工的低门槛体验。不能在"通用 AI scribe"这一层正面竞争。
