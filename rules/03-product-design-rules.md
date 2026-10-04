---
paths:
  - "docs/**"
  - "06-app-development/**"
---

# 产品设计规范 (Product Design Rules)

Owner: Lightman (PO) · Last reviewed: 04/10/2026
适用：功能定义、UX 设计、界面文字、AI 行为设计、模板设计

## 1. 必须参考本地法律文件
- **必须**：设计任何功能之前，先用 `legal-reference-check` skill，或者手动按 [`legal-reference-map.md`](legal-reference-map.md) 查阅相关的本地法律文件。
- **必须**：设计稿或设计说明里写一节 **"法律依据"**，列出查阅过的本地文件路径，以及这些文件对设计的具体约束。
- **禁止**：凭记忆或通用知识判断合规。本地资料库没有覆盖的主题（见对照表里的"缺口"），必须标注 `⚠️ 本地无资料，需律师确认`，并且在补齐之前**不能上线**。
- 本地文件之间有冲突，或者内容可能已经过时（比如超过 6 个月没有复核），以官方最新版本为准，并更新资料库。

## 2. 设计前的必答问题
每个功能都要能回答下面这些问题，答案写进设计说明或 PRD：

| # | 问题 | 依据 |
|---|---|---|
| 1 | TGA 红绿灯是什么颜色？界面文字会不会扩大预期用途？ | `LC/tga-samd-boundary.md`、`LL/tga-digital-scribes-summary.md` |
| 2 | 收集了哪些新数据？是否必要？存哪里？保留多久？会不会出境？ | APP 3/6/8/11；`LC/privacy-program.md` |
| 3 | 系统有没有替人做选择（自动分配、自动分类）？需不需要披露？ | APP 1.7–1.9（2026-12-10 生效） |
| 4 | 护士在哪一步确认？能不能绕过？ | 护栏 G1；AHPRA AI 指引 |
| 5 | 出错会伤害到谁？最坏情况是什么？ | `06-app-development/clinical-safety/hazard-log.md` |
| 6 | 涉及哪些 provider 法定义务（记录、SIRS、限制性措施、老人权利）？ | Aged Care Act / Rules / Quality Standards |
| 7 | 在不同州有没有差异？ | `REF/state-by-state-comparison.md` |
| 8 | 老人或家属能不能退出？退出后怎么处理？ | Statement of Rights；APP |

## 3. 设计原则（来自主 PRD）
1. **护士是作者**：确认是一个有意识的动作；敏感内容必须逐条确认，不能一键全过。
2. **只写说过的**：AI 新增或改写的内容要高亮；每句话都能追溯到原话。
3. **不确定就问，不要猜**：低置信度的老人归属、数值、术语都要让人确认。
4. **安全失败**：AI 或网络出问题时，护士能退回手动记录，草稿不丢失。
5. **为真实场景设计**：单手操作、戴手套、经常被打断、Wi-Fi 差、英语不是母语。
6. **尊重的语言**：界面和示例使用 person-centred 语言（"older person"、"resident"）。
7. **无障碍**：目标 WCAG 2.2 AA；字号可调、对比度足够、支持屏幕阅读器。
8. **隐私默认**：默认最少收集、最短保留；隐私选项默认选择更保护隐私的一边。

## 4. 禁止设计的功能（TGA 红灯）
诊断或鉴别诊断 · 风险评分或恶化预测 · 治疗或用药建议 · 根据数值自动报警 · 自动判定或自动上报 SIRS · 用录音监控员工绩效。
如果确实想做，必须作为公司级决策走 ADR，按 SaMD 路线单独立项。

## 5. 界面文字
- 跑 `tga-boundary-check` 检查所有界面文字。
- 禁用词：diagnose、detect、predict、risk score、monitor condition、early warning、clinical insights。
- 推荐表述："helps you document"、"sorts your notes by resident"、"you review and approve every note"。

## 6. 模板设计
- 字段设计参考 `REF/paperwork-taxonomy.md` 和 `PT/` 中的官方模板，但**不能原样复制**有版权限制的模板，要自己设计或取得授权。
- 评分类字段（Abbey、Braden 等）只能"员工输入、系统照录"，系统不推算分数。
- ISBAR 的 A 和 R 栏、care plan 的"策略"栏：只用员工原话，没说就显示"请填写"。
