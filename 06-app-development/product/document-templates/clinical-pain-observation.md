# Pain observation record（疼痛观察记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录住户的疼痛：住户自己怎么说（部位、性质、自评分数）、员工观察到什么、员工使用了哪个评估工具并**自己**给出的分数、采取了什么措施、复查结果。**所有分数只照录员工输入，careKind 不计算、不推算、不把分数换算成严重程度。**

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 疼痛 / 皮肤 / 临床观察（口述提到疼痛、住户说痛、员工观察到疼痛表现） | ✅ + progress note + 交接要点 |
| 跌倒后 | ✅（作为跌倒后记录的一部分，链接 incident / 跌倒后记录） |
| PRN 镇痛前后 | ✅ 与 `clinical-prn-effectiveness.md` 互相链接 |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 观察的员工；**使用评估工具并评分的必须是机构授权的人员（通常 RN / EN）** |
| 谁审核签署 | RN（EN 视机构政策） |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 2；跌倒或伤害后的疼痛记录随事件 Tier 3 |
| 时限 | 观察到时尽快；干预后在 RN 说出的复查时间（或机构政策 ⚠️）复查；入住、怀疑疼痛、状态变化时的评估频率由机构政策决定 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 评估疼痛，包括沟通有困难的住户；计划、监测和响应止痛需要；24 小时可得 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 5.5.8(a)(b)(c)，第 39 页 | 同时支持自评和观察工具；记录复查 |
| 监测临床状况 | 同上 | Action 5.4.5，第 37 页 | |
| RACF 疼痛评估流程（提到 PAINAD、Abbey 等观察工具） | `03-legal-compliance/references/paperwork-templates/qld-health-racf-pathway-pain-assessment.pdf` | 第 2 页 | 工具名称作为选项；许可 ⚠️ 需核实，不复制 |
| Abbey Pain Scale | `03-legal-compliance/references/paperwork-templates/palliaged-abbey-pain-scale-fillable.pdf` | 全文（6 项，每项 0–3） | **量表有原作者权利、许可 ⚠️ 需核实：careKind 不复制量表条目说明和分区**；只记录员工给出的分数 |
| 文书字段与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md` | §4.6（AI 自动打分 = TGA 风险高） | 系统不推算分数 |
| 评分类字段只能"员工输入、系统照录" | `rules/03-product-design-rules.md` | §6 | |
| TGA 边界 | `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md`；`03-legal-compliance/tga-samd-boundary.md` | 红绿灯表 | 评分 / 评估 = 红灯 |

**州差异**：疼痛记录本身没有州法差异；VIC 公营机构可能使用 Vic 卫生部的标准化护理流程（⚠️ 本地未下载疼痛相关文件）。见 `03-legal-compliance/references/state-by-state-comparison.md`。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | | ✅ | 🧑 人工 | |
| Date / time | | ✅ | 🗣️ 照录 | |
| Context | 跌倒后 / 照护中 / PRN 前 / 例行…… | ✅ | 🤖 AI 可起草 | 链接相关记录 |
| Resident's words | 住户怎么描述疼痛 | 有则必填 | 🗣️ 照录 | 包括"我不疼" |
| Site | 部位 | ✅ | 🗣️ 照录 | 左右必须是员工说的，**不推断** |
| Self-reported score & scale | 例如 "4/10, numeric" | 有则填 | 🗣️ 照录 | 住户说的数字原样记录 |
| Observed signs | 员工看到的表情、动作、声音 | 有则填 | 🤖 AI 可起草 | 可观察描述 |
| Observational tool used | Abbey / PAINAD / 机构工具 | 用了则必填 | 🧑 人工 | |
| Item scores | 员工逐项说出的分数 | 员工说了才填 | 🗣️ 照录 | 没说的项留空，不补 |
| Total score | 员工自己给出的总分 | 用了工具则必填 | 🧑 人工 / 🗣️ | **系统不求和**；员工说的各项与总分不一致 → 提示"请 RN 核对"（不自动更正） |
| Severity / category | 例如 "mild / moderate" | 仅员工说出时 | 🧑 人工 | **系统不按分数自动分区** |
| Pain type | 急性 / 慢性 / 慢性加重…… | 仅员工说出时 | 🧑 人工 | |
| Measures taken | 非药物、PRN（链接）、通知 | ✅ | 🤖 AI 可起草 | 不建议措施 |
| Review time & result | | ✅ | 🗣️ 照录 | |
| Recorded / reviewed by | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### Pain observation
Resident: ____ · ID: ____
Date: __/__/____ · Time: __:__ · Context: ____ (linked: ____)
Resident said: "____"
Site: ____ · Self-reported score: ____ (scale: ____)
Observed signs: ____
Observational tool (if used): ____ · Item scores (as entered): ____ · Total (as entered by ____): ____
Severity / pain type (staff's own words only): ____
Measures taken: ____
Review at __:__ → resident said: "____" · score: ____ · observed: ____
Recorded by: ____ · Reviewed by: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · 15:10 Mrs Edna Hall 浴室跌倒后（见 `daily-progress-note.md`）。Edna 能自己说出疼痛，所以用自评分数；观察工具示例见 `clinical-prn-effectiveness.md`（Tomasz，Abbey 总分由 RN 给出）。

**原话（Daniel Reyes RN 15:28 口述，转写）**
> "Pain for Edna after the fall. She says her right wrist hurts, says it's about a four out of ten, sore when she moves it. Asked about her hip and head, she says 'my hip's fine, nothing else hurts.' She was guarding the wrist, holding it against her chest. I put a cold pack on from five to four for twenty minutes, propped it on a pillow. Recheck at half five."

**复查原话（Daniel 17:32）**
> "Edna at half five, says the wrist is two out of ten now, 'it's just sore when I move it.' She's using her left hand for her cup."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Resident: Mrs Edna Hall（虚构，88 岁）· WG-0412
Date: 18/10/2026 · Time: **15:25**（⚠️ 口述于 15:28，原话没有说观察时间——请确认）· Context: **Post-fall**（linked: progress note 15:35, incident draft, vital signs 15:20, wound 15:50）
Resident said: "**It's about a four out of ten**", sore when she moves it. "My hip's fine, nothing else hurts."
Site: Right wrist · Self-reported score: 4/10 (scale: **numeric 0–10**)
Observed signs: **Holding her right wrist against her chest**（原话 "guarding the wrist, holding it against her chest"）
Observational tool: — （未使用）
Severity / pain type: —（RN 未说）
Measures taken: Cold pack to right wrist from 15:55 for 20 minutes; wrist **supported** on a pillow.
Review at 17:30 → resident said: "It's just sore when I move it." · score: 2/10 · observed: Using her left hand to hold her cup.
Recorded by: Daniel Reyes RN（虚构）· Reviewed by: Daniel Reyes RN · 17:35

**改写说明与审核要点**
- "says it's about a four out of ten" → 放进 Resident said，并在 Self-reported score 中照录 **4/10**；**AI 没有**写 "mild pain" 或 "moderate pain"。
- 时间：RN 说的是 "after the fall"，没有说具体时间。AI 用了 RN 15:25 的语音片段时间并标 ⚠️，RN 审核时确认 "15:25"。
- "propped it on a pillow" → **"supported on a pillow"**（规范措辞）。
- "nothing else hurts" 是住户原话，**AI 没有**改写成 "no other injuries"——疼痛自述和伤情检查是两件事。
- 15:10 跌倒后，pain 记录和 vital signs、wound、escalation 记录互相链接；交接（22:45）中的 "4/10 at 15:25 and 2/10 at 17:30" 直接引用本记录。

## 7. careKind 起草规则
- **可从口述自动填**：住户原话、部位（左右只按员工说的）、住户自评数字、员工观察到的表现、员工说出的工具名称和分数、措施、复查结果。
- **缺失时显示"请填写"**：观察时间（原话没说时）；用了工具但没说总分；复查时间。
- **必须 RN 确认**：所有分数（自评和工具分）；工具名称；严重程度和疼痛类型（只有 RN 说了才有）。
- **禁止生成**：从叙述推断任何一项分数或总分；自动把各项分数相加；按分数自动标注 "no pain / mild / moderate / severe"；疼痛原因（"likely fracture"）；镇痛建议或"建议做 X-ray"；疼痛趋势的临床解读。
- 认知障碍住户无法自评时：提示"可以使用机构规定的观察工具，由授权人员评分"；careKind 只提供空白字段，不预填。
