Owner: Legal/Compliance · Status: Research draft · Last reviewed: 18/10/2026
> 运营参考，不是法律意见

# 州/领地临床执业与同意规则对照（State Clinical Practice Rules）— 影响住宿养老护理**文书记录**的部分

范围：NSW、VIC、QLD、WA、SA、TAS、ACT、NT。只覆盖会改变 careKind 文书模板、字段和审核流程的临床与同意规则：约束性措施同意、替代决策者、给药与 S8 记录、死亡与 VAD、强制报告、护士执业范围与投诉机构。隐私、保存期、护士配比、工资税等见 `state-by-state-comparison.md`；联邦框架见 `../aged-care-regulatory.md`；TGA 边界见 `../tga-samd-boundary.md`。

标记：✅ 已生效（读过官方原文或官方页面）· ⏳ 已通过、待生效或正在过渡 · ⚠️ 需核实（只有搜索摘要、二手资料、官方网站拒绝抓取，或没找到来源）
引用：`[L#]` 本地 PDF；`[S#]` `[M#]` `[D#]` `[R#]` `[N#]` `[C#]` 是在线来源，完整 URL 见文末“来源列表”。所有在线来源访问日期 **18/10/2026**。
研究方法说明：本轮多个州立法网站（legislation.nsw.gov.au、legislation.sa.gov.au）、opa.sa.gov.au、health.qld.gov.au、nursingmidwiferyboard.gov.au 拒绝自动抓取（403/Cloudflare）。依赖搜索摘要的结论一律标 ⚠️，正式引用前要人工打开核对。

---

## 0. 最重要的结论（先读这里）

1. **2026-12-01 是约束性措施同意的“悬崖日”。** Aged Care Act 2024 s163 的民事/刑事责任豁免只覆盖 **2026-12-01 之前**按 Rules 6-20 取得同意的约束性措施 [L1 s163(2)]。Rules 6-20(2) 的联邦五级 hierarchy 本身在 Compilation No. 10（01/08/2026）中**没有日落条款** [L2 s6-20]，但部门 2025 年的 FAQ 和咨询稿都把它描述为“延长到 2026-12-01”的过渡安排 [S3][S4]。**截至 18/10/2026 没找到再次延期的官方文件** ⚠️。
2. **约束性措施的同意权比普通医疗同意窄。** NSW 要 guardian/enduring guardian 持有专门的 restrictive practices function [S10]；VIC 的 guardian、attorney、medical treatment decision maker **不会自动**取得 RP 同意权 [S20]；QLD 普通 health care 委任不够，要 QCAT 授权或 personal matters 的 EPA attorney [S30][S31]；NT 的 health care decision maker **法律明文无权**同意约束 [S80 s29]。产品**不能**把“NOK / 医疗决策人”字段直接当作 RP 同意人。
3. **VIC 从 01/07/2026 起只有护士（RN/EN）或其他注册健康从业者可以给不自行用药的住户 administer 已配发的 S4、S8、S9 药物**，执法宽限期 29/09/2026 结束 [M21][M22]。PCW 给药流程在 VIC 必须拦截（RN 记录的紧急例外除外）。
4. **NSW 药品法 2026-11-05 换代**：Medicines, Poisons and Therapeutic Goods Act 2022 + Regulation 2026 取代 1966 Act / 2008 Regulation；S8 register 改为 witness countersign、每 3 个月盘点，电子 drug register 要符合新的强制 Electronic Drug Register Standards ⏳ [M10][M11][M14][M16]。
5. **没有任何州因为“住在养老院”就把死亡定为 reportable death**；QLD 甚至明文把 aged care facility 排除在 “death in care” 之外 [D30 s9]。但**跌倒/骨折后死亡**在多数州属于“accident or injury”导致的 reportable death（QLD 例：股骨颈骨折后肺炎）[D30 s8][D20 s4]；NSW 对 72 岁以上的意外跌倒有有限例外 ⚠️ [D10]。
6. **NT 在 2026 年通过 VAD 法**（Act No. 23 of 2026，2026-09-03 assent），全澳 8 个辖区都有 VAD 法，但 NT 尚未生效 ⏳ [D81][D82]。QLD、NSW、ACT（以及据报 SA）对不参与 VAD 的养老机构有明确的“不得阻碍、允许访问、公开声明”义务 [D32][D12][D72]。
7. **全澳没有一般性的 elder abuse 州级强制报告义务**（"none found"，不是“已确认不存在”）⚠️；住宿养老的法定报告义务是联邦 SIRS（provider 义务）[R1][R15]。SA 的 Ageing and Adult Safeguarding 修正法 2026-07-01 起给 ASU 增加信息索取权，可能触及 provider 记录 ⏳ [R8][R9]。

---

## 1. 约束性措施（restrictive practices）知情同意与替代决策者

### 1.1 联邦基线（Aged Care Act 2024 + Aged Care Rules 2025）

| 规则 | 内容 | 状态 | 来源 |
|---|---|---|---|
| 最后手段 | 只能为防止伤害作为 last resort；先用替代策略并写入 BSP；必要、相称、最少限制、最短时间；须有本人或 RPSDM 的知情同意（含 duration、frequency、intended outcome）；同时须符合州/领地法律 | ✅ | [L2 s162-15(1)] |
| 非化学约束 | approved health practitioner（medical practitioner、NP 或 **RN**）且对住户有 day-to-day knowledge，评估风险和必要性，评估写入 BSP | ✅ | [L2 s5-5 定义、s162-20] |
| 化学约束 | provider 须确认 medical practitioner 或 NP 已评估、开处方并取得处方同意；BSP 记录评估、决定、行为、理由、provider 向医生提供的信息、处方细节（药名、剂量、何时用）等 9 项 | ✅ | [L2 s162-25] |
| 使用中监测 | 监测痛苦/伤害、副作用、情绪行为、wellbeing、独立功能、ADL；定期监测、复查并**记录**必要性；化学约束须把效果反馈给处方者 | ✅ | [L2 s162-30] |
| 紧急使用 | 紧急期间可豁免同意等要求；事后尽快通知 RPSDM，并在 BSP 记录行为、替代策略、理由、后续照护、**已通知 RPSDM 的记录** | ✅ | [L2 s162-35] |
| BSP 必须写 | 无能力时：适用 6-20(1) 还是 6-20(2) 表中哪一项及**理由**、RPSDM 姓名、与 RPSDM 的协商、**同意记录**；每次使用：开始时间、每次时长、频率、结果、是否符合同意、参与人员、外部支持、监测与复查结果 | ✅ | [L2 s162-55, 162-60, 162-65] |
| BSP 复查与协商 | 定期复查并在情况变化后尽快修订；须咨询本人/supporter（或州法下的决策人）、相关健康从业者、做评估的 practitioner 和 RPSDM；提供可访问格式 | ✅ | [L2 s162-70, 162-75] |
| RP nominee | provider 防止胁迫；协助通知被提名人、给副本、取得书面同意；**记录**提名、是否同意、是否撤回 | ✅ | [L2 s6-15, s162-40] |
| RPSDM 定义 | 6-20(1)：州/领地法律委任的人或机构，或依州法有效的书面委任 | ✅ | [L2 s6-20(1)] |
| 联邦 hierarchy | 6-20(2)：只在州法下无委任，且州法无明确机制或申请严重延迟时适用。顺序：① RP nominee → ② 伴侣（亲密持续关系、书面同意、有能力）→ ③ 入住前的无偿照护者亲友（多人取最年长）→ ④ 其他亲友（最年长）→ ⑤ medical treatment authority | ✅ | [L2 s6-20(2)–(4)] |
| 豁免期限 | s163：provider 及使用人员的民事/刑事豁免只覆盖 **2026-12-01 之前**的使用 | ✅（期限仍是 2026-12-01）| [L1 s163(2)]；[S1] |
| 2026-12-01 后 | 部门 FAQ（2025-07）称安排“extended until 1 December 2026”；2025-02 咨询稿注明 6-20(2) 与 6-15 届时废止；Compilation No. 10 正文无日落；部门 RP 页面（2026-08-03 更新）未写截止日；**未找到延期的 Act/Rules/部长声明** | ⚠️ | [S3][S4][S1] |
| 部门对记录的要求 | 记录潜在 RPSDM 的书面同意、能力与意愿；同意或拒绝写入 **BSP 和 care and services plan**；情况、频率、时长、复查监测、已尝试替代策略、已提供 OPAN 等倡导联系方式 | ✅ | [S2] |

### 1.2 八州对照

