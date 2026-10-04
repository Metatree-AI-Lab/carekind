# Workflow: marketing-content-publish

Owner: Lightman · Trigger: 发布任何对外内容前 · Frequency: on demand

## Inputs
- `content`：文案或文件路径（必填）、`channel`（官网 / LinkedIn / 邮件 / deck）

## Steps
| # | Step | Skill | Output | Gate |
|---|---|---|---|---|
| 1 | 合规与品牌检查 | marketing-copy-check | 审查表 | 有 block 项 → 停止 |
| 2 | 修改 | （agent 按审查表提出修改稿） | 修改稿 | — |
| 3 | 复查 | marketing-copy-check | 无 block 项 | — |
| 4 | 发布 | （人工） | 已发布 | 🧑 Lightman |

## Done when
没有 block 项，并且已由人工发布。邮件渠道还要确认 Spam Act 要求（同意、身份、退订）都已满足。
