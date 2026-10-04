# Workflow: incident-response

Owner: Privacy Officer（Lightman）+ Lin · Trigger: 发现事故 · Frequency: immediate · Headless-safe: ❌（必须交互）

## Steps
| # | Step | Skill | Output | Gate |
|---|---|---|---|---|
| 1 | 建事故记录 + 控制清单 | incident-triage | `03-legal-compliance/incidents/INC-…` | — |
| 2 | 控制 | （人工执行） | 已控制 | 🧑 Lin |
| 3 | NDB 评估（30 天内） | （人工 + 律师） | 是否属于 eligible breach | 🧑 Privacy Officer |
| 4 | 通知 | （人工） | OAIC / 个人 / provider / 保险 | 🧑 |
| 5 | 复盘 | adr（如需要改流程） | 根因 + 改进措施 | 🧑 |

## Done when
事故报告已关闭；涉及 AI 错误的，相关场景已加入评测集。
