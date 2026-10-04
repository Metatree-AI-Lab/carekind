# Workflow: feature-to-release

Owner: Lightman (PO) + Lin (Tech Lead) · Trigger: 新功能想法 · Frequency: on demand

## Inputs
- `feature`：功能描述（必填）

## Steps
| # | Step | Skill | Output | Gate |
|---|---|---|---|---|
| 1 | TGA 边界预检 | tga-boundary-check | 判定结果 | 🔴 → 停止；🟡 → 🧑 临床顾问 + 法规顾问 |
| 1.5 | 查阅本地法律文件 | legal-reference-check | 法律依据表 + 资料缺口 | 有缺口 → 🧑 律师确认后才能上线 |
| 2 | 写 PRD（必须包含法律依据） | prd-writer | `docs/prds/…` | 🧑 Lightman 审阅 |
| 3 | 临床危害评审 | （人工）| hazard-log 更新 | 🧑 临床顾问接受或拒绝 HAZ |
| 4 | 技术方案 | adr（技术类） | `engineering/adr/NNNN-…` | 🧑 Lin 批准 |
| 5 | 开发 | （app 仓库）| PR | 代码审查 |
| 6 | AI 评测（涉及 AI 时） | （按 evaluation-plan） | 评测报告 | 🧑 临床顾问 + Lin 签字 |
| 7 | 文案检查 | marketing-copy-check（release notes / App 内文字） | 审查表 | — |
| 8 | 发布 | （按 release-process） | 发布说明 | 🧑 Lightman |

## Done when
PRD 状态改为 Approved，功能已发布，监控 48 小时无 P1。