| 州 | 州法/机制 | RP 同意人（住户无能力时） | 记录要点 | 状态 |
|---|---|---|---|---|
| NSW | *Guardianship Act 1987* + *Guardianship Regulation 2026*（sl-2026-0437）| NCAT 委任的 guardian 或 enduring guardian，**必须持有 restrictive practices function**；medical/dental function 不覆盖化学约束。Regulation 2026 Form 1 新增第 5 项职能 (e)“consent to, or withhold consent to, the use of a restrictive practice” | 记录委任文件和其中是否勾选 RP 职能；2026 年之前的旧委任可能没有该职能 | ✅ NCAT 立场 [S10][S14]；⚠️ Regulation 2026 生效日 01/09/2026 与旧委任延续（s20）只见二手资料 [S11][S12]；⚠️“2026-12 起 NSW 新框架”只见律所博客，未找到官方来源 |
| VIC | *Aged Care Restrictive Practices Substitute Decision-maker Act 2024* (Vic) | Tier 1 住户提名的 RPSDM → Tier 2 temporary SDM（配偶/伴侣 → 主要照护者 → 最年长成年子女 → 年长的父/母 → 最年长兄弟姐妹；须成年、亲密持续关系、可联系且愿意）→ Tier 3 VCAT 委任 → Tier 4 VCAT 本身。guardian、attorney、MTDM **不自动**有权 | Tier 2 在该项决定作出后即结束，**新的或变更的 RP 要重新跑层级**；无法定表格，部门“鼓励”在 BSP 或管理系统记录决策人；provider 员工和 BSP 作者不能当 SDM | ✅ [S20][S21][S22][S23]（适用住宿养老自 01/11/2025，见 [S20]；旧文档写 2025-07-01，⚠️ 两个日期需人工核对）|
| QLD | *Guardianship and Administration Act 2000*（s12 personal matter guardian）；QCAT Practice Direction No. 2 of 2026（20/07/2026 起）| QCAT 委任、授权 RP 的 guardian；Public Guardian 只在 QCAT 明确授权时可同意；PD 第 16 段：personal matters 的 EPA attorney 若可联系，可以同意或拒绝（引 *EJ* [2026] QCAT 175）| QCAT 申请要附：能力报告、现行 BSP、显示时长/频率/预期结果的临床记录、非正式决策人、环境约束理由、化学约束处方者证明、enduring 文件 → 这些都应能从记录中导出 | ✅ [S30][S31][S32]；⚠️ QLD Health interim consent 指引（1/12/2022–1/12/2026）网页 403 [S33] |
| WA | *Guardianship and Administration Act 1990*；OPA Position Statement 2（2026）| 拥有 plenary 或含 RP 的有限授权的 guardian / enduring guardian；provider 须 sight 委任令或 enduring power；Public Advocate 作为最后手段的 guardian | 记录已查看的委任文件和授权范围 | ✅ [S40][S41]；⏳ LRC Project 114 建议新法引入 "personal representatives"，未见法案 [S42] |
| SA | *Advance Care Directives Act 2013*；*Guardianship and Administration Act 1993*；*Statutes Amendment (Health and Wellbeing) Act 2025* 新增 Part 5A | OPA SA 指引：ACD 下的 SDM、guardian 或 Person Responsible（仅搜索摘要）；ACD Act s10(g) 要求 SDM 尽量不限制基本权利。Part 5A 是**医院出院转入养老院的安置/拘留**路径，不是 RP 同意 | 如适用 Part 5A，记录 SDM 的安置/运送/居住决定 | ⚠️ OPA SA 页面 403 [S50]；✅ ACD Act [S51]；✅ Part 5A 内容 / ⚠️ 生效日 09/07/2026 未确认 [S52]；⚠️ “physical restraint 须 SACAT 授权（s32）”本轮未核实 |
| TAS | *Guardianship and Administration Act 1995*（TASCAT）| TASCAT 可以委任有权批准 RP 的 guardian，**包括 aged care**；残障 RP 已转给 Senior Practitioner（*Disability Rights, Inclusion and Safeguarding Act 2024*）| 记录 TASCAT 委任令中的 RP 权限 | ✅ [S60][S61]；⏳ TLRI 正在复审 1995 Act，未见 2026 修法 |
| ACT | *Guardianship and Management of Property Act 1991*（ACAT）| ACAT 决定是否授权 guardian 同意 RP（*Ben* [2020] ACAT 82、*Evelyn* [2021] ACAT 126、*Re Frieda* [2022] ACAT 27）| 记录 ACAT 委任令中的 RP 授权 | ✅ 判例 [S70]；⚠️ 没找到现行 ACT 养老 RP 指引或 2026 立法 |
| NT | *Health Care Decision Making Act 2023*；*Guardianship of Adults Act 2016* | health care decision maker **无权**同意 seclusion 或化学、机械、身体、环境约束（s29，少量例外）；guardian 在某些情况下可能有 RP 权限（2021 NT Full Court 判决）| 记录同意来源是 guardian 而非 HCDM | ✅ s29 [S80]；⚠️ guardian 权限只见 PGT 年报 [S81] |

### 1.3 对 careKind 的设计启示
- **同意来源是“法律判断”，AI 不起草。** RPSDM 是谁、适用 6-20(1) 还是 6-20(2) 哪一项、为什么适用（162-55(f)）——这些是 provider 的法律/临床决定。careKind 只提供**结构化字段由 RN/经理手动选择和填写**，AI 不推断、不预填、不建议。
- **字段按辖区切换，不硬编码联邦表。** 字段：辖区；同意来源类型（VIC Tier 1–4 / NSW guardian 或 enduring guardian 的 RP function / QLD QCAT guardian 或 personal matters EPA attorney / WA guardian 授权范围 / SA SDM / TAS·ACT 法庭委任 / 联邦 6-20(2) item 1–5）；委任文件引用和“已查看”勾选；同意日期、范围（duration、frequency、intended outcome）；有效期；BSP 链接；care plan 链接。
- **2026-12-01 之后**：如未延期，模板应能对“联邦 hierarchy item 2–5”显示“过渡安排可能已结束，请按机构政策核对”提示（流程提示，不是法律判断）。这个开关要可配置，不写死日期。
- **VIC Tier 2 每次决定重新确认**：每个新的或变更的 RP 都要重新记录 temporary SDM，不能沿用。
- **AI 可以做的**：把护士口述的“使用经过”整理进 162-60 的事实字段（开始时间、时长、频率、观察到的行为、尝试过的替代策略、参与人员、监测观察）；缺字段时**标黄提示**。**不能做的**：建议是否使用约束、推荐药物或剂量、判断“必要性”或“相称性”（162-20/162-25 的评估必须由 approved health practitioner/医生/NP 作出）——这会越过 TGA 边界（治疗建议）和执业范围。
- **必须 RN 签署**：162-20 评估（RN 也是 approved health practitioner）、紧急使用后的 BSP 记录、监测与复查记录。化学约束的评估和处方只能由医生/NP。
- **SIRS 联动**：inappropriate use of restrictive practices 是 reportable incident 类别；不符合同意范围的使用（162-60(a)(v) “否”）应提示护士按机构 SIRS 流程评估（只做流程提示）。

---

## 2. 监护 / enduring 委任 / 预立指示：名称、法律依据与记录

### 2.1 联邦基线
- Aged Care Act / Rules 不创设医疗决策人，只引用州/领地法律（"a person or body who, under the law of the State or Territory … can make decisions about that care"）[L2 s162-75(1)(b)]；care and services plan 须反映需求、目标和偏好 [L2 s148-80，见 `law-library/index.md` 摘录]。
- 联邦唯一自建的角色是 **restrictive practices nominee**（6-15）[L2]。
- 因此 care record 中“决策人”字段的**合法性**完全取决于州法，产品只能记录“文件名称 + 法律依据 + 已查看 + 范围”。

### 2.2 八州对照

| 州 | 预立指示 | 持久医疗/个人事务委任 | 财务委任 | 法定医疗同意顺序（无指示、无委任时）| 状态与来源 |
|---|---|---|---|---|---|
| NSW | Advance care directive（普通法，无法定表格）| Appointment of Enduring Guardian（Guardianship Act 1987；Regulation 2026 Form 1，含新 RP 职能）| Enduring Power of Attorney（仅财务）| s33A **person responsible**：有医疗职能的 guardian → 配偶/伴侣（亲密持续关系）→ 无偿照护者（含入住前的照护者）→ 亲密朋友或亲属 | ✅ [S13]；⚠️ Form 1 现行文本只见草案 [S12] |
| VIC | Advance care directive（instructional / values directive）| Appointment of Medical Treatment Decision Maker（*Medical Treatment Planning and Decisions Act 2016*）；support person | EPA（*Powers of Attorney Act 2014*）| MTDM 顺序：委任的 MTDM → VCAT guardian → 配偶/同居伴侣 → 主要无偿照护者 → 最年长成年子女 → 最年长的父/母 → 最年长成年兄弟姐妹 | ✅ [S24][S25] |
| QLD | Advance Health Directive | EPA（personal/health matters，*Powers of Attorney Act 1998*）| EPA（financial）| AHD → 法庭 guardian → enduring attorney → statutory health attorney（配偶 → 无偿照护者 → 亲密朋友或亲属 → Public Guardian）| ✅ [S34][S35] |
| WA | Advance Health Directive | Enduring Power of Guardianship | EPA | AHD → enduring guardian → guardian → s110ZD person responsible：配偶/de facto → 成年子女（同等顺位）→ 父母 → 兄弟姐妹 → 主要无偿照护者 → 其他亲近的人 → SAT | ✅ [S43][S44] |
| SA | Advance Care Directive（自 01/07/2014 单一法定表格；可指定 SDM）| ACD 中的 substitute decision-maker | EPA | ACD SDM → guardian → *Consent to Medical Treatment and Palliative Care Act 1995* 的 person responsible（法定亲属 → 成年朋友 → 照看日常照护的成年人）| ✅ [S51][S53] |
| TAS | Advance Care Directive（GAA Part 5A，2022-11-21 起；须用卫生部批准表格 2024-09 版，2 名见证人，可在 TASCAT 登记）| Enduring guardian（TASCAT 表格；不能同意 "special treatment"）| EPA | person responsible：guardian → 配偶 → 无偿照护者 → 亲密朋友或亲属 | ✅ ACD [S62][S63]；⚠️ person responsible 顺序本轮未重新核对 [S64] |
| ACT | Health Direction（*Medical Treatment (Health Directions) Act 2006*）| EPA（含 health care matters，*Powers of Attorney Act 2006*）| EPA | health attorney（*Guardianship and Management of Property Act 1991*）由主治医生当时确定；Public Trustee and Guardian 兜底 | ✅ [S71][S72][S73]；⚠️ health attorney 顺序（伴侣 → 照护者 → 亲属/朋友）未核对 Act 原文 |
| NT | Advance Personal Plan（*Advance Personal Planning Act 2013*）| APP 中指定的 decision maker | APP | *Health Care Decision Making Act 2023* s13：APP 指定人 → 有健康照护权限的 guardian → **文化上适当的亲属（Aboriginal 习惯法）**→ 配偶/de facto → 无偿照护者 → 子女 → 父母 → 兄弟姐妹 → 朋友 | ✅ [S82][S83][S80]；⚠️ HCDMA 生效日（PGT 年报写 01/07/2024）需核对 |

