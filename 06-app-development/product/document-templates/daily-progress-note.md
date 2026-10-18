# Progress note（护理 / 进展记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录员工在一个班次里为一位住户做了什么、观察到什么、住户本人说了什么、通知了谁、下一步跟进什么。它是 careKind 的核心文书：几乎所有事件都会先生成一条 progress note，再按 PRD §14 派生其他文书。

| 触发事件（[PRD §14](../../../docs/PRD.md) 事件类别） | 是否生成 progress note | 同时派生 |
|---|---|---|
| 日常照护 / ADL、饮食饮水、家属来访 | ✅ | food & fluid、家属沟通（只在说到时） |
| 情绪或行为、限制性措施 | ✅ | `clinical-abc-behaviour-chart.md`、`clinical-restrictive-practice-use-monitoring.md` |
| 疼痛 / 皮肤 / 临床观察、病情变化 / 升级 | ✅ | `clinical-pain-observation.md`、`clinical-wound-pressure-injury.md`、`clinical-deterioration-escalation.md` |
| 跌倒、伤害 / 疑似虐待或忽视、临终照护 | ✅ | incident / 跌倒后记录 / eol 模板（另一组） |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 口述的员工本人（PCW / EN / RN）；careKind 只整理其原话 |
| 谁审核签署 | 按条目的风险 Tier：Tier 1 可由 PCW（机构允许时）/ EN / RN 确认；Tier 2 由 RN（EN 视机构政策）；Tier 3 只能 RN 逐条确认 |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | 按内容分级，一条 note 内各条目可以不同 Tier；整条 note 以最高 Tier 路由 |
| 时限 | 发生变化或事件时尽快记录；常规条目在本班结束前完成（具体频率由机构政策决定，⚠️ 无全国统一频率） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 信息准确完整、按需可得 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 2.7.2(a)(b)(c)，第 19 页 | 记录要准确完整；收集和披露要有知情同意 → 只写原话中的事实，保留审计记录 |
| Care and services plan 指导服务、变化时复核 | 同上 | Action 3.1.4(e)、3.1.5，第 24–25 页 | note 中出现"变化 / 事件"时，提示 RN 考虑是否复核计划（只提示，不判断） |
| 关键信息沟通 | 同上 | Action 3.3.1、3.3.2(b)(c)，第 27 页 | 变化、恶化、事件必须进入交接（派生 ISBAR 要点） |
| 通知 GP 和 supporters、监测临床状况 | 同上 | Action 5.4.4(d)、5.4.5，第 37 页 | "已通知谁、何时"作为字段；没说就显示"请填写" |
| 提供者记录义务 | `03-legal-compliance/references/paperwork-templates/health-provider-responsibilities-and-record-keeping-summary.md` | GACL Ch.3 摘要 | 记录"提供了什么服务、给了谁" |
| 事件记录保存 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 154-150，第 234 页（印刷页码） | 已确认记录只能更正，不能删除（护栏 G7） |
| TGA 边界 | `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | TGA 页面 30/01/2026 | 不写员工没说过的诊断或解释（"很迷糊"≠"疑似谵妄"） |
| 文书字段参考 | `03-legal-compliance/references/paperwork-taxonomy.md` | §1.1 | 字段结构参考；全国没有统一的官方 progress note 模板（`paperwork-templates/index.md`"已知缺口"） |

**州差异**：VIC（Health Records Act 2001）、NSW（HRIPA 2002）、ACT 有州级健康信息法，保存期为成人最后一次服务后 7 年（NSW s25、VIC HPP 4）；其他州 ⚠️ 需核实。见 `03-legal-compliance/references/state-by-state-comparison.md` 表 A、§3.2。

## 4. 字段表
来源标记：`🤖 AI 可起草`（从原话整理、规范措辞）· `🗣️ 照录原话/数值`（逐字保留）· `🧑 人工`（AI 不能填写，必须由员工本人填写或确认）

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | 姓名 + 至少 1 个其他识别信息（DOB / Resident ID / 房间） | ✅ | 🧑 人工 | 归属由系统建议，员工确认（护栏 G4）；只在本班名单内匹配 |
| Date / time of entry | 记录时间；事件时间单独写 | ✅ | 🗣️ 照录 | 口述时间与系统时间不同时两者都保留 |
| Author / role | 口述人和角色 | ✅ | 🧑 人工 | 来自登录身份 |
| Category | ADL / 饮食 / 情绪行为 / 临床观察 / 事件…… | ✅ | 🤖 AI 可起草 | 只用于路由审核，不是临床判断 |
| What I observed | 员工看到、听到的事实 | ✅ | 🤖 AI 可起草 | 标签改写成可观察描述，不增加内容 |
| What the resident said | 住户原话 | 有则必填 | 🗣️ 照录 | 引号保留 |
| Care provided | 做了哪些照护 | ✅ | 🤖 AI 可起草 | |
| Resident's preferences / choices | 住户的选择、拒绝、意愿 | 有则必填 | 🤖 AI 可起草 | 拒绝照护时写明住户说的理由 |
| Values stated | 员工说出的数值（量、时长、体征） | 有则必填 | 🗣️ 照录 | 低置信度识别必须让员工确认（护栏 G3） |
| Clinical assessment / interpretation | 例如"考虑 UTI" | 仅 RN 自己说出时 | 🧑 人工 | AI 不起草；只记录 RN 原话 |
| Who was notified, when | RN / GP / 家属 / 经理 | 事件时必填 | 🗣️ 照录 | 没说就显示"请填写"，不推断 |
| Follow-up | 员工说出的下一步 | 有则必填 | 🗣️ 照录 | AI 不提出新的照护或治疗建议 |
| Linked records | 派生的 ABC / 伤口 / 升级记录等 | 自动 | 🤖 AI 可起草 | 只建立链接 |
| Reviewed by / time | 审核人、时间 | ✅ | 🧑 人工 | 按 Tier；Tier 3 逐条确认 |

## 5. 空白模板
```markdown
### Progress note
- Resident: ____ · DOB / ID: ____ · Room: ____
- Date: __/__/____ · Time of entry: __:__ · Event time (if different): __:__
- Author: ____ (PCW / EN / RN)
- Category: ____ · Tier: ____

