Owner: Legal/Compliance · Status: Research draft · Last reviewed: 04/10/2026

> 运营参考，不是法律意见

# TGA — Digital scribes（HTML 页面摘要）

- **Publisher**: Therapeutic Goods Administration (TGA)
- **URL**: https://www.tga.gov.au/products/medical-devices/software-and-artificial-intelligence-ai/overview/types-software-based-medical-devices/digital-scribes
- **页面 Last updated**: 30 January 2026（04/10/2026 抓取时）
- **性质**: 监管指引（HTML only），无 PDF 版本

## 核心原文（英文引用，便于对外口径一致）
- "Digital scribes intended only to transcribe and translate clinical conversations into written records without performing analysis or interpretation are not considered medical devices. These products do not have a therapeutic use under the Act."
- "However, if a digital scribe analyses or interprets clinical conversations – for example by generating a diagnosis, differential diagnosis or treatment recommendation not explicitly stated by the healthcare practitioner – it is considered a medical device." → 必须进入 ARTG 才能供应。
- 判断依据：Therapeutic Goods Act 1989 s41BD 医疗器械定义（diagnose, monitor, predict, provide a prognosis, treat … ）。
- **For industry**: "Developers must regularly assess whether changes to their product affect its intended purpose. If updates introduce functionality with a therapeutic use, the product becomes a medical device." 此时必须停止供应直至 ARTG 纳入，或移除该功能。
- 非医疗器械的 scribe 仍需遵守：Privacy Act 1988（OAIC）、Cyber Security Act 2024、AHPRA 国家注册体系、Australian Consumer Law、ACSQHC 的 AI 临床使用指引。
- **For health professionals**: 临床人员负责获得知情同意并 "verifying the accuracy of information entered into a patient’s health record"；需定期评估软件更新是否改变 intended purpose。
- **For consumers**: 使用 scribe 前应告知并获得知情同意；可随时撤回同意并要求其他记录方式。

## 相关 TGA 动态
- TGA 2026-07 演示稿（本目录 `tga-software-and-ai-compliance-and-reforms-presentation-2026-07.pdf`）显示 TGA 正在开展 **Digital Scribe Review**：scoping、行业教育、向开发者自愿征集信息以判断是否符合医疗器械定义；同时在复审 Therapeutic Goods (Excluded Goods) Determination 2018。⚠️ 需持续关注复审结果。
- TGA AI review 报告：`tga-report-clarifying-strengthening-regulation-mdsw-ai-2025.pdf`（来源 https://www.tga.gov.au/news/news-articles/tga-ai-review-outcomes-report-published ）。

## 对 careKind 的意义
1. 我们的产品"把护士口述整理成记录"处于非医疗器械一侧，但前提是**不生成护士没说过的诊断/鉴别诊断/治疗建议**。
2. 风险点：自动"总结"时加入临床解读（如"可能是 UTI"）、风险评分、SIRS 优先级自动判定、恶化预警。见 `../../tga-samd-boundary.md`。
3. 每次版本更新需做 intended purpose 复核并留档（TGA 明确要求开发者持续评估）。
4. 营销文案同样构成 intended purpose 证据。
