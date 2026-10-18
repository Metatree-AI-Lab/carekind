# 入住评估（Admission / entry assessment）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。本模板整理**入住访谈和员工观察的叙述部分**。量表评分（跌倒、压疮、营养、疼痛、认知等）由合资格员工用机构工具完成，careKind 只照录员工说出的结果，**不推算分数、不判定风险等级**。

## 1. 用途与触发事件
- 用途：older person 入住（start day）时，记录本人的需要、目标、偏好、生活史、沟通方式和已知信息，作为 comprehensive clinical assessment 和第一版 care and services plan 的输入。
- 触发事件：入住；不在 PRD §14 的事件表内（计划性文书）。入住访谈的口述会同时生成 progress note 和 `plan-advance-care-planning-record.md`（如谈到 ACP）。
- 不覆盖：service agreement、start notification、AN-ACC 相关表单、用药清单本身（见 `paperwork-requirements-by-event.md` §1，careKind 只提示不起草）。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | Admitting RN 口述访谈内容；PCW / EN 口述首日观察；careKind 起草 |
| 谁审核签署 | Admitting RN；GP 负责 comprehensive medical assessment（SQS 5.4.2(a)） |
| 风险 Tier | **Tier 2**（临床观察；PRD §6.5）——RN 确认，不能批量确认 |
| 时限 | Care and services plan 须在 **start day 当天或之前**制定（Rules r 148-80(1)(a)）；comprehensive clinical assessment "on commencement"，具体天数按机构政策（⚠️ 无全国统一天数） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 评估与计划系统：需要、目标、偏好；风险与本人一起确定管理策略 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 3.1.1–3.1.3，第 24 页 | "Goals in own words" 字段；结果须告知本人 |
| 入住时 comprehensive clinical assessment（含 GP 医学评估、临床风险、frailty 和沟通障碍、器具） | 同上 | 5.4.2(a)–(d)，第 36–37 页 | 评估分节 |
| 过敏和副作用在开始时记录 | 同上 | 5.3.3，第 36 页 | 过敏由 RN 核对来源后填写 |
| 营养、饮水、用餐偏好 | 同上 | 6.2.1，第 44 页 | 饮食偏好照录本人原话 |
| ACP 讨论与存放 | 同上 | 3.1.6，第 25 页 | 链接 ACP 模板 |
| 收集和共享信息的知情同意；信息准确完整 | 同上 | 2.7.2(b)–(d)，第 19–20 页 | 同意状态 🧑 人工 |
| Care and services plan 在 start day 当天或之前制定 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 148-80(1)，印刷页 203–204 | 提示 RN 同日完成初版计划 |
| 入住文书清单和 careKind 边界 | `03-legal-compliance/references/paperwork-requirements-by-event.md`；`03-legal-compliance/references/paperwork-taxonomy.md` | §1；§3.1 | 不碰协议、通知、资金表单 |

