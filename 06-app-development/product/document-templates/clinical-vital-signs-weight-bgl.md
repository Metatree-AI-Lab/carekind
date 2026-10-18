# Vital signs, weight & BGL record（生命体征、体重和血糖记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
照录员工口述或输入的数值：生命体征、GCS / 神经观察（如机构流程要求）、体重、BGL，以及测量条件和测量人。**只记录，不报警，不判断正常 / 异常，不计算变化百分比，不套用任何阈值或分区。**

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 疼痛 / 皮肤 / 临床观察（口述中有数值） | ✅ 每组数值一行 |
| 跌倒后（基线和后续观察） | ✅ 链接 incident / 跌倒后记录 |
| 病情变化 / 升级 | ✅ 链接 `clinical-deterioration-escalation.md` |
| 按 care plan 或医嘱的例行测量（体重、BGL） | ✅ |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 测量的员工（PCW 按机构授权测体重和部分体征；GCS / 神经观察通常由 RN / EN） |
| 谁审核签署 | RN（EN 视机构政策） |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 2（生命体征叙述）；跌倒 / 病情变化相关 → Tier 3 |
| 时限 | 测量后尽快；测量频率由 care plan、医嘱和机构流程决定（careKind 不设定频率） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 监测临床状况 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 5.4.5，第 37 页 | 记录可追溯的原值 |
| 营养和水分：响应体重意外下降或增加 | 同上 | Action 5.5.5(c)，第 38 页 | 体重原值 + 测量条件；判断由 RN |
| 跌倒后基线评估包括生命体征 | `03-legal-compliance/references/paperwork-templates/acsqhc-falls-guidelines-residential-aged-care-2025.pdf` | 第 27 页 | 跌倒后数值链接事件 |
| QI：unplanned weight loss（significant ≥5% / 3 个月；consecutive） | `03-legal-compliance/references/paperwork-templates/health-qi-program-manual-part-a-2025-10.pdf` | 第 10–11 章，第 23 页起 | **careKind 不计算百分比、不标记 QI 事件**；记录要能供机构统计 |
| 恶化识别路径的红 / 黄分区 | `03-legal-compliance/references/paperwork-templates/qld-health-racf-pathway-recognition-deteriorating-resident.pdf` | 第 1 页 | 这是临床判断工具，**careKind 不套用** |
| 文书字段与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md` | §4.7（套阈值报警 = monitor / triage） | |
| 护栏 G3 | `docs/PRD.md` | §9 | 不补全数值；不根据数值报警 |
| TGA 红绿灯 | `03-legal-compliance/tga-samd-boundary.md` | "超出机构阈值时的显示提示" = 🟡 需边界审查 | MVP 不做；要做必须先走 ADR 和法规顾问 |

**州差异**：数值记录没有州法差异；保存期按州健康信息法（VIC / NSW / ACT 7 年，其他 ⚠️），见 `03-legal-compliance/references/state-by-state-comparison.md` §3.2。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | | ✅ | 🧑 人工 | |
| Date / time measured | | ✅ | 🗣️ 照录 | 测量时间 ≠ 口述时间时都保留 |
| Context | 例行 / 跌倒后 / 变化时 / 医嘱 | ✅ | 🤖 AI 可起草 | 链接事件 |
| BP (mmHg) · position | | 测了则填 | 🗣️ 照录 | "one-forty-eight on eighty-six" → 148/86，需确认 |
| HR (/min) · regular? | | 测了则填 | 🗣️ 照录 | |
| RR (/min) | | 测了则填 | 🗣️ 照录 | |
| SpO2 (%) · room air / O2 | | 测了则填 | 🗣️ 照录 | |
| Temp (°C) · route | | 测了则填 | 🗣️ 照录 | |
| GCS / neuro obs | 只记录员工给出的总分或机构表格的引用 | 测了则填 | 🧑 人工 / 🗣️ | **不从描述推算 GCS** |
| BGL (mmol/L) · timing (fasting / pre-meal / other) | | 测了则填 | 🗣️ 照录 | |
| Weight (kg) · scale type · clothing | | 测了则填 | 🗣️ 照录 | 不计算 BMI、变化量或百分比 |
| Measured by | | ✅ | 🧑 人工 | |
| Staff comment | 员工自己的话 | 有则填 | 🗣️ 照录 | 例如 "usual for her"（只能是员工原话） |
| Action / notified | 员工说的 | 有则填 | 🗣️ 照录 | 链接升级记录 |
| Reviewed by | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### Vital signs, weight & BGL
Resident: ____ · ID: ____ · Context: ____ (linked: ____)

| Date | Time | BP | HR | RR | SpO2 | Temp | GCS | BGL | Weight | Measured by | Staff comment |
|---|---|---|---|---|---|---|---|---|---|---|---|
| __/__/____ | __:__ | ___/___ | ___ | ___ | ___% (RA/O2) | ___ °C | ___ | ___ mmol/L | ___ kg | ____ | ____ |

Action / notified (staff's words): ____
Reviewed by: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · 15:10 Mrs Edna Hall 浴室跌倒（无人目击）后的观察，频率按机构跌倒后流程（RN 决定）。另附 01/10/2026 例行月体重。

Resident: Mrs Edna Hall（虚构，88 岁）· WG-0412 · Context: Post-fall observations（linked: progress note 15:35, escalation 15:45）

| Date | Time | BP | HR | RR | SpO2 | Temp | GCS | BGL | Weight | Measured by | Staff comment |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 01/10/2026 | 16:00 | — | — | — | — | — | — | — | 66.4 kg (chair scales, day clothes) | Priya (PCW，虚构) | Monthly weight per care plan |
| 18/10/2026 | 15:15 | — | — | — | — | — | 15 | — | — | Daniel Reyes RN（虚构） | Neuro obs started — facility chart |
| 18/10/2026 | 15:20 | 148/86 (sitting) | 92 | 18 | 96% RA | 36.7 | — | 6.8 (random) | — | Daniel Reyes RN | — |
| 18/10/2026 | 16:20 | 142/84 | 88 | 17 | 97% RA | 36.6 | 15 | — | — | Daniel Reyes RN | — |
| 18/10/2026 | 17:20 | 138/82 | 84 | 16 | 97% RA | — | 15 | — | — | Daniel Reyes RN | — |
| 18/10/2026 | 19:20 | 136/80 | 82 | 16 | 97% RA | 36.8 | 15 | — | — | Daniel Reyes RN | — |
| 18/10/2026 | 22:20 | 134/80 | 80 | 16 | 96% RA | — | 15 | — | — | Daniel Reyes RN | "Obs steady all evening" |

Action / notified (staff's words): "Dr Brooks informed of the 15:20 set at 15:45." 
Reviewed by: Daniel Reyes RN · 22:30

**原话 → AI 草稿对照（15:20 行）**
- 原话（Daniel 15:42）："obs at three-twenty BP one-forty-eight on eighty-six, pulse ninety-two, resp eighteen, sats ninety-six on room air, temp thirty-six point seven, BGL six point eight."
- AI 草稿：148/86 · 92 · 18 · 96% RA · 36.7 · BGL 6.8 —— 数值逐个照录；**"(sitting)" 和 "(random)" 是 AI 从上下文补的测量条件 → 原话没有，审核界面高亮并要求 RN 确认或删除**（RN 确认：Edna 当时坐在椅子上；BGL 非空腹）。
- 22:20 行的 "Obs steady all evening" 是 RN 原话，照录在 Staff comment；**系统自己不会写 "stable" 或 "within normal limits"**，也不对 148/86 等任何数值着色。
- 体重：careKind 不计算与上月的差值或百分比；如果机构需要 QI 统计，由机构系统按 QI 手册计算。

## 7. careKind 起草规则
- **可从口述自动填**：每个数值（逐字照录，口语数字转阿拉伯数字后要求确认）、测量时间、测量人、员工说出的测量条件、员工评论、通知。
- **识别置信度低或数字有歧义**（"one-forty-eight on eighty-six"、"ninety or nineteen"）→ 必须员工逐项确认（护栏 G3）；不"合理补全"。
- **缺失时显示"请填写"**：测量人、单位或条件不明的数值；**未测的项目显示"—"，不填默认值**。
- **必须 RN 确认**：GCS / 神经观察、所有跌倒或病情变化相关的数值。
- **禁止生成**：正常 / 异常、高 / 低判断；颜色标记或分区；根据数值报警、提醒或推送；early warning score 或任何评分；体重变化百分比、BMI、QI 事件判定；"需要通知 GP"之类建议；趋势的临床解读。
