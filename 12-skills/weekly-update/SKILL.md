---
name: weekly-update
description: Draft the careKind weekly update (周报) from OKRs, the inbox, run logs and research synthesis. Use on Fridays or when asked for a weekly update/周报. Not for monthly investor updates.
---

# Weekly Update

Inputs: week number (default: current ISO week, Australia/Melbourne time).

1. Read `01-strategy/okrs.md`, `99-inbox/` (excluding `weekly/`), `11-workflows/runs/` from the last 7 days, `06-app-development/research/synthesis.md` if it exists, and `git log --since="7 days ago" --oneline`.
2. Fill `09-templates/weekly-update.md` and save it as `99-inbox/weekly/YYYY-WW.md`.
3. Rules: only report facts found in those sources; mark any KR with no data as `—` and never invent a score. Customer insights must be de-identified. Write in Chinese.
4. List any "⚠️ 风险与合规事项" found, e.g. overdue items in `03-legal-compliance/compliance-register.md`.
