# Wound & pressure injury record（伤口与压伤记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录每一处伤口（皮肤撕裂、擦伤、压伤、慢性伤口等）从发现到愈合的每一次评估和换药：部位、员工测量的大小、员工描述的外观、员工给出的分类 / 分期、处理、下次评估日期。**分类、分期、测量值只能来自合资格员工说出的内容，careKind 不从描述或照片推断。**

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 疼痛 / 皮肤 / 临床观察（发现新伤口、压红、换药） | ✅ + progress note + 交接要点 |
| 跌倒、伤害 | ✅ + incident / 跌倒后记录（链接）+ ⏱ SIRS 评估提示（来自事件，不来自伤口本身） |
| 例行全身皮肤检查（QI pressure injuries） | ✅ 发现时；没有发现时只在 progress note 中照录员工说的结果 |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | PCW 可口述"看到了什么"（发现、位置、外观）；**测量、分类 / 分期、处理计划由 RN（或机构授权的 EN / 伤口护士）给出** |
| 谁审核签署 | RN |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 2（皮肤）；由跌倒 / 伤害造成 → Tier 3 |
| 时限 | 发现时尽快；之后每次换药或评估都记录；下次评估日期由 RN 按伤口计划决定 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 例行全面皮肤检查；伤口和压伤的监测和响应 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 5.5.9(a)(b)，第 39 页 | 每次评估一条记录，可追溯 |
| 跌倒后伤害的监测和复盘 | 同上 | Action 5.5.4(b)(c)，第 38 页 | 跌倒造成的伤口链接到跌倒记录 |
| QI：pressure injuries（每个报告期的全身观察评估、分期口径） | `03-legal-compliance/references/paperwork-templates/health-qi-program-manual-part-a-2025-10.pdf` | 第 8 章 | 分期字段供 QI 统计，**分期由员工给出** |
| 慢性伤口评估要素（原因、组织、渗液、疼痛、营养等） | `03-legal-compliance/references/paperwork-templates/qld-health-racf-pathway-chronic-wound-assessment.pdf` | ⚠️ 页码需核实；许可 ⚠️ | 只参考主题 |
| 压伤标准化护理流程 | `03-legal-compliance/references/paperwork-templates/vic-health-standardised-care-process-pressure-injuries.pdf` | 2018 版；© State of Victoria，**不允许转载 / 改编** | 只参考主题，不复制 |
| Braden / Waterlow 风险量表 | `03-legal-compliance/references/paperwork-templates/index.md` | C12（未下载，有版权） | **careKind 不计算风险分数** |
| 文书字段与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md` | §4.1（自动分期 = 诊断，TGA 风险中到高） | |
| TGA 红绿灯 | `03-legal-compliance/tga-samd-boundary.md` | "伤口照片分析分期" = 🔴；"伤口照片的文字描述辅助" = 🟡 | MVP 不做照片分析 |

**州差异**：伤口照片属于健康信息；VIC、NSW、ACT 州健康信息法另有要求，拍照需同意并存放在机构批准的系统（见 `03-legal-compliance/references/state-by-state-comparison.md` 表 A、§3.1）。VIC 公营机构使用 Vic 卫生部标准化护理流程。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | | ✅ | 🧑 人工 | |
| Wound ID / site | 部位、左右、编号 | ✅ | 🗣️ 照录 | 左右只按员工说的 |
| Date / time first noticed · how | 首次发现 + 经过（例如跌倒） | 首次必填 | 🤖 AI 可起草 | 链接事件 |
| Wound type / classification / stage | 皮肤撕裂分型、压伤分期等 | ✅ | 🧑 人工 | **只记录合资格员工说出的分类**；没说 → "请填写" |
| Size (L × W × D) | 员工测量的 cm | ✅ | 🗣️ 照录 | 只有长宽就只记长宽；不估算 |
| Wound bed | 员工描述 | ✅ | 🤖 AI 可起草 | 规范措辞，不改变颜色 / 组织描述 |
| Exudate | 量、性质（员工描述） | ✅ | 🗣️ 照录 | |
| Surrounding skin | | ✅ | 🤖 AI 可起草 | |
| Odour / other signs noted | | 有则填 | 🗣️ 照录 | **不写"感染迹象"，除非 RN 原话** |
| Pain at wound | 住户原话或分数 | 有则填 | 🗣️ 照录 | 链接 `clinical-pain-observation.md` |
| Cleansing & dressing | 员工说的做法（按伤口计划 / 机构流程） | ✅ | 🗣️ 照录 | **AI 不建议敷料或处理方法** |
| Photo taken | 是 / 否；同意；存放位置 | ✅ | 🧑 人工 | 照片不进入 careKind 分析 |
| Next review | 日期 | ✅ | 🧑 人工 | RN 说出 |
| Notified | GP、伤口护士、家属 | 有则填 | 🗣️ 照录 | |
| Recorded / reviewed by | | ✅ | 🧑 人工 | |

## 5. 空白模板
```markdown
### Wound & pressure injury record
Resident: ____ · ID: ____
Wound ID: ____ · Site: ____ · First noticed: __/__/____ __:__ · How: ____
Type / classification / stage (by ____): ____
Size: L ____ cm × W ____ cm × D ____ cm (measured by ____)
Wound bed: ____ · Exudate: ____ · Surrounding skin: ____
Other observations: ____
Pain at wound: ____
Cleansing and dressing: ____
Photo: ☐ no ☐ yes (consent: ____ · stored in: ____)
Next review: __/__/____ · Notified: ____
Recorded by: ____ · Reviewed by: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · 15:10 Mrs Edna Hall 浴室跌倒后右手腕伤口（见 `daily-progress-note.md`）。

