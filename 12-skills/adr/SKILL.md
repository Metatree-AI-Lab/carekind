---
name: adr
description: Create a new Architecture/Decision Record (ADR) with the next number. Use when a decision is made or proposed — company-level (02-operating-system/decisions) or technical (06-app-development/engineering/adr).
---

# ADR

1. Decide the scope. Company-level decisions (equity, vendors that handle customer data, entering SaMD, hiring, big contracts, privacy exceptions) go in `02-operating-system/decisions/`. Technical decisions go in `06-app-development/engineering/adr/`.
2. Find the highest existing number and add 1 (4 digits).
3. Copy `09-templates/adr-template.md` to `NNNN-<kebab-title>.md`, fill it in from the user's input, and set the status to `Proposed` unless the user says it is accepted.
4. Add a row to that folder's README index.
5. List any docs the decision requires updating (e.g. compliance register, sub-processor register, privacy policy) as follow-ups. Don't silently edit them.
