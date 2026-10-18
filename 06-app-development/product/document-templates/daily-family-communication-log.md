# Family / supporter communication log（家属与支持者沟通记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录员工和住户的家属、supporter、代理决策人之间的每一次沟通：谁、何时、怎么联系、说了什么、对方说了什么、住户是否同意分享、下一步。MVP 只**记录**沟通，不自动给家属发消息（[PRD §7.6](../../../docs/PRD.md)）。

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 家属来访或沟通 | ✅ |
| 跌倒、伤害、情绪或行为、疼痛 / 临床观察、病情变化、临终照护 | **只在口述中提到"已通知 / 已联系"时**生成 |
| 限制性措施的同意讨论 | 不用本模板 → `clinical-restrictive-practice-consent-record.md` |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 进行沟通的员工（通常是 RN 或 Care Manager；PCW 记录来访时的对话） |
| 谁审核签署 | 沟通人本人确认；涉及 Tier 3 事件的通知记录由 RN 确认 |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | 默认 Tier 1；跟随所关联事件的 Tier（例如跌倒通知 = Tier 3） |
| 时限 | 沟通后尽快记录；事件通知的"及时"由机构政策定义（⚠️ 没有全国统一时限） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 临床事件或变化时及时通知 supporters | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 5.4.4(d)，第 37 页 | 通知时间、方式、对象是必填项 |
| 在知情同意下向 supporters 沟通 | 同上 | Action 3.1.3(b)，第 24 页 | 必须记录住户是否同意分享信息、同意范围 |
| 信息收集和披露需同意 | 同上 | Action 2.7.2(c)，第 19 页 | 同上；住户撤回同意时要记录 |
| 关键信息与 supporters 沟通、升级关切 | 同上 | Outcome 3.3、Action 3.3.1、3.3.3，第 27 页 | 家属提出的担忧要原话记录，并标出已转给谁 |
| 隐私：披露健康信息 | `03-legal-compliance/references/law-library/oaic-app-guidelines-consolidated-2026-05.pdf` | APP 6 ⚠️ 页码需核实 | 只披露住户同意或法律允许的内容 |
| 文书字段参考 | `03-legal-compliance/references/paperwork-taxonomy.md` | §1.3 | |

**州差异**：VIC、NSW、ACT 的州健康信息法对披露健康信息另有要求（VIC Health Records Act 2001、NSW HRIPA 2002、ACT Health Records (Privacy and Access) Act 1997），见 `03-legal-compliance/references/state-by-state-comparison.md` 表 A、§3.1。代理决策人的身份按州法确定（同文件表 B、§3.4）。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | 姓名 + 识别信息 | ✅ | 🧑 人工 | |
| Date / time | 沟通时间 | ✅ | 🗣️ 照录 | |
| Contact person & relationship | 姓名、关系、身份（supporter / 代理决策人 / 其他） | ✅ | 🧑 人工 | 从住户档案选择；**AI 不判断谁有决策权** |
| Method | 电话 / 当面 / 视频 / 邮件 | ✅ | 🤖 AI 可起草 | |
| Initiated by | 员工主动 / 家属来电 | ✅ | 🤖 AI 可起草 | |
| Resident's consent to share | 住户是否同意、范围；或档案中已有的同意 | ✅ | 🧑 人工 | 员工确认；没说 → "请填写" |
| Reason for contact | 事件通知 / 例行更新 / 家属询问…… | ✅ | 🤖 AI 可起草 | 链接到事件记录 |
| Information given | 员工告诉对方的内容 | ✅ | 🤖 AI 可起草 | 只能是员工说过的；不能比已确认记录说得更多 |
| Family's questions, concerns, requests | 对方原话 | 有则必填 | 🗣️ 照录 | 担忧不弱化 |
| Responses / agreed actions | 员工的回答、双方约定 | 有则必填 | 🗣️ 照录 | |
| Interpreter used | 是否使用口译、语言 | 有则填 | 🧑 人工 | |
| Follow-up & owner | 下一步、谁负责、何时 | 有则必填 | 🗣️ 照录 | |
| Recorded by / confirmed | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### Family / supporter communication
Resident: ____ · ID: ____
Date: __/__/____ · Time: __:__ · Method: ____ · Initiated by: ____
Contact: ____ · Relationship / role: ____
Resident's consent to share (scope): ____
Reason: ____ (linked record: ____)
Information given: ____
Family said / asked: "____"
Response / agreed actions: ____
Interpreter: ____
Follow-up (who · when): ____
Recorded and confirmed by: ____ (role) · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026。关联事件：15:10 Mrs Edna Hall 浴室跌倒（见 `daily-progress-note.md`）。

