---
paths:
  - "rules/**"
---

# rules — careKind 规范

Owner: Lightman · Last reviewed: 04/10/2026

公司所有人和所有 AI agent 都必须遵守的规范。**"必须 / 禁止"是硬性要求，"应该"是默认做法**（偏离时要在 PR 或文档里说明理由）。

| 规范 | 适用于 | 自动加载（Claude Code） |
|---|---|---|
| [00-company-rules.md](00-company-rules.md) | 所有人：价值观落地、保密、沟通、文档、AI 工具使用 | 始终 |
| [01-operations-rules.md](01-operations-rules.md) | 运营、销售、客户成功、营销、财务、供应商 | 始终 |
| [02-code-rules.md](02-code-rules.md) | 所有代码：**16 条核心要求**（含：单文件超过 1000 行自动触发重构）、Tab 缩进 4、SOLID / DRY / KISS、性能底线、测试、安全、隐私、LLM 代码、Git | 改代码文件时 |
| [03-product-design-rules.md](03-product-design-rules.md) | 产品设计、UX、功能定义（**必须参考本地法律文件**） | 改 docs/、06-app-development/ 时 |
| [04-prd-rules.md](04-prd-rules.md) | 写 PRD（**必须引用本地法律文件**） | 改 docs/ 时 |
| [05-changelog-rules.md](05-changelog-rules.md) | **所有 AI agent**：每次修改都记录到 `changelog/`（编辑明细自动写，任务摘要 AI 必须写） | 始终 |
| [legal-reference-map.md](legal-reference-map.md) | 主题 → 本地法律文件对照表（03、04 共用） | 改 docs/、06-app-development/、03-legal-compliance/ 时 |

## 怎么生效
- **Claude Code**：`.claude/rules → rules/` 软链接，按每个文件 frontmatter 里的 `paths` 自动加载。
- **Codex**：`AGENTS.md` 写明了按任务类型读取哪份规范。
- **人**：入职必读（`05-hr-teams/onboarding/onboarding-checklist.md`）；PR 和 PRD 审核时对照检查。

## 修改规范
规范变更要写 ADR（`02-operating-system/decisions/`），由 Lightman 批准；代码规范的变更还需要 Lin 批准。
