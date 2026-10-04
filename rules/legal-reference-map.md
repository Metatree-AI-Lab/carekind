---
paths:
  - "docs/**"
  - "06-app-development/**"
  - "03-legal-compliance/**"
  - "07-marketing-ops/**"
---

# 法律参考对照表 (Legal Reference Map)

Owner: Lightman · Last reviewed: 04/10/2026 · 运营参考，不是法律意见

> 产品设计和写 PRD 时，**必须按主题查阅下表中的本地文件**，并在产出中引用文件路径（和条款或页码，如果可以确定）。
> 路径简写：`LL/` = `03-legal-compliance/references/law-library/`，`PT/` = `03-legal-compliance/references/paperwork-templates/`，`REF/` = `03-legal-compliance/references/`，`LC/` = `03-legal-compliance/`

## 第一步：先读内部结论（快）
| 文件 | 用途 |
|---|---|
| `LC/compliance-register.md` | 所有适用法律和义务的总表 |
| `LC/tga-samd-boundary.md` | 功能红绿灯、预期用途声明 |
| `LC/privacy-program.md` | APPs 落地方案 |
| `LC/aged-care-regulatory.md` | Aged Care Act 对供应商的影响 |
| `LC/ai-governance.md` | AI 原则与风险登记 |
| `docs/PRD.md` §9 | 产品护栏 G1–G11 |