**原话（Daniel Reyes RN 16:10 口述，转写）**
> "Rang Karen, Edna's daughter, at five to four. Edna said yes, ring Karen, she'll worry otherwise. Told her Mum slipped in the bathroom about ten past three, grazed her right wrist, it's dressed, she didn't hit her head she says, obs are fine, GP's coming tomorrow morning. Karen was upset, she said 'Is she going to need an X-ray? This is the second time this year.' I said Dr Brooks will review her on the round and I'll call her after. She's coming in tomorrow at ten."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Resident: Mrs Edna Hall（虚构，88 岁）· WG-0412
Date: 18/10/2026 · Time: 15:55 · Method: Phone · Initiated by: Staff
Contact: Karen Hall（虚构）· Relationship / role: Daughter; **registered as Edna's supporter in her file**（← 从档案带出，员工确认）
Resident's consent to share: Edna **agreed to Karen being called** — "Yes, ring Karen, she'll worry otherwise."
Reason: Notification of fall at 15:10（linked: progress note 15:35, incident draft）
Information given: Edna slipped in her bathroom at about 15:10 and grazed her right wrist; the wrist is dressed; Edna says she did not hit her head; **observations were discussed** ⚠️; GP review planned for the morning of 19/10/2026.
Family said / asked: Karen **was upset**. "Is she going to need an X-ray? This is the second time this year."
Response / agreed actions: **Daniel explained** that Dr Brooks will review Edna on the morning round and **that he will call Karen after the review.**
Interpreter: Not required
Follow-up: Daniel Reyes RN（或 AM shift RN）to call Karen after GP review on 19/10/2026 · Karen to visit 19/10/2026 at 10:00.
Recorded and confirmed by: Daniel Reyes RN · 16:12

**改写说明与审核要点**
- "obs are fine" → AI 写成 **"observations were discussed"** 并标 ⚠️：careKind 不把 "fine" 写成对体征的判断；RN 可以在审核时恢复为自己的原话（"I told Karen her obs are fine"），因为这是 RN 本人说过的话。
- "Karen was upset" 是 RN 的观察，保留，不改成 "Karen was anxious"（不增加情绪标签）。
- "This is the second time this year" 是家属原话，照录；careKind **不**去查询或总结跌倒次数。
- 跟进责任人：原话只说 "I'll call her after"，Daniel 19/10 不一定上班 → AI 显示 "（或 AM shift RN）" 并要求确认。审核后 Daniel 改为："Handed over to AM RN to call Karen after GP review"，并写入交接 pending。

## 7. careKind 起草规则
- **可从口述自动填**：时间、方式、联系对象（从档案匹配后确认）、沟通内容、家属原话、约定事项、跟进。
- **缺失时显示"请填写"**：住户同意分享（且档案中没有有效同意时）；跟进责任人；口述只说"会打电话"时不生成"已通知"记录。
- **必须员工本人 / RN 确认**：联系对象的身份和关系；住户同意；所有和 Tier 3 事件相关的通知。
- **禁止生成**：对体征或伤情的判断（"she's fine"，除非员工原话）；预测（"she'll recover quickly"）；对家属情绪的推断标签；对"是否需要 X-ray / 转院"的任何回答（只能记录员工实际怎么答）；向家属透露住户未同意分享的内容。
- 家属在沟通中**提出投诉**时：提示"可能需要按投诉流程记录"（incident / complaints 模板），不判断是否属于投诉。
