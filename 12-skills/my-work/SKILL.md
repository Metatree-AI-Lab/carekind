---
name: my-work
description: Show a team member their own outstanding work - PRDs assigned to them, PRDs waiting for their review, blockers, and exactly which stage-gate items are still missing - plus their recent agent work log. Use at the start of a work session, when asked "what do I still have to do", 我还有什么没做, 我的待办, 工作记录, or when Lightman wants a per-member status (--all). Not for assigning (prd-assign) or changing stages (prd-status).
---

# My Work

Rule: `rules/06-adlc-rules.md` §9. Data: `docs/prds/registry.md` (assignments, stages) and `changelog/ai-edits/*.jsonl` (agent edit log, with `member` and `prd` fields).

## Steps
1. Run `scripts/my-work.sh` (current member), `scripts/my-work.sh <name>`, or `scripts/my-work.sh --all` (Lightman's weekly view). If the member is `unknown`, tell the user to set `git config user.name` (must contain their roster name from `05-hr-teams/member-profiles.md`) or `CARE_MEMBER`, and stop.
2. For every PRD the script lists under 负责, read the PRD file and `rules/06-adlc-rules.md` §2, and list the **gate items for the next stage** as ✅ / ❌ with evidence paths (required sections, legal-reference-check and tga-boundary-check done, reviewer, ADR, eval report, sign-offs). Say plainly which ❌ items the member can do now, and which need a person (approval, clinical advisor, Lightman).
3. For PRDs under 评审: list what the member is expected to review and by when if the registry says.
4. Show blockers and stale rows from the script output; suggest the next concrete action for each (e.g. "run prd-status to record the blocker", "ask Lightman to confirm the assignee").
5. Show the recent agent log summary (count of edits, PRDs touched). It is the member's own work record, for them to check and correct; never present it as a performance measure.
6. Read-only: this skill changes nothing. If the user asks to act on an item, hand over to `prd-writer`, `prd-status` or `prd-assign`.

## Don't
- Don't show one member's log to another unless the user is Lightman running `--all`, and even then only PRD-level status, not per-file activity.
- Don't infer effort, productivity or attitude from the log.
- Don't invent items: if a gate can't be checked from the repo, say "cannot verify".