### 2.3 对 careKind 的设计启示
- **决策人记录是“文件登记”，不是自由文本。** 字段：文件类型（按辖区下拉，用上表官方名称）、法律依据、签署日期、范围/限制（尤其是否含 RP 职能）、文件存放位置（provider 系统）、已查看人与日期。**RN 或机构指定人员确认**；AI 只能把口述中提到的名称放进“待核对”区域。
- **不要用一个“NOK”字段代替法定顺序。** 法定顺序各州不同（WA 子女同等顺位；NT 有文化亲属顺位；VIC 有固定年长顺序）。产品不做“自动推导谁是 person responsible”（这属于决定代替，也触发 2026-12-10 起 APP 1.7 自动化决策透明度问题，见 `rules/legal-reference-map.md`）。
- **预立指示内容不由 AI 改写。** ACD/AHD 中的拒绝治疗等指示是住户本人意愿，只照录引用，不总结、不“解释”；交接摘要中最多提示“有 ACD，见文件”。
- 文书模板参考：州表格大多是公开政府文件，但仍**只作字段参考**，不要原样嵌入产品（版权说明见 `paperwork-templates/index.md`）。

---

## 3. 药物：谁可以给药、S8 记录、电子 drug register

### 3.1 联邦基线
| 内容 | 状态 | 来源 |
|---|---|---|
| Standard 5 Outcome 5.3：给药前药物须已为该住户开具处方；药物须由 **registered health practitioners** 适当、安全地 administered、监测和复查；药物不良事件须监测并报告 | ✅ | [L2 s15-30(5)–(7)]；[M3][M4] |
| ⚠️ 解读：5.3(6)(b) 措辞与多州允许 PCW 协助/给药的州法如何衔接，ACQSC 指引仍在更新 | ⚠️ | [M3] |
| *Guiding principles for medication management in residential aged care facilities*（2022 版，15 条原则，配套 MAC 用户指南）| ✅ | [M1][M2] |
| eNRMC：**不是强制**，纸质 NRMC 仍可用；e-prescribing conformant eNRMC 过渡期延长到 **31/03/2027**（原 31/12/2026，2026-09-22 公告）；01/04/2027 起非 conformant 系统中的医嘱需另开 PBS 处方 | ⏳ | [M5][M6][M7] |
| Aged Care On-site Pharmacist（ACOP）：自愿参加，自 01/07/2024 资助 | ✅；⚠️ 与 eNRMC 脱钩只见二手资料 | [M8] |
| 质量指标：medication management（polypharmacy、antipsychotic）| ✅ | [L2 s166-140] |

### 3.2 八州对照

| 州 | 法律 | 谁可以给药（住宿养老）| S8 register | 电子 register | 保存期 | 来源 |
|---|---|---|---|---|---|---|
| NSW | ✅ *Poisons and Therapeutic Goods Act 1966* + *Regulation 2008*；⏳ **05/11/2026 起** *Medicines, Poisons and Therapeutic Goods Act 2022* + *Regulation 2026* | 住户本人已配发、已贴标签的药：不规定由谁 administer，"any agent or carer" 按机构治理政策；urgent-use stock 只有 RN（按医嘱）或处方者可取用；urgent-use S8 须有 witness 全程在场（RN/EN/AIN 均可）| 每个品牌规格一页，当天记录，DON/设施经理负责，记录时有 witness；现行每年 3 月、9 月盘点；⏳ 新法下由 "authorised person" 保管、witness **countersign**、**每 3 个月**盘点 | ✅ 允许（2021 dual-signature framework）；⏳ 新法下须符合强制 *Electronic Drug Register Standards*（2026-09-08 发布，指南待发）| ≥2 年（自最后一条记录）| [M10]–[M16] |
| NSW S4D | — | — | 不要求病区 register，除非机构自愿 | — | — | [M13] |
| VIC | ✅ *Drugs, Poisons and Controlled Substances Act 1981* + *Regulations 2017* | ✅ **01/07/2026 起**：不自行用药的住户，其已配发 S4、S8、S9 和 drugs of dependence **只能由护士（RN/EN）或其他注册健康从业者 administer**（不论是否在 DAA 中）；宽限期 29/09/2026 结束。例外：护士不可得的不可预见事件，由管理 RN 决定该剂不能等并授权，**RN 须记录日期、简述和覆盖时段**。S2/S3 和非处方药不受影响；PCA 不能接触未配发的 S4/S8 | S8 imprest stock 和未放入 DAA 的 S8 须有 register（Reg 110）；已放入防篡改 DAA 的 S8 不需要；装订本、页码连续；所有药物都要有给药记录（Reg 107、108）| ⚠️ 未在官方页面找到 | ⚠️ | [M20][M21][M22][M23] |
| QLD | ✅ *Medicines and Poisons Act 2019* + *Medicines and Poisons (Medicines) Regulation 2021* | RN 可按处方给 S4/S8（Sch 7 Pt 3 s11）；EN 在医生/牙医/助产士/RN 监督下可给任何药（Pt 4 s19）；有 notation 的 EN 限 S2/S3（Pt 5 s21）；Regulation 无 PCW/AIN 授权表，PCW 可能依 Act 的 agent/carer 条款（ss34、51）⚠️ | medicine register 由 safe/store manager 保管（s206）；24 小时内记录（s211）；授权用户签名（s212）；DAA 中的 S8 免（s203(2)）；至少每月对账（s217）；销毁须见证（s147）| ✅ **明确允许**（s208）：每个用户安全身份、助理录入保持 "pending" 直到确认、确认后不可删除、可随时出纸质报告 | 最后记录后 2 年（s224）| [M30] |
| WA | ✅ *Medicines and Poisons Act 2014* + *Regulations 2016* | ⚠️ 未找到全州规则；WACHS 程序（机构政策，不是法律）：非护士只能在护士指示下协助自行用药，口服 restricted S4/S8 只能从 DAA 给 | 须用卫生部批准的 register（r144），保管人签名；纸质 HA14；S8 在养老院药物表上的医嘱须通过 **approved electronic prescribing system**（r14(2)）| ✅ **只允许批准名单内**：DiamondCare（Modeus）、StrongCare（StrongRoomAI）| **≥5 年** | [M40][M41][M42][M43]；⚠️ reprint 版本日期不清 |
| SA | *Controlled Substances Act 1984* + *Controlled Substances (Poisons) Regulations 2011* | ⚠️ 未核实 | ⚠️ 二手摘要：health service facility 含 nursing homes；经理须保持 drug of dependence 库存记录；交班清点；给药须见证并记录见证人姓名签名 | ⚠️ | 2 年（reg 38，药剂师页面）| [M50]；立法网站 403 |
| TAS | ✅ *Poisons Act 1971* + *Poisons Regulations 2018* | ✅ Reg 133：住宿养老员工经负责人授权、在 RN 一般监督或指示下、持国家认证给药模块且保持能力、按 Secretary 指南，可以 administer 或 make available S2/3/4 和 "specified narcotic substance"（2021 指南：口服、外用，S8 只限 buprenorphine 贴剂 ⚠️ 指南链接已失效）| 按 Secretary 批准格式的 narcotic substances register（r18）；墨水记录 48 小时内、病区 register 24 小时内（r33）| ⚠️ | ≥2 年（r19）| [M60][M61] |
| ACT | ✅ *Medicines, Poisons and Therapeutic Goods Act 2008* + *Regulation 2008* | ✅ s361："assistant" 可按标签指示、应住户请求（或住户无能力时 guardian 授权）给住户本人已供应的药；无药房设施的 DON 可持有限急救库存 | 无药房设施由负责人保管 controlled medicines register（s540 item 9），每个剂型规格一页；给药须见证（Act s53），见证人含护士，EN 可见证（s544）；DAA 中的 S8 可不写住户名（s543(2)）| ✅ **明确允许**（ss542(2)、546(2)）| ⚠️ | [M70] |
| NT | ✅ *Medicines, Poisons and Therapeutic Goods Act 2012* + *Regulations 2014* | 养老院雇用的护士可按 supply order 给 S4/S8；⚠️ PCW 规则未找到 | 每个设施一本 S8 register，由 nurse in charge 保管（r50）；DAA 中的 S8 免；供应和给药须见证（Act s100；r18）| ✅ 允许（每个剂型规格独立记录，电子修订通过关联文件）| 最后记录后 ≥2 年（r61）| [M80]；⚠️ PDF 版本日期 |

