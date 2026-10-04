---
name: legal-reference-check
description: Find and cite the local Australian legal reference files (03-legal-compliance/references/) that apply to a feature, design, PRD or copy, and produce the mandatory "法律依据（本地参考文件）" section. Use whenever designing a product feature or writing/reviewing a PRD, and when asked which laws apply. Not legal advice.
---

# Legal Reference Check

1. Read `rules/legal-reference-map.md`. Then read the internal conclusions it lists in step 1, as relevant: `03-legal-compliance/compliance-register.md`, `tga-samd-boundary.md`, `privacy-program.md`, `aged-care-regulatory.md`, `ai-governance.md`, and `docs/PRD.md` §9.
2. From the input (feature description, design or PRD), list the topics it touches. Go through every row of the map's topic table and decide yes or no for each.
3. For each topic marked yes, **open the local files**. For PDFs, read the relevant pages (use `pdftotext` via Bash if it's available, otherwise the Read tool with page ranges). For each file, extract the specific requirement that constrains this feature, and record the clause or page number when you can identify it.
   - Only cite files that exist. Check the paths with `ls`.
   - Never state a legal requirement that you didn't find in a local file or an official source you actually fetched.
4. Check the map's **gaps** table. If the feature touches a gap topic, add it under "本地资料缺口" with `⚠️ 本地无资料，需律师确认` and mark it as a launch gate.
5. Flag local files that may be stale: the index date is more than 6 months old, or the file is marked legacy (e.g. the SIRS Guidelines 2022).
6. Output the section in the format required by `rules/04-prd-rules.md` §2:
   ```
   ## 法律依据（本地参考文件）
   | 主题 | 本地文件 | 条款 / 页码 | 对本功能的约束 |
   ### 本地资料缺口
   ### 可能过时的资料
   > 运营参考，不是法律意见。
   ```
7. Do not modify the law library or the compliance register. Only propose changes (the `compliance-review` skill owns those edits).