## 第二步：按主题查原文
| 主题 | 什么时候必须查 | 本地文件 |
|---|---|---|
| **Aged care 法定义务** | 任何涉及老人记录、权利、provider 义务的功能 | `LL/aged-care-act-2024-compilation-2026-07-01.pdf` · `LL/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` · `LL/aged-care-rules-2025-vol2-compilation-2026-08-01.pdf` · `PT/health-provider-responsibilities-and-record-keeping-summary.md` |
| **质量标准** | 记录内容、交接、临床照护、信息管理 | `LL/strengthened-aged-care-quality-standards-nov-2025.pdf` · `LL/acqsc-strengthened-quality-standards-quick-reference-guide.pdf` |
| **事故与 SIRS** | 事故报告、敏感事件、时限提示 | `LL/acqsc-reportable-incidents-sirs-quick-guide-changes-1-nov-2025.pdf` · `PT/acqsc-sirs-*`（通报表、影响评估、调查计划、决策工具、流程图）· `LL/acqsc-effective-incident-management-systems-guidance-2021.pdf` · `PT/acqsc-recording-incidents-in-ims-fact-sheet-2021.pdf` |
| **限制性措施 / 行为支持** | 行为记录、BSP、约束相关提醒 | `PT/health-consent-for-restrictive-practices-info-for-providers-2026.pdf` · `PT/acqsc-behaviour-support-plans-fact-sheet.pdf` · `PT/dsa-behaviour-support-plan-template-*.pdf` · `PT/acqsc-restraint-free-decision-making-tool-residential.pdf` |
| **跌倒、压伤、疼痛、恶化** | 对应的记录模板（只照录，不评分） | `PT/acsqhc-falls-guidelines-residential-aged-care-2025.pdf` · `PT/qld-health-rcf-post-fall-clinical-pathway.pdf` · `PT/vic-health-standardised-care-process-*.pdf` · `PT/palliaged-abbey-pain-scale-fillable.pdf` · `PT/qld-health-racf-pathway-*.pdf` |
| **交接** | 交接摘要 | `PT/sa-health-isbar-clinical-handover-fact-sheet.pdf` |
| **Care minutes / AN-ACC** | 价值主张、营销表述、任何资金相关功能 | `PT/health-care-minutes-information-for-workers.pdf` · `PT/health-an-acc-*.pdf` |
| **TGA 医疗器械边界** | **每个功能**、所有界面文字和营销文案 | `LL/tga-digital-scribes-summary.md` · `PT/tga-digital-scribes-guidance-summary.md` · `LL/tga-report-clarifying-strengthening-regulation-mdsw-ai-2025.pdf` · `LL/tga-software-and-ai-compliance-and-reforms-presentation-2026-07.pdf` |
| **隐私（APPs）** | 任何新收集、使用、披露、保留、跨境的数据 | `LL/privacy-act-1988-compilation-2026-06-04.pdf` · `LL/oaic-app-guidelines-consolidated-2026-05.pdf` · `LL/privacy-and-other-legislation-amendment-act-2024-as-made.pdf` |
| **自动化决策透明度（2026-12-10 生效）** | 自动分配、自动分类、任何"系统替人做了选择"的功能 | `LL/oaic-app-1-7-1-9-adm-transparency-flowchart-2026-09.pdf` · `LL/ag-privacy-reform-consultation-paper-2026-08-exposure-draft.pdf` |
| **使用商用 AI / LLM** | 选型、提示词、数据流、训练 | `LL/oaic-checklist-privacy-use-of-commercial-ai-products-2024.pdf` · `LL/oaic-checklist-selecting-an-ai-product-2024.pdf` · `LL/oaic-checklist-developing-training-genai-models-2024.pdf` · `LL/oaic-guidance-commercial-ai-products-summary.md` |
| **数据泄露** | 事故流程、DPA、通知时限 | `LL/oaic-data-breach-preparation-and-response.pdf` · `LL/oaic-quick-reference-responding-to-data-breaches-2026-06.pdf` |
| **护士专业责任** | 审核流程、作者身份、记录规范 | `LL/ahpra-ai-in-healthcare-summary.md` · `LL/nmba-code-of-conduct-for-nurses-2018.pdf` · `LL/nmba-registered-nurse-standards-for-practice-2016.pdf` · `LL/nmba-enrolled-nurse-standards-for-practice-2016.pdf` |
| **临床 AI 安全** | AI 起草、ambient scribe、评测 | `LL/acsqhc-ai-clinical-use-guide-2025-08.pdf` · `LL/acsqhc-ai-safety-scenario-ambient-scribe-2025-08.pdf` · `LL/health-safe-responsible-ai-in-health-care-regulation-review-final-report-2025-07.pdf` |
| **国家 AI 指引** | AI 治理、客户尽调 | `LL/disr-nais-guidance-for-ai-adoption-foundations.pdf` · `LL/disr-nais-guidance-for-ai-adoption-implementation-practices.pdf` · `LL/disr-national-ai-plan-2025-12.pdf` · `LL/voluntary-ai-safety-standard-status-summary.md` |
| **网络安全** | 架构、基础设施、员工设备 | `LL/asd-essential-eight-maturity-model-2023-11.pdf` · `LL/asd-engaging-with-artificial-intelligence-2024-01.pdf` |
| **各州差异** | 健康记录法、保存期、公立机构、护士配比、限制性措施同意 | `REF/state-by-state-comparison.md` |
| **文书字段与 AI 适合度** | 设计任何文书模板 | `REF/paperwork-taxonomy.md` · `PT/index.md`（含许可说明） |

## ⚠️ 本地资料库缺口（使用前必须先补充或问律师）
| 主题 | 缺少的文件 | 影响 |
|---|---|---|
| **监控设备法 / 录音** | Surveillance Devices Act 1999 (Vic)、Surveillance Devices Act 2007 (NSW) 等各州监控设备法 | **整班录音（Shift Capture）必须用到** |
| **工作场所监控** | Workplace Surveillance Act 2005 (NSW)、Workplace Privacy Act 2011 (ACT) | 员工录音告知 |
| **生物特征信息** | OAIC 关于生物特征信息的指引 | 声纹过滤 |
| **Australian Consumer Law** | ACCC 关于误导性陈述的指引 | 营销文案 |
补充方法：跑 `compliance-review` skill（需要联网），或者手动从官方网站下载到 `LL/` 并更新 `LL/index.md`。

## 版权提醒
`PT/` 里的模板大多**只允许非商业使用**：只能作为设计参考，**禁止**原样复制进产品或对外分发。许可说明见 `PT/index.md`。