### 3.3 对 careKind 的设计启示
- **careKind 不做 drug register、不做给药核对、不做 eNRMC。** 用药核对、过敏冲突、剂量判断在 TGA 红区（`../tga-samd-boundary.md`）；S8 register 在 WA 只允许批准系统，在 NSW 新法下有强制标准。产品定位应写明“不替代 eNRMC / drug register”。
- **progress note 里提到给药时**：AI 只照录护士说的事实（药名、时间、住户反应、拒药），**不补全剂量、不推断药名、不纠正“看起来不对”的剂量**；缺信息标黄让护士补。PRN 使用后的效果观察可以整理进记录，但“是否需要再给”不由 AI 说。
- **VIC 角色门控**：在 VIC 机构，PCW 起草的记录如果描述 PCW 本人 administer 了 S4/S8/S9，产品应提示“VIC 01/07/2026 起须护士给药；如属紧急例外，须 RN 记录日期、原因、时段”（流程提示）。紧急例外的记录必须 **RN 签署**。
- **化学约束联动**：PRN 精神类药物用于行为管理时可能构成 chemical restraint（见 §1），模板应提示护士核对 BSP，不由 AI 判断是否属于化学约束。
- **NSW 05/11/2026 过渡**：客户如果问“能不能把 careKind 的记录当 S8 register”，答案是不能；NSW Electronic Drug Register Standards 适用于 register 系统本身。

---

## 4. 死亡：reportable death、expected death、死亡证明、VAD

### 4.1 联邦基线
- SIRS：与照护相关的 **unexpected death** 是 Priority 1 reportable incident（24 小时内）[`law-library/index.md` 1a；L2 s165A-25]。Rules 定义 unexpected death 包括：provider 未采取合理步骤防止死亡，或死亡由所提供服务或**未提供服务**导致 [L2 s16-5(8)，对应 Act s16(1)(d)] ✅。
- end-of-life care 定义：terminal phase，death imminent，预计 3 个月内 [L2 s5-5] ✅。
- Coroner 报告与 SIRS 报告是**两套独立义务**：一个是州法（通常由医生/警察报告），一个是联邦 provider 义务。

### 4.2 Coroner：八州对照

| 州 | Coroners Act | Reportable death（与养老相关的部分）| 住养老院本身是否触发 | 报告时限 / 对象 | 来源 |
|---|---|---|---|---|---|
| NSW | *Coroners Act 2009* | s6：violent/unnatural、突然且原因不明、可疑或异常、非医疗程序合理预期结果；s23/s24 另列 custody、children in care、残障居住照护、assisted boarding houses。**例外 s38(2)**：72 岁以上、意外伤害、归因于年龄、非他人造成、亲属无异议时，医生仍可出证；Coroners Court 提醒未遵循跌倒管理计划时可能不适用 | 否 | 明知不报为罪；警察填 P79A；⚠️ s35 时限原文未核 | ⚠️ 只核对了 Coroners Court 页面 [D10] |
| VIC | *Coroners Act 2008*（authorised v045，2026-09-30）| s4(2)：unexpected、unnatural、violent，或**直接或间接由 accident or injury 导致**；医生预计不到的医疗程序死亡；"person placed in custody or care"（不含 aged care；NDIS SDA 居民是规定类别）；无 BDM s37 证明 | 否 | 在场或事后的医生 "without delay" 报 coroner/VIFM（s10）；其他人认为未报的也须 without delay（s12）；CA&E 1300 309 519 | ✅ [D20][D21] |
| QLD | *Coroners Act 2003* | s8(3)：violent/unnatural、可疑、health care related、不能出死亡证明、death in care、death in custody；s8(6) 例：股骨颈骨折数月后肺炎死亡属 unnatural；**s9 death in care 明文排除 aged care facility** | 否（明文排除）| s7 "immediately" 报警察或 coroner，可电邮/传真 | ✅ [D30] |
| WA | *Coroners Act 1996* | s3：unexpected、unnatural、violent，或直接/间接由 injury 导致；麻醉相关；"person held in care"（不含 aged care）；BDM s44 未出证 | 否 | s17 "immediately" 报 coroner 或警察 | ✅（⚠️ 需确认为现行合并版）[D40] |
| SA | *Coroners Act 2003* | unexpected、unnatural、unusual、violent 或原因不明；某些医疗程序中/后 24 小时内或出院 24 小时内；child protection、residential care、guardianship、mental health 法下的 protected persons；对无能力者给出替代同意后的死亡（⚠️ 范围）；无证明 | ⚠️ "residential care" 是否含养老院未核实 | "immediately" 报警察或 State Coroner | ⚠️ SA Law Handbook（法律援助委员会）[D50]，立法网站 403 |
| TAS | *Coroners Act 1995* | s3：unexpected、unnatural、violent 或由 accident/injury 导致；未预期的医疗程序死亡；原因不明；"person held in care"（仅 child protection/mental health）；工作场所死亡 | 否（Act 无 aged care 字样）| s19 "as soon as possible" 报 coroner 或警察 | ✅ [D60] |
| ACT | *Coroners Act 1997*（R51，2026-09-05）| s13：violent/unnatural 且情况不明、可疑、程序相关、**无医生或 NP 出具的死因证明**、死前 6 个月无医生或 NP 诊视、意外直接导致、death in care/custody（s3BB 不含 aged care）；s19B 例子点名 aged care facility 是 coroner 可调取医疗记录的持有人 | 否 | s77 "as soon as practicable" 报 coroner 或警察 | ✅ [D70] |
| NT | *Coroners Act 1993* | s12：unexpected、unnatural、violent 或由 accident/injury 导致；麻醉相关；"person held in care or custody"（不含 aged care）；身份不明 | 否 | "as soon as possible" 报 coroner 或警察 | ✅ [D80] |

### 4.3 Expected death：死亡确认（verification）与死因证明（MCCD）

| 州 | RN 能否确认死亡（verification / life extinct）| 记录内容 | 谁出具死因证明 | 来源 |
|---|---|---|---|---|
| NSW | ✅ 无医生时 RN、RM、paramedic 可确认，观察 ≥5 分钟，用全州 Verification of Death 表；reportable death 不用此表（用 Form A）；**该 PD 只约束 NSW Health 机构**，对私营养老是参考 | 表格字段 | 医生（NSW Health 政策）| [D11] |
| VIC | ✅ RN、RM、paramedic 可确认（自愿、限于受雇范围）；最低标准包括 2 分钟无心音、2 分钟无呼吸音（2026-06-01 指南）| 确认人姓名职称、所用标准、日期时间地点，写入健康记录 | 只能医生（BDM Act 1996 s37），48 小时内通知 BDM | [D22] |
| QLD | ⚠️ QLD Health "care after death" 文件：医生或 RN 用 Life Extinct 表确认 | ⚠️ | 医生 | [D31]（403）|
| WA | ⚠️ 未找到 | — | 医生（BDM s44）⚠️ | — |
| SA | ⚠️ 未找到 | — | 医生 ⚠️ | — |
| TAS | ⚠️ 未核对 | — | 医生 ⚠️ | — |
| ACT | ⚠️ 未核对 | — | ✅ **医生或经认证的 NP**（负责其照护、48 小时内、无需报 coroner；法案 2026-02-26 通过，⚠️ 具体生效日）| [D70][D71] |
| NT | ⚠️ 未核对 | — | 医生 ⚠️ | — |

### 4.4 Voluntary Assisted Dying：八州对照

