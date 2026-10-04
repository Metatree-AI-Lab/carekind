---
name: inbox-triage
description: Sort notes in 99-inbox/ into the right Company OS folders. Use weekly or when asked to clean up/整理 inbox. Never moves anything into 10-feedback.
---

# Inbox Triage

1. List `99-inbox/` (skip `README.md`, `weekly/` and `archive/`).
2. For each note, propose a destination folder and an action (merge into an existing doc / new doc / ADR / task / discard). Raw user feedback is the exception: tell the user to enter it into `10-feedback/` themselves, verbatim. Do NOT move it there yourself.
3. Show the plan as a table and wait for 🧑 confirmation. In headless runs, stop after writing the plan to the run log.
4. After confirmation: merge or move the notes, update `Last reviewed` on the docs you touched, and move the processed originals to `99-inbox/archive/`.