**Observed:** ____
**Resident said:** "____"
**Care provided:** ____
**Resident's choices / preferences:** ____
**Values stated (as said):** ____
**RN assessment (RN's own words only):** ____
**Notified:** ____ at __:__ (method: ____)
**Follow-up:** ____
**Linked records:** ____

Reviewed and confirmed by: ____ (role) · __/__/____ __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · PM shift 15:00–23:00。所有人物均为虚构。

**原话（Priya 15:35 口述，转写）**
> "Edna in twelve. At ten past three I heard her call out, she was sitting on the bathroom floor, she said her foot slipped on the wet mat when she reached for her towel. She said she didn't hit her head, just her wrist. Right wrist's got a graze, bit of blood. She was talking normal. I pressed the bell, Daniel came straight away, checked her, then we got her up with the floor lifter, the two of us, into her chair. She was a bit grumpy about it, said she's fine. Daniel's ringing the GP and her daughter."

**AI 草稿（审核界面中 **粗体** = AI 改写或规范化部分，其余逐字来自原话）**
- Resident: Mrs Edna Hall（虚构，88 岁）· DOB 03/02/1938 · WG-0412 · Room 12, Wattle wing
- Date: 18/10/2026 · Time of entry: 15:35 · Event time: 15:10
- Author: Priya (PCW，虚构) · Category: Fall · Tier 3

**Observed:** At 15:10 I heard Edna call out. **I found her** sitting on the bathroom floor **of her room**. A graze **with a small amount of bleeding** on her right wrist. She was talking **as usual for her**.
**Resident said:** "My foot slipped on the wet mat when I reached for my towel." "I didn't hit my head, just my wrist." "I'm fine."
**Care provided:** I pressed the **emergency** bell. Daniel Reyes RN (虚构) attended and checked Edna **before she was moved**. Daniel and I **assisted Edna off the floor using the mechanical floor lifter** into her chair.
**Resident's choices / preferences:** Edna **said she was unhappy about being lifted** and said she was fine.
**Values stated:** — （未口述）
**RN assessment:** 请填写（Daniel Reyes RN）
**Notified:** Daniel Reyes RN at 15:12. GP and daughter: "Daniel's ringing" → **请填写：通知时间和人员由 RN 确认**
**Follow-up:** 请填写
**Linked records:** incident 草稿 · 跌倒后记录草稿 · `clinical-pain-observation`（15:25）· `clinical-vital-signs-weight-bgl`（15:20）· `clinical-wound-pressure-injury`（15:50）· `clinical-deterioration-escalation`（15:45）· `daily-family-communication-log`（15:55）· ISBAR 要点
> ⏱ 提示：此事件可能需要按机构流程和 ACQSC SIRS 决策工具评估（P1 时限 24 小时）。careKind 不判定是否 reportable。

**改写说明**：
- "a bit grumpy" → "said she was unhappy about being lifted"（标签 → 可观察描述，保留住户原话 "I'm fine"）。
- "talking normal" → "talking as usual for her"（规范措辞；**没有**写成 "alert and orientated" 或 GCS，因为 Priya 没说，GCS 只能由 RN 记录）。
- "Daniel's ringing the GP and her daughter" 没有时间 → 不写入"已通知"，显示"请填写"。

**RN 补充并确认（Daniel Reyes RN，虚构，16:05）**
**RN assessment:** "GCS 15 at 15:15. No visible injury other than right wrist skin tear. Edna denied hitting her head. Unwitnessed fall, so neuro obs started as per facility post-fall procedure."
**Notified:** Dr Amelia Brooks (GP，虚构) by phone at 15:45; Karen Hall (daughter，虚构) by phone at 15:55; Grace Liu (Care Manager，虚构) by phone at 16:00.
**Follow-up:** GP to review on 19/10/2026 morning round. Neuro obs and vital signs as per facility procedure. Wrist dressing review 21/10/2026.
Reviewed and confirmed by: Daniel Reyes RN · 18/10/2026 16:05

**同一班次的 Tier 1 条目（Edna，同一份 note 的另一条）**
- 原话（Priya 18:05）："Edna ate about half her shepherd's pie, all the custard, I cut it up for her because her wrist's sore."
- AI 草稿：Edna ate about half of her shepherd's pie and all of her custard at dinner. **I cut up her food because she said her right wrist was sore.** → 同步写入 `daily-food-fluid-chart.md`。
  - 注："because she said her right wrist was sore" 是 AI 把 "because her wrist's sore" 归因为住户自述 —— **审核时必须确认**：如果 Edna 没有这样说，应改为 "because her right wrist was injured earlier"。

## 7. careKind 起草规则
- **可从口述自动填**：住户（建议，需确认）、事件时间、观察、住户原话、已做的照护、员工说出的数值、员工说出的通知和跟进。
- **缺失时显示"请填写"**：事件中的"已通知谁 / 何时"、跟进、跌倒或伤害后的 RN assessment；口述只说"会通知 / 正在打电话"时不当作已通知。
- **必须 RN 确认**：所有 Tier 2、Tier 3 条目；任何临床 assessment；住户归属有疑问的条目。
- **禁止生成**：诊断或疑似诊断（"possible delirium"、"likely UTI"）；风险描述（"high falls risk"）；原因推断（"fell because of …"，除非是住户或员工原话）；治疗或用药建议；"no injury" 之类员工没有说过的阴性结论；是否属于 SIRS reportable incident 的判断。
- **语言**：person-centred；用 "older person / resident"，不用贬低或标签化的词；敏感事件不弱化员工原话中的关键描述（PRD §6.6 第 5 条）。
