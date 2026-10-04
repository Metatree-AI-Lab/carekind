# Workflow: quarterly-compliance-review

Owner: Lightman（Privacy Officer）· Trigger: 每季度首周 · Frequency: quarterly · Headless-safe: ✅（只做到提出修改建议）

## Steps
| # | Step | Skill | Output | Gate |
|---|---|---|---|---|
| 1 | 合规总表复核 | compliance-review | 复核报告 + 修改建议 | 🧑 确认后才修改总表 |
| 2 | 子处理方与访问权限审查 | （agent 读取 vendor register、access-control，列出待审项） | 审查清单 | 🧑 Lin |
| 3 | 风险登记复核 | （agent 读取 ai-governance 风险表、hazard-log） | 状态变化建议 | 🧑 |
| 4 | 记录决策 | adr（如有重大变化） | ADR | 🧑 |

## Done when
总表的复核日志新增一行；运行记录已归档。
