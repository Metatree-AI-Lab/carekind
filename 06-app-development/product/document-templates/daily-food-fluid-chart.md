# Food & fluid chart（饮食和液体摄入记录）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

## 1. 用途与触发事件
记录一位住户在指定期间每餐、每次饮水**提供了什么、吃喝了多少、需要什么协助、拒绝和住户说的理由**。只照录员工说出的量，不计算"是否足够"。

| 触发事件（[PRD §14](../../../docs/PRD.md)） | 生成 |
|---|---|
| 饮食饮水（且住户的 care plan 要求做 food & fluid chart） | ✅ 每次口述到餐食或饮水就追加一行 |
| 饮食饮水（care plan 没有要求） | 只写进 progress note，不建 chart |
| 食欲变化（Tier 2） | progress note + chart（如有）；是否开始记录 chart 由 RN 决定 |

## 2. 责任与时限
| 项目 | 内容 |
|---|---|
| 谁起草 | 提供或协助进餐的员工（通常是 PCW） |
| 谁审核签署 | Tier 1：PCW（机构允许时）/ EN / RN；拒食、明显变化写进 progress note 时按 Tier 2 由 RN 确认 |
| 风险 Tier（[PRD §6.5](../../../docs/PRD.md)） | Tier 1 常规；"食欲变化"类条目 Tier 2 |
| 时限 | 每餐或每次饮水后尽快；本班结束前完成。开始 / 停止记录的时间和原因由 RN 按 care plan 决定 |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| 营养和水分 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Action 5.5.5(a)(c)，第 38 页 | 记录要能支持 RN 对营养不良和体重变化的响应；判断留给 RN |
| 安全咀嚼和吞咽 | 同上 | Action 5.5.2，第 38 页 | 记录提供的质地 / 稠度（按机构标准，如 IDDSI 等级 ⚠️ 由机构决定） |
| 营养评估、菜单和用餐选择 | 同上 | Action 6.2.1、6.3.1–6.3.4，第 44–45 页 | 记录住户的选择和偏好，不只是量 |
| 体重 QI | `03-legal-compliance/references/paperwork-templates/health-qi-program-manual-part-a-2025-10.pdf` | 第 10–11 章（第 23 页起） | 体重在 `clinical-vital-signs-weight-bgl.md` 记录；本表不计算体重变化百分比 |
| 文书字段参考 | `03-legal-compliance/references/paperwork-taxonomy.md` | §4.8 | 没有全国统一模板（`paperwork-templates/index.md`"已知缺口"） |
| TGA 边界 | `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | — | 自动判断"脱水风险""摄入不足"会把 TGA 风险升到中高 → 禁止 |

**州差异**：本模板字段没有州法差异。保存期按州健康信息法（VIC / NSW / ACT 7 年，其他 ⚠️），见 `03-legal-compliance/references/state-by-state-comparison.md` §3.2。

## 4. 字段表
来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`

| 字段 | 说明 | 必填 | 来源标记 | 备注 |
|---|---|---|---|---|
| Resident | 姓名 + 识别信息 | ✅ | 🧑 人工 | 系统建议，员工确认 |
| Chart reason / period | 为什么记、从哪天到哪天 | ✅ | 🧑 人工 | RN 按 care plan 填，AI 不填 |
| Texture / fluid consistency | 按 care plan | ✅ | 🧑 人工 | 从 care plan 带出；不能从口述改写 |
| Time | 每一行的时间 | ✅ | 🗣️ 照录 | |
| Meal / drink | 早餐、加餐、午餐、饮水…… | ✅ | 🤖 AI 可起草 | |
| Offered | 提供的食物或饮品、份量（ml） | ✅ | 🗣️ 照录 | 员工没说份量 → "请填写" |
| Taken | 吃了多少（员工说的比例）、喝了多少（ml） | ✅ | 🗣️ 照录 | "一半"照录为 "about half"；**不把比例换算成克或卡路里** |
| Assistance | 独立 / 准备 / 部分协助 / 喂食 | ✅ | 🤖 AI 可起草 | 从描述中归类，员工确认 |
| Declined & reason | 拒绝的内容 + 住户原话 | 有则必填 | 🗣️ 照录 | |
| Resident's choice / comments | 住户的偏好、评价 | 有则填 | 🗣️ 照录 | |
| Recorded by | 员工 | ✅ | 🧑 人工 | |
| Daily fluid total | 当天 ml 合计 | 可选 | 🧑 人工 | **只在机构要求时显示员工自己填写的合计**；系统不自动标注"不足" |
| RN review | RN 的意见和行动 | 有则填 | 🧑 人工 | 只记录 RN 原话 |