| 州 | 法律 / 生效 | 对机构（含养老院）的义务 | 对护士 / 从业者 | 来源 |
|---|---|---|---|---|
| NSW | ✅ *Voluntary Assisted Dying Act 2022*，28/11/2023 | 不参与的私营机构须：**公开声明**不提供 VAD；不得阻碍获取信息；允许执业者和 Care Navigator 合理访问；转院只能在无严重伤害、不影响访问、不延长痛苦、无经济损失时进行（ss93–97、102–106）| 有异议的健康工作者不得阻碍；有异议的医生须立即拒绝首次请求；First Request、Notification of Death 等表格由医生填 | [D12][D13]；⚠️ 2025 年允许机构 opt-out 的修正案被否决（二手）|
| VIC | ✅ *Voluntary Assisted Dying Act 2017*，19/06/2019；⏳ 修正法 2025-11-18 通过，**19/04/2027** 起 | 现行法对机构无访问义务；⚠️ 修正法是否增加机构义务未核对终文 | ⏳ 修正后取消 gag clause；有异议的医生/NP 至少须告知可找其他执业者并提供 Statewide Care Navigator 联系方式；NP 可作 administering practitioner | [D23][D24] |
| QLD | ✅ *Voluntary Assisted Dying Act 2021*，01/01/2023（⚠️ 日期未重抓）| Part 6 Div 2（ss85–98）适用于 "relevant entities"（含住宿养老）：不得阻碍信息（s90）；**永久住户**（含 Aged Care Act security of tenure，s89）须允许请求、评估、给药的合理访问（ss92–97），非永久住户可转院；不参与的须公开（s98）| s84：有异议者须告知他人可帮忙并给出执业者或服务（如 QVAD-Support）的详情 | [D32] |
| WA | ✅ *Voluntary Assisted Dying Act 2019*，01/07/2021（⚠️ 日期未重抓）| WA Health 指南：机构不必提供、可禁止；FAQ 建议机构（含养老）建立处理请求的制度 | 有异议的医生须立即告知、给资料手册、2 个工作日内把 First Request Form 交 Board | [D41][D42] |
| SA | ✅ *Voluntary Assisted Dying Act 2021*，31/01/2023 | SA Health：health service establishments（含养老）须回应请求、告知不允许在本机构进行、有转院安排；⚠️ 公开声明和允许访问义务只见二手资料，条款号未核 | 机构经理不能当翻译，照护员工不能当见证人 | [D51] |
| TAS | ✅ *End-of-Life Choices (Voluntary Assisted Dying) Act 2021*，23/10/2022 | 未找到机构专门义务；不支持 VAD 的机构中员工仍须履行最低义务；2026 年独立复审进行中 | RN 等注册从业者有“最低义务”（有单独 fact sheet）| [D61] |
| ACT | ✅ *Voluntary Assisted Dying Act 2024*，03/11/2025 | 机构须有可访问的 VAD 政策（是否提供、如何履行义务、不撤除照护、Care Navigator 联系方式）；允许住户在本机构获取信息、完成 VAD 步骤并维持同等照护；允许 "relevant person" 合理访问或提供转院；未安排批准的转院须书面向 VAD Oversight Board 说明理由；违反可能构成犯罪 | 从业者须在 2 个工作日内给出 Care Navigator 联系方式 | [D72] |
| NT | ⏳ *Rights of the Terminally Ill* Act（Act No. 23 of 2026，2026-08-27 通过、2026-09-03 assent）；⚠️ 生效日未见官方；据报 18 个月准备期、2028 年可用 | ⚠️ 未核实 | ⚠️ 据媒体保留 gag clause 和 12 个月预后限制 | [D81][D82] |
| 全部 | VIC s4(3)、QLD s8(5)、ACT s13(2) 明文把 VAD 死亡排除出 reportable death；SA ⚠️（二手）| | | [D20][D30][D70] |

### 4.5 对 careKind 的设计启示
- **AI 永远不判断“是否 reportable death”或“是否 expected”。** 这是医生/coroner 的判断。模板只提供：死亡时间、发现人、发现情况、最后一次观察、在场人员、已通知（医生、家属、经理）的时间——都是事实字段。
- **“跌倒后死亡”提示**：如果近期记录中有跌倒/骨折事件，死亡记录模板可显示“该住户有近期跌倒/受伤记录，请按机构流程确认是否需报告 coroner 和 SIRS”——这只是基于已录入事实的流程提示（🟡 需要边界审查，因为它涉及“从历史记录中汇总”，见 `../tga-samd-boundary.md`）。
- **Verification of death 记录必须 RN 签署**（VIC/NSW 指南明确 RN 可做，记录要有确认人姓名、职称、标准、时间地点）。AI 可以把口述整理到这些字段，但**不能替护士填写“已满足某标准”**（如 2 分钟无心音）——只能照录护士明确说出的观察。
- **MCCD 不在 careKind 范围**（医生；ACT 也可由 NP）。
- **VAD 记录高度敏感**：AI 不起草 VAD 请求、评估或资格判断；机构的不参与声明、Care Navigator 信息属于机构政策内容。护士记录住户提出 VAD 相关询问时，模板只照录原话并提示“按机构 VAD 政策处理”。conscientious objection 的记录（谁、何时、已提供哪些信息/联系方式）是**从业者本人的记录**，应由本人签署，AI 不代写“已转介”之类没说过的内容。
- **QLD/ACT/NSW 客户**：机构有法定访问义务，记录中“家属/外部执业者到访”不能被 AI 改写或省略。

---

## 5. 强制报告：州级 elder abuse 与联邦 SIRS

### 5.1 联邦基线
- **SIRS**（Aged Care Act 2024 s16、Rules Part 10 / 165A）：provider 对 8 类 reportable incidents 负报告义务；Priority 1 在 24 小时内，Priority 2 在 30 天内 ✅ [`law-library/index.md` 1a；L2；R15]。
- **Ahpra mandatory notifications**（Health Practitioner Regulation National Law ss140–141）：impairment、执业时醉酒、严重偏离专业标准、sexual misconduct；治疗中的执业者只在“substantial risk of harm”时通报；**WA 豁免治疗中的执业者**（s141(4)(ca)），非治疗执业者和雇主仍有义务 ✅ [R14]；QLD 目前无治疗执业者豁免 ⚠️（只见二手资料）。

### 5.2 八州对照

| 州 | 州级 elder abuse 强制报告 | 州机构 | 与 SIRS 的关系 | 状态 / 来源 |
|---|---|---|---|---|
| NSW | 未找到 | Ageing and Disability Commission（*Ageing and Disability Commissioner Act 2019*）| 不管养老服务（有联邦质量机制），可/须转 ACQSC；2024 复审建议改为酌情转介，是否立法未确认 | ⏳ [R3]；另见 `state-by-state-comparison.md` §3.5 |
| VIC | 未找到 | Seniors Rights Victoria（倡导与热线）| 走 SIRS | ⚠️ |
| QLD | 未找到；OHO 2025 年提交称“目前只有联邦 approved providers 有强制报告（SIRS）”，并建议 QLD 考虑扩展 | Public Advocate；elder abuse 议会调查 2025-12-12 报告（16 条建议，含 adult safeguarding），政府回应 2026-03-12；未见立法 | 走 SIRS | ✅ [R1]；⏳ [R4][R5] |
| WA | 未找到 | Elder Abuse Helpline（Advocare，1300 724 679）| 走 SIRS | ⏳ [R6] |
| SA | 未找到强制报告义务 | Adult Safeguarding Unit（*Ageing and Adult Safeguarding Act 1995*；65+，原住民 50+）；不调查服务提供者，养老院问题转 ACQSC。⏳ *Ageing and Adult Safeguarding (Review Recommendations) Amendment Act 2025*（No 38，2025-09-11 assent；DHS 称 01/07/2026 起）增加转介监管机构、authorised officers、**要求提供信息的权力**（ss23–30A）| 可能要求 provider 提供记录 ⚠️ | ✅ Act [R8]；⏳ 生效日 [R9]；[R7] |
| TAS | 未找到；未见 Adult Safeguarding Bill | *Disability Rights, Inclusion and Safeguarding Act 2024*（只管残障，01/07/2025 起）；Older Tasmanians 职能 02/07/2026 起转卫生部；TLRI 2025-12 建议设 Commissioner for Older People（⚠️ 二手）| 走 SIRS | ✅ [R10]；⏳ [R11][R12] |
| ACT | 无报告义务，但有**刑事罪**：对弱势人士（含 60 岁以上）负有照护责任者的 abuse、failure to protect（Crimes Act 1900 s36A）、neglect（s36C），明确覆盖机构，2021-04-21 起 | ACT Public Advocate | 走 SIRS；刑事责任另计 | ⏳ [R13] |
| NT | 未找到 | Elder Abuse Information Line | 走 SIRS | ⚠️ |

### 5.3 对 careKind 的设计启示
- **SIRS 是唯一需要在产品流程中重点支持的报告义务**：现有设计（只提示“可能需要按 SIRS 评估”，判定和报告由 provider 做）不变。
- **ACT 的刑事罪**和 **SA 的信息索取权**意味着 neglect/abuse 相关记录可能成为证据：AI **不得淡化、美化或删除**疑似虐待/忽视的事实描述（`../aged-care-regulatory.md` §3 已有要求）；保留护士原话和修改历史。
- 不在产品里做“是否构成 elder abuse”的分类或评分。

---

## 6. 护士执业范围与记录义务；州 Health Complaints 机构

