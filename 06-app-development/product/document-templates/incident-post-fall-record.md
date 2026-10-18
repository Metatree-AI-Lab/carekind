# 跌倒后记录（Post-fall record）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。本模板**只记录，不评分**：不算跌倒风险分、不判断数值是否异常、不决定观察频率、不决定是否转院。

## 1. 用途与触发事件
- 用途：记录一次跌倒发现时的情况、即时检查、通知、后续观察，供 RN、GP、家属沟通、care plan 复核和 QI 数据使用。
- 触发事件：PRD §14 **跌倒**（目击或未目击、发现住户在地上、住户自述跌倒）。同一事件同时生成 `incident-report-ims.md`、progress note、SIRS 评估提示、家属沟通记录和交接要点（PRD §7.3 C1–C5）。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | 发现者（PCW / EN）口述发现经过；RN 口述检查结果和观察数值；careKind 起草 |
| 谁审核签署 | Shift RN 逐条确认；每一行观察由实际测量的员工署名 |
| 风险 Tier | **Tier 3**（PRD §6.5 跌倒）——只有 RN 确认 |
| 时限 | 跌倒后即时检查；观察**频率和时长由机构 post-fall 程序或医嘱决定**，由 RN 填进观察时间表；交接时必须带上（SQS 3.3.2(d)） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 跌倒后照护、监测跌倒和伤害、复盘原因与后果 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 5.5.4(b)(c)，第 38 页 | 本记录 + care plan 复核 |
| 事件 / 变化时通知 GP 和 supporters | 同上 | 5.4.4(d)，第 37 页 | 通知字段 |
| 交接和转运时使用结构化沟通 | 同上 | 3.3.2(c)(d)，第 27 页 | 交接摘要 |
| 跌倒后处理良好实践（生命体征基线、受伤检查；撞头 / 新发意识混乱 / 未目击时做神经观察；考虑抗凝药等） | `03-legal-compliance/references/paperwork-templates/acsqhc-falls-guidelines-residential-aged-care-2025.pdf` | Post-fall Management，第 27 页 | 字段主题参考；**CC BY-NC-ND，不复制措辞** |
| 跌倒后路径的记录主题（初始观察、是否撞头、抗凝、通知谁和何时、观察记录） | `03-legal-compliance/references/paperwork-templates/qld-health-rcf-post-fall-clinical-pathway.pdf` | 第 1–2 页 | 只参考主题；**不采用其观察间隔表和版式**（版权 ⚠️ 需核实） |
| IMS 记录"已做的评估" | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 164-25(1)(g)，印刷页 282 | 本记录作为 IMS 的评估附件 |
| QI 跌倒与重大伤害指标 | 同上 | r 166-135，印刷页 310 | 跌倒日期与伤情须可追溯 |
| 字段与 TGA 风险 | `03-legal-compliance/references/paperwork-taxonomy.md` | §2.3 | 不自动判断转院，不按数值报警 |

