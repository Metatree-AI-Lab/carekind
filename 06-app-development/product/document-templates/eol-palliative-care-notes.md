# 姑息与临终照护记录（Palliative & end-of-life care notes）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。careKind **不判断"进入临终阶段"**、不评症状分数、不建议用药；预期性用药以用药系统为准，本记录只引用。

## 1. 用途与触发事件
- 用途：按班记录舒适照护：症状（员工观察和本人原话）、口腔 / 眼部 / 皮肤 / 二便护理、体位、饮食饮水、家属在场和支持、精神与文化需要、已按医嘱给予的药物（引用）。
- 触发事件：PRD §14 **临终照护**（以及姑息阶段的疼痛 / 皮肤 / 临床观察）。是否属于姑息或临终阶段由 GP / RN 记录，careKind 只在该住户已被 RN 标记为姑息阶段后提供本模板。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | PCW / EN / RN 口述；careKind 起草 |
| 谁审核签署 | Shift RN |
| 风险 Tier | **Tier 3**（PRD §6.5 临终）——只有 RN 逐条确认 |
| 时限 | 每班，或按 RN 设定的更频繁的舒适照护时间 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 识别姑息需要并回应变化 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 5.7.1，第 40 页 | 由人判断阶段 |
| 舒适与尊严；精神文化需要；症状变化；照护地点偏好；向 supporters 提供临终和丧亲信息 | 同上 | 5.7.3(a)–(h)，第 40–41 页 | 字段结构 |
| 最后几天：预期性用药 24 小时可得；压力、口腔、眼部、二便护理；谵妄；避免不必要转院 | 同上 | 5.7.4(a)–(e)，第 41 页 | 护理项目；药物只引用 |
| 文书与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md`；`03-legal-compliance/references/paperwork-requirements-by-event.md` | §5.3；§14 | 不判断进入临终 |
| 病例会议资料（主题参考） | `03-legal-compliance/references/paperwork-templates/palliaged-palliative-care-case-conference-pack.pdf` | — | 不复制 |

**州差异提示**：药品授权（谁可以给皮下预期性用药）按州不同，见 `03-legal-compliance/references/state-clinical-practice-rules.md`。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| L01 | Resident · date · shift · time | | 是 | 🤖 | |
| L02 | Comfort & appearance (observed) | | 是 | 🗣️ | 不写"actively dying" 除非 RN 原话 |
| L03 | Resident's own words | | 否 | 🗣️ | |
| L04 | Pain / breathing / agitation / secretions (observed) | | 是 | 🗣️ | 量表分数只照录员工输入 |
| L05 | Mouth, eye, skin, pressure, bowel & bladder care given | 时间、做了什么 | 是 | 🗣️ | |
| L06 | Repositioning | 时间、体位 | 否 | 🗣️ | |
| L07 | Food & fluids offered / taken | | 否 | 🗣️ | 只照录量 |
| L08 | Medicines given as charted | "See eNRMC" + 时间 + 给药人 | 条件 | 🧑 人工 | 不重录药名剂量 |
| L09 | Family / supporters present · support offered | | 否 | 🗣️ | |
| L10 | Spiritual / cultural care | | 否 | 🗣️ | |
| L11 | Escalation / GP contact · instructions | 指示逐字照录 | 条件 | 🗣️ | |
| L12 | RN confirmation | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
PALLIATIVE / END-OF-LIFE CARE NOTE
Resident: ______________ Date: __/__/____ Shift: ____ Time: __:__
Comfort & appearance (observed): ________________________________________
Resident's own words: "_________________________________________________"
Pain / breathing / agitation / secretions (observed; tool score only as entered): ____
Care given (mouth / eyes / skin / pressure / bowel & bladder): ___________________
Repositioning: __:__ ______  __:__ ______
Food & fluids offered / taken: _________________________________________
Medicines given as charted: see eNRMC — __:__ by ______
Family / supporters present & support offered: ___________________________
Spiritual / cultural care: _____________________________________________
GP contacted: __:__  Instructions (verbatim): "__________________________"
RN confirmed: ______________ __/__/____ __:__
```

## 6. 示例（虚构）
> Mr George Whitfield（虚构，93 岁，WG-0198，Room 3, Wattle wing），Dr Amelia Brooks 于 10/10/2026 记录其进入姑息阶段（GP 记录）。Ruth Whitfield（女儿，虚构）。

**原话 → AI 草稿对照（片段）**
| 片段 | Priya（PCW）口述 | careKind 草稿 |
|---|---|---|
| S1 | "George, room three. Did mouth care at two, his lips were dry so I put the balm on. He opened his eyes when Ruth held his hand and said 'there's my girl'. Breathing sounds a bit rattly." | 14:00 — Mouth care given; lips dry, lip balm applied (Priya). George opened his eyes when Ruth held his hand and said: "There's my girl." Priya: "Breathing sounds a bit rattly." |

> "rattly" 以 Priya 原话加引号保留，没有改写成"terminal secretions"。

**填写后的记录**
```text
PALLIATIVE / END-OF-LIFE CARE NOTE
Resident: Mr George Whitfield (fictional), 93, WG-0198   Date: 16/10/2026  Shift: PM  Time: 13:00–21:30
Comfort & appearance (observed): Resting in bed most of the shift, eyes closed, face relaxed (Priya 14:00).
Resident's own words: 14:00 "There's my girl." 18:30 "Just tired."
Pain / breathing / agitation / secretions: Priya 14:00: "Breathing sounds a bit rattly." Daniel Reyes
  RN 14:10 recorded his own pain assessment in the facility pain tool (score as entered by Daniel).
Care given: mouth care 14:00, 18:00 (lip balm); eye care 18:00; pad change and skin check 14:00,
  20:00 — no new marks seen (Priya); pressure care per plan.
Repositioning: 14:00 left side · 16:00 back, 30° · 18:00 right side · 20:00 left side
Food & fluids: sips of water from a spoon 14:00, 18:00 — "about five spoonfuls" (Priya); declined custard.
Medicines given as charted: see eNRMC — 14:10 by Daniel Reyes RN
Family / supporters: Ruth present 13:30–21:00. Daniel explained what to expect over the coming days
  using the facility's information sheet; Ruth asked to be called "any time, day or night".
Spiritual / cultural care: Anglican chaplain visited 16:30, prayers with George and Ruth (Ruth's request).
GP contacted: 14:20 by Daniel — Dr Brooks: "Keep him comfortable, use the anticipatory medicines as
  charted, and call me if Ruth has questions."
RN confirmed: Daniel Reyes RN 16/10/2026 21:10
```

## 7. careKind 起草规则
- **可以从口述自动填**：L01–L07、L09–L11（照录）。
- **缺失显示"请填写"**：给药时间和给药人（L08）、GP 指示。
- **必须 RN 确认或填写**：L08、L12；整份 Tier 3 逐条确认。
- **禁止生成**：判断"dying / last days / deteriorating"；症状评分；预期性用药的名称、剂量或是否给药建议；预计死亡时间；"comfortable"之类结论（除非员工原话）。
