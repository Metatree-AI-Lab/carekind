---
name: onboard-member
description: Onboard a new careKind team member — add them to the roster and team page, and generate a personalised onboarding checklist. Use when someone joins/is hired (入职).
---

# Onboard Member

Inputs: name, role, team, employment type (employee/contractor/advisor), start date, full- or part-time.

1. Read `05-hr-teams/team-members.md`, `05-hr-teams/onboarding/onboarding-checklist.md` and `05-hr-teams/policies/employment-compliance.md`.
2. Add a row to `team-members.md` and to `05-hr-teams/teams/<team>/README.md`. Record work info only. Never record TFN, bank details, address, visa details or police check results.
3. Create `05-hr-teams/onboarding/members/<name>.md`: the checklist tailored to the person's employment type, e.g. FWIS, PAYG/STP, super and WorkCover for employees; contractor agreement, IP assignment and an ABN check for contractors; plus role-specific reading (engineering → `04-security/`, `ai-governance.md`, `tga-samd-boundary.md`).
4. Make sure any new folder you create has README.md and CLAUDE.md (templates in 09-templates/).
5. If they are the first person in a new employment type or state, run `compliance-review` and flag the new obligations.