## 5. 空白模板
```markdown
### Food & fluid chart
Resident: ____ · ID: ____ · Room: ____
Chart reason / period (RN): ____ · from __/__/____ to __/__/____
Texture / fluids (from care plan): ____

| Date | Time | Meal / drink | Offered | Taken | Assistance | Declined & reason | Comments | Recorded by |
|---|---|---|---|---|---|---|---|---|
| __/__/____ | __:__ | ____ | ____ | ____ | ____ | ____ | ____ | ____ |

Daily fluid total (staff-entered, if required by policy): ____ ml
RN review: ____ · Signed: ____ · __:__
```

## 6. 示例（虚构）
> 场景：Wattle Grove Residential Care（虚构，VIC）· 18/10/2026 · PM shift。与 `daily-progress-note.md`、`daily-shift-handover-isbar.md` 为同一天。

Resident: Mrs Edna Hall（虚构，88 岁）· WG-0412 · Room 12, Wattle wing
Chart reason / period (RN): "Karen mentioned Mum's been leaving meals; chart for 7 days then I'll review" — Daniel Reyes RN（虚构）· 15/10/2026 to 21/10/2026
Texture / fluids (from care plan): Regular diet · thin fluids

| Date | Time | Meal / drink | Offered | Taken | Assistance | Declined & reason | Comments | Recorded by |
|---|---|---|---|---|---|---|---|---|
| 18/10/2026 | 16:15 | Afternoon drink | Tea with milk, 200 ml | about 150 ml | Set-up; cup placed on her left side | — | "Leave it on this side, my right one's sore." | Priya (PCW，虚构) |
| 18/10/2026 | 17:30 | Dinner | Shepherd's pie, steamed beans; custard; water 200 ml | about half of the pie, beans not eaten, all of the custard, about 100 ml water | Food cut up by staff | Beans — "Not tonight, love." | Edna chose to eat in her room after the fall | Priya (PCW，虚构) |
| 18/10/2026 | 20:00 | Supper | Warm milk, 150 ml | 150 ml (all) | Set-up | — | "That's lovely." | Priya (PCW，虚构) |

Daily fluid total: 请填写（机构政策要求时由员工填写；系统不计算）
RN review: "Intake noted; I'll keep the chart going to 21/10 as planned." — Daniel Reyes RN · 18/10/2026 22:30

**原话 → AI 草稿对照（17:30 行）**
- 原话（Priya 18:05）："Edna ate about half her shepherd's pie, didn't want the beans, said not tonight love, all the custard, about a hundred mls of her water. I cut it up for her because her wrist's sore. She wanted to stay in her room."
- AI 草稿：Taken = "about half of the pie, beans not eaten, all of the custard, about 100 ml water"（"a hundred mls" → **100 ml**，数值规范化，原值未变）；Assistance = **"Food cut up by staff"**（AI 归类）；Comments = **"Edna chose to eat in her room after the fall"**（AI 把 "she wanted to stay in her room" 与 15:10 事件关联——**审核时确认**，如果只是她的日常习惯，要删掉 "after the fall"）。
- AI **没有**写 "poor intake" 或 "below target"。

## 7. careKind 起草规则
- **可从口述自动填**：时间、餐次、提供的食物和份量、员工说出的摄入比例和 ml、协助程度（归类后确认）、拒绝及住户原话、住户评价。
- **缺失时显示"请填写"**：份量（ml）没说时；"喝了一些""吃了点"这类模糊量 → 提示员工说出估计比例或 ml，不替员工估。
- **必须 RN 确认**：开始 / 停止记录、记录原因、质地和稠度（来自 care plan）、RN review。
- **禁止生成**：摄入"足够 / 不足"、"脱水风险"、"营养不良"之类判断；自动换算卡路里或蛋白质；根据合计数标红或提醒；修改质地 / 稠度建议。
- 一段口述同时提到多位住户的进餐 → 拆成多行并分别确认归属（[PRD §6.4](../../../docs/PRD.md)）。
