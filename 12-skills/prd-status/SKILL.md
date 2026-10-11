---
name: prd-status
description: Show the PRD board (all PRDs by ADLC stage, assignee, blockers) or advance / roll back / block / cancel one PRD's lifecycle stage after checking the stage gates. Use when asked for PRD status, 看板, PRD 进度, "move PRD to review/in progress", or to record a blocker. Not for assigning an owner (use prd-assign).
---

# PRD Status

The registry `docs/prds/registry.md` is the single source of truth for stage and assignee. Stages, gates and who may advance each one are in `rules/06-adlc-rules.md` §2 — read it first and apply the gates exactly.

## Mode A — board (read only)
1. Read the registry and run `scripts/check-prd-registry.sh`.
2. Output a table grouped by stage: PRD, assignee, reviewer, complexity/risk, blocked, days since 更新.
3. Highlight: rows with a check error, `blocked` rows, rows in one stage for more than 10 working days, members over `wip_limit` (from `05-hr-teams/member-profiles.md`), PRDs in `draft` or later with no assignee.
4. Don't write anything.

## Mode B — change a stage
1. Identify the PRD and the target stage. Only the transitions in rules §2 are allowed (plus the two rollbacks). No skipping stages.
2. **Check the gate** for the target stage by reading the actual PRD / ADR / hazard log / eval report. Report each gate item as ✅ / ❌ with the evidence path. If any ❌, stop and say what is missing.
3. **Human-only stages.** `approved` and `released` can only be set by a human. If the target is one of them: collect the gate evidence, tell Lightman exactly what to confirm, and **stop** (🧑). Only write it after Lightman states in this conversation that the approvals were given; record who and when. Never edit a PRD header to `Approved` yourself except in that case, and never invent an approval date.
4. For `idea → draft` the PRD needs an assignee. If it has none, run `prd-assign` first. For `draft → in_review` (and later), a PRD that is R3 or beyond its assignee's default level (e.g. a junior on anything above S) needs a **senior-or-above reviewer** in the registry; `scripts/check-prd-registry.sh` enforces it, so stop and ask Lightman who the reviewer is if it is empty.
5. Update the row (阶段, 更新 date) and **append** a row to 变更历史 with the reason and evidence. Never edit old history rows.
6. `blocked`: set the Blocked column to `原因 · 等谁 · 复查日期`; clear it with `—` when resolved (and add a history row either way).
7. `cancelled` / `superseded`: 🧑 Lightman decides; the reason is mandatory (and the new PRD for `superseded`). Assignee stays as is for the record.
8. Run `scripts/check-prd-registry.sh`; append a changelog summary (`rules/05-changelog-rules.md`).

## Don't
- Don't advance a PRD whose TGA verdict is 🔴.
- Don't change an assignee here (use `prd-assign`).
- Don't treat an agent's own review as an approval.
