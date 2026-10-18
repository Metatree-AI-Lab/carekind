# Clinical deterioration & escalation record（病情变化与升级记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
当员工**已经决定**要把住户的变化升级给 RN、GP、NP、after-hours 服务或 000 时，记录：员工观察到的变化（原话）、当时的数值、升级给谁、何时、通过什么方式、对方给了什么指示、结果。careKind 可以把 RN 要说的内容整理成 ISBAR 格式方便打电话，但**不判断"是否需要升级"或"紧急程度"**。

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 病情变化 / 升级（口述中提到"已通知 RN / 打给 GP / 叫了救护车"） | ✅ + progress note + 交接 + 家属沟通（提到通知时） |
| 跌倒、伤害后 RN 联系 GP | ✅（链接 incident / 跌倒后记录） |
| PCW 向 RN 报告变化 | ✅ 第一层升级（PCW → RN） |
| 口述只描述变化、没有说升级 | 只写 progress note；**不自动生成"需要升级"提示** |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 发现变化的员工（PCW → RN 的升级）；RN（RN → GP / NP / 000 的升级） |
| 谁审核签署 | **只有 RN，逐条确认** |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 3（病情变化） |
| 时限 | 升级发生后尽快；对方的指示在通话结束后立即照录。**升级本身的时机由员工按机构流程判断，careKind 不计时、不催促** |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 支持员工识别恶化并及时响应和升级 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 3.2.5(a)(b)(c)，第 26 页 | 记录"谁、何时升级给谁" |
| 风险、变化、恶化须升级和沟通；结构化沟通 | 同上 | Outcome 3.3 statement、Action 3.3.1、3.3.2(c)、3.3.3，第 27 页 | ISBAR 结构；进入交接 |
| 获得 after-hours 和紧急临床服务；变化时及时通知 GP 和 supporters | 同上 | Action 5.4.4(c)(d)，第 37 页 | 通知字段 |
| 监测临床状况、恶化时重新评估 | 同上 | Action 5.4.5，第 37 页 | 重新评估由 RN 做 |
| 跌倒后：基线评估包括生命体征；撞头、新发意识混乱或无人目击时做神经观察；监测类型和频率由临床决定 | `03-legal-compliance/references/paperwork-templates/acsqhc-falls-guidelines-residential-aged-care-2025.pdf` | Post-fall Management，第 27 页 | 只记录员工说的做法和频率；**CC BY-NC-ND，不复制** |
| RACF 恶化识别路径（体征红 / 黄分区） | `03-legal-compliance/references/paperwork-templates/qld-health-racf-pathway-recognition-deteriorating-resident.pdf` | 第 1 页（明确写明不能替代临床判断） | **careKind 不套用这些阈值**，不标红 / 黄 |
| 跌倒后路径字段 | `03-legal-compliance/references/paperwork-templates/qld-health-rcf-post-fall-clinical-pathway.pdf` | ⚠️ 页码需核实；许可 ⚠️ | 只参考主题 |
| TGA 边界 | `03-legal-compliance/tga-samd-boundary.md` | "自动判断是否需要转院 / 就医" = 🔴 | 不判断是否升级、不分诊 |

**州差异**：公立医院的恶化识别框架按州不同（如 NSW CEC "Between the Flags"，`paperwork-templates/index.md` D4，只面向 NSW 公立医院）；私营 residential aged care 按机构流程。after-hours GP / 虚拟急诊服务各州不同 ⚠️ 本地无资料。见 `03-legal-compliance/references/state-by-state-comparison.md`。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | | ✅ | 🧑 人工 | |
| Change noticed — when, by whom | | ✅ | 🗣️ 照录 | |
| What was observed | 员工原话描述的变化 | ✅ | 🤖 AI 可起草 + 🗣️ | 不改写成诊断（"more confused" ≠ "delirium"） |
| Resident's words | | 有则必填 | 🗣️ 照录 | |
| Baseline (from record) | 档案中已记录的平时状态 | 有则填 | 🤖 AI 可起草 | 只引用已有记录，不总结 |
| Values at the time | 体征、BGL、GCS 等（链接体征表） | 有则填 | 🗣️ 照录 | 原值 + 时间；**不标正常 / 异常** |
| Actions before escalation | 员工已经做的事 | 有则填 | 🤖 AI 可起草 | |
| Escalated to · role · time · method | RN / GP / NP / after-hours / 000 | ✅ | 🗣️ 照录 | **是否升级、升级给谁由员工决定** |
| ISBAR call summary | 供 RN 打电话用 | 可选 | 🤖 AI 可起草 | I/S/B 来自已确认记录；**A/R 只用 RN 原话** |
| Instructions received | 对方说了什么（照录） | ✅ | 🗣️ 照录 | 新医嘱以用药系统 / 正式医嘱为准 |
| Read-back confirmed | RN 是否复述确认 | 有则填 | 🧑 人工 | |
| Outcome | 留院观察 / GP 来访 / 转院 / 其他 | ✅ | 🧑 人工 | |
| Next contact / review | | 有则填 | 🗣️ 照录 | |
| Family notified | 链接家属沟通记录 | 有则填 | 🗣️ 照录 | |
| RN confirmation | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### Deterioration & escalation record
Resident: ____ · ID: ____
Change noticed: __/__/____ __:__ by ____
Observed: ____ · Resident said: "____"
Baseline (from record): ____
Values (as recorded, time): ____
Actions before escalation: ____
Escalated to: ____ (role) · __:__ · method: ____

