---
name: refactor-large-file
description: Refactor a code file that exceeds 1000 lines by splitting it along responsibilities into smaller modules (target ≤ 500 lines each) without changing behaviour. Use when the file-length hook, pre-commit or CI reports a file over 1000 lines, or when asked to refactor/split/拆分 a large file. Never shrink line count by minifying, deleting tests/comments or cramming lines.
---

# Refactor Large File

Rule: `rules/02-code-rules.md` core requirement 16. Limit: 1000 lines per code file (`scripts/check-file-length.sh`). Target after refactor: each file ≤ 500 lines.

## 1. Understand before cutting
1. Read the whole file. List its responsibilities: types, constants and policies, pure domain logic, I/O and adapters, UI components, helpers.
2. Find the existing tests that cover it. If coverage of the parts you will move is missing, **write characterization tests first** (core requirement 05), so you can prove behaviour didn't change.
3. Write the split plan as a short table before editing anything: `new file | responsibility | moved symbols | approx lines`. Follow the layering in `rules/02-code-rules.md` §3 (domain / application / adapters / interfaces).

## 2. Split (in small, safe steps)
- Split by **responsibility** (SRP), not by line count. Typical cuts:
  - Types and schemas → `*.types.ts` / `schema.ts`
  - Constants and business policies → `policy.ts` (and keep them DRY, defined once)
  - Pure logic → separate modules in `domain/`
  - Side effects (HTTP, DB, vendor SDKs) → `adapters/`
  - Large UI components → child components plus hooks
- Move one group at a time, update imports, run type-check and tests after each move.
- Keep the public API stable. If the old file was imported elsewhere, either keep it as a thin re-export index for this PR or update every import site in the same PR. Never leave both versions.
- Delete code that is actually dead (confirm with search plus tests). Don't delete code just because it's long.

## 3. Forbidden ways to "reduce lines"
- ❌ Minifying, putting several statements on one line, removing blank lines or formatting
- ❌ Deleting tests, comments that explain "why", or error handling
- ❌ Moving code into a giant `utils.ts` / `helpers.ts` grab-bag (that just relocates the problem)
- ❌ Changing behaviour, public contracts or guardrail logic (docs/PRD.md §9) during the refactor
- ❌ Adding `any`, TODOs or new dependencies to make the split easier

## 4. Done when
- `scripts/check-file-length.sh <all touched files>` passes; every file is ≤ 1000 lines, and ideally ≤ 500.
- Type-check, lint (tabs, width 4) and all tests pass, with the same results as before the refactor.
- The PR description includes the split plan table and states "pure refactor, no behaviour change".
- Changes touching clinical logic, permissions, deletion or prompts are flagged for Lin's review.