**州差异提示**：跌倒后流程没有全国统一表单（QLD、VIC 各有州卫生部门资料：`PT/vic-health-standardised-care-process-falls.pdf`）。观察频率按机构政策。⚠️ 是否有州级强制要求，本地资料未覆盖，需核实；州级临床规则见 `03-legal-compliance/references/state-clinical-practice-rules.md`。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| P01 | Resident | | 是 | 🤖 | 本班名单内匹配 |
| P02 | Date / time found | | 是 | 🗣️ | |
| P03 | Location / position found | 地点、姿势 | 是 | 🗣️ | |
| P04 | Witnessed? | Witnessed / Unwitnessed | 是 | 🗣️ | 没说就"请填写" |
| P05 | Found by | | 是 | 🤖 | |
| P06 | Resident's own account | 原话 | 否 | 🗣️ | 住户没说就写 "Not stated" |
| P07 | Hit head? | Yes / No / Not known——**按原话** | 是 | 🗣️ | 记录"谁说的"（住户自述 / 员工看到） |
| P08 | Loss of consciousness observed? | Yes / No / Not known | 是 | 🗣️ | 只照录员工观察 |
| P09 | Injuries seen | 部位、外观、测量值 | 是 | 🗣️ | 不写诊断词（fracture 等），除非 GP 或 RN 原话 |
| P10 | Pain (resident's words / rating if given) | 住户自报的数字照录 | 是 | 🗣️ | 系统不推算疼痛分 |
| P11 | Initial observations | BP、HR、RR、SpO2、Temp、GCS、BGL——员工报出的数值 | 是 | 🗣️ | 逐字照录；识别置信度低必须确认；**不标红、不报警** |
| P12 | Anticoagulant / antiplatelet | Yes / No——RN 对照用药系统 | 是 | 🧑 人工 | careKind 不读不判药 |
| P13 | How resident was assisted up | 方法、设备、人数 | 是 | 🗣️ | |
| P14 | First aid / wound care given | | 否 | 🗣️ | |
| P15 | GP / NP contacted | 时间、方式、谁打的 | 是 | 🗣️ | |
| P16 | GP / NP instructions | **逐字照录** | 是 | 🗣️ | careKind 不补充、不改写医嘱 |
| P17 | Hospital transfer? | Yes / No + 谁决定 | 是 | 🧑 人工 | 系统不判断是否转院 |
| P18 | Supporter notified | 姓名、关系、时间、对方回应 | 是 | 🗣️ | 只写口述里明确说了的 |
| P19 | Care Manager notified | | 是 | 🗣️ | |
| P20 | Environment observed | 地面、照明、助行器、鞋、呼叫铃 | 否 | 🗣️ | 观察，不写"原因" |
| P21 | Observation schedule basis | Facility post-fall procedure / medical order | 是 | 🧑 人工 | RN 选择，不由系统决定 |
| P22 | Observation rows | 计划时间、实际时间、数值、员工、备注 | 是 | 🧑 计划 / 🗣️ 数值 | 见空白模板 |
| P23 | Care plan / falls plan review requested | | 是 | 🧑 人工 | 见 `plan-care-services-plan-review.md` |
| P24 | RN confirmation | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
POST-FALL RECORD                                    Linked IMS ref: ________
Resident: ______________ Room: ____  Found: __/__/____ __:__  By: __________
Location / position found: ____________________  ☐ Witnessed ☐ Unwitnessed
Resident's own words: "_________________________________________________"
Hit head: ☐ Yes ☐ No ☐ Not known (source: ____)  LOC observed: ☐ Yes ☐ No ☐ Not known
Injuries seen: _________________________________________________________
Pain (resident's words / own rating): ___________________________________
Initial obs at __:__   BP ___/___  HR ___  RR ___  SpO2 ___% (__)  Temp ___°C  GCS ___  BGL ___
Anticoagulant/antiplatelet (RN, per medication system): ☐ Yes ☐ No
Assisted up: method ______________ staff ______________ time __:__
First aid / wound care: ________________________________________________
GP/NP contacted: __:__ by ________  Instructions (verbatim): "______________"
Hospital transfer: ☐ Yes ☐ No — decided by ____________
Supporter notified: ______ (relationship ____) __:__ response: __________
Care Manager notified: ______ __:__
Environment observed: __________________________________________________
Observation schedule basis (RN): ☐ Facility post-fall procedure ☐ Medical order: ______

OBSERVATION LOG (planned times entered by RN; values entered by the staff member who measured)
| Planned | Actual | BP | HR | RR | SpO2 | Temp | GCS | BGL | Pain (own words) | Staff | Notes |
|---------|--------|----|----|----|------|------|-----|-----|------------------|-------|-------|
|         |        |    |    |    |      |      |     |     |                  |       |       |

Care plan / falls plan review requested: ☐ Yes — with ________ by __/__/____
RN confirmed: ______________ __/__/____ __:__
```

## 6. 示例（虚构）
> 虚构机构 Wattle Grove Residential Care（虚构，VIC）；全部人物均为虚构。Mrs Edna Hall · DOB 03/02/1938 · WG-0412 · Room 12, Wattle wing · 四轮助行器。

**原话 → AI 草稿对照（片段）**
| 片段 | 口述原话 | careKind 草稿 |
|---|---|---|
| S4（Daniel Reyes RN） | "Obs at three twenty: BP one forty-eight on eighty-six, heart rate ninety-two, resp eighteen, sats ninety-six on room air, temp thirty-six seven, BGL six point eight. GCS was fifteen at quarter past." | 15:20 — BP 148/86, HR 92, RR 18, SpO2 96% (room air), Temp 36.7 °C, BGL 6.8 mmol/L. GCS 15 at 15:15. |
| S5（Daniel） | "Rang Dr Brooks at quarter to four. She said: continue post-fall obs per our policy, paracetamol as charted if needed, she'll see her on the morning round tomorrow and decide about an X-ray then, call her or after-hours if pain goes up, swelling, or any change in how alert she is." | GP/NP contacted 15:45 by Daniel Reyes RN. Instructions (verbatim as reported): "Continue post-fall observations per facility policy. Paracetamol as charted if needed. I'll see her on my morning round tomorrow, 19/10, and we'll decide about an X-ray then. Call me or after-hours if pain increases, swelling, or any change in her alertness." |

> 数值逐字照录；系统没有给任何数值加"正常 / 异常"标签。GP 指示整段照录；"X-ray"只出现在 GP 原话里。

**填写后的记录**
```text
POST-FALL RECORD                              Linked IMS ref: WG-IMS-2026-0418 (fictional)
Resident: Mrs Edna Hall (fictional), 88, DOB 03/02/1938, WG-0412   Room: 12, Wattle wing (fictional)
Found: 18/10/2026 15:10  By: Priya (PCW, fictional) — call bell 15:12; Daniel Reyes RN arrived 15:13
Location / position found: En-suite bathroom floor, sitting beside the shower chair. Unwitnessed.
Resident's own words: "My foot slipped on the wet floor when I reached for my towel. I didn't hit my head."
Hit head: No (source: Mrs Hall's own account)   LOC observed: No (Priya: "she called out and was
  talking to me the whole time")
Injuries seen: Skin tear to right wrist, 3.0 x 1.0 cm, ISTAP type 1 (Daniel Reyes RN). Daniel: "No
  swelling or deformity that I can see."
Pain: 15:25 Mrs Hall: "It's sore, about a 4." (4/10, own rating) · 17:30: "2 now." (2/10)
Initial obs  GCS 15 at 15:15 · 15:20 BP 148/86  HR 92  RR 18  SpO2 96% (room air)  Temp 36.7 °C  BGL 6.8 mmol/L
Anticoagulant/antiplatelet (RN, per eNRMC): No — checked by Daniel Reyes RN 15:40
Assisted up: mechanical lifter per facility procedure; Daniel Reyes RN and Priya; 15:30
First aid / wound care: Skin tear dressed 15:50 (Daniel); wound review 21/10/2026 — see wound record.
GP/NP contacted: 15:45 by Daniel Reyes RN (phone) — Dr Amelia Brooks (GP, fictional)
  Instructions (verbatim): "Continue post-fall observations per facility policy. Paracetamol as charted
  if needed. I'll see her on my morning round tomorrow, 19/10, and we'll decide about an X-ray then.
  Call me or after-hours if pain increases, swelling, or any change in her alertness."
Hospital transfer: No — per Dr Brooks' instructions above; recorded by Daniel Reyes RN
Supporter notified: Karen Hall (daughter, fictional) 15:55 by phone — "This is her second fall this
  year. I'll come in tomorrow at ten."
Care Manager notified: Grace Liu (CM, fictional) 16:00 by phone
Environment observed: Floor wet near the shower. Non-slip bath mat not in place. Towel on the far rail.
  Four-wheeled walker parked outside the bathroom door.
Observation schedule basis (RN): Facility post-fall procedure — unwitnessed fall (Wattle Grove
  procedure, fictional). Planned times entered by Daniel Reyes RN.

| Planned | Actual | BP     | HR | RR | SpO2 | Temp | GCS | BGL | Pain (own words)   | Staff          | Notes |
|---------|--------|--------|----|----|------|------|-----|-----|--------------------|----------------|-------|
| 15:15   | 15:15  | —      | —  | —  | —    | —    | 15  | —   | —                  | D Reyes RN     | On bathroom floor |
| 15:20   | 15:20  | 148/86 | 92 | 18 | 96%  | 36.7 | 15  | 6.8 | "about a 4" (15:25)| D Reyes RN     | Initial set |
| 15:50   | 15:52  | 142/80 | 86 | 18 | 97%  | —    | 15  | —   | "still a 4"        | D Reyes RN     | After dressing, in her chair |
| 16:20   | 16:20  | 138/78 | 82 | 16 | 97%  | —    | 15  | —   | "a bit better"     | D Reyes RN     | Watching TV |
| 16:50   | 16:55  | 136/78 | 80 | 16 | 96%  | 36.6 | 15  | —   | —                  | D Reyes RN     | Delayed 5 min — other resident call |
| 17:20   | 17:30  | 136/76 | 78 | 16 | 97%  | —    | 15  | —   | "2 now"            | D Reyes RN     | Delayed — dinner service |
| 18:20   | 18:20  | 134/76 | 78 | 16 | 97%  | —    | 15  | —   | "fine, love"       | D Reyes RN     | Ate most of dinner (Priya) |
| 20:20   | 20:20  | 132/74 | 76 | 16 | 97%  | 36.5 | 15  | —   | "just a little sore"| D Reyes RN    | In bed, reading |
| 22:20   | 22:20  | 130/74 | 74 | 16 | 96%  | —    | 15  | —   | "only if I move it"| D Reyes RN     | Handover to Sofia Martins RN at 22:45 |
| 02:20   |        |        |    |    |      |      |     |     |                    | (Sofia Martins RN) | Next set due |

Care plan / falls plan review requested: Yes — Grace Liu (CM) with Mrs Hall, 19/10/2026
RN confirmed: Daniel Reyes RN 18/10/2026 22:30 (rows to 22:20); later rows confirmed by the RN who records them
```

## 7. careKind 起草规则
- **可以从口述自动填**：P01–P06、P09、P13–P15、P18–P20；观察行的数值只在员工口述后填入当前行。
- **缺失显示"请填写"**：是否目击、是否撞头、意识丧失、抗凝、GP 指示、家属通知；尤其**抗凝**一栏不能留默认值。
- **必须 RN 确认或填写**：P12、P17、P21、观察计划时间、P23、P24。
- **禁止生成**：跌倒风险分或风险等级；数值"正常 / 异常 / 恶化"判断、颜色标记或提醒（PRD §9 G3）；观察频率建议；"需要 / 不需要转院"；伤情诊断；跌倒原因结论；用药建议。
- 下一行观察到了计划时间只显示"计划时间到了"这类**时间提醒**（基于 RN 自己填的计划），不涉及数值。⚠️ 这一提醒是否属于 TGA 🟡 区域，需按 `03-legal-compliance/tga-samd-boundary.md` 评审。
