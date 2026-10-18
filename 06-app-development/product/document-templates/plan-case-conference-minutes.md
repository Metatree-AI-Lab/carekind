# 病例会议纪要（Case conference minutes）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。纪要**只记录会上实际说的和实际做出的决定**；没有决定的议题写 "No decision"。

## 1. 用途与触发事件
- 用途：记录住户、supporter、决策人、GP、RN、allied health 等一起讨论照护目标和计划的会议（含 BSP 复核、姑息病例会议）。
- 触发事件（PRD §14）：情绪或行为（BSP 复核）、限制性措施、病情变化、**临终照护**；以及定期或按需召开。
- 注意：careKind 只起草会议纪要；**同意**（如限制性措施同意、治疗同意）本身是决策人的行为，纪要只记录"谁在什么时候说了什么"。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | 会议记录人（通常 RN / CM）口述或会后口述；careKind 起草 |
| 谁审核签署 | 会议主持人（RN / CM）；GP 的医疗决定以 GP 自己的记录为准 |
| 风险 Tier | **Tier 2**；涉及限制性措施、临终 → **Tier 3**（PRD §6.5） |
| 时限 | 按需 / 定期 / 进入姑息阶段；纪要会后尽快确认并发给约定的人（按机构政策）；BSP 复核和咨询要求见 Rules r 162-70、162-75（印刷页 277–278，⚠️ 未逐条复核） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 评估与计划基于与本人和其希望参与者的持续沟通 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 3.1.2，第 24 页 | 记录本人意愿 |
| 与本人、supporters 合作设定照护目标、支持决策；多学科协调 | 同上 | 5.4.1，第 36 页；5.4.4(a)(b)，第 37 页 | 参会者和决定 |
| 认知障碍住户的协作 | 同上 | 5.6.2，第 40 页 | BSP 会议 |
| 姑息阶段的持续讨论和 ACP 复核 | 同上 | 5.7.2(a)–(c)，第 40 页 | 姑息病例会议 |
| BSP 复核与咨询 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 162-70、162-75，印刷页 277–278 | ⚠️ 需核实具体要求 |
| 病例会议资料（只参考主题） | `03-legal-compliance/references/paperwork-templates/palliaged-palliative-care-case-conference-pack.pdf` | — | 许可 ⚠️ 未声明，**不复制版式** |
| 文书与 careKind 边界 | `03-legal-compliance/references/paperwork-requirements-by-event.md`；`03-legal-compliance/references/paperwork-taxonomy.md` | §13；§3.3 | 只记录实际决定 |

