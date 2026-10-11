# 成员工作画像 (Member Profiles)

Owner: Lightman · Status: Draft · Last reviewed: 11/10/2026

> 供 `prd-assign` skill 分配 PRD 使用，规则见 [`rules/06-adlc-rules.md`](../rules/06-adlc-rules.md) §4–§6。
> **只记录工作能力和容量**。绩效评价、薪酬、合同、个人档案**不放本仓库**（见 `team-members.md`）。画像不用于绩效考核。
> 值是 `{{TBD}}` 的成员**不参与自动推荐**：先由本人和 Lightman 确认后再填写，AI 不能替人猜。

字段取值：`level` = junior / mid / senior / lead；方向 = fullstack · frontend · backend · mobile · ai-eval · infra-security（含 DevOps）· product-ux（产品思维、交互、视觉审美）· docs-ops

| 姓名 | level | primary_tracks | secondary_tracks | wip_limit | r3_eligible | strengths（自由文字，不计分） | growth_goal | 可作为 assignee | 备注 |
|---|---|---|---|---|---|---|---|---|---|
| Lightman | — | docs-ops | — | 2 | 否 | — | — | 仅 docs-ops 类 PRD | PO / 审批人，不做开发类 assignee |
| Lin | senior | {{TBD}} | {{TBD}} | 2 | 是 | Tech Lead：架构、安全、AI 评测、技术决策 | {{TBD}} | 待填 primary_tracks 后启用 | 还要做 R3 评审；wip_limit 取默认值 |
| Gary | junior | product-ux | {{TBD}} | 1 | 否 | 产品思维、审美 | {{TBD}} | 是（S 复杂度、R1/R2；见规则 §5） | 具体写代码的方向（frontend / fullstack 等）待确认；wip_limit、r3_eligible 取 junior 默认值 |
| Windston | {{TBD}} | infra-security | {{TBD}} | {{TBD}} | {{TBD}} | 擅长 DevOps | {{TBD}} | 否（level 未填） | level 待确认；确认前不参与推荐 |

## 填写说明
- `level` 以**这个人能独立负责到什么程度**为准，不是年限：
  - junior：需要明确的任务边界和评审，适合方案清楚的小 PRD
  - mid：能独立完成一个模块内的 PRD，复杂问题会主动求助
  - senior：能独立处理跨模块、不确定性高的 PRD，能评审别人的方案
  - lead：senior + 对架构、安全、AI 评测的最终技术决策负责
- `fullstack` 表示前后端都能独立交付；如果只是"都写过"，请填在 `secondary_tracks`。
- 每季度和本人一起复核一次画像（跟 `quarterly-compliance-review` 一起做）；本人可以随时申请调整。

## 变更历史（只追加）
| 日期 | 成员 | 变更 | 确认人 |
|---|---|---|---|
| 11/10/2026 | 全员 | 创建画像表 | — |
| 11/10/2026 | Lin、Gary、Windston | 按 Lightman 的说明填写：Lin = senior；Gary = junior，强项产品思维和审美（方向 product-ux）；Windston 擅长 DevOps（方向 infra-security）。未说明的字段保持 `{{TBD}}`；wip_limit 与 r3_eligible 取规则默认值。新增方向 `product-ux` | Lightman（对话中口头确认；⚠️ 待本人核对） |
