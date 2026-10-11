---
name: prd-assign
description: Assign (or reassign) a PRD to exactly one team member as its assignee, using the ADLC assignment rules (member level junior/mid/senior/lead, tech tracks, workload, risk). Use when asked to assign / reassign / who should own a PRD, 分配 PRD, 指派负责人. Not for advancing a PRD's stage (use prd-status) or writing the PRD (use prd-writer).
---

# PRD Assign

Every PRD has **exactly one** assignee (a human, never an AI agent). You recommend; **Lightman confirms** (🧑). Rules and weights live in `rules/06-adlc-rules.md` — read it first and do not restate or change its numbers here.

## Inputs
- The PRD: a file in `docs/prds/` (required). If the user names none, list registry rows with an empty or `—` assignee and ask which one.
- Optional: `growth mode` (adds the growth bonus), a requested assignee (still run the checks), or a reassignment reason.

## Steps
1. Read `rules/06-adlc-rules.md`, `docs/prds/registry.md` and `05-hr-teams/member-profiles.md`.
2. **Read the PRD** and score it per rules §3: complexity (4 dimensions → S/M/L) and risk (R1/R2/R3, highest hit wins). List the tech tracks it needs. Show the per-dimension points and the evidence (section of the PRD) — the user can override any of them.
   - L complexity needing 3+ tracks → recommend splitting into sub-PRDs first (each gets one assignee, `Parent` column). Stop and ask unless the user says to continue.
3. **Profile check.** Any member whose `level` / tracks / `wip_limit` are `{{TBD}}` is excluded. List who was excluded and which fields are missing. **Never guess a level or track.** If nobody is eligible, report what is missing (profile, capacity, a second senior for R3 review) and stop — do not loosen the rules.
4. **Current WIP** per member = registry rows with that Assignee in `draft`…`verifying` (L counts 2 for senior/lead, rules §5). Ignore `idea`, `released` and later.
5. **Hard filters** (rules §5), then **score** (rules §6). Show a table for the top 3: each factor's points, total, and one sentence of reasoning. Also show who was filtered out and why.
6. **Reviewer.** R3 needs a senior-or-above reviewer who is not the assignee. If none exists, write `🧑 需外部评审` and surface it to Lightman. Never propose an AI agent as reviewer.
7. **🧑 Stop and ask Lightman to confirm** one assignee (and reviewer if required). Do not write the registry before confirmation.
8. After confirmation, edit `docs/prds/registry.md`:
   - set Assignee, Reviewer, 复杂度, 风险 and 更新 date on the PRD's row (one row per PRD; create it if missing);
   - **append** a row to 变更历史: date, PRD, `assignee: <old> → <new>`, the reason / score summary, and who confirmed. Never edit old history rows.
   - if the PRD is at `idea`, leave the stage alone (use `prd-status` to move it to `draft`).
9. Run `scripts/check-prd-registry.sh`. Fix any error you caused. If it still fails, report the output.
10. Per `rules/05-changelog-rules.md`, append a task summary to `changelog/YYYY-MM.md`.

## Output format
```
PRD: <file>   Complexity: M (scope 1, tech 1, uncertainty 1, deps 0)   Risk: R3 (reason)   Tracks: backend, ai-eval
Excluded: Gary (level/tracks TBD), Lightman (PO, not a dev assignee)
| Rank | Member | Track 40 | Level 25 | Load 20 | Context 15 | Growth | Total | Why |
Recommended assignee: <name>   Reviewer: <name>
🧑 Please confirm (or pick another).
```

## Reassignment
Same flow. Ask for the reason (capacity, skill gap, leave, scope change). The old assignee must be told; note that in the history row. A PRD in `in_progress` or later should only be reassigned with an explicit handover note (what is done, open branches/PRs) in the history row.

## Don't
- Don't assign more than one person, a team, "TBD", or an AI agent.
- Don't change PRD status, `Status:` in the PRD header, or approvals.
- Don't use assignment data to rate people; it is workload routing only.
- Don't edit `05-hr-teams/member-profiles.md` — propose changes and let the person and Lightman confirm.
