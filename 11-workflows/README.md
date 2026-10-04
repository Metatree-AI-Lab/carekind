# 11 Workflows

Owner: Lightman · Last reviewed: 04/10/2026

Workflow = 把多个 skill（`12-skills/`）串起来的固定流程。Claude Code 和 Codex 都可以执行。

## 怎么运行
| 方式 | Claude Code | Codex |
|---|---|---|
| 交互式 | 说"跑 weekly-operating-review workflow"，或 `/run-workflow weekly-operating-review` | 说同样的话，或 `$run-workflow weekly-operating-review` |
| 无人值守 / 定时 | `scripts/run-workflow.sh weekly-operating-review claude` | `scripts/run-workflow.sh weekly-operating-review codex` |

无人值守运行遇到 `🧑 人工确认` 会停下，把待确认事项写进 `runs/` 里的运行记录，不会越过人工确认步骤继续执行。

## Workflow 列表
| Workflow | 触发 | 频率 |
|---|---|---|
| [weekly-operating-review](weekly-operating-review.md) | 每周五 | 每周 |
| [feature-to-release](feature-to-release.md) | 新功能想法 | 按需 |
| [customer-feedback-loop](customer-feedback-loop.md) | 新反馈录入后 | 每周 / 按需 |
| [marketing-content-publish](marketing-content-publish.md) | 发布对外内容前 | 按需 |
| [quarterly-compliance-review](quarterly-compliance-review.md) | 每季度首周 | 每季度 |
| [new-hire-onboarding](new-hire-onboarding.md) | 有人入职 | 按需 |
| [incident-response](incident-response.md) | 发现事故 | 立即 |

## 新增 workflow
复制下面的格式，存为 `11-workflows/<kebab-name>.md`，并更新上表。
```
# Workflow: <name>
Owner · Trigger · Frequency
## Inputs（含默认值）
## Steps
| # | Step | Skill | Output | Gate |
## Done when
```
