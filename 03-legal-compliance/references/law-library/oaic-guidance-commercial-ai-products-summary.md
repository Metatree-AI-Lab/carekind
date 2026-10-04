Owner: Legal/Compliance · Status: Research draft · Last reviewed: 04/10/2026

> 运营参考，不是法律意见

# OAIC — Guidance on privacy and the use of commercially available AI products（HTML 摘要）

- **Publisher**: Office of the Australian Information Commissioner (OAIC)
- **URL**: https://www.oaic.gov.au/privacy/privacy-guidance-for-organisations-and-government-agencies/guidance-on-privacy-and-the-use-of-commercially-available-ai-products
- **日期**: Published 21 October 2024；页面显示 last updated 17 January 2025
- **配套 PDF（已下载）**: `oaic-checklist-privacy-use-of-commercial-ai-products-2024.pdf`、`oaic-checklist-selecting-an-ai-product-2024.pdf`、`oaic-top5-takeaways-commercial-ai-products-2024.pdf`；姊妹指引（开发/训练生成式 AI）checklist：`oaic-checklist-developing-training-genai-models-2024.pdf`（页面 https://www.oaic.gov.au/privacy/privacy-guidance-for-organisations-and-government-agencies/guidance-on-privacy-and-developing-and-training-generative-ai-models ）

## 要点
- 适用对象：部署（deploy）商用 AI 产品的 APP entity——即我们的客户（aged care provider）；但它直接决定客户对我们的**采购尽调问题**。
- 隐私设计 + PIA：部署前进行 Privacy Impact Assessment。
- **供应商尽调**：产品是否经过测试、训练数据与偏见风险、**供应商能否为自身目的访问输入/输出数据**、安全措施与运行环境。
- **APP 6**：AI 相关的二次用途很难被认为在"合理预期"之内 → 用客户数据训练模型需另行同意/明确合同授权。
- **APP 3**：AI 生成或推断出的个人信息也属于"collection"；Sensitive information（健康信息）需同意。
- **APP 10 准确性**：人工监督、员工培训、持续监测；记录应能标明 AI 输出性质。
- **APP 1/5 透明度**：隐私政策中说明 AI 使用。
- OAIC 建议：不要把个人信息输入公开的生成式 AI 工具。
- 原文："Personal information includes inferred, incorrect or artificially generated information … where it is about an identified or reasonably identifiable individual."

## 对 careKind 的意义
- 准备一份可直接交给客户的 **PIA 支持包**（数据流、存储地点、子处理者、保留期、模型是否用客户数据训练——默认否）。
- 合同中明确：客户数据不用于训练（或仅在书面同意下）、不用于我们自身目的。
- 产品内标注"AI 辅助起草"并保留人工审核记录，支撑客户的 APP 10 义务。
- 2026-12-10 起 APP 1.7–1.9 自动化决策透明度义务生效（见 index.md）；我们的产品定位为"起草记录、不做决定"，有助于客户判断不触发该义务，但仍需逐功能评估。⚠️ 需核实。
