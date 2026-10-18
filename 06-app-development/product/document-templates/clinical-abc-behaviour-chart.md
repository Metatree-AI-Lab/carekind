# ABC behaviour chart（行为观察记录：Antecedent · Behaviour · Consequence）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
每次住户出现 BSP 中列出的行为，或员工认为需要记录的行为变化时，记录**之前发生了什么、行为本身（描述行为，不贴标签）、之后发生了什么、用了哪些替代策略和效果**。这些记录是 BSP 每次行为发生信息（日期、时间、持续时间、后果、相关事件、预警信号）的来源。

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 情绪或行为 | ✅ ABC + progress note + 交接要点 |
| 情绪或行为 + 有人受伤 | ✅ 再加 incident 草稿 + ⏱ SIRS 评估提示 |
| 行为中使用了限制性措施 | ✅ 再加 `clinical-restrictive-practice-use-monitoring.md` + "请确认 BSP、同意和监测记录" |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 在场的员工（PCW / EN / RN） |
| 谁审核签署 | **只有 RN，逐条确认**（行为事件 = Tier 3） |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 3 |
| 时限 | 行为结束、住户安全后尽快；本班结束前必须确认。BSP 规定了观察期的，按 BSP |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| BSP 要记录每次行为发生的日期、时间、持续时间、不良后果、相关事件、预警信号或诱因 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 162-50(d)，第 274 页（印刷页码） | 字段必须覆盖这些项；"诱因 / 原因"只能写员工观察或员工原话 |
| BSP 记录替代策略的效果和监测 | 同上 | r 162-50(e)–(g)，第 274–275 页 | 记录用过哪个策略、效果如何 |
| 认知障碍：识别和减少诱发行为变化的情境 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 5.6.3，第 40 页；Action 3.2.6，第 26 页 | 记录情境（环境、时间、人），不推断临床原因 |
| 限制性措施最少化 | 同上 | Action 3.2.7，第 26 页 | 行为中出现约束 → 链接 RP 记录 |
| 描述行为而不是贴标签 | `03-legal-compliance/references/paperwork-templates/dsa-behaviour-support-plan-template-restrictive-practices.pdf` | 行为描述栏（⚠️ 许可未核实，**只参考原则，不复制**） | AI 把标签改写成可观察描述 |
| Behaviours of concern 流程 | `03-legal-compliance/references/paperwork-templates/qld-health-racf-pathway-behaviours-of-concern.pdf` | ⚠️ 页码需核实 | 只作主题参考 |
| 行为事件造成伤害 → SIRS | `03-legal-compliance/references/law-library/acqsc-reportable-incidents-sirs-quick-guide-changes-1-nov-2025.pdf` | 第 2 页（P1 24 小时） | 只显示提示，不判定（护栏 G6） |

**州差异**：ABC 字段本身没有州差异；行为中如使用限制性措施，同意规则按州（见 `clinical-restrictive-practice-consent-record.md` 和 `03-legal-compliance/references/state-by-state-comparison.md` §3.4）。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | 姓名 + 识别信息 | ✅ | 🧑 人工 | |
| Date · start · end · duration | | ✅ | 🗣️ 照录 | 持续时间由员工说的起止时间得出；只说"大概 20 分钟"就照录 |
| Location | | ✅ | 🤖 AI 可起草 | |
| Staff present | | ✅ | 🧑 人工 | |
| **A** Antecedent / what was happening before | 环境、活动、人、噪音、时间 | ✅ | 🤖 AI 可起草 | 只写员工观察到的；"不知道"就写 "Not observed" |
| Early warning signs observed | 员工看到的前兆 | 有则填 | 🤖 AI 可起草 | |
| **B** Behaviour | 具体做了什么、说了什么 | ✅ | 🤖 AI 可起草 + 🗣️ | 动作可整理；住户的话照录 |
| Who / what was affected | 其他住户、员工、物品 | ✅ | 🤖 AI 可起草 | 有人受伤 → incident + SIRS 提示 |
| **C** Consequence / response | 员工做了什么、住户的反应 | ✅ | 🤖 AI 可起草 | |
| BSP strategies used & effect | 对照 BSP 中的策略 | ✅ | 🤖 AI 可起草 | 只匹配员工说过的做法；**不推荐**新策略 |
| Restrictive practice used? | 是 / 否 / 类型 | ✅ | 🧑 人工 | 叙述提到上锁、按住、镇静等 → 提示，员工确认 |
| Injury / harm | 员工观察到的 | ✅ | 🗣️ 照录 | 没说 → "请填写"，不默认"无" |
| Possible triggers / causes | | 仅员工说出时 | 🧑 人工 / 🗣️ | **AI 不推断**（例如"可能是疼痛"） |
| Notified | RN / 家属 / GP | 有则填 | 🗣️ 照录 | |
| RN review | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### ABC behaviour chart
Resident: ____ · ID: ____ · Room: ____
Date: __/__/____ · Start __:__ · End __:__ · Duration: ____ · Location: ____
Staff present: ____