**州差异提示**：可以为住户做决定的人（guardian、medical treatment decision maker、RPSDM 等）称谓和权限按州不同：`03-legal-compliance/references/state-by-state-comparison.md` §3.4；`03-legal-compliance/references/state-clinical-practice-rules.md`。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| K01 | Resident · date · time · location / mode | | 是 | 🤖 | |
| K02 | Purpose | | 是 | 🧑 人工 | 主持人确认 |
| K03 | Attendees · role · how attended | | 是 | 🤖 | |
| K04 | Resident's participation | 全程 / 部分 / 未参加 + 原因 | 是 | 🗣️ | |
| K05 | Resident's wishes (own words) | | 是 | 🗣️ | |
| K06 | Agenda items · discussion | 每个议题：谁说了什么 | 是 | 🤖 | 标明发言人 |
| K07 | Decisions made · by whom | 只写会上明确的决定 | 是 | 🧑 人工 | AI 可预填候选，主持人逐条确认 |
| K08 | Actions · owner · due | | 是 | 🗣️ | |
| K09 | Consent recorded (if any) · by whom | 决策人原话 | 条件 | 🧑 人工 | 纪要不等于同意书 |
| K10 | Disagreements / unresolved | | 否 | 🗣️ | 不抹平分歧 |
| K11 | Summary sent to · date | | 是 | 🧑 人工 | |
| K12 | Next meeting | | 否 | 🧑 人工 | |
| K13 | Confirmed by (chair) | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
CASE CONFERENCE MINUTES
Resident: ______________  Date: __/__/____  Time: __:__–__:__  Location/mode: ________
Purpose: _______________________________________________________________
Attendees (name, role, in person/phone/video): __________________________
Resident's participation: _______________  Wishes (own words): "_________"
| # | Item | Discussion (who said what) | Decision (by whom) | Action / owner / due |
|---|------|----------------------------|--------------------|----------------------|
Consent recorded (if any): _____________________________________________
Unresolved / different views: __________________________________________
Summary sent to: ______________ on __/__/____   Next meeting: __/__/____
Confirmed by (chair): ______________ __/__/____
```

## 6. 示例（虚构）
> Mr Tomasz Nowak（虚构，81 岁，痴呆，有 BSP；DOB 22/06/1945 · WG-0287 · Room 7, Banksia wing（memory support，键盘锁门）；环境类限制性措施同意由 Marek Nowak（儿子，VIC temporary SDM）于 01/09/2026 记录）。新增虚构人物：Ana Lopes（lifestyle coordinator，虚构）。

**原话 → AI 草稿对照（片段）**
| 片段 | 原话 | careKind 草稿 |
|---|---|---|
| S1（Priya, PCW） | "Around four he starts looking for the door, says he has to get to work. If we walk with him to the garden and talk about Legia, his football team, he settles in ten minutes or so." | Priya (PCW): Around 16:00 Mr Nowak starts looking for the door and says he has to get to work. When staff walk with him to the garden and talk about Legia, his football team, he settles in about 10 minutes. |
| S2（Dr Brooks） | "I'll do a medication review on my round on the nineteenth, no changes today." | Dr Amelia Brooks (GP): "I'll do a medication review on my round on the 19th, no changes today." |

> 草稿没有把 "looking for the door" 写成 "exit-seeking due to sundowning"，也没有把 GP 的话改成"medication review recommended"。

**填写后的记录**
```text
CASE CONFERENCE MINUTES
Resident: Mr Tomasz Nowak (fictional), 81, DOB 22/06/1945, WG-0287, Room 7, Banksia wing — memory support (fictional)
Date: 15/10/2026  Time: 14:00–14:45  Location: Banksia family room + phone
Purpose: BSP and care and services plan review (scheduled)
Attendees: Mr Nowak (in person, 14:00–14:20); Marek Nowak, son (in person); Grace Liu, CM (chair);
  Daniel Reyes RN; Priya, PCW; Ana Lopes, lifestyle coordinator; Dr Amelia Brooks, GP (phone 14:15–14:30)
Resident's participation: first 20 minutes, then chose to go to the garden with Ana.
  Wishes (own words): "I like the garden. I like the music. Not too many people talking at me."
| # | Item                 | Discussion (who said what)                                                     | Decision (by whom)                                           | Action / owner / due |
|---|----------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------|----------------------|
| 1 | Afternoon distress   | Priya: settles in ~10 min with garden walk and football talk. Marek: "Dad worked shifts at the tram depot, four o'clock was when he left." | Keep BSP strategies; add 15:45 garden walk to daily plan (Grace Liu) | Update BSP & care plan — Daniel Reyes RN — 16/10/2026 |
| 2 | Music                | Ana: Polish folk playlist used twice this week, "he sang along".                | Ana to offer music 15:30 daily (Grace Liu)                   | Playlist on lounge speaker — Ana — 16/10/2026 |
| 3 | Medicines            | Dr Brooks: "I'll do a medication review on my round on the 19th, no changes today." | No change (Dr Brooks)                                     | GP round — Dr Brooks — 19/10/2026 |
| 4 | Night sleep          | Daniel: night RN reports up twice most nights. Marek asked about sleeping tablets. | No decision — Dr Brooks to discuss at review                 | — |
Consent recorded: Not revisited — existing consent for an environmental restrictive practice
  (keypad-locked exit doors, Banksia wing) given by Marek Nowak (son, VIC temporary SDM) on 01/09/2026,
  after Dr Brooks' assessment 27/08/2026; see restrictive practice consent record. BSP review 01/12/2026.
Unresolved / different views: Marek would like sleeping tablets considered; Grace and Daniel prefer
  to try the evening routine first. To be discussed at GP review 19/10/2026.
Summary sent to: Marek Nowak (email) and Dr Brooks on 16/10/2026   Next meeting: 01/12/2026 (BSP review)
Confirmed by (chair): Grace Liu (CM) 15/10/2026 16:30
```

## 7. careKind 起草规则
- **可以从口述自动填**：K01、K03–K06、K08、K10；每句标明发言人和来源片段。
- **缺失显示"请填写"**：目的、决定人、summary 发给谁、下次会议。
- **必须主持人确认或填写**：K02、K07、K09、K11–K13。
- **禁止生成**：会上没有做出的决定；把讨论写成共识；行为原因解释或诊断；药物或限制性措施建议；把某人的意见写成"family agreed"。
- 如讨论内容出现约束、上锁、镇静等词，提示"请确认 BSP、同意和监测记录"（PRD §14）。
