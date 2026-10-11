---
name: standup
description: Submit the daily standup for the current team member through the AI - collects yesterday / today / blockers, shows newly assigned PRDs and unfinished PRDs, and writes the member's standup record. Use every working day when a member starts work, or when asked for 早会, standup, 站会, 提交 standup, 今天做什么. Also reports the team's standup status and blockers when Lightman asks (digest mode). Not for assigning PRDs (prd-assign) or changing PRD stages / recording a blocker in the registry (prd-status).
---

# Standup

Rule: `rules/06-adlc-rules.md` §10. Records live in `02-operating-system/standups/members/<Name>/YYYY-MM-DD.md` (Melbourne date). The record is the **member's own report**: you prepare and remind, the member confirms. Never invent content.

## Mode A — submit (default)
1. **Who.** Run `scripts/my-work.sh` and read its header. If the member is `unknown`, tell them to set `git config user.name` or `CARE_MEMBER` and stop. You may only write the **current member's** record, never someone else's.
2. **Already submitted?** If `02-operating-system/standups/members/<Name>/<today>.md` exists, show it and ask whether to add a supplement (append under `## 补充`; never delete or rewrite earlier text). On a weekend, say standup is not required, but allow submitting.
3. **Gather facts (read-only):**
   - assigned unfinished PRDs, PRDs waiting for their review, blockers, stale rows → `scripts/my-work.sh` output;
   - **newly assigned** PRDs since their last standup → the `🆕 新分配` lines of the same output;
   - agent work since their last standup → `changelog/ai-edits/*.jsonl` filtered by their `member` (use only to **jog memory**).
4. **Ask the member, in one message:**
   1. 昨天（上次 standup 以来）完成了什么？ — offer a **draft hint** from the work log (PRDs touched, number of files) clearly labelled as a hint; the member must confirm or rewrite it.
   2. 今天计划做什么？ — suggest picking from their unfinished PRDs and the missing gate items of their next stage (see `my-work` skill for the checklist).
   3. 有什么 blocker？ — include any registry blocker on their PRDs; ask who/what is needed and for which PRD.
   - Also ask them to acknowledge each 🆕 新分配 PRD ("已看到"). If the member is on leave or not working today, record `休假 / 不工作` with **no reason**.
5. **Wait for the answers.** Don't fill gaps. If an answer is empty, write `（未填写）`; don't guess.
6. **Write the record** (create directories if needed) in exactly this format:
   ```markdown
   # Standup · <Name> · DD/MM/YYYY
   Member: <Name> · Date: YYYY-MM-DD · Status: 已提交 | 休假/不工作 · Via: claude-code | codex · Session: <session id if known>

   ## 昨天完成
   - <member's words>

   ## 今天计划
   - [<prd-slug>] <member's words>

   ## Blockers
   - 无
   - [<prd-slug>] <what is blocked> · 需要：<who / what> · 影响：<what slips>

   ## 新分配（已确认看到）
   - 无 | <prd-slug>

   ## PRD 状态快照（自动，来自 registry）
   - <prd-slug> · <stage> → <next stage>
   ```
   No prompts, no resident/health information, no personal reasons.
7. **Blockers → registry.** For each blocker tied to a PRD, offer to record it in the registry with `prd-status` (Blocked column: `原因 · 等谁 · 复查日期`). Do it only after the member agrees. A blocker that needs a decision from Lightman or the clinical advisor: say so explicitly and tell the member to raise it with them.
8. **Close with a short summary:** what was recorded, PRDs still unfinished, new assignments, blockers raised. Editing standup records does not need a changelog summary (the edit itself is still logged automatically).

## Mode B — digest (Lightman only)
Run `scripts/my-work.sh --all`; for today's records read each `members/*/<today>.md`. Report: who submitted / who did not, blockers by PRD with who is needed, newly assigned PRDs that nobody has acknowledged, PRDs with no movement. Read-only. Report PRD- and blocker-level facts; do not rank or compare people, and don't quote members' "昨天完成" text as a performance view.

## Don't
- Don't write for another member, and don't submit on a member's behalf without their answers.
- Don't treat a missing standup as misconduct; just remind.
- Don't change registry stages or assignees here (use `prd-status` / `prd-assign`).
- Don't use standup content for performance evaluation (rules §10.4).