### 6.1 全国统一（NMBA / Ahpra）
| 内容 | 状态 | 来源 |
|---|---|---|
| RN Standards for Practice（2016）：记录评估、计划、决策、行动和评价 | ✅（本地 PDF）；⏳ 2026-01-16 至 2026-03-13 咨询修订 RN/EN 标准，终稿未见 | `law-library/nmba-registered-nurse-standards-for-practice-2016.pdf`；[N1][N3] |
| EN Standards for Practice（2016）：EN 在 RN 直接或间接监督下执业，对所做的委派照护负责 | ✅ 本地 PDF；⏳ 同上 | `law-library/nmba-enrolled-nurse-standards-for-practice-2016.pdf`；[N2] |
| Decision-making framework（2020-02-03 起）：执业范围与委派 | ⏳（NMBA 网站 403）| [N4] |
| Code of conduct for nurses（2018-03-01 起）：按法律管理健康记录、隐私保密 | ✅ 本地 PDF | `law-library/nmba-code-of-conduct-for-nurses-2018.pdf` |
| Ahpra “Meeting your professional obligations when using AI in healthcare”（2024-08-22）：执业者负责核对 AI 生成记录的准确性和相关性；AI scribe 一般需取得患者同意并记录在健康记录中，软件“should include an explicit consent requirement as an initial step”；AI scribe 通常不受 TGA 监管，但 TGA 批准也不免除人工监督 | ✅ | [N5][N6]；`law-library/ahpra-ai-in-healthcare-summary.md` |
| 共管辖区：NSW 由 HCCC 与 Nursing and Midwifery Council of NSW 共同处理；QLD 由 OHO 作为单一入口，与 Ahpra 共同考虑 | ✅ QLD [R1]；⏳ NSW | [R1] |

### 6.2 州 Health Complaints 机构

| 州 | 机构 / 法律 | 对私营住宿养老及其员工的管辖 | National Code of Conduct for Health Care Workers（覆盖未注册人员，如 PCW）| 状态 / 来源 |
|---|---|---|---|---|
| NSW | HCCC（*Health Care Complaints Act 1993*）| s4 "health service" 含 nursing services（公私）；是否覆盖养老机构是推论 ⚠️；HRIPA 健康信息投诉向 NSW Privacy Commissioner（6 个月内）| 已实施 ⏳ | [C3][C4] |
| VIC | Health Complaints Commissioner（*Health Complaints Act 2016*；*Health Records Act 2001*）| 与 ACQSC 交换函件 2025-09-17 定稿；HCC 受理私营养老的 HPP 投诉 | 已实施 ⏳ | [C1][C2] |
| QLD | Office of the Health Ombudsman（*Health Ombudsman Act 2013*）| health service organisations **明确包括 residential aged care facilities**；覆盖 RN、EN、AIN、personal carers；与 ACQSC 有 MOU | ✅ 已实施，明确适用于 aged care workers 和 personal carers；Code 第 4 条要求报告其他工作者造成的严重风险 | ✅ [R1] |
| WA | HaDSCO | 管辖健康和残障服务；Code of Conduct for certain health care workers（17 条）已运行；所列工作者类型未点名 aged care workers ⚠️ | 已实施；⚠️ 生效日 | [C6] |
| SA | HCSCC（*Health and Community Services Complaints Act 2004*）| 公营、私营、NGO 健康和社区服务；"community service" 是否含 aged care ⚠️（需看 s4）| 已实施 ⏳ | [C5] |
| TAS | Health Complaints Commissioner | ⚠️ | 网页称 **尚未实施**，2025 年咨询中 | ⏳ [C7] |
| ACT | ACT Human Rights Commission（Health Services Commissioner）| ⚠️ | 已通过 *Human Rights Commission Regulation 2023* 实施 ⏳ | [C8] |
| NT | HCSCC | ⚠️ | 咨询中，未见最终决定 ⚠️ | [C9][C10] |

### 6.3 对 careKind 的设计启示
- **作者身份和审核是专业义务，不只是产品功能。** Ahpra 的 AI 指引把核对责任放在执业者身上：每条记录保留作者（护士本人）、AI 辅助标记、审核确认人和时间；RN 审核 PCW 草稿时，审核人身份要单独记录（RN 对委派与监督负责）。
- **同意记录作为第一步**：Ahpra 建议 AI scribe 软件以明确的同意为初始步骤——careKind 的录音/口述功能应有“住户（或决策人）已知情并同意”字段，记录在健康记录中（与 §2 决策人字段联动；涉及录音还要查州监控设备法，见 `rules/legal-reference-map.md` 缺口表）。
- **PCW 也受投诉机制约束**（QLD 明确；其他州通过 National Code 逐步覆盖）：PCW 起草的记录同样要可追溯、保留原话，便于投诉调查。
- **NMBA 标准修订**：终稿发布后需复核本文件和产品中引用的标准条款。

---

## 7. 跨主题：哪些内容必须 RN 签署、AI 不能起草

| 记录类型 | 谁起草 | 谁签署/确认 | AI 可以做 | AI 不能做 | 依据 |
|---|---|---|---|---|---|
| 约束性措施评估（非化学）| approved health practitioner（RN/NP/医生）| 同左 | 整理口述的观察事实 | 判断风险、必要性、相称性 | [L2 s162-20] |
| 化学约束评估、处方 | 医生/NP | 医生/NP；provider 确认 | 无（只能链接） | 任何药物建议 | [L2 s162-25]；TGA 红区 |
| RP 使用记录（162-60）| PCW/EN/RN 口述 | **RN 审核** | 结构化事实、缺字段标黄 | 填写“符合同意”或推断同意范围 | [L2 s162-60] |
| 紧急 RP 后记录、通知 RPSDM | RN | RN | 记录通知时间（照录）| 判断“是否紧急” | [L2 s162-35] |
| RPSDM / 决策人登记 | 机构指定人员 | RN 或经理 | 无（结构化手动字段）| 推导谁是决策人 | [L2 s6-20]；§1.2、§2.2 |
| VIC 给药紧急例外 | 管理 RN | 管理 RN | 无 | 任何代写 | [M21] |
| 给药相关 progress note | 给药者 | 给药者本人；PCW 草稿 RN 审核 | 照录事实 | 补剂量、核对、纠错 | Outcome 5.3 [L2]；TGA 红区 |
| Verification of death | RN（按州指南）| RN | 整理口述到字段 | 代填“已满足标准” | [D11][D22] |
| 死亡事实记录 | 发现者 | RN | 事实字段 | 判断 reportable / expected | §4.2 |
| VAD 相关询问、conscientious objection | 从业者本人 | 本人 | 照录原话 | 起草请求、评估、转介内容 | §4.4 |
| 疑似虐待/忽视 | 发现者 | RN；机构按 SIRS 流程 | 保留原话、整理时间线 | 分类、淡化、判断是否 reportable | [R15]；[R13] |

---

## 8. ⚠️ 需核实清单
1. 联邦 RPSDM hierarchy（Rules 6-20(2)）和 s163 豁免在 **2026-12-01 之后**是否延期——在 12 月前直接查 Federal Register 是否有 F2026 修正 [S1][S3][S4]。
2. NSW *Guardianship Regulation 2026* 的生效日（二手资料称 01/09/2026）、旧 enduring guardian 委任的延续条款，以及“2026-12 起 NSW 新 RP 框架”是否存在。
3. VIC RPSDM Act 对住宿养老的适用日：本文件 [S20] 写 01/11/2025，`state-by-state-comparison.md` 写 2025-07-01。
4. QLD Health interim consent 指引现行状态（2026-12-01 到期）。
5. SA：OPA SA RP 指引原文；physical restraint 是否须 SACAT 授权（GAA 1993 s32）；Part 5A 生效日；VAD 机构义务条款号；Coroners Act “residential care” 是否含养老院；Controlled Substances (Poisons) Regulations 2011 中养老院给药、见证和电子 register 规定。
6. TAS person responsible 顺序；ACT health attorney 顺序；NT HCDMA 生效日。
7. VIC S8 register 的见证人、保存期和电子 register 规则。
8. WA 全州 PCW 给药规则；WA Regulations 现行 reprint。
9. QLD PCW 给药依据（Medicines and Poisons Act ss34、51 原文）；QLD 无 Ahpra 治疗执业者豁免的官方确认。
10. NSW 新药品法下 DAA 中 S8 是否免记 register；NSW 报告 coroner 的时限（s35）原文。
11. QLD、WA、SA、TAS、NT 的 RN 死亡确认指南；ACT NP 出具死因证明的生效日。
12. VIC VAD 修正法（2027-04-19 起）是否增加机构义务；NT VAD 法生效日和机构义务。
13. 各州是否确实没有 elder abuse 一般性强制报告（律师最终确认）；SA 2025 修正法信息索取权的范围。
14. NSW HCCC、SA HCSCC、TAS、ACT、NT 投诉机构对私营养老员工的管辖；National Code 在 WA、TAS、NT 的实施日期。
15. Outcome 5.3(6)(b)“由 registered health practitioners administered”与州法允许 PCW 给药之间的关系（等 ACQSC 更新指引）。
16. NMBA RN/EN 标准修订终稿。
17. 本轮 NSW、SA 立法网站，opa.sa.gov.au，health.qld.gov.au，NMBA 网站拒绝抓取；相关结论来自搜索摘要，正式引用前需人工打开核对。

---

## 来源列表（访问日期：18/10/2026）

