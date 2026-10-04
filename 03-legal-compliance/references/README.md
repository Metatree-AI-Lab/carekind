Owner: Legal/Compliance · Status: Research draft · Last reviewed: 04/10/2026

> 运营参考，不是法律意见

# careKind 法规与文书参考库（references/）

这是一个**原始资料库**：官方法律、监管指引和文书模板的本地副本，以及我们自己整理的索引和分析。上一级目录 `03-legal-compliance/` 里的合规文档（如 `aged-care-regulatory.md`、`tga-samd-boundary.md`、`privacy-program.md`）引用本库作为证据。

## 目录

| 路径 | 内容 | 什么时候用 |
|---|---|---|
| `law-library/index.md` | 34 项联邦资料：Aged Care Act 2024、Aged Care Rules 2025（两卷）、Strengthened Quality Standards、SIRS 与限制性措施指引、Privacy Act / POLA Act 2024 / APP Guidelines / NDB / OAIC AI 指引、TGA digital scribes、Ahpra AI 指引、NMBA code 与 standards、Guidance for AI Adoption、National AI Plan、Essential Eight。附关键条款摘录（7 年保留、incident 字段、SIRS 时限、care plan、restrictive practices） | 写 PRD 的合规章节、回答客户尽调问卷、核对销售口径 |
| `law-library/*.pdf`，以及 4 个 `*-summary.md` | 官方 PDF 原件（约 43MB）。只有网页版的资料（TGA digital scribes、Ahpra AI、OAIC AI 产品指引、VAISS 状态）写成了摘要 | 需要引用原文时 |
| `paperwork-templates/index.md` | 30 多份公开的表单、模板和工具：SIRS 表单和工具、BSP 模板、RPSDM 同意、AN-ACC、QI Program、跌倒、压伤、疼痛、恶化、ISBAR、case conference 等，每份都写了发布方、URL、许可、文档类型 | 设计 AI 起草模板的字段结构 |
| `paperwork-taxonomy.md` | residential aged care 护理文书分类：每种文书的典型字段、频率、监管依据、AI 起草适合度（高/中/低），以及 TGA 风险和产品设计启示 | 产品路线图排序、功能边界评审 |
| `state-by-state-comparison.md` | 8 个州/领地在以下方面的对照：健康记录法、保留期、公营部门隐私法与 MNDB、限制性措施与监护、elder abuse 报告、护士配比、工人筛查、工资税、工伤保险、疫苗要求；附"对 careKind 的影响" | 进入新州前、和州政府运营的设施签约前 |
| `sources.md` | 全部来源 URL（按章节去重） | 核查出处 |

## 使用方法
1. **先读索引，再读原件。** 每个 index 都写了"为什么对 careKind 重要"，PDF 只在需要原文时打开。
2. **注意版本。** legislation.gov.au 的 compilation 会更新（Rules 自 2025-11 起已有 10 个 compilation）。引用前到 index 里的官方 URL 确认是否有新版本，并在引用处写明 compilation 日期。
3. **标记为 legacy 的文件**（SIRS Guidelines v1.8 2022、ACQSC RP overview、部分 BSP 模板）是 2025-11-01 新 Act 生效之前的版本，只用来参考结构，法律要求以 Act 和 Rules 为准。
4. **"⚠️ 需核实"** 是本研究无法确认的事项，每份文件末尾都有清单。涉及合同、对外承诺、产品边界的事项，必须先请律师或法规顾问确认。
5. **许可。** 下载的模板仅供内部参考，**不要原样嵌入产品或再分发**。多数 Commonwealth 资料仅允许非商业使用，ACSQHC 的跌倒资料是 CC BY-NC-ND，Victoria 禁止转载。只有标明 CC BY 4.0 的资料可以在署名后改编（见 `paperwork-templates/index.md`）。
6. 少量文件在两个子目录里都有（例如 SIRS quick guide、ACSQHC AI 指南），属于有意保留，方便各子目录独立使用。

## 关键结论速览（04/10/2026）
- **联邦**：Aged Care Act 2024 和 Rules 2025 于 2025-11-01 生效。Rules 对 incident、投诉、合规等记录统一要求**保留 7 年**，但**没有**一条覆盖所有护理记录的通用保留期，需要与州法叠加判断。SIRS：P1 24 小时，P2 30 天。
- **TGA**：只转写或整理、不做分析的 digital scribe 不是医疗器械。生成护士没说过的诊断或治疗建议，就会变成医疗器械。TGA 正在开展 Digital Scribe Review。
- **隐私**：APP 1.7–1.9 自动化决策透明度义务 **2026-12-10 生效**。Tranche 2 exposure draft（2026-08-31）**尚未提交国会**。
- **AI 政策**：VAISS 已被 Guidance for AI Adoption（6 practices，2025-10）取代。National AI Plan（2025-12）放弃了强制 guardrails。
- **州**：只有 VIC、NSW、ACT 有覆盖私营机构的州健康记录法，其中 VIC 没有小企业豁免。WA PRIS Act 的 IPPs 已于 2026-07-01 生效，适用于承包商。州级 MNDB：NSW 和 QLD 已实施，WA 预计 2027 年。限制性措施的 RPSDM 过渡安排 2026-12-01 结束，各州的替代决策规则不同。护士配比只适用于 VIC 和 QLD 的**公营**养老机构。
