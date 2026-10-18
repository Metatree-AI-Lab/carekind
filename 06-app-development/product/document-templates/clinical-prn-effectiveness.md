# PRN effectiveness note（PRN 按需用药效果记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录一次 PRN 给药的**叙述部分**：员工观察到的给药理由、给药前尝试过的非药物措施、复查时间和效果、观察到的不良反应。**药名、剂量、给药时间和签名以 eNRMC / 用药系统为准，careKind 不写用药记录本身，也不替代用药系统。**

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 疼痛 / 临床观察 + 口述提到"给了 PRN" | ✅ 给药叙述 + 待复查提醒（复查时间由 RN 说出或按机构政策） |
| 情绪或行为 + 给了精神类 PRN | ✅ + "可能属于 chemical restraint，请确认 BSP、同意和处方" → `clinical-restrictive-practice-use-monitoring.md` |
| 复查时的口述 | ✅ 补充效果栏 |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 给药的 RN / EN（按机构的给药授权）；PCW 可以口述观察到的效果 |
| 谁审核签署 | RN（EN 视机构政策） |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 2（PRN 效果）；精神类 PRN 用于行为 → Tier 3 |
| 时限 | 给药后尽快记录理由；在 RN 说出的复查时间点（或机构政策规定的时间 ⚠️）记录效果 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 记录所有药物及其临床理由，包括 PRN | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 5.3.1(e)，第 35 页 | 记录理由和效果；用药记录本身在用药系统 |
| PRN 医嘱应有适应症和最大剂量 | `03-legal-compliance/references/paperwork-templates/health-guiding-principles-medication-management-racf-2022.pdf` | Guiding Principle 8 §5 "PRN medicines"，PDF 第 54 页；Guiding Principle 9（PRN 适应症记录），PDF 第 62 页 | careKind 不核对剂量、不判断是否超量 |
| 精神类 PRN：每次使用记录原因、尝试过的替代措施、效果 | `03-legal-compliance/references/paperwork-templates/acqsc-psychotropic-prn-stickers-guide.pdf` | 第 1–2 页（2020，引用旧 QoC Principles） | 字段主题参考；**不复制其贴纸版式和措辞** |
| 化学约束：医生 / NP 评估、处方、同意，记录在 BSP | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 17-5(2)，第 98 页；r 162-25，第 270–271 页；r 162-30(e)，第 272 页（印刷页码） | "是否属于 chemical restraint"由 RN 判断；属于时链接 RP 记录 |
| 疼痛管理 | strengthened-aged-care-quality-standards-nov-2025.pdf | Action 5.5.8(b)，第 39 页 | 效果复查是疼痛管理的一部分 |
| TGA 边界 | `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | — | 绝不建议是否给药、剂量、换药 |

**州差异**：给药授权（EN、PCW 协助用药）各州和机构不同 ⚠️ 本地资料未覆盖，按机构政策；化学约束的同意规则见 `03-legal-compliance/references/state-by-state-comparison.md` §3.4。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | | ✅ | 🧑 人工 | |
| Medicine, dose, route, time | **引用** eNRMC 中的记录 | ✅ | 🧑 人工 | 口述中的药名剂量只作核对；不一致 → 以 eNRMC 为准并提示 |
| Given by | | ✅ | 🧑 人工 | |
| Reason — what was observed | 员工看到 / 听到的情况 | ✅ | 🤖 AI 可起草 | 不能写成诊断 |
| Resident's words | | 有则必填 | 🗣️ 照录 | |
| Pain score before (if used) | 员工说出的分数 + 工具 | 有则填 | 🗣️ 照录 | 系统不推算，见 `clinical-pain-observation.md` |
| Non-drug measures tried first & outcome | | ✅ | 🤖 AI 可起草 | 没说 → "请填写" |
| Psychotropic / chemical restraint? | | ✅ | 🧑 人工 | RN 判断；"是"时链接 RP 记录 |
| Review time | | ✅ | 🗣️ 照录 | RN 说出的时间或机构政策 |
| Effect at review | 观察到的变化 + 住户原话 | ✅ | 🤖 AI 可起草 + 🗣️ | 不写"有效 / 无效"，除非 RN 原话 |
| Pain score after (if used) | | 有则填 | 🗣️ 照录 | |
| Adverse effects observed | | ✅ | 🗣️ 照录 | **不能默认"无"** |
| Further action | RN 原话 | 有则填 | 🧑 人工 | 例如"通知 GP" |
| Reviewed by | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### PRN effectiveness note
Resident: ____ · ID: ____
Medicine / dose / route / time (from eNRMC): ____ · Given by: ____
Reason (observed): ____ · Resident said: "____"
Score before (tool, as entered by staff): ____
Non-drug measures tried first → outcome: ____
Psychotropic / chemical restraint (RN): ☐ no ☐ yes → RP record: ____
Review at: __:__ · Reviewed by: ____
Effect observed: ____ · Resident said: "____"
Score after (tool, as entered by staff): ____
Adverse effects observed: ____
Further action (RN's words): ____
Confirmed by: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · PM shift。前因见 `clinical-abc-behaviour-chart.md`（16:40–16:58）：散步时 Tomasz 揉左膝，说 "This knee is no good today"，Priya 17:02 告诉 Daniel。

**原话（Daniel Reyes RN 17:15 口述，转写）**
> "Tomasz, left knee. He told me it's no good today, rubbing it, wincing when he stood up from the lounge chair to show me. Couldn't give me a number, so I did an Abbey, I scored it five. Sat him in the lounge with his leg up on the footstool from just after five, didn't really help, he kept rubbing it. Gave his PRN paracetamol at ten past five, it's charted for pain. Not for behaviour — this is for his knee. I'll check him at ten past six."

**复查原话（Daniel 18:15）**
> "Checked Tomasz at ten past six, he walked to the dining room with his frame, not wincing, sat and ate. He said knee is better now. Abbey two. Nothing untoward."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Resident: Mr Tomasz Nowak（虚构，81 岁）· WG-0287
Medicine / dose / route / time (from eNRMC): Paracetamol 1 g oral, 17:10 — **以 eNRMC 记录为准**（careKind 只显示 eNRMC 已有条目，口述未说剂量）· Given by: Daniel Reyes RN（虚构）
Reason (observed): Tomasz was rubbing his left knee and **grimaced** when he stood up from the lounge chair. · Resident said: "This knee is no good today."
Score before (tool, as entered by staff): Abbey Pain Scale — **total 5, as scored by Daniel Reyes RN**（careKind 不计算；各项分数未口述 → 只记总分）
Non-drug measures tried first → outcome: Sat in the lounge with his leg **elevated** on a footstool from **shortly after 17:00**; **he continued to rub his knee.**
Psychotropic / chemical restraint (RN): ☑ no — "Not for behaviour — this is for his knee."
Review at: 18:10 · Reviewed by: Daniel Reyes RN
Effect observed: Tomasz walked to the dining room with his frame **without grimacing**, sat and ate his dinner. · Resident said: "Knee is better now."
Score after: Abbey Pain Scale — total 2, as scored by Daniel Reyes RN
Adverse effects observed: **"Nothing untoward"**（照录 RN 原话；⚠️ 请确认是否指"未观察到不良反应"）
Further action (RN's words): 请填写
Confirmed by: Daniel Reyes RN · 18:20

**改写说明**
- "wincing" → **"grimaced"**：同义规范化，未增加内容。
- "didn't really help, he kept rubbing it" → **"he continued to rub his knee"**：保留可观察事实；"didn't really help" 是 RN 的评价，审核时可恢复。
- **AI 没有**写 "PRN effective" 或 "pain resolved"；也没有根据 5 → 2 写 "pain reduced from moderate to mild"（分数区间解释属于评估，不由系统做）。
- RN 审核补充 Further action："Will mention knee pain at the BSP review; ask Dr Brooks to look at his knee on the 19/10 round."

## 7. careKind 起草规则
- **可从口述自动填**：观察到的理由、住户原话、非药物措施和结果、复查时间、复查时观察到的变化、员工说出的分数（照录，注明工具和评分人）。
- **从 eNRMC 引用（只读）**：药名、剂量、途径、给药时间、给药人；没有接入 eNRMC 时显示"请在用药系统核对"，口述中的药名剂量必须由 RN 逐项确认。
- **缺失时显示"请填写"**：非药物措施、复查时间、不良反应、是否属于 chemical restraint。
- **必须 RN 确认**：整条记录；是否属于 chemical restraint；是否需要进一步行动。
- **禁止生成**：是否应该给药、给多少、何时再给、是否换药或加药；"有效 / 无效"的结论（除非 RN 原话）；分数换算成严重程度；超量或相互作用判断；把"没说到不良反应"写成"无不良反应"。
- 精神类 PRN 用于行为时：自动链接 RP 记录，并提示"请确认 BSP、同意和处方（r 162-25）"。
