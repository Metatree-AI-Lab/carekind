# TGA 医疗器械边界 (SaMD Boundary)

Owner: 产品 + 临床顾问 · Status: Active — 每个新功能必须过这张表 · Last reviewed: 04/10/2026

## 为什么重要
按 Therapeutic Goods Act 1989，**预期用途 (intended purpose)** 为诊断、预防、监测、预测、预后、治疗疾病的软件可能被认定为医疗器械（SaMD），需要在 ARTG 注册、符合基本原则、承担上市后义务。对种子期公司来说，这意味着成本和时间都会大幅增加。

TGA 的 **digital scribes** 页面（2026-01-30 更新）写明：只转写或整理记录的 scribe **不属于**医疗器械；如果 scribe 生成了临床人员**没有说过**的诊断或治疗内容，就属于医疗器械。TGA 目前还在做 Digital Scribe Review，需要持续关注。摘要见 `references/law-library/tga-digital-scribes-summary.md`。

**预期用途由我们的全部表述决定**：产品文案、官网、销售 PPT、App 内文字、合同、演示时说的话。

## 预期用途声明（对外统一口径）
> careKind AI is a documentation assistant that helps aged care staff draft records from their own spoken or written notes. All drafts are reviewed and approved by the staff member before being saved. careKind AI does not diagnose, recommend treatment, or make clinical decisions.

## 功能红绿灯
| 🟢 可以做（文书辅助） | 🟡 需边界审查 + 律师/法规顾问意见 | 🔴 不做（会成为 SaMD） |
|---|---|---|
| 语音转文字 | 根据记录"提示可能缺失的字段"（如未记录跌倒时间） | 根据症状提示可能的诊断 |
| 把护士口述整理为机构模板 | 提示"该事件可能需要按 SIRS 评估"（只做流程提示） | 推荐治疗、用药、剂量调整 |
| 语法、拼写、person-centred 语言改写 | 从历史记录中汇总趋势（如"本周 3 次跌倒记录"） | 跌倒/压伤/恶化风险评分或预测 |
| Handover 汇总（只复述已记录事实） | 生命体征超出机构设定阈值时的显示提示 | 自动判断是否需要转院/就医 |
| 翻译（多语言口述 → 英文） | 伤口照片的文字描述辅助 | 伤口照片分析分期 |
| 模板管理、导出、集成 | | 用药核对、过敏冲突判断 |

## 流程
1. PRD 中必须有一节 "TGA boundary check"，引用本表。
2. 🟡 功能：产品 + 临床顾问评审，必要时外部法规顾问，结论记入 ADR。
3. 营销文案上线前由产品 Owner 检查是否扩大了预期用途（例："predicts falls" ❌，"helps you document falls faster" ✅）。
4. 如未来战略决定做 🔴 功能 → 单独立项，走 SaMD 路线（QMS / ISO 13485、临床证据、ARTG），这是公司级决策。
