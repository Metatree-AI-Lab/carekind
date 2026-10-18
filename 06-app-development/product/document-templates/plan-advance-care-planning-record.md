# 预先照护计划记录（Advance care planning record）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。本模板只记录 **ACP 讨论过程**和**已有文件的登记信息**。Advance care directive（ACD）本身是本人按州法律完成的法律文件，**careKind 不起草、不改写、不解释其效力**；替代决策者的称谓和权限按州不同，以 `03-legal-compliance/references/state-clinical-practice-rules.md` 为准。

## 1. 用途与触发事件
- 用途：记录 older person 关于未来医疗和照护的价值观、意愿和担忧；登记已有 ACD / ACP 文件、替代决策者、存放位置、复核和共享（含转院时）。
- 触发事件：入住、状况变化、进入姑息阶段、定期复核、本人主动提出；PRD §14 **临终照护**、**病情变化 / 升级**、**家属来访或沟通**中谈到意愿时。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | RN / GP / CM 口述讨论；careKind 起草讨论记录 |
| 谁审核签署 | 讨论记录：RN（或主持讨论的 GP / CM）；ACD：本人按州法签署；GP 的 goals of care / 复苏决定以 GP 自己的记录为准 |
| 风险 Tier | PRD §6.5 未单列。建议按 **Tier 3**（只有 RN 逐条确认）处理（⚠️ 待 PO 确认） |
| 时限 | 入住时询问；状况变化、姑息阶段、定期复核；转院时共享（SQS 3.1.6(d)）。具体复核间隔按机构政策 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| ACP 流程：讨论未来治疗和照护；完成和复核 ACP 文件；提名替代决策者；文件存放、使用和共享（含 transitions） | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 3.1.6(a)–(d)，第 25 页 | 字段 A01–A12 |
| 姑息阶段继续讨论、复核 ACP 文件 | 同上 | 5.7.2(a)–(c)，第 40 页 | 复核触发 |
| 偏好的照护地点告知员工和 supporters | 同上 | 5.7.3(e)，第 41 页 | "Preferred place of care" |
| 收集和共享信息需知情同意 | 同上 | 2.7.2(c)(d)，第 19–20 页 | 共享记录 |
| ACP 文书与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md`；`03-legal-compliance/references/paperwork-requirements-by-event.md` | §5.2；§1、§14 | ACD 本身不起草 |
| 各州 ACD 法律、替代决策者名称 | `03-legal-compliance/references/state-clinical-practice-rules.md`；`03-legal-compliance/references/state-by-state-comparison.md` | §3.4 | ⚠️ 各州表单未下载；术语以州规则文件为准 |

**州差异提示**：ACD 的名称（如 advance care directive、advance health directive）、替代决策者的称谓（如 medical treatment decision maker、enduring guardian、attorney）和委任方式按州不同；限制性措施的同意人另有规则。模板用中性字段 "Substitute decision maker — title under state law"，由 RN 按州规则文件填写。⚠️ 需逐州核实。

## 4. 字段表
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| A01 | Resident · date · discussion type | Initial / review / palliative | 是 | 🤖 / 🧑 | |
| A02 | Present | 本人、supporter、SDM、GP、RN、interpreter | 是 | 🤖 | |
| A03 | Resident able to take part | 本人参与情况（不是能力判定） | 是 | 🗣️ | 决策能力评估 🧑 由合资格人员 |
| A04 | What matters most (own words) | | 是 | 🗣️ | |
| A05 | Worries / fears (own words) | | 否 | 🗣️ | |
| A06 | Wishes about future care & treatment (own words) | | 否 | 🗣️ | 不改写成医疗术语 |
| A07 | Preferred place of care / death | | 否 | 🗣️ | |
| A08 | Cultural, spiritual, religious practices | | 否 | 🗣️ | |
| A09 | Existing documents | 名称（按文件原名）、日期、谁持有、副本位置 | 是 | 🧑 人工 | 不解释效力 |
| A10 | Substitute decision maker — name · title under state law · document | | 是 | 🧑 人工 | 按州规则文件 |
| A11 | GP's documented goals of care / resuscitation decision | 只引用 GP 记录 | 否 | 🧑 人工 | careKind 不起草 |
| A12 | Shared with · date | GP、医院、ambulance plan 等 | 是 | 🧑 人工 | 本人同意 |
| A13 | Next review | | 是 | 🧑 人工 | |
| A14 | RN confirmation | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
ADVANCE CARE PLANNING RECORD
Resident: ______________ Date: __/__/____  ☐ Initial ☐ Review ☐ Palliative phase
Present: ______________________________________  Interpreter: ☐ No ☐ Yes (____)
Resident's participation: _______________________________________________
What matters most (own words): "_________________________________________"
Worries (own words): "__________________________________________________"
Wishes about future care & treatment (own words): "______________________"
Preferred place of care: _______________________________________________
Cultural / spiritual / religious practices: _______________________________
Existing documents (title as written, date, held by, copy location): __________
Substitute decision maker: name ______ title under state law ______ document ______
GP's documented goals of care / resuscitation decision (reference only): _______
Shared with: ______________ on __/__/____ (resident's consent: ☐ Yes)
Next review: __/__/____        RN confirmed: ______________ __/__/____ __:__
```

