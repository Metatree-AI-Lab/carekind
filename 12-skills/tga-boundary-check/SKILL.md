---
name: tga-boundary-check
description: Check a feature idea, PRD, UI text or marketing copy against careKind's TGA SaMD boundary (green/amber/red). Use before shipping features or publishing copy, or when asked "is this a medical device / TGA ok?".
---

# TGA Boundary Check

1. Read `03-legal-compliance/tga-samd-boundary.md` (including the intended purpose statement and the traffic light table).
2. For the input, assess:
   - Function: does it only transcribe, structure or rephrase what staff said (🟢)? Does it summarise or flag process items (🟡)? Does it interpret data to diagnose, predict, score risk or recommend treatment (🔴)?
   - Wording: flag words that expand the intended purpose: diagnose, detect, predict, prevent, risk score, clinical decision, recommend treatment, monitor condition.
3. Output:
   ```
   Verdict: 🟢 / 🟡 / 🔴
   Reasons:
   Risky wording → safer alternative:
   Required next step: (none / clinical advisor + regulatory review + ADR / do not build)
   ```
4. Always end with: "运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。"
