# standups — 每日 Standup 记录

Owner: Lightman · Status: Draft · Last reviewed: 11/10/2026

每位成员在每个工作日开始工作前，通过 AI（`/standup` skill）提交当天的 standup。规则见 [`rules/06-adlc-rules.md`](../../rules/06-adlc-rules.md) §10。

## 内容
- `members/<姓名>/YYYY-MM-DD.md`：每人每天一份记录（昨天完成 / 今天计划 / Blockers / 新分配 / PRD 状态快照）

## 怎么用
- 成员：在 Claude Code 里输入 `/standup`，回答三个问题，确认后 AI 写入记录。
- 提醒：每次会话开始，如果你今天还没提交，会收到提醒；也会提醒你新分配的 PRD、未完成的 PRD 和 blockers。
- Lightman：`scripts/my-work.sh --all` 看今天谁已提交、谁没有，以及汇总的 blockers。

## 注意
- 记录由成员本人确认后才写入，AI 不替成员编内容。
- **不用于绩效考核或比较成员**（规则 §10.4）。不要写住户信息、健康信息，也不要写个人原因（休假只写"休假"）。