### 本地文件（`law-library/`）
- [L1] Aged Care Act 2024，Compilation 01/07/2026，`aged-care-act-2024-compilation-2026-07-01.pdf`（s17、s18、s162、s163）— https://www.legislation.gov.au/C2024A00104/latest/text
- [L2] Aged Care Rules 2025 Vol 1，Compilation No. 10（01/08/2026，F2026C00802），`aged-care-rules-2025-vol1-compilation-2026-08-01.pdf`（s5-5、s6-15、s6-20、s15-30、s16-5(8)、Part 9 s162-5 至 s163-5、s166-140）— https://www.legislation.gov.au/F2025L01173/latest/text

### 1–2 约束性措施、决策人
- [S1] https://www.health.gov.au/topics/aged-care/providing-aged-care-services/training-and-guidance/restrictive-practices-in-aged-care-a-last-resort
- [S2] https://www.health.gov.au/sites/default/files/2026-02/consent-for-restrictive-practices-information-for-aged-care-providers.pdf
- [S3] https://www.health.gov.au/sites/default/files/2025-07/new-aged-care-regulatory-model-frequently-asked-questions.pdf
- [S4] https://www.health.gov.au/sites/default/files/2025-02/new-aged-care-act-rules-consultation-release-3-provider-obligations_0.pdf
- [S10] https://ncat.nsw.gov.au/documents/factsheets/gd_factsheet_restrictive_practices_and_guardianship.pdf
- [S11] https://legislation.nsw.gov.au/view/whole/html/inforce/current/sl-2026-0437
- [S12] https://hdp-au-prod-app-nsw-haveyoursay-files.s3.ap-southeast-2.amazonaws.com/3317/8062/5576/Proposed_Guardianship_Regulation_2026.PDF
- [S13] https://ncat.nsw.gov.au/documents/factsheets/gd_factsheet_person_responsible.pdf
- [S14] https://www.nsw.gov.au/departments-and-agencies/trustee-guardian/news-stories/restrictive-practices-aged-care-a-guide-for-guardians
- [S20] https://www.health.vic.gov.au/residential-aged-care/substitute-decision-making-restrictive-practices
- [S21] https://www.health.vic.gov.au/substitute-decision-making-restrictive-practices/temporary-restrictive-practices-substitute-decision-maker-aged-care-tier-2
- [S22] https://www.health.vic.gov.au/sites/default/files/2025-06/flowchart-aged-care-restrictive-practices-substitute-decision-maker-act-2024.pdf
- [S23] https://www.vcat.vic.gov.au/case-types/restrictive-practices-residential-aged-care/appointment-restrictive-practices-substitute-decision-maker
- [S24] https://www.health.vic.gov.au/advance-care-planning/forms
- [S25] https://www.health.vic.gov.au/advance-care-planning/medical-treatment-planning-and-decisions-act-2016
- [S30] https://www.qcat.qld.gov.au/__data/assets/pdf_file/0010/910783/qcat-practice-direction-2-of-2026.pdf
- [S31] https://www.publicguardian.qld.gov.au/understanding-guardianship/request-a-decision/restrictive-practices-aged-care-resident
- [S32] https://www.publicguardian.qld.gov.au/__data/assets/pdf_file/0005/757121/RP-in-Aged-Care-Policy-Statement-Feb-2025.pdf
- [S33] https://www.health.qld.gov.au/system-governance/policies-standards/guidelines/interim-consent-arrangements-for-restrictive-practices-in-aged-care
- [S34] https://www.legislation.qld.gov.au/view/pdf/current/act-1998-022
- [S35] https://www.publicguardian.qld.gov.au/making-decisions/future-planning/advance-health-directive
- [S40] https://www.wa.gov.au/system/files/2026-07/opa-position-statement-2.pdf
- [S41] https://www.wa.gov.au/system/files/2026-07/opa-position-statement-8.pdf
- [S42] https://www.parliament.wa.gov.au/publications/tabledpapers.nsf/displaypaper/4211006c8bbdd34494475a3048258dab00095ff3/$file/tp-1006.pdf
- [S43] https://www.health.wa.gov.au/~/media/Corp/Policy-Frameworks/Clinical-Governance-Safety-and-Quality/Consent-to-Treatment-Policy/Supporting/WA-Hierarchy-of-Treatment-Decision-Makers.pdf
- [S44] https://www.wa.gov.au/organisation/department-of-justice/office-of-the-public-advocate/making-treatment-decisions-opa-information
- [S50] https://opa.sa.gov.au/guardianship/restrictive-practices （⚠️ 403，仅搜索摘要）
- [S51] https://www.legislation.sa.gov.au/_legislation-documents/lz/c/a/advance-care-directives-act-2013/current/2013.10.auth.pdf
- [S52] https://www.legislation.sa.gov.au/_legislation-documents/lz/v/a/2025/statutes-amendment-health-and-wellbeing-act-2025_69/2025.69.un.pdf
- [S53] https://www.sahealth.sa.gov.au/wps/wcm/connect/f0ee918046d8588f8b8ffb22d29d99f6/Consent+Guideline.pdf?MOD=AJPERES
- [S60] https://tascat.tas.gov.au/news/changes-to-restrictive-intervention-applications
- [S61] https://www.tascat.tas.gov.au/__data/assets/pdf_file/0004/637303/Private-Guardian-Handbook.pdf
- [S62] https://www.tascat.tas.gov.au/news/introduction-of-advance-care-directives
- [S63] https://www.health.tas.gov.au/sites/default/files/2024-09/Advance%20Care%20Directive%20-%20Print%20form.pdf
- [S64] https://www.legislation.tas.gov.au/view/whole/html/inforce/current/act-1995-044
- [S70] https://www.acat.act.gov.au/__data/assets/pdf_file/0005/2119478/ACAT-Annual-Review-2021-22.pdf
- [S71] https://www.legislation.act.gov.au/a/2006-51/current/pdf/2006-51.pdf
- [S72] https://www.ptg.act.gov.au/__data/assets/pdf_file/0007/2166487/ptg-power-to-choose2025.pdf
- [S73] https://www.legislation.act.gov.au/af/2017-205/current/pdf/2017-205.pdf
- [S80] https://legislation.nt.gov.au/api/sitecore/Act/PDF_History?id=22781
- [S81] https://pgt.nt.gov.au/about-us/publications/annual-reports/public-guardian-and-trustee2/Public-Guardian-and-Trustee-Annual-Report-202324.pdf
- [S82] https://nt.gov.au/law/rights/advance-personal-plan
- [S83] https://pgt.nt.gov.au/advance-personal-plans/making-an-advance-personal-plan

### 3 药物
- [M1] https://www.health.gov.au/resources/collections/guiding-principles-for-medication-management-in-residential-aged-care-facilities-collection
- [M2] https://www.health.gov.au/sites/default/files/2025-05/guiding-principles-for-medication-management-in-residential-aged-care-facilities.pdf
- [M3] https://agedcarequality.gov.au/strengthened-quality-standards/clinical-care/safe-and-quality-use-medicines
- [M4] https://www.health.gov.au/sites/default/files/2026-08/strengthened-aged-care-quality-standards.pdf
- [M5] https://www.health.gov.au/news/electronic-national-residential-medication-charts-enrmc-implementation-timeframes-extended-to-31-march-2027
- [M6] https://www.health.gov.au/sites/default/files/2026-09/electronic-national-residential-medication-chart-enrmc-transitional-arrangement-extended-to-31-march-2027.pdf
- [M7] https://www.health.gov.au/sites/default/files/2025-11/electronic-national-residential-medication-charts-enrmc-transition-to-electronic-prescribing-and-end-of-transitional-arrangement.pdf
- [M8] https://www.health.gov.au/our-work/aged-care-on-site-pharmacist
- [M10] https://www.health.nsw.gov.au/pharmaceutical/Pages/medicine-laws-faq.aspx
- [M11] https://legislation.nsw.gov.au/view/whole/html/inforce/current/sl-2026-0330
- [M12] https://www.health.nsw.gov.au/pharmaceutical/Pages/residential-care-facilities.aspx
- [M13] https://www.health.nsw.gov.au/pharmaceutical/Pages/schedule-8-medicines.aspx
- [M14] https://www.health.nsw.gov.au/pharmaceutical/Pages/changes-for-healthcare-settings.aspx
- [M15] https://www.health.nsw.gov.au/pharmaceutical/Documents/framework-edr-dual.pdf
- [M16] https://www.health.nsw.gov.au/pharmaceutical/Pages/electronic-register-standards.aspx
- [M20] https://www.health.vic.gov.au/drugs-and-poisons/drugs-poisons-and-controlled-substances-act-1981-and-regulations-2017
- [M21] https://www.health.vic.gov.au/drugs-and-poisons/medication-administration-in-residential-aged-care
- [M22] https://health.vic.gov.au/drugs-and-poisons/faq-aged-care-facilities
- [M23] https://health.vic.gov.au/drugs-and-poisons/residential-aged-care-medication-storage-and-record-keeping
- [M30] https://www.legislation.qld.gov.au/view/whole/html/inforce/current/sl-2021-0140
- [M40] https://www.legislation.wa.gov.au/legislation/prod/filestore.nsf/FileURL/mrdoc_49666.htm/$FILE/Medicines%20and%20Poisons%20Regulations%202016%20-%20%5B00-t0-00%5D.html
- [M41] https://www.health.wa.gov.au/~/media/Files/Corporate/general-documents/medicines-and-poisons/Word/Approved-registers-hard-copy-and-electronic.PDF
- [M42] https://health.wa.gov.au/Articles/S_T/Schedule-8-drug-registers
- [M43] https://www.wacountry.health.wa.gov.au/~/media/WACHS/Documents/About-us/Policies/Medication-Administration-in-Residential-Aged-Care-Procedure.pdf
- [M50] https://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/clinical+resources/clinical+programs+and+practice+guidelines/medicines+and+drugs/legal+control+over+medicines/legal+requirements+for+the+prescription+and+supply+of+drugs+of+dependence/pharmacist+legal+obligations+when+handling+dispensing+and+supplying+drugs+of+dependence
- [M60] https://www.legislation.tas.gov.au/view/whole/html/inforce/current/sr-2018-079
- [M61] https://www.dhhs.tas.gov.au/__data/assets/pdf_file/0013/64102/Guidelines_for_the_administration_of_certain_substances_by_aged_care_workers_-_2021_FINAL.pdf （⚠️ 链接已失效）
- [M70] https://www.legislation.act.gov.au/sl/2008-42/current/pdf/2008-42.pdf
- [M80] https://legislation.nt.gov.au/api/sitecore/SubordinateLegislation/PDF?id=3971

