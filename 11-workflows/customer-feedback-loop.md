# Workflow: customer-feedback-loop

Owner: Lightman · Trigger: `10-feedback/` 有新文件 · Frequency: weekly / on demand · Headless-safe: ✅

> `10-feedback/` 由人工录入，AI 只读。

## Steps
| # | Step | Skill | Output | Gate |
|---|---|---|---|---|
| 1 | 分析原始反馈 | feedback-synthesis | synthesis.md 更新 | — |
| 2 | 映射到路线图 | （agent 根据 synthesis 对照 product-roadmap.md 提出调整建议） | 写进运行记录的建议 | 🧑 Lightman 决定是否改路线图 |
| 3 | 高优先级机会写 PRD | prd-writer | PRD 草稿 | 🧑 |

## Done when
synthesis 已更新，并列出了路线图调整建议。
