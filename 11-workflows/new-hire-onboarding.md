# Workflow: new-hire-onboarding

Owner: Lightman · Trigger: 有人入职 · Frequency: on demand

## Inputs
姓名、角色、团队、雇佣类型、开始日期、全职 / 兼职（缺失时询问）

## Steps
| # | Step | Skill | Output | Gate |
|---|---|---|---|---|
| 1 | 加入名册 + 个人入职清单 | onboard-member | `team-members.md`、`onboarding/members/<name>.md` | — |
| 2 | 合规影响检查 | compliance-review（只读） | 新增义务 | 🧑 |
| 3 | 开权限（按角色最小权限） | （人工，参照 access-control.md） | — | 🧑 Lin |

## Done when
入职清单已生成；雇佣合同、FWIS、WorkCover、super 都已确认。
