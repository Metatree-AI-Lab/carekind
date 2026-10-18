# 护理计划复核（Care and services plan review）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。"策略 / 措施"栏**只用 RN 或本人原话**，没说就显示"请填写"（PRD §6.6 第 4 条）。

## 1. 用途与触发事件
- 用途：记录一次 care and services plan 复核：为什么复核、本人和 supporter 的意见、哪些部分改了、由谁决定、下次复核时间，以及副本已交给本人。
- 触发事件（PRD §14）：**跌倒**、**伤害**、**病情变化 / 升级**、情绪或行为、限制性措施、临终照护；以及定期复核、转院返回、需求或偏好变化（SQS 3.1.5(a)–(f)）。careKind 可以提示"这些已确认事件可能需要复核哪一节"，不决定要不要复核。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | RN / Care Manager 口述复核讨论；careKind 起草 |
| 谁审核签署 | RN 或 Care Manager；本人（或其 supporter / 决策人）参与并收到副本 |
| 风险 Tier | **Tier 2**（PRD §6.5，策略属于临床决定）；事件触发的复核随事件按 Tier 3 路由 |
| 时限 | SQS 3.1.5 的触发情况发生后"及时"；定期复核间隔按机构政策（⚠️ Rules r 148-80(3)(c) 的 12 个月只适用于部分 home / community 类别，不适用 residential，见 by-event §13）；每次更新后把副本给本人（r 148-80(4) ⚠️ 需核实页码） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 计划内容：需要、目标、偏好；风险与支持方式；本人可获取；员工使用 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 3.1.4(a)–(e)，第 24–25 页 | 分节结构 |
| 复核触发：需要变化 / 计划无效；功能或状况变化；家属照护能力变化；transition；新风险或事件；照护责任变化 | 同上 | 3.1.5(a)–(f)，第 25 页 | "Reason for review" 选项 |
| 基于与本人和其希望参与者的持续沟通；结果告知本人 | 同上 | 3.1.2–3.1.3，第 24 页 | 本人原话字段 |
| 跌倒后复盘原因和后果 | 同上 | 5.5.4(c)，第 38 页 | 跌倒触发的复核 |
| 制定时间；副本 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 148-80，印刷页 203–204 | |
| 复核文书与 careKind 边界 | `03-legal-compliance/references/paperwork-requirements-by-event.md`；`03-legal-compliance/references/paperwork-taxonomy.md` | §13；§3.2 | 不生成新策略 |

**州差异提示**：BSP 和限制性措施部分的同意人按州不同（`03-legal-compliance/references/state-by-state-comparison.md` §3.4、§4.6；`03-legal-compliance/references/state-clinical-practice-rules.md`）。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| R01 | Resident | | 是 | 🤖 | |
| R02 | Review date · type | Scheduled / triggered | 是 | 🧑 人工 | |
| R03 | Reason for review | SQS 3.1.5 选项 + 链接事件 | 是 | 🧑 人工 | AI 可列出链接事件 |
| R04 | Participants | 本人、supporter、RN、allied health | 是 | 🤖 | |
| R05 | Resident's views (own words) | | 是 | 🗣️ | 本人没参加要写原因 |
| R06 | Supporter's views | | 否 | 🗣️ | 本人同意时 |
| R07 | Relevant recent records | 已确认记录的列表 | 否 | 🤖 | 只列链接，不总结成"趋势" |
| R08 | Section reviewed | mobility、personal care、skin、nutrition、behaviour… | 是 | 🧑 人工 | |
| R09 | Change to needs / goals / preferences | | 是 | 🗣️ | |
| R10 | Strategy (new / changed / continued) | **RN 或本人原话** | 是 | 🧑 人工 | 没说就"请填写" |
| R11 | Decided by | | 是 | 🧑 人工 | |
| R12 | Referrals arising | | 否 | 🧑 人工 | |
| R13 | Copy offered to resident · date | | 是 | 🧑 人工 | |
| R14 | Next review date | | 是 | 🧑 人工 | |
| R15 | RN / CM confirmation | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
CARE AND SERVICES PLAN REVIEW
Resident: ______________ Room: ____   Date: __/__/____  ☐ Scheduled ☐ Triggered
Reason (SQS 3.1.5): ☐ needs/goals changed or plan not effective ☐ function/condition changed
  ☐ family care changed ☐ transition ☐ new risk / incident ☐ care responsibility changed
