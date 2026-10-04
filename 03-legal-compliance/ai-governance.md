# AI 治理政策 (AI Governance Policy)

Owner: Lin (Tech Lead)· Status: Draft v0.1 · Last reviewed: 04/10/2026

## 1. 适用范围
careKind 产品中所有使用 AI / ML / LLM 的功能，以及员工在工作中使用 AI 工具。

## 2. 原则
1. **Human-in-the-loop**：AI 生成的临床记录在护士审核确认前，不得写入正式记录。
2. **Grounded only**：草稿只能来自护士输入（及明确授权的上下文），不得生成输入中不存在的临床事实（如生命体征数值、用药、时间）。
3. **Transparent**：记录标注 AI 辅助；护士知道 AI 做了什么、没做什么；住户/家属可获知 AI 被使用（通过 provider 告知）。
4. **Accountable**：每个 AI 功能有明确 Owner；事故有报告与复盘流程。
5. **Fair**：对不同口音、英语非母语使用者、性别、年龄的转写与生成质量做评测，差距超阈值不上线。
6. **Private**：遵守 `privacy-program.md`；不用客户数据训练通用模型。
7. **Within scope**：遵守 `tga-samd-boundary.md`。

## 3. 外部框架对齐
| 框架 | 我们如何对齐 |
|---|---|
| AHPRA《Meeting your professional obligations when using AI in healthcare》(2024) | 支持从业者的责任、透明、知情同意、审核——产品功能设计逐项对齐 |
| NMBA Code of Conduct / 记录标准 | 记录准确、及时、客观；护士保留作者身份 |
| Guidance for AI Adoption（DISR/NAIC，2025-10，6 项实践；取代了 Voluntary AI Safety Standard） | 自愿采纳。原文见 `references/law-library/disr-nais-guidance-for-ai-adoption-*.pdf` |
| OAIC 商用 AI 产品隐私指引（2024） | 选型和使用 LLM 时逐项对照 OAIC 检查清单 |
| ACSQHC AI 临床使用指南 + ambient scribe 安全场景（2025-08） | 作为临床安全设计参考 |
| ISO/IEC 42001 (AI 管理体系) | 远期认证目标，当前作为参考结构 |

## 4. AI 风险登记（初版）
| 风险 | 影响 | 控制措施 | 状态 |
|---|---|---|---|
| 幻觉：生成不存在的事实 | 临床伤害、审计风险 | 约束式提示、事实核查层（输出 vs 输入比对）、高亮新增内容、评测集 | 🔴 |
| 遗漏关键信息（如跌倒、疼痛） | 临床伤害 | 关键实体召回率评测；审核界面并列显示原始转写 | 🔴 |
| 转写错误（口音、药名、人名） | 记录错误 | 自定义词表（住户名、药名）；低置信度标记 | 🔴 |
| 语言不尊重/偏见 | 违反 Standard 1、品牌受损 | 语言风格规则 + 评测 | 🔴 |
| 自动化偏差 (automation bias)：护士不认真审核 | 错误进入记录 | UX：关键字段强制确认；培训；抽样审计 | 🔴 |
| 提示注入 / 越权 | 数据泄露 | 输入隔离、输出过滤、租户隔离 | 🔴 |
| 模型供应商变更导致行为漂移 | 质量下降 | 锁定模型版本；变更前跑回归评测 | 🔴 |

## 5. 评测与发布门槛
- 维护**黄金评测集**：去标识化或合成的 aged care 场景（由临床顾问编写/审核），覆盖 progress note、incident、handover、多语言、口音。
- 每次模型/提示词变更都跑评测；指标：事实一致性（无新增事实）、关键信息召回、格式符合率、语言风格、各人群子集差距。
- 发布门槛：由临床顾问 + CTO 签字。阈值 {{TBD}}。
- 上线后监控：护士修改率、修改类型抽样、用户报告的 AI 错误。

## 6. AI 事故
护士报告"AI 写错了"→ 当作安全事件处理：记录、评估是否已进入正式记录、通知 provider（如需）、复盘、加入评测集。流程见 `09-templates/incident-report.md`。

## 7. 员工使用 AI 工具
- 可以用 AI 编码/写作助手处理**非客户数据**。
- **禁止**把客户数据、住户信息粘贴进任何未经批准的 AI 工具。
- 已批准工具列表维护在 `04-security/vendor-subprocessor-register.md`。