## 6. 示例（虚构）
> 新增虚构人物：Mr George Whitfield（虚构，93 岁）· DOB 11/05/1933 · WG-0198 · Room 3, Wattle wing；Ruth Whitfield（女儿，虚构）。机构在 VIC。

**原话 → AI 草稿对照（片段）**
| 片段 | 原话 | careKind 草稿 |
|---|---|---|
| S1（George，Grace Liu 口述转述） | "I want to stay here with my garden view. I don't want to go back to that hospital unless it's something simple they can fix." | What matters most / wishes (own words): "I want to stay here with my garden view. I don't want to go back to that hospital unless it's something simple they can fix." |

> 草稿没有把这句话改写成"Not for hospital transfer"或"comfort care only"——那是 GP 和本人 / 决策人之间的医疗决定，只能引用 GP 自己的记录（A11）。

**填写后的记录**
```text
ADVANCE CARE PLANNING RECORD
Resident: Mr George Whitfield (fictional), 93, WG-0198, Room 3, Wattle wing   Date: 10/10/2026   Review
Present: George; Ruth Whitfield (daughter, fictional); Dr Amelia Brooks (GP, fictional); Grace Liu (CM)
Resident's participation: George took part for the whole discussion (35 minutes); tired at the end.
What matters most: "My garden view, my daughter, and not being in pain."
Worries: "I don't want to be hooked up to machines."
Wishes about future care & treatment: "I want to stay here with my garden view. I don't want to go
  back to that hospital unless it's something simple they can fix."
Preferred place of care: Wattle Grove, his own room (George's words: "here, in my room").
Cultural / spiritual: Anglican; would like the chaplain to visit "when it's close".
Existing documents: "Advance Care Directive" dated 02/03/2024 — original held by Ruth; certified copy
  scanned to CMS documents 10/10/2026 (Grace Liu). Validity under VIC law not assessed by careKind.
Substitute decision maker: Ruth Whitfield — title under state law and appointment document to be
  recorded by RN per state-clinical-practice-rules.md (VIC) ⚠️ — Grace Liu sighted the appointment
  document 10/10/2026.
GP's documented goals of care: see Dr Brooks' note 10/10/2026 in CMS (reference only).
Shared with: Dr Brooks (10/10/2026); copy placed in transfer pack (10/10/2026) — George agreed.
Next review: 24/10/2026 or earlier if his condition changes (Grace Liu)
RN confirmed: Grace Liu (RN, Care Manager) 10/10/2026 16:00
```

## 7. careKind 起草规则
- **可以从口述自动填**：A01、A02、A03（只写参与情况）、A04–A08——全部照录原话，标明谁说的。
- **缺失显示"请填写"**：A09–A13；家属转述与本人原话分开标注。
- **必须 RN / GP / CM 填写**：A09–A14。
- **禁止生成**：ACD 或任何法律文件的文字；"Not for resuscitation / not for transfer"等医疗决定；决策能力结论；替代决策者是谁的判断；对文件是否有效的意见；把本人的话改写成临床术语。