ISBAR (for the call)
- I: ____  - S: ____  - B: ____
- A (RN's words): ____  - R (RN's request): ____

Instructions received (as said): ____ · Read back: ☐
Outcome: ____ · Next contact / review: ____
Family notified: ____ (linked: ____)
RN: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · 15:10 Mrs Edna Hall 浴室跌倒后，RN 决定通知 GP。两层升级：Priya → Daniel（15:12），Daniel → Dr Brooks（15:45）。

**原话（Daniel Reyes RN 15:42 口述，准备打电话）**
> "Going to ring Dr Brooks about Edna. Unwitnessed fall at ten past three, found sitting on the bathroom floor, says she slipped on the mat, says she didn't hit her head. Right wrist skin tear, pain four out of ten. GCS fifteen, obs at three-twenty BP one-forty-eight on eighty-six, pulse ninety-two, resp eighteen, sats ninety-six on room air, temp thirty-six point seven, BGL six point eight. She's on no blood thinners. I think she's okay but I want her reviewed and I want to know if she needs an X-ray of the wrist."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Resident: Mrs Edna Hall（虚构，88 岁）· WG-0412
Change noticed: 18/10/2026 15:10 by Priya (PCW，虚构) → escalated to Daniel Reyes RN（虚构）15:12 via emergency bell
Observed: Found sitting on her bathroom floor after an unwitnessed fall. Resident said she slipped on the mat and did not hit her head.
Baseline (from record): Walks with a four-wheeled walker（care plan）
Values (as recorded, 15:20): BP 148/86 · HR 92 · RR 18 · SpO2 96% room air · Temp 36.7 °C · BGL 6.8 mmol/L · GCS 15（15:15）（linked: vital signs record）
Actions before escalation: RN check at 15:13; assisted off the floor with mechanical floor lifter at 15:30; neuro obs started as per facility post-fall procedure.
Escalated to: Dr Amelia Brooks (GP，虚构) · 15:45 · method: phone

ISBAR (for the call)
- I: Daniel Reyes RN, Wattle Grove; resident Edna Hall, DOB 03/02/1938, WG-0412
- S: Unwitnessed fall at 15:10 in her bathroom. Right wrist skin tear. **Self-reported pain 4/10 at the right wrist.**
- B: **No anticoagulant medicines（RN 原话 "no blood thinners"，⚠️ 请在 eNRMC 核对）**. Walks with a four-wheeled walker.
- A (RN's words): "I think she's okay."
- R (RN's request): "I want her reviewed and I want to know if she needs an X-ray of the wrist."

**通话后原话（Daniel 15:52）**
> "Dr Brooks says keep doing neuro obs as per our procedure because it was unwitnessed, dress the wrist, she'll see Edna on her round tomorrow morning and decide about the X-ray then, no new medication orders, ring her after-hours line if anything changes. I read it back."

Instructions received (as said): Continue neuro obs as per facility procedure (unwitnessed fall). Dress the wrist. GP will review Edna on the morning round 19/10/2026 and decide about a wrist X-ray then. No new medication orders. Call the after-hours line if anything changes. · Read back: ☑
Outcome: Remains at Wattle Grove; GP review 19/10/2026
Next contact / review: GP morning round 19/10/2026
Family notified: Karen Hall (daughter，虚构) at 15:55（linked: family communication log）
RN: Daniel Reyes RN · 15:58

**改写说明与审核要点**
- "pain four out of ten" → **"Self-reported pain 4/10"**：标明是住户自评（来自 pain 记录），不是员工评分。
- "no blood thinners" → **"No anticoagulant medicines"** 并标 ⚠️：术语规范化，且用药信息必须以 eNRMC 为准，careKind 不核对药物。
- A 栏 "I think she's okay" 照录；**AI 没有**写成 "haemodynamically stable" 或 "vital signs within normal limits"。
- R 栏只用 RN 原话；**AI 没有**加入 "consider CT"、"monitor for delayed head injury" 等内容。
- 15:20 的数值只照录，不标颜色；QLD 路径的红 / 黄分区不被套用。

## 7. careKind 起草规则
- **可从口述自动填**：观察到的变化、住户原话、员工说出的数值（或链接体征表的原值）、升级对象 / 时间 / 方式、对方指示（照录）、结果、家属通知（链接）。
- **ISBAR 通话摘要**：I/S/B 只用已确认记录和档案；A/R 只用 RN 原话，没说就"请填写"。
- **缺失时显示"请填写"**：升级时间、对方指示、是否复述确认、结果。
- **必须 RN 确认**：整条记录（Tier 3 逐条）；所有术语替换；所有用药相关表述。
- **禁止生成**：是否需要升级、升级给谁、紧急程度；根据数值标红、报警或打分（如 early warning score）；诊断或鉴别诊断；转院建议；任何新的治疗或用药建议；"stable / within normal limits" 之类结论（除非 RN 原话）。
