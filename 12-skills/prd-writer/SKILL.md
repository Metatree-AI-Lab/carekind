---
name: prd-writer
description: Create a PRD for a careKind feature using the PRD template, including the mandatory TGA boundary, privacy and clinical hazard sections. Use when asked to write/draft a PRD, spec or 需求文档.
---

# PRD Writer

1. Read `06-app-development/product/prd-template.md`, `06-app-development/product/product-principles.md`, `03-legal-compliance/tga-samd-boundary.md`, `03-legal-compliance/privacy-program.md` and `06-app-development/clinical-safety/hazard-log.md`.
2. Ask for (or infer from the user's description) the problem, users and evidence. Pull supporting evidence from `06-app-development/research/synthesis.md` and cite it. Do not invent evidence.
3. Write `docs/prds/YYYY-MM-DD-<slug>.md` from the template.
4. **Legal basis (mandatory, see `rules/04-prd-rules.md`)**: run the `legal-reference-check` skill and paste its output as the "法律依据（本地参考文件）" section. A PRD without this section is invalid.
5. Section 5 (TGA): run the `tga-boundary-check` skill and paste its verdict.
6. Section 7 (hazards): propose new HAZ entries but mark them `Proposed`. Only the clinical advisor accepts them into the hazard log.
7. Follow `rules/03-product-design-rules.md` §2 (the pre-design questions). Set the status to `Draft`. The approvals table is left for humans to fill.
