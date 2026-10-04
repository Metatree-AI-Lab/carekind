Owner: Strategy · Status: Research draft · Last reviewed: 04/10/2026

# Microsoft（Dragon Copilot / 原 Nuance DAX Copilot）及 Copilot Studio 生态

**威胁等级：中**（Dragon Copilot 本身为低到中；以 Copilot Studio 为基础的机构自建为中到高，见 [provider-in-house-builds.md](provider-in-house-builds.md)）

| 字段 | 内容 | 来源 |
|---|---|---|
| 公司 | Microsoft（Nuance） | S54 |
| 总部/国家 | 美国 | S54 |
| 产品 | Dragon Copilot：由 Dragon Medical One 口述、ambient 录音和生成式 AI 合并而成。2025-10 推出护理版 ambient 功能 | S54, S56 |
| 目标用户 | 医院医生和护士（美国医院系统，例如 Mercy、Advocate 参与共同开发） | S56 |
| AI 功能（护理版） | 录下护患对话并转成 flowsheet 文档写入 EHR；护士可以暂停、预览、编辑后再提交；提供临床内容查询；自动起草笔记和互动摘要 | S54 |
| 集成方式 | 深度嵌入医院 EHR（新闻稿没有点名 Epic） | S54 |
| 澳洲可用性 | 截至抓取日，经销商页面称"Coming to Australia"，预计 2026 年内上线，**Microsoft 尚未公布澳洲上线日期**（⚠️ 需核实） | S55 |
| 定价 | 未公开 | — |
| AU 数据驻留 | 未公开（Azure 有澳洲区域，但没有找到 Dragon Copilot 的具体承诺） | — |
| TGA | 未提及 | — |
| 养老客户 | Dragon Copilot 本身未见。但 **Regis Aged Care** 用 Microsoft Copilot Studio 和 Foundry（与 Cognizant 合作）自建了 RegiCare Assist；**Uniting NSW.ACT** 在 Microsoft Tech for Social Impact 支持下做了 Buddy | S69, S70 |

## 优势
- 可以和已有的 Microsoft 365 / Azure 企业协议打包，大型养老机构 IT 部门熟悉，采购阻力小。
- Copilot Studio 降低了机构自建门槛，Regis 和 Uniting 两个案例都是这条路线。

## 劣势
- Dragon Copilot 定位医院 EHR，不适配澳洲养老 CMS，也没有 PCW 工作流。
- 澳洲上线时间不确定。

## 对 careKind 的威胁判断
**中。** 直接竞品的威胁有限，真正的威胁是让大型机构倾向"自己用 Copilot 搭"。careKind 需要准备好"自建与采购"对比的 TCO 论证：Regis 自己也承认成本可持续性是扩展的难点（S68）。
