# CLAUDE.md — 本地法律参考库

> 层级：子部门 / 功能区 · 路径：`03-legal-compliance/references/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
2026-10-04 下载的联邦法律、监管指引（law-library/）、aged care 文书模板（paperwork-templates/）、文书分类、各州差异对比。共约 77MB。

## 在这里通常要做的事
- 按主题查原文，生成 PRD 的"法律依据"（legal-reference-check skill）
- 补充资料库缺口（监控设备法、工作场所监控、生物特征、ACL）

## 本目录特有的规则（在根目录规则之外）
- PDF 用 pdftotext 读取，引用时写条款号和页码
- 新下载的文件必须用 file 命令确认是真 PDF，并更新对应的 index.md
- 超过 6 个月没复核的资料视为可能过时

## 关键文件
- README.md
- law-library/index.md（含关键条款摘录）
- paperwork-templates/index.md（含许可说明）
- paperwork-taxonomy.md
- state-by-state-comparison.md
- sources.md

## 不要做
- 不要修改原始 PDF
- 不要把非商业许可的模板放进产品或对外分发

## 相关
- rules/legal-reference-map.md
- 12-skills/legal-reference-check/SKILL.md