**A — Before:** ____
**Early warning signs:** ____
**B — Behaviour (describe, don't label):** ____ · Resident said: "____"
**Affected:** ____
**C — Response and outcome:** ____
**BSP strategies used → effect:** ____
**Restrictive practice used:** Yes / No · Type: ____ (→ RP use record)
**Injury / harm observed:** ____
**Triggers / causes (staff's own words only):** ____
**Notified:** ____
RN review: ____ · Confirmed by: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · PM shift · Banksia wing（memory support，出口为键盘锁门）。

**原话（Priya 17:15 口述，转写）**
> "Tomasz, room seven Banksia. About twenty to five, after the visitors went out the front door, he was at the door pushing the handle, banging on it with his hand, three times maybe, yelling let me out I need to go home. He was really aggro. TV was blaring in the lounge. Nobody else near him. I went up in front of him, said Tomasz, nice and quiet, asked if he wanted to walk in the garden, he said yes. We walked, I asked about his carpentry, he told me about building his kitchen. By about two minutes to five he sat on the bench, he was smiling, talking normal. Then tea with honey in the lounge at five. He was rubbing his left knee, said this knee is no good today, so I told Daniel."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Resident: Mr Tomasz Nowak（虚构，81 岁）· WG-0287 · Room 7, Banksia wing
Date: 18/10/2026 · Start 16:40 · End 16:58 · Duration: **18 minutes** · Location: Banksia wing exit door, then garden courtyard
Staff present: Priya (PCW，虚构)

**A — Before:** Visitors had just left through the Banksia wing door. The television in the lounge was **loud**.
**Early warning signs:** **Not observed**（Priya 没有说到前兆）
**B — Behaviour:** Tomasz stood at the exit door, pushed the handle repeatedly and **hit the door with his open hand about three times**. He said **in a loud voice**: "Let me out, I need to go home."
**Affected:** No other residents or staff were near him. **请填写：门或物品是否损坏**
**C — Response and outcome:** Priya approached him from the front, used his name and spoke **quietly**. She offered a walk in the garden courtyard; Tomasz accepted. They talked about his carpentry work; he talked about building his kitchen. At 16:58 he sat on the garden bench, **smiling and speaking at his usual volume**. At 17:00 he had tea with honey in the lounge.
**BSP strategies used → effect:** Approach from the front and use his name · Garden walk · Talk about carpentry → **Tomasz accepted the walk and was seated and smiling by 16:58**（匹配 BSP 01/09/2026 中的策略 1、2、4）
**Restrictive practice used:** 🧑 请确认 — 门处于键盘锁状态（BSP 中已同意的 environmental restraint）。本次没有使用其他约束。→ 已生成 RP monitoring 条目
**Injury / harm observed:** 请填写
**Triggers / causes:** —（员工没有说）
**Notified:** Daniel Reyes RN（虚构）at 17:02 about left knee — "This knee is no good today."（→ PRN 记录、pain 记录由 RN 处理）

**改写说明**
- "really aggro" → 删除标签，保留可观察行为（推门、拍门、大声说话）；**AI 没有**写 "agitated" 或 "aggressive behaviour"。
- "yelling" → **"in a loud voice"**；"talking normal" → **"speaking at his usual volume"**。
- "after the visitors went out" 写进 A 栏，但 **AI 没有**写 "triggered by visitors leaving"——是否是诱因由 RN 判断。
- 膝盖疼的原话照录在 Notified 栏；**AI 没有**写 "behaviour may be related to pain"。

**RN 审核（Daniel Reyes RN，17:40）**
- Affected: "No damage to the door." · Injury: "No injury seen; I checked his right hand at 17:05, no marks."
- Triggers / causes（RN 原话）："Visitors leaving and the TV seem to set him off at this time of day, same as the BSP says. Knee pain could be part of it too — I'll mention it at the BSP review."
- Confirmed by: Daniel Reyes RN · 18/10/2026 17:40

## 7. careKind 起草规则
- **可从口述自动填**：时间、地点、A / B / C 叙述、住户原话、员工用过的策略（匹配 BSP 中已有条目）、通知。
- **缺失时显示"请填写"**：伤害 / 损坏（不能默认"无"）；结束时间；是否使用了限制性措施。
- **必须 RN 确认**：每一条 ABC（Tier 3，逐条）；诱因 / 原因；是否涉及限制性措施；是否需要 incident。
- **禁止生成**：行为标签（"aggressive"、"wandering"、"difficult"）；诱因或原因推断（疼痛、谵妄、感染）；新的替代策略或用药建议；行为频率趋势的临床解读；是否属于 SIRS reportable incident 的判断。
- 叙述中出现"锁上 / 按住 / 关在房间 / 给了药让他安静"等 → 显示"请确认 BSP、同意和监测记录"（只提示，不判定违规）。