**原话（Daniel Reyes RN 15:58 口述，转写）**
> "Wound for Edna, right wrist, back of the wrist. From the fall at ten past three. It's a skin tear, I'd call it ISTAP type one, the flap's intact, I've laid it back. Measures three centimetres by one. Bleeding stopped with pressure, bit of serous ooze. Skin around it is thin and a bit bruised. Cleaned with saline, silicone non-adherent dressing as per our skin tear procedure, marked the arrow for the flap direction. She says it stings. No photo. Review the dressing on the twenty-first unless it lifts."

**AI 草稿（**粗体** = AI 改写或规范化部分）**
Resident: Mrs Edna Hall（虚构，88 岁）· WG-0412
Wound ID: **W1-2026-10-18** · Site: Right wrist, **dorsal aspect** ⚠️ · First noticed: 18/10/2026 15:10 · How: Unwitnessed fall in her en-suite bathroom（linked: progress note 15:35, incident draft）
Type / classification / stage (by Daniel Reyes RN): Skin tear, ISTAP type 1, as stated by RN; flap intact and **repositioned**
Size: L 3.0 cm × W 1.0 cm × D — **请填写（未口述）**（measured by Daniel Reyes RN）
Wound bed: **请填写**（原话没有描述创面）
Exudate: Small amount of serous **exudate**（原话 "bit of serous ooze"）; bleeding stopped with pressure.
Surrounding skin: Thin and **bruised**（原话 "a bit bruised"）
Pain at wound: "It stings."（linked: pain record 15:25）
Cleansing and dressing: Cleaned with saline; silicone non-adherent dressing as per facility skin tear procedure; arrow marked on the dressing to show flap direction.
Photo: ☑ no
Next review: 21/10/2026, or earlier if the dressing lifts · Notified: Dr Amelia Brooks (GP，虚构) at 15:45（来自 escalation 记录）
Recorded by: Daniel Reyes RN（虚构）· Reviewed by: Daniel Reyes RN · 16:02

**改写说明与审核要点**
- "back of the wrist" → **"dorsal aspect"** 并标 ⚠️：医学术语替换必须由 RN 确认（也可以保留原话）。
- "I'd call it ISTAP type one" → 照录为 RN 给出的分类，并写明 "as stated by RN"；**AI 没有**根据 "flap intact" 自己判断分型。
- "a bit bruised" → **"bruised"**：AI 删掉了程度词，属于弱化原话——**审核时应恢复为 "a little bruised"**（PRD §6.6 第 5 条：敏感事件不弱化，也不加强）。
- 深度和创面原话没有 → "请填写"，不估算。RN 审核补充："Wound bed: pink, flap viable. Depth: superficial, not measured."
- 交接（22:45）中 "dressing is dry and intact" 是 RN 在交接时的原话，不是本记录推断的。

## 7. careKind 起草规则
- **可从口述自动填**：部位（左右按原话）、发生经过（链接事件）、员工说出的测量值、渗液 / 周围皮肤 / 创面的员工描述、员工说出的分类、清洁和敷料做法、下次评估日期、通知。
- **缺失时显示"请填写"**：分类 / 分期、任一测量维度、创面描述、照片同意和存放位置、下次评估日期。
- **必须 RN 确认**：分类 / 分期、测量值、医学术语替换、处理做法、整条记录。
- **禁止生成**：从描述或照片推断分期、分型或深度；"infected / signs of infection / healing well" 之类判断（除非 RN 原话）；敷料或治疗建议；Braden / Waterlow 等风险分数；愈合预测。
- 照片：MVP 不分析照片内容；只记录是否拍摄、同意和存放位置（TGA 红绿灯：照片分期 = 🔴）。
