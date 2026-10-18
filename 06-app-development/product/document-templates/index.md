# 文书模板索引

Owner: Lightman · Status: Draft templates · Last reviewed: 18/10/2026

> careKind 自有设计，不复制第三方非商业模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 字段调整。
> 每份模板结构相同：用途与触发事件 → 责任（起草 / 签署 / Tier / 时限）→ 法律与标准依据 → 字段表（`🤖 AI 可起草` / `🗣️ 照录原话或数值` / `🧑 人工`）→ 空白模板 → 示例（虚构）→ careKind 起草规则。

## 模板清单
| 模板 | 触发事件 | 起草 → 签署 | 默认 Tier | 关键限制 |
|---|---|---|---|---|
| [daily-progress-note](daily-progress-note.md) | 每班日常、任何观察 | PCW / EN / RN → RN（按 Tier） | 1–3 跟随事件 | 只写说过的；AI 改写高亮 |
| [daily-shift-handover-isbar](daily-shift-handover-isbar.md) | 班末交接 | RN → 下一班 RN 接收 | 2 | A / R 栏只用 RN 原话 |
| [daily-food-fluid-chart](daily-food-fluid-chart.md) | 饮食饮水观察 | PCW → RN | 1 | 只照录说出的量，不计算 |
| [daily-family-communication-log](daily-family-communication-log.md) | 与家属 / supporter 沟通 | 沟通人 → RN | 跟随事件 | 只记已发生的沟通；记录住户是否同意分享 |
| [incident-report-ims](incident-report-ims.md) | 任何事件（IMS） | 发现人 → RN / CM | 3 | r 164-25(1) 字段；判断字段只由人填 |
| [incident-post-fall-record](incident-post-fall-record.md) | 跌倒 | PCW / RN → RN | 3 | 观察时间表由 RN 填，不评分、不标异常 |
| [incident-medication-incident](incident-medication-incident.md) | 用药事件 | 发现人 → RN | 3 | 药名剂量以 eNRMC 为准，不写给药记录 |
| [incident-sirs-assessment-prep](incident-sirs-assessment-prep.md) | 可能的 reportable incident | RN → CM 决定 | 3 | 只整理事实和时限倒计时；是否 reportable、P1/P2、提交都由人做 |
| [incident-complaint-feedback](incident-complaint-feedback.md) | 投诉 / 反馈 | 接收人 → CM | ⚠️ PRD 未定义 | 原话照录 |
| [incident-infection-outbreak-log](incident-infection-outbreak-log.md) | 感染 / 疫情 | RN / IPC lead | 2 | 州公共卫生通报规则 ⚠️ |
| [clinical-abc-behaviour-chart](clinical-abc-behaviour-chart.md) | 行为事件 | PCW → RN | 3 | 描述行为不贴标签；不推断诱因 |
| [clinical-restrictive-practice-use-monitoring](clinical-restrictive-practice-use-monitoring.md) | 使用约束性措施 | RN | 3 | r 162-30 监测项；只提示，不判定是否属于约束 |
| [clinical-restrictive-practice-consent-record](clinical-restrictive-practice-consent-record.md) | 约束性措施同意 | RN / CM | 3 | 同意人按州法；01/12/2026 过渡期截止 ⚠️ |
| [clinical-prn-effectiveness](clinical-prn-effectiveness.md) | PRN 给药后复查 | RN / EN | 2（精神类 PRN 建议 3） | 药物信息只引用 eNRMC |
| [clinical-pain-observation](clinical-pain-observation.md) | 疼痛观察 | 员工 → RN | 2 | 分数只照录，系统不求和 |
| [clinical-wound-pressure-injury](clinical-wound-pressure-injury.md) | 压疮 / 伤口 | RN | 2 | 分期只由 RN 给出 |
| [clinical-deterioration-escalation](clinical-deterioration-escalation.md) | 病情变化 / 升级 | RN | 3 | 不判断是否需要升级 |
| [clinical-vital-signs-weight-bgl](clinical-vital-signs-weight-bgl.md) | 生命体征 / 体重 / 血糖 | 员工 → RN | 2 | 不报警、不标颜色、不算百分比 |
| [plan-admission-entry-assessment](plan-admission-entry-assessment.md) | 入住 | RN | 2 | care plan 须在 start day 当天或之前（r 148-80） |
| [plan-care-services-plan-review](plan-care-services-plan-review.md) | care plan 复核 | RN → CM | 2 | 只汇编变化，不写策略；不写死 12 个月 |
| [plan-case-conference-minutes](plan-case-conference-minutes.md) | 病例会议 | RN / CM | 2 | 决定由参会人作出 |
| [plan-gp-allied-health-referral](plan-gp-allied-health-referral.md) | 转介 | RN | 2 | 不写临床建议 |
| [plan-advance-care-planning-record](plan-advance-care-planning-record.md) | ACD / 替代决策者 | RN | 3 | ACD 名称按州 |
| [eol-palliative-care-notes](eol-palliative-care-notes.md) | 姑息与临终照护 | RN / EN | 3 | person-centred 语言 |
| [eol-death-record-notifications](eol-death-record-notifications.md) | 死亡 | RN → CM | 3 | 是否 expected / 是否须报 coroner 只由人判断，按州 |
| [eol-hospital-transfer-summary](eol-hospital-transfer-summary.md) | 转院 | RN | 3 | 转院决定在 RN / GP 之后才起草 |

Tier 依据主 PRD §6.5；各模板里有具体说明。标 ⚠️ 的项见各模板的依据表。

## 统一的虚构示例场景
所有示例都发生在虚构机构 **Wattle Grove Residential Care（VIC）**，18/10/2026，彼此可以互相对照：
- **Mrs Edna Hall**（虚构，88 岁，Room 12 Wattle wing）：15:10 浴室无人目击跌倒 → 15:13 RN 到场 → 右腕 skin tear → 15:45 通知 GP Dr Amelia Brooks → 15:55 通知女儿 Karen Hall → 16:00 通知 Care Manager Grace Liu → 22:45 Daniel Reyes RN 交班给 Sofia Martins RN。对应的模板有 progress note、IMS、跌倒后记录、疼痛、生命体征、伤口、病情恶化、家属沟通、SIRS 准备和交接。
- **Mr Tomasz Nowak**（虚构，81 岁，Room 7 Banksia wing，有 BSP）：对应的模板有 ABC、约束性措施使用和同意（儿子 Marek Nowak 是 VIC temporary SDM）、PRN。
- 其他虚构住户和员工用于入住、疫情、临终、转院、投诉等示例，见各模板。

## 相关
- 按文书类型分类：`03-legal-compliance/references/paperwork-taxonomy.md`
- 按触发事件分类：`03-legal-compliance/references/paperwork-requirements-by-event.md`
- 州差异：`03-legal-compliance/references/state-by-state-comparison.md`、`state-clinical-practice-rules.md`
- 使用这些模板的 PRD：`docs/prds/2026-10-18-event-to-multi-document-drafting.md`、`2026-10-18-demo-workspace-and-synthetic-data.md`
