---
name: prd-assign
description: Assign (or reassign) a PRD to exactly one team member as its assignee, using the ADLC assignment rules (member level junior/mid/senior/lead, tech tracks, workload, risk). Use when asked to assign / reassign / who should own a PRD, 分配 PRD, 指派负责人. Not for advancing a PRD's stage (use prd-status) or writing the PRD (use prd-writer).
---

# PRD Assign

Every PRD has **exactly one** assignee (a human, never an AI agent), and the **whole PRD goes to that one person** - never split one PRD across several assignees by track. You recommend; **Lightman confirms** (🧑); Lightman may also **designate** someone directly (rules §5.1). Rules and weights live in `rules/06-adlc-rules.md` — read it first and do not restate or change its numbers here.

## Inputs
- The PRD: a file in `docs/prds/` (required). If the user names none, list registry rows with an empty or `—` assignee and ask which one.
- Optional: `growth mode` (adds the growth bonus), a reassignment reason, or a **designated assignee** (Lightman names a person; see Designation below).

## Steps
1. Read `rules/06-adlc-rules.md`, `docs/prds/registry.md` and `05-hr-teams/member-profiles.md`.
2. **Read the PRD** and score it per rules §3: complexity (4 dimensions → S/M/L) and risk (R1/R2/R3, highest hit wins). List the tech tracks it needs. Show the per-dimension points and the evidence (section of the PRD) — the user can override any of them.
   - **Do not split by default.** If the PRD needs 3+ tracks, still assign the whole PRD to one person; just list members who could help (contributors, not accountable, from `member-profiles.md`) and note them in the history row. Offer a split into sub-PRDs only if Lightman asks for it.
3. **Profile check.** Any member whose `level` / tracks / `wip_limit` are `{{TBD}}` is excluded. List who was excluded and which fields are missing. **Never guess a level or track.** If nobody is eligible, report what is missing (profile, capacity, a second senior for R3 review) and stop — do not loosen the rules.
4. **Current WIP** per member = registry rows with that Assignee in `draft`…`verifying` (L counts 2 for senior/lead, rules §5). Ignore `idea`, `released` and later.
5. **Hard filters** (rules §5), then **score** (rules §6). Show a table for the top 3: each factor's points, total, and one sentence of reasoning. Also show who was filtered out and why.
6. **Reviewer.** R3 needs a senior-or-above reviewer who is not the assignee. If none exists, write `🧑 需外部评审` and surface it to Lightman. Never propose an AI agent as reviewer.
7. **🧑 Stop and ask Lightman to confirm** one assignee (and reviewer if required). Do not write the registry before confirmation. If nobody passes the filters, say what is missing and offer the options: wait, change profiles, or **designate** (below) - never loosen the filters yourself.
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
Recommended assignee: <name> (@<github handle from member-profiles.md>)   Reviewer: <name> (@<handle>)
Helpers (not accountable): <names, scope>      (only if the PRD spans many tracks)
🧑 Please confirm (or designate someone else).

Designation output:
Designated by Lightman: <name>   Complexity: L   Risk: R3
⚠️ Overrides: junior × L; junior × R3; ...
Mitigations: reviewer <senior> (required from in_review); design review + every PR; escalate blockers after 2 working days
Registry row + history row (指定覆盖) written.
```

## Designation (Lightman names the assignee) - rules §5.1
When Lightman says who should take the PRD (for example "give the whole design system to Gary"), that is a designation. Only Lightman can do this; if anyone else asks for an override, tell them it needs Lightman.
1. Still score the PRD and run the filters, then **list every rule the designation overrides** (e.g. `junior × L`, `junior × R3`, `WIP will exceed the limit`, `profile field TBD`). Don't hide them and don't argue the designation away.
2. Iron rules are never overridden: one human assignee, not an AI agent, reviewer ≠ assignee, `approved` / `released` human-only, stage gates.
3. **Mitigations are mandatory** (rules §5.1): a senior-or-above reviewer for any R3 and for any PRD beyond the assignee's default level, filled in the registry from `in_review` onwards (the check script enforces it); reviewer joins the design review and every PR; blockers escalate to the reviewer after 2 working days; helpers and their scope go in the history row. If there is no senior reviewer available, write `🧑 需外部评审` and ask Lightman.
4. Write the registry row (assignee, reviewer, complexity, risk) and **append** a history row that starts with `指定覆盖`, then the overridden rules, Lightman's reason, and the mitigations.
5. Show the overrides again in the output so the assignee and reviewer can see them.

## GitHub handles
`member-profiles.md` has a `github` column. The registry keeps the person's **name** (the single source of truth); show the handle next to it so it can be used for GitHub PR/issue assignment. Handles marked `（示例）` are demo placeholders, not real accounts: say so in the output and never run `gh` commands against them. Do not create or guess GitHub accounts.

## Reassignment
Same flow. Ask for the reason (capacity, skill gap, leave, scope change). The old assignee must be told; note that in the history row. A PRD in `in_progress` or later should only be reassigned with an explicit handover note (what is done, open branches/PRs) in the history row.

## Don't
- Don't assign more than one person, a team, "TBD", or an AI agent, and don't split one PRD across people unless Lightman asks.
- Don't let anyone but Lightman override the filters, and don't skip the mitigations when he does.
- Don't change PRD status, `Status:` in the PRD header, or approvals.
- Don't use assignment data to rate people; it is workload routing only.
- Don't edit `05-hr-teams/member-profiles.md` — propose changes and let the person and Lightman confirm.