**州差异提示**：替代决策者（substitute decision maker）的称谓、委任文件和 ACD 效力按州不同；用药授权按州不同。见 `03-legal-compliance/references/state-clinical-practice-rules.md` 和 `03-legal-compliance/references/state-by-state-comparison.md` §3.4。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| E01 | Resident · preferred name · pronouns | | 是 | 🧑 人工 | 从 CMS 带出，RN 核对 |
| E02 | Start day · admitted from · admitting RN | | 是 | 🧑 人工 | |
| E03 | People present at interview | 本人、supporter、interpreter | 是 | 🤖 | |
| E04 | Life story & what matters to me | 本人原话 | 是 | 🗣️ | person-centred |
| E05 | Goals in own words | | 是 | 🗣️ | 没说就"请填写"，不替本人设定目标 |
| E06 | Daily routine & preferences | 起床、洗浴、穿衣、睡眠、活动 | 是 | 🤖 | 每条附原话片段 |
| E07 | Culture, language, faith, identity | | 是 | 🗣️ | 只写本人愿意分享的 |
| E08 | Communication | 听力、视力、语言、辅助器具 | 是 | 🤖 | |
| E09 | Mobility & transfers (observed) | 员工观察 | 是 | 🗣️ | 不写风险等级 |
| E10 | Personal care, continence, skin (observed) | | 是 | 🗣️ | |
| E11 | Eating & drinking preferences | 喜好、质地（按 SP 或医嘱已有记录） | 是 | 🗣️ | 质地等级不由 AI 推断 |
| E12 | Cognition & mood (observed / own words) | | 是 | 🗣️ | 只照录观察；诊断只照录 GP 文件 |
| E13 | Pain (own words / rating if given) | | 否 | 🗣️ | |
| E14 | Known health conditions (from source documents) | 标明来源文件 | 是 | 🧑 人工 | RN 从 GP 信、出院小结核对 |
| E15 | Allergies & adverse reactions | 物质、反应、来源 | 是 | 🧑 人工 | **不由 AI 填** |
| E16 | Medicines | "Reconciled in medication system" + 谁、何时 | 是 | 🧑 人工 | careKind 不录药单 |
| E17 | Screening / assessment tools completed | 工具名、完成人、结果（员工输入） | 是 | 🧑 人工 | 系统不算分 |
| E18 | Equipment & aids | | 是 | 🗣️ | |
| E19 | ACP status · substitute decision maker | 有无文件、存放位置；SDM 姓名和依据 | 是 | 🧑 人工 | 见 ACP 模板 |
| E20 | Supporters & contact preferences | 谁、什么时候联系、本人同意分享什么 | 是 | 🗣️ | |
| E21 | Consents recorded | 信息共享、照片、AI 文书告知 | 是 | 🧑 人工 | |
| E22 | Referrals arranged | GP 医学评估、allied health | 否 | 🧑 人工 | |
| E23 | Areas for first care plan | 本次评估中由 RN 说出的需要和策略 | 是 | 🧑 人工 | 策略只用 RN 原话 |
| E24 | RN confirmation | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
ENTRY ASSESSMENT                                   Resident ID: ______
Name: ______________ Preferred name: ______ Pronouns: ______ Room: ____
Start day: __/__/____  Admitted from: ________  Admitting RN: ______________
Present: ______________________________________________________________
What matters to me (own words): "______________________________________"
My goals (own words): "_______________________________________________"
Daily routine & preferences: ____________________________________________
Culture / language / faith / identity: __________________________________
Communication (hearing, vision, language, aids): ________________________
Mobility & transfers (observed): ______________________________________
Personal care / continence / skin (observed): __________________________
Eating & drinking (likes, dislikes, texture per existing record): ________
Cognition & mood (observed / own words): _______________________________
Pain (own words / own rating): _________________________________________
Known health conditions (source document): ______________________________
Allergies & reactions (RN, source): ____________________________________
Medicines: reconciled in medication system by ________ on __/__/____
Tools completed (tool / by / result as entered): _________________________
Equipment & aids: _____________________________________________________
ACP status / substitute decision maker: _________________________________
Supporters & contact preferences: ______________________________________
Consents recorded: ____________________________________________________
Referrals arranged: ___________________________________________________
Areas for first care plan (RN): ________________________________________
RN confirmed: ______________ __/__/____ __:__
```

## 6. 示例（虚构）
> 新增虚构人物：Mrs Margaret "Peggy" O'Brien（虚构，86 岁，Room 14, Wattle wing）；Liam O'Brien（儿子，虚构）。评估人 Sunita Rao RN（虚构）。机构 Wattle Grove Residential Care（虚构），演示州 VIC。

**原话 → AI 草稿对照（片段）**
| 片段 | 口述原话 | careKind 草稿 |
|---|---|---|
| S1（Sunita Rao RN） | "Peggy says: 'Call me Peggy, everyone does. I'm up with the birds, love, six o'clock, and I want my cup of tea before anything else.' She showers in the evening, not mornings." | Preferred name: Peggy ("Call me Peggy, everyone does."). Daily routine: wakes around 06:00 — "I'm up with the birds … I want my cup of tea before anything else." Prefers to shower in the evening. |
| S2（Sunita） | "She uses a four-wheel walker, walked from the car to her room with it, a bit slow on the turn into the doorway. Hearing aid left ear." | Mobility (observed 14/10/2026): walked from the car to her room with her four-wheeled walker; slower when turning into the doorway. Communication: hearing aid, left ear. |

> 观察"slower when turning"没有被改写成"high falls risk"；跌倒筛查结果只在 E17 由 RN 输入。

**填写后的记录（节选）**
```text
ENTRY ASSESSMENT                                   Resident ID: WG-0455 (fictional)
Name: Mrs Margaret O'Brien (fictional)  Preferred name: Peggy  Pronouns: she/her  Room: 14, Wattle wing (fictional)
Start day: 14/10/2026  Admitted from: home (lived alone)  Admitting RN: Sunita Rao RN (fictional)
Present: Peggy; son Liam O'Brien (fictional); Sunita Rao RN. No interpreter needed (English).
What matters to me: "My garden, my rosary beads, and Liam visiting on Sundays."
My goals: "I want to keep walking on my own and not be a bother."
Daily routine: wakes around 06:00 and wants a cup of tea first; evening shower; likes the radio
  (talkback) after lunch; bed around 21:00.
