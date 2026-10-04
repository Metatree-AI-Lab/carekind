#!/usr/bin/env bash
# Run a Company OS workflow headlessly with Claude Code or Codex.
# Usage: scripts/run-workflow.sh <workflow-name> [claude|codex]
# Example (cron, Fridays 4pm Melbourne):  0 16 * * 5  cd ~/Documents/sites/carekind && scripts/run-workflow.sh weekly-operating-review claude
set -euo pipefail

WF="${1:?usage: run-workflow.sh <workflow-name> [claude|codex]}"
AGENT="${2:-claude}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

[[ -f "11-workflows/$WF.md" ]] || { echo "No such workflow: 11-workflows/$WF.md" >&2; ls 11-workflows/*.md >&2; exit 1; }
if grep -q "Headless-safe: ❌" "11-workflows/$WF.md"; then
  echo "Workflow '$WF' must be run interactively." >&2; exit 1
fi

mkdir -p 11-workflows/runs/logs
LOG="11-workflows/runs/logs/$(date +%Y-%m-%d_%H%M)_${WF}_${AGENT}.log"
PROMPT="Use the run-workflow skill to execute workflow '$WF' (11-workflows/$WF.md). This is a HEADLESS run: use input defaults, do not pass any 🧑 human-approval gate, never write to 10-feedback/, and write the run record to 11-workflows/runs/. Agent: $AGENT."

case "$AGENT" in
  claude)
    # acceptEdits lets Claude write files in this repo without prompting; it cannot run arbitrary shell commands unattended.
    claude -p "$PROMPT" --permission-mode acceptEdits 2>&1 | tee "$LOG" ;;
  codex)
    # workspace-write sandbox: may edit files inside this repo only.
    codex exec --sandbox workspace-write "$PROMPT" 2>&1 | tee "$LOG" ;;
  *) echo "Unknown agent: $AGENT (use claude|codex)" >&2; exit 1 ;;
esac
