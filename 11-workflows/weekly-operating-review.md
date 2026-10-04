# Workflow: weekly-operating-review

Owner: Lightman · Trigger: 每周五 · Frequency: weekly · Headless-safe: ✅

## Inputs
- `week`: default = 当前 ISO 周（Australia/Melbourne 时间）

## Steps
| # | Step | Skill | Output | Gate |
|---|---|---|---|---|
| 1 | 整理 inbox | inbox-triage | 整理方案 | 🧑 确认后才移动文件 |
| 2 | 更新反馈洞察 | feedback-synthesis | `06-app-development/research/synthesis.md` | — |
| 3 | 检查合规事项是否有逾期 | compliance-review（只做步骤 1–4，只读） | 逾期与即将到期清单 | — |
| 4 | 生成周报 | weekly-update | `99-inbox/weekly/YYYY-WW.md` | 🧑 Lightman 审阅 |

## Done when
周报已生成；运行记录写入 `runs/`。
