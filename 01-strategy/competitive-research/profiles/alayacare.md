Owner: Strategy · Status: Research draft · Last reviewed: 04/10/2026

# AlayaCare（含 AlayaCare Residential）

**威胁等级：高**

| 字段 | 内容 | 来源 |
|---|---|---|
| 公司 | AlayaCare | S19 |
| 总部/国家 | 加拿大蒙特利尔；设有 ANZ 团队（MD ANZ：Annette Hili） | S23, S20 |
| 产品 | AlayaCare Home & Community、**AlayaCare Residential**、AlayaFlow（agent 工作流）、Layla AI assistant | S19 |
| 目标用户 | 居家及社区护理、**residential aged care**、残障服务（NDIS） | S19 |
| AI 功能（Residential） | **AI Note Assistant**（2026-06 进入 early access）：通过浏览器麦克风口述 progress notes，生成结构化 care notes。**AI Form Assistant**（计划中）：口述后自动填写表单字段。**AI Resident Insights**（计划中）：汇总居民信息，标出 care plan 和表单之间的变化 | S20, S19 |
| AI 功能（平台其他） | AI Smart Summaries；Client Intelligence 预测高风险客户；AlayaFlow 的 Intake、Scheduling、Clinical Agent（"生成推荐 care plan"）；Visit Optimizer | S19 |
| 集成方式 | 原生嵌入自家系统，属于 system of record | S19, S20 |
| 定价 | 未公开 | — |
| 融资/规模 | 累计融资约 3.44 亿（Crunchbase，币种按原文）；2026-02 获 CIBC 5,000 万债务融资；官网称 "330+ ANZ Clients"。并购包括 Procura、Delta Health Technologies、Nightingale Software（2025-10）等（⚠️ 并购信息来自第三方聚合，需核实；AlayaCare Residential 的来源也未确认） | S19, S23 |
| AU 数据驻留 | 官网首页未披露（⚠️ 需核实） | S19 |
| TGA | 未提及。注意 "Clinical Agent generates recommended care plans" 带有"推荐"性质，监管边界值得观察 | S19 |
| 养老客户（ANZ） | 官网点名 AnglicareSA、Ozcare、ermha365（未说明是 residential 还是 home care） | S19 |

## 事实与营销声明的区分
- **已核实（媒体）**：AI Note Assistant 于 2026-06 进入 early access，另外两项工具在计划中（S20）。
- **营销声明**："From voice to form in seconds"（S19）。

## 优势
- 已经是 system of record，AI 笔记直接落在居民档案里，不需要复制粘贴。
- 资金充足，路线图完整（笔记、表单、洞察），residential 和 home care 都覆盖。

## 劣势
- 只对自家客户有价值，非 AlayaCare 客户用不了。
- 首个功能还在 early access，没有公开效果数据；事故报告、交接等场景尚未单独发布。

## 对 careKind 的威胁判断
**高（对 AlayaCare 客户群）/ 低（对其他 CMS 客户群）。** 它代表最核心的结构性风险：**CMS 厂商把 AI 文档做成内置免费功能**。如果 Leecare、AutumnCare、Telstra Health 跟进，独立工具的价值空间会被压缩。careKind 的应对：要么成为这些 CMS 的 AI 层合作伙伴（参考 PainChek 的集成打法，S80），要么在 AI 质量和养老专用流程上明显领先内置功能。
