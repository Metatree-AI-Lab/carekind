# Restrictive practice use & monitoring record（限制性措施使用与监测记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录**每一次使用**（按需使用的约束）或**每班监测**（持续使用的约束，例如键盘锁的 memory support 单元）的情况：用了什么、何时开始、持续多久、使用前用过哪些替代策略、使用期间监测到什么、效果如何、是否符合已记录的同意。这些内容按 Aged Care Rules 2025 要记录在 BSP 里；本模板是写进 BSP 之前的现场记录。

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 限制性措施（口述中提到约束、上锁、按住、隔离、镇静等） | ✅ + progress note + ABC（如由行为引起）+ 交接 + "请确认 BSP、同意和监测记录" |
| 紧急情况下使用、事先没有同意 | ✅ + 紧急使用字段 + 提示"尽快通知 RPSDM 并补记 BSP"（r 162-35） |
| 叙述显示可能不符合同意或 BSP | ✅ + ⏱ 提示"可能需要按 SIRS（inappropriate use of restrictive practices）评估"——只提示，不判定 |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 在场的员工（PCW / EN / RN）口述；RN 补充监测和评估 |
| 谁审核签署 | **只有 RN，逐条确认**；Care Manager 定期复核 |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 3 |
| 时限 | 按需使用：每次使用后尽快；持续使用：每班至少一条监测（频率按 BSP 和机构政策 ⚠️）；紧急使用：开始后尽快通知 RPSDM 并写入 BSP（r 162-35 "as soon as practicable"） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 5 类限制性措施的定义 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 17-5，第 98–99 页（印刷页码） | "类型"字段用这 5 类；**分类由 RN 确认** |
| 使用任何限制性措施的条件（最后手段、先用替代策略、最少限制、最短时间、符合同意和 BSP、符合州法） | 同上 | r 162-15，第 269 页 | 记录替代策略、是否符合同意 |
| 非化学约束需 approved health practitioner 评估；化学约束需医生 / NP 评估和处方 | 同上 | r 162-20、162-25，第 270–271 页 | 评估和处方信息**引用** BSP，不由 careKind 生成 |
| 使用期间必须监测的 6 项 + 必要性复核 + 效果 + 环境调整 | 同上 | r 162-30，第 271–272 页 | 字段表的"监测"一节逐项对应 |
| 紧急使用后的要求 | 同上 | r 162-35，第 272 页 | 紧急使用字段 |
| BSP 中记录每次使用（开始时间、持续时间、频率、结果、是否符合同意、之前的行为和替代策略、参与人员、监测、复核结果） | 同上 | r 162-60，第 276 页 | 字段表覆盖这些项 |
| 质量标准：最后手段、最少限制、知情同意、监测和复核 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 3.2.7，第 26 页 | 同上 |
| SIRS：inappropriate use of restrictive practices | `03-legal-compliance/references/law-library/acqsc-reportable-incidents-sirs-quick-guide-changes-1-nov-2025.pdf` | 第 2 页 | 只提示时限（护栏 G6） |
| QI：限制性措施指标 | `03-legal-compliance/references/paperwork-templates/health-qi-program-manual-part-a-2025-10.pdf` | 第 9 章 | 记录要能支持季度 QI 统计；careKind 不提交 QI |
| 替代策略参考 | `03-legal-compliance/references/paperwork-templates/acqsc-restraint-free-decision-making-tool-residential.pdf` | 2012 版（较旧） | 只作主题参考，不复制 |

**州差异（重要）**：同意由谁给出按州法决定（VIC 有 *Aged Care Restrictive Practices Substitute Decision-maker Act 2024* (Vic)；QLD 由 QCAT 委任；NSW、SA、WA 各有机制；TAS / ACT / NT ⚠️ 未核实）。联邦 RPSDM hierarchy 是过渡措施，适用到 **01/12/2026**（之后是否延期 ⚠️ 需核实）。SA 的 physical restraint 可能须 SACAT 授权 ⚠️。见 `03-legal-compliance/references/state-by-state-comparison.md` 表 B、§3.4、§4.6。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident / State | 住户、所在州 | ✅ | 🧑 人工 | 州决定同意规则 |
| Restrictive practice type | chemical / environmental / mechanical / physical / seclusion | ✅ | 🧑 人工 | AI 可以提示"叙述可能涉及 X"，**分类由 RN 确认** |
| Description of practice | 具体做法（例如"键盘锁出口门"） | ✅ | 🤖 AI 可起草 | 来自 BSP + 口述 |
| Use pattern | 持续 / 按需 / 紧急 | ✅ | 🧑 人工 | |
| Start · end · duration | 本次或本班 | ✅ | 🗣️ 照录 | |
| Behaviours leading to use | 只针对按需 / 紧急使用 | 按需时必填 | 🤖 AI 可起草 | 链接 ABC |
| Alternative strategies used first & outcome | | 按需时必填 | 🤖 AI 可起草 | 只写员工说过的 |
| Staff involved | | ✅ | 🧑 人工 | |
| Monitoring — distress or harm | r 162-30(a)(i) | ✅ | 🤖 AI 可起草 | 只写观察；没说 → "请填写" |
| Monitoring — side effects / adverse events | r 162-30(a)(ii) | ✅ | 🗣️ 照录 | **不能默认"无"** |
| Monitoring — mood or behaviour | r 162-30(a)(iii) | ✅ | 🤖 AI 可起草 | |
| Monitoring — well-being & meaningful activities | r 162-30(a)(iv) | ✅ | 🤖 AI 可起草 | |
| Monitoring — independent function / ADLs | r 162-30(a)(v)(vi) | ✅ | 🤖 AI 可起草 | |
| Effectiveness / outcome | 是否达到 BSP 中写的预期结果 | ✅ | 🧑 人工 | RN 判断 |
| Environmental changes made | r 162-30(d) | 有则填 | 🤖 AI 可起草 | |
| In line with recorded consent & BSP? | 是 / 否 / 不确定 | ✅ | 🧑 人工 | RN 核对同意记录；**careKind 不判定违规** |
| Emergency use: RPSDM informed (who, when) | r 162-35(a) | 紧急时必填 | 🧑 人工 | |
| Necessity review due / done | r 162-30(b) | ✅ | 🧑 人工 | 日期来自 BSP |
| Chemical restraint: info given to prescriber | r 162-30(e) | 化学约束时必填 | 🧑 人工 | |
| RN confirmation | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### Restrictive practice use & monitoring
Resident: ____ · ID: ____ · State: ____
Type (RN): ☐ chemical ☐ environmental ☐ mechanical ☐ physical ☐ seclusion
Practice: ____ · Use pattern: ☐ ongoing ☐ as-needed ☐ emergency
Date: __/__/____ · Start __:__ · End __:__ · Duration: ____
Consent record: ____ (date, by whom) · BSP version: ____