### 4 死亡与 VAD
- [D10] https://coroners.nsw.gov.au/for-healthcare-professionals.html
- [D11] https://www1.health.nsw.gov.au/pds/ActivePDSDocuments/PD2023_014.pdf
- [D12] https://www.health.nsw.gov.au/voluntary-assisted-dying/Publications/private-entity-guidance.pdf
- [D13] https://www.health.nsw.gov.au/voluntary-assisted-dying/Pages/healthcare-worker-obligations.aspx
- [D20] https://content.legislation.vic.gov.au/sites/default/files/2026-09/08-77aa045-authorised.pdf
- [D21] https://www.coronerscourt.vic.gov.au/report-death-or-fire/reportable-deaths
- [D22] https://www.health.vic.gov.au/publications/guidance-note-for-the-verification-of-death
- [D23] https://www.health.vic.gov.au/legislation/voluntary-assisted-dying-act
- [D24] https://health.vic.gov.au/voluntary-assisted-dying/upcoming-changes
- [D30] https://www.legislation.qld.gov.au/view/whole/html/inforce/current/act-2003-013
- [D31] https://www.health.qld.gov.au/__data/assets/pdf_file/0024/1501494/care-after-death.pdf （⚠️ 403）
- [D32] https://www.legislation.qld.gov.au/view/whole/html/inforce/current/act-2021-017
- [D40] https://www.legislation.wa.gov.au/legislation/prod/filestore.nsf/FileURL/mrdoc_27783.htm/$FILE/Coroners%20Act%201996%20-%20%5B03-e0-02%5D.html
- [D41] https://www.health.wa.gov.au/~/media/Corp/Documents/Health-for/Voluntary-assisted-dying/VAD-guidelines.pdf
- [D42] https://www.health.wa.gov.au/~/media/Corp/Documents/Health-for/Voluntary-assisted-dying/FAQs-for-Health-Professionals.pdf
- [D50] https://lawhandbook.sa.gov.au/ch36s03s03.php （SA Legal Services Commission 法律手册，非立法原文）
- [D51] https://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/services/community+and+specialised+services/voluntary+assisted+dying/health+services+information+for+voluntary+assisted+dying/health+service+resources+for+voluntary+assisted+dying
- [D60] https://www.legislation.tas.gov.au/view/whole/html/inforce/current/act-1995-073
- [D61] https://www.health.tas.gov.au/sites/default/files/2022-10/VAD%20Minimum%20Obligations%20for%20registered%20nurses%20and%20other%20registered%20health%20practitioners%20fact%20sheet-accessible.pdf
- [D70] https://legislation.act.gov.au/DownloadFile/a/1997-57/current/PDF/1997-57.PDF
- [D71] https://www.cmtedd.act.gov.au/open_government/inform/act_government_media_releases/rachel-stephen-smith-mla-media-releases/2026/act-government-delivers-more-nation-leading-reforms-for-nurse-practitioners
- [D72] https://www.act.gov.au/health/end-of-life-and-palliative-care/voluntary-assisted-dying-laws-for-private-facilities
- [D80] https://legislation.nt.gov.au/api/sitecore/Act/PDF?id=11720
- [D81] https://legislation.nt.gov.au/LegislationPortal/Acts/By-Year
- [D82] https://www.abc.net.au/news/2026-08-27/nt-passes-voluntary-assisted-dying-laws-legalising-vad-australia-wide/107087354 （媒体报道，⚠️ 非官方）

### 5 强制报告
- [R1] https://documents.parliament.qld.gov.au/com/EDUCATIONA-7015/IEAQ-77CA/submissions/00000049.pdf （QLD Office of the Health Ombudsman 提交）
- [R3] https://dcj.nsw.gov.au/documents/about-us/engage-with-us/public-consultations/ageing-and-disability-commission-act-independent-review/Ageing-and-Disability-Commission.pdf
- [R4] https://www.families.qld.gov.au/our-work/seniors/elder-abuse-awareness-prevention/inquiry-into-elder-abuse-queensland
- [R5] https://www.justice.qld.gov.au/__data/assets/pdf_file/0007/820762/qpa-proposal-for-qld-adult-support-and-safeguarding-act.pdf
- [R6] https://consumerprotection.wa.gov.au/publications/elder-abuse-prevention-resources
- [R7] https://www.sahealth.sa.gov.au/wps/wcm/connect/Public+Content/SA+Health+Internet/About+us/Department+for+Health+and+Wellbeing/Office+for+Ageing+Well/Adult+Safeguarding+Unit
- [R8] https://www.legislation.sa.gov.au/_legislation-documents/lz/v/a/2025/ageing-and-adult-safeguarding-review-recommendations-amendment-act-2025_38/2025.38.un.pdf
- [R9] https://dhs.sa.gov.au/__data/assets/pdf_file/0019/183700/Ageing-and-Adult-Safeguarding-Review-Recommendations-Amendment-Act-2025-Information-Sheet.pdf
- [R10] https://www.dpac.tas.gov.au/news_and_features/disability-rights-inclusion-and-safeguarding-act-2024
- [R11] https://www.parliament.tas.gov.au/__data/assets/pdf_file/0027/107289/260612-QON-Response-Ageing.pdf
- [R12] https://www.elderabuse.tas.gov.au/resources-and-publications/Lifelong-Respect-Tasmanias-Strategy-to-end-the-abuse-of-older-people.pdf
- [R13] https://www.legislation.act.gov.au/DownloadFile/a/2020-41/20210420-74886/DOCX/2020-41.DOCX
- [R14] https://ahpra.gov.au/Notifications/mandatorynotifications/Mandatory-notifications.aspx
- [R15] https://www.agedcarequality.gov.au/providers/serious-incident-response-scheme/about-serious-incident-response-scheme-sirs （⚠️ 本轮超时；SIRS 时限以本地 `law-library/index.md` 1a 摘录为准）

### 6 执业范围与投诉机构
- [N1] https://www.nursingmidwiferyboard.gov.au/codes-guidelines-statements/professional-standards/registered-nurse-standards-for-practice
- [N2] https://www.nursingmidwiferyboard.gov.au/Codes-Guidelines-Statements/Professional-standards/enrolled-nurse-standards-for-practice.aspx
- [N3] https://www.nursingmidwiferyboard.gov.au/News/2026-01-16-consultation-open-EN-RN-standards-for-practice
- [N4] https://www.nursingmidwiferyboard.gov.au/Codes-Guidelines-Statements/Frameworks.aspx
- [N5] https://www.ahpra.gov.au/Resources/Artificial-Intelligence-in-healthcare.aspx
- [N6] https://www.nursingmidwiferyboard.gov.au/News/2024-08-22-AI-in-healthcare-code-of-conduct
- [C1] https://www.agedcarequality.gov.au/resource-library/exchange-letters-between-victoria-health-complaints-commission-hcc-and-aged-care-quality-and-safety-commission-acqsc
- [C2] https://health.vic.gov.au/legislation/health-records-act
- [C3] https://legislation.nsw.gov.au/view/whole/html/inforce/2020-12-14/act-1993-105
- [C4] https://www.ipc.nsw.gov.au/fact-sheet-privacy-related-complaints-under-hrip-act
- [C5] https://hcscc.sa.gov.au/about-hcscc/hcscc-and-the-law
- [C6] https://hadsco.wa.gov.au/~/media/HaDSCO/Publications/About-Us/Resources/Code-of-Conduct-for-certain-health-workers-Information-Sheet---2025.pdf
- [C7] https://www.healthcomplaints.tas.gov.au/national-code-of-conduct
- [C8] https://www.legislation.act.gov.au/DownloadFile/es/db_67429/20230330-80694/DOCX/db_67429.DOCX
- [C9] https://hcscc.nt.gov.au/__data/assets/pdf_file/0004/1248223/National_Code_of_Conduct_NT_Information_Paper.pdf
- [C10] https://mediareleases.nt.gov.au/article?id=24027
