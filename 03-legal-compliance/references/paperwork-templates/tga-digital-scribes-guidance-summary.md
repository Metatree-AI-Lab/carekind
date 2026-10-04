Owner: Legal/Compliance · Status: Research draft · Last reviewed: 04/10/2026
> 运营参考，不是法律意见

# TGA — Digital scribes（网页摘要）

- **Publisher**: Therapeutic Goods Administration (TGA)
- **URL**: https://www.tga.gov.au/products/medical-devices/software-and-artificial-intelligence-ai/overview/types-software-based-medical-devices/digital-scribes
- **页面标注**: "Last updated 30 January 2026"（2026-10-04 抓取）
- **类型**: HTML 指南（无 PDF 版本），因此只保存摘要
- **版权**: © Commonwealth of Australia（TGA 网站版权条款，⚠️ 需核实具体条款）

## 要点（基于页面原文）

1. Digital scribe（又称 AI scribe / ambient scribe）如具有 therapeutic purpose 并符合 *Therapeutic Goods Act 1989* s41BD 的 medical device 定义，就作为 medical device 受监管，须先列入 ARTG 才能在澳洲供应。
2. **不属于 medical device**：原文 "Digital scribes intended only to transcribe and translate clinical conversations into written records without performing analysis or interpretation are not considered medical devices."
3. **属于 medical device**：原文 "if a digital scribe analyses or interprets clinical conversations – for example by generating a diagnosis, differential diagnosis or treatment recommendation not explicitly stated by the healthcare practitioner – it is considered a medical device."
4. 即使不是 medical device，仍可能适用：Privacy Act 1988 (OAIC)、Cyber Security Act 2024、National Registration and Accreditation Scheme (Ahpra)、Australian Consumer Law (ACCC)，以及 ACSQHC 的 AI 临床指南。
5. 对消费者：医疗专业人员必须告知其使用 digital scribe，并提供足够信息以获得 informed consent；消费者可撤回同意。
6. 对医疗专业人员：负责取得 informed consent，并核实录入健康记录信息的准确性。
7. TGA 对作为未注册 medical device 供应的 scribe 可采取 compliance action。

## 对 careKind 的意义

- careKind 的核心功能（把护理人员自己口述的内容整理成 progress note / incident report / handover）对应 "transcribe ... into written records" 一类；**一旦生成员工未明确说出的诊断、风险评分、分诊或治疗建议，就会滑向 medical device**。
- 产品需要硬性"范围护栏"：只重述、结构化、提示缺失字段；不得推断临床结论。详见 `../paperwork-taxonomy.md` 的 design implications。
- 相关 ACSQHC 文件已下载：`acsqhc-ai-safety-scenario-ambient-scribe-2025.pdf`、`acsqhc-ai-clinical-use-guide-2025.pdf`。
- 注意：aged care 中大量记录者是 PCW/AIN（非 registered health practitioner），TGA 页面以"healthcare practitioner"表述，对 aged care 场景的适用细节 ⚠️ 需核实。