Behaviours leading to use (as-needed / emergency): ____
Alternative strategies used first → outcome: ____
Staff involved: ____

Monitoring
- Distress or harm: ____
- Side effects / adverse events: ____
- Mood or behaviour: ____
- Well-being / meaningful activities: ____
- Independent function / ADLs: ____
Environmental changes made: ____
Effectiveness vs intended outcome (RN): ____
In line with consent and BSP (RN): ☐ yes ☐ no ☐ unsure → ____
Emergency only — RPSDM informed: ____ at __:__
Necessity review: due __/__/____ · done ☐
RN: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · PM shift。持续使用的 environmental restraint 每班监测条目。同意见 `clinical-restrictive-practice-consent-record.md`（01/09/2026）。

**原话（Daniel Reyes RN 22:15 口述，转写）**
> "RP monitoring for Tomasz, the locked door. He was at the door from sixteen-forty to about five to five, upset, wanting to go home, Priya walked him in the garden and he settled. No harm, I checked his hand. No side effects. Rest of the evening good — ate all his dinner himself, watched the footy replay in the lounge from seven to eight, chatting with Mr Ferris. Walked with his frame. Said no to his shower at half seven, said tomorrow. We turned the lounge TV down after the door episode. It's all within what Marek consented to. Review's due first of December."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Resident: Mr Tomasz Nowak（虚构，81 岁）· WG-0287 · State: VIC
Type (RN): ☑ environmental · Practice: Keypad-locked exit doors, Banksia wing · Use pattern: ☑ ongoing
Date: 18/10/2026 · **PM shift 15:00–23:00**（持续使用，本班监测）
Consent record: 01/09/2026, Marek Nowak（虚构，son）· BSP version: 01/09/2026

Monitoring
- Distress or harm: 16:40–**16:58** at the exit door, **saying he wanted to go home** (see ABC chart 18/10/2026 16:40). Settled with a garden walk with Priya (PCW，虚构). **No harm seen; RN checked his hand.**
- Side effects / adverse events: **None observed**（RN 原话 "No side effects"）
- Mood or behaviour: After 16:58, **calm for the rest of the evening**（⚠️ 原话是 "Rest of the evening good"——请确认措辞）
- Well-being / meaningful activities: Watched the football replay in the lounge 19:00–20:00 and **chatted with another resident**.
- Independent function / ADLs: Ate all of his dinner independently. Walked with his frame. Declined his shower at 19:30 — "Tomorrow."
Environmental changes made: Lounge television volume turned down after 16:58.
Effectiveness vs intended outcome (RN): 请填写
In line with consent and BSP (RN): ☑ yes — "It's all within what Marek consented to."
Necessity review: due 01/12/2026 · done ☐
RN: Daniel Reyes RN（虚构）· 22:20

**改写说明**
- "about five to five" → **16:58**：与已确认的 ABC 记录对齐（AI 从链接记录取值，并标出差异让 RN 确认）。
- "chatting with Mr Ferris" → **"chatted with another resident"**：本记录属于 Tomasz，不写入其他住户的姓名（隐私最小化）。
- "Rest of the evening good" → AI 不把 "good" 当作临床结论，改写为可观察描述并标 ⚠️，由 RN 决定是否保留。
- "Effectiveness" 栏 RN 没有口述 → "请填写"；**AI 没有**根据"他平静下来了"自己写 "effective"。RN 审核时补充："Intended outcome met this shift — Tomasz moved freely in the wing and garden and did not leave the building alone."

## 7. careKind 起草规则
- **可从口述自动填**：做法描述、起止时间、行为和替代策略（链接 ABC）、6 项监测中员工说到的内容、环境调整、RN 关于同意的原话。
- **缺失时显示"请填写"**：任何一项监测没有说到；效果；紧急使用时 RPSDM 是否已通知；类型（AI 只能提示）。
- **必须 RN 确认**：类型、是否符合同意和 BSP、效果、紧急使用相关字段、整条记录（Tier 3 逐条）。
- **禁止生成**：建议使用、继续、增加或停止任何限制性措施；建议药物或剂量；判断谁有权同意；判断"使用不当 / 违规"或是否 reportable；把"没说到副作用"写成"无副作用"。
- 口述中出现约束但系统里**找不到对应的同意记录或 BSP** → 显示"请确认 BSP 和同意记录"，并提示可能需要按机构流程评估；只提示，不判定（`paperwork-taxonomy.md` §4.4、§7 第 7 条）。
