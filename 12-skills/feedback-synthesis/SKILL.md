---
name: feedback-synthesis
description: Analyse raw user feedback in 10-feedback/ (READ-ONLY) and update the research synthesis. Use when asked to summarise/analyse feedback, 用户反馈, interview insights. Never edits 10-feedback.
---

# Feedback Synthesis

**Hard rule: `10-feedback/` is read-only raw data. Never create, edit, rename, translate or delete anything in it.**

1. Read all files in `10-feedback/**` (skip README and .gitkeep). Optional input: a date range.
2. For each file, extract: role, setting, pain points, current workflow, concerns about AI, feature requests, and verbatim quotes (copy exactly, without correcting them).
3. Update `06-app-development/research/synthesis.md` (create it if missing) with:
   - Themes table: theme | # of sources | roles | representative quote | source file paths
   - Pain point frequency ranking
   - Opportunities, mapped to `06-app-development/product/product-roadmap.md`
   - Contradictions and open questions
   - Signals with TGA/privacy implications (flag them; don't decide)
4. Every claim must cite at least one source path. Do not generalise from a single source without saying `n=1`.
5. If any raw file appears to contain identifiable resident information, report the file path to the user so a human can redact it. Do not fix it yourself.
