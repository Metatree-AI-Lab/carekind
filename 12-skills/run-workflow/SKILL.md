---
name: run-workflow
description: Execute a careKind Company OS workflow from 11-workflows/ step by step. Use when the user says "run/execute/跑/执行 <name> workflow", or names a workflow file. Do not use for single tasks that a single skill covers.
---

# Run Workflow

1. List `11-workflows/*.md` (exclude README). If the requested name is ambiguous, show the list and ask.
2. Read the workflow file fully. Note its inputs, steps, the skills each step uses, and the `🧑 人工确认` gates.
3. Collect any missing inputs from the user before starting (in non-interactive runs, use the defaults the workflow declares; if a required input has no default, stop and report).
4. Execute steps in order. For each step: announce `Step N/M: <title>`, invoke the named skill (read `12-skills/<skill>/SKILL.md` and follow it), then report the output files.
5. At a `🧑 人工确认` gate: in an interactive session, stop and wait. In a headless run (`scripts/run-workflow.sh`), do NOT proceed past the gate — finish the run and list what awaits approval.
6. Never write to `10-feedback/`.
7. Finish by writing `11-workflows/runs/YYYY-MM-DD_<workflow>.md`:
   ```
   # Run: <workflow> · <date> · agent: <claude|codex>
   ## Steps
   | # | Step | Status (done/skipped/blocked) | Output |
   ## Awaiting human approval
   ## Issues / follow-ups
   ```