Culture / faith: Born in Cork, Ireland; Catholic — "I'd like Mass when the priest comes."
Communication: hearing aid, left ear (Peggy puts it in herself); reading glasses.
Mobility (observed): four-wheeled walker; walked car → room; slower turning into doorway.
Personal care / continence / skin: independent with showering, wants staff nearby; Peggy: "I wear
  a pad at night, just in case." No skin concerns seen by Sunita at admission (14/10/2026 15:30).
Eating & drinking: likes porridge, roast dinners, "a sherry on a Sunday"; dislikes fish.
  Normal textures per GP referral letter.
Cognition & mood (observed / own words): chatted about her garden; asked twice what time dinner is.
  GP referral letter (Dr Amelia Brooks, 07/10/2026) — "mild memory impairment" (GP's words).
Pain: "Just my knees when it's cold."
Known health conditions: per GP referral letter 07/10/2026 — recorded in CMS by Sunita Rao RN.
Allergies & reactions (RN): Penicillin — rash (source: GP referral letter 07/10/2026; Peggy agrees).
Medicines: reconciled in eNRMC by Sunita Rao RN with community pharmacy list, 14/10/2026 16:10.
Tools completed: facility falls screening, pressure injury screening, nutrition screening and
  cognition screening — completed by Sunita Rao RN; results entered in CMS assessment module.
Equipment & aids: four-wheeled walker; hearing aid; reading glasses; own recliner chair.
ACP status: Peggy says she made an advance care directive with her GP in 2025; Liam has the copy and
  will bring it on 18/10/2026. Substitute decision maker: Liam (Peggy's words) — document and
  appointment type to be confirmed by RN per VIC rules (state-clinical-practice-rules.md).
Supporters: Liam — call any time for falls or illness; Peggy agrees Liam can be told about her care.
Consents recorded: information sharing with Liam; careKind AI documentation notice given (Sunita).
Referrals arranged: GP comprehensive medical assessment — Dr Brooks round 19/10/2026; physiotherapy
  mobility review requested.
Areas for first care plan (Sunita's words): "Walker always within reach; tea at six; evening shower
  with staff nearby; check hearing aid is in each morning."
RN confirmed: Sunita Rao RN 14/10/2026 17:05
```

## 7. careKind 起草规则
- **可以从口述自动填**：E03、E04–E06、E07（本人愿意分享的）、E08–E13、E18、E20——每条附原话片段。
- **缺失显示"请填写"**：目标（本人没说就不写）、过敏、SDM、ACP 状态、同意。
- **必须 RN 确认或填写**：E01、E02、E14–E17、E19、E21–E24。
- **禁止生成**：任何风险等级或量表分数（"high falls risk""malnutrition risk"）；从叙述推断诊断（"forgetful" → "dementia"）；药物清单或剂量；过敏；质地等级；替本人设定目标；以 AN-ACC 分类为目的的措辞。
- 本人原话和员工观察要分开显示；家属转述标明是谁说的。