Linked records: ________________________________________________
Participants: __________________________________________________
Resident's views (own words): "_________________________________"
Supporter's views: "____________________________________________"
| Section | Change to needs / goals | Strategy (staff or resident's own words) | Decided by |
|---------|-------------------------|-------------------------------------------|------------|
Referrals arising: ______________________________________________
Copy offered to resident: __/__/____ by ______   Next review: __/__/____
Confirmed by: ______________ (RN/CM) __/__/____ __:__
```

## 6. 示例（虚构）
> 承接 Mrs Edna Hall（虚构）18/10/2026 跌倒。复核日 19/10/2026（Monday）。

**原话 → AI 草稿对照（片段）**
| 片段 | 原话 | careKind 草稿 |
|---|---|---|
| S1（Edna，Grace Liu 口述转述） | "I'll ring if I need the towel. I just don't like bothering you girls." | Resident's views: "I'll ring if I need the towel. I just don't like bothering you girls." |
| S2（Grace Liu） | "Strategy: towel on the rail beside the shower chair before every shower, non-slip mat checked AM and PM by the PCW, and staff remind Edna the call bell is fine to use." | Mobility / bathroom — Strategy (Grace Liu's words): "Towel on the rail beside the shower chair before every shower; non-slip mat checked AM and PM by the PCW; staff remind Edna the call bell is fine to use." |

> 第三条策略在原话里就有，careKind 没有新增"hip protectors""sensor mat"等员工没说过的措施。

**填写后的记录**
```text
CARE AND SERVICES PLAN REVIEW
Resident: Mrs Edna Hall (fictional), 88   Room: 12, Wattle wing (fictional)   Date: 19/10/2026  Triggered
Reason (SQS 3.1.5): new risk / incident — fall 18/10/2026 15:10 (WG-IMS-2026-0418)
Linked records: post-fall record 18/10; Dr Brooks' review 19/10 morning round (X-ray decision in GP's note); complaint WG-CF-2026-0093; physiotherapy referral 18/10
Participants: Edna; Karen Hall (daughter, in person after her 10:00 meeting with Grace); Grace Liu (CM); Sunita Rao RN
Resident's views: "I'll ring if I need the towel. I just don't like bothering you girls."
Supporter's views (Karen): "I'm happier now the mat's back. Please keep the towel where she can reach."
| Section          | Change to needs / goals                          | Strategy (own words)                                                  | Decided by |
|------------------|--------------------------------------------------|-----------------------------------------------------------------------|------------|
| Bathroom/mobility| Fell in bathroom 18/10; goal unchanged: "keep showering myself" | "Towel on the rail beside the shower chair before every shower; non-slip mat checked AM and PM by the PCW; staff remind Edna the call bell is fine to use." | Grace Liu |
| Skin             | Right wrist skin tear (3.0 x 1.0 cm, ISTAP 1)                                | "Dressing per wound plan; wound review 21/10/2026." (Sunita Rao RN) | Sunita Rao RN |
| Mobility         | Awaiting physio review                           | Please fill in after physiotherapy review                             | —          |
Referrals arising: physiotherapy (sent 18/10/2026 by Daniel Reyes RN)
Copy offered to resident: 19/10/2026 by Sunita Rao RN — Edna: "Leave it on my table, Karen will read it."
Next review: after physio review, no later than 02/11/2026 (Grace Liu)
Confirmed by: Grace Liu (CM) 19/10/2026 11:00
```

## 7. careKind 起草规则
- **可以从口述自动填**：R01、R04–R07、R09；策略栏只在原话里有时才填，并标明是谁说的。
- **缺失显示"请填写"**：R10 策略、R13 副本、R14 下次复核。
- **必须 RN / CM 确认或填写**：R02、R03、R08、R10–R15。
- **禁止生成**：新的干预措施、治疗或用药策略；风险评分；"plan effective / not effective"的结论；把多次事件总结成"increasing falls"之类趋势判断；以资金分类为目的的措辞。
