# 12 Skills

Owner: Lin (Tech Lead) · Last reviewed: 04/10/2026

可复用的单项 AI 能力，使用 Agent Skills 标准格式（`<skill>/SKILL.md`，frontmatter 包含 `name` 和 `description`）。

**Claude Code 与 Codex 共用这一份**：
- `.claude/skills → 12-skills/`（Claude Code 自动发现；用 `/skill-name` 调用）
- `.agents/skills → 12-skills/`（Codex 自动发现；用 `$skill-name` 或 `/skills` 调用）
- 两个工具也会根据 `description` 自动匹配调用

| Skill | 用途 |
|---|---|
| [run-workflow](run-workflow/SKILL.md) | 执行 `11-workflows/` 中的流程 |
| [weekly-update](weekly-update/SKILL.md) | 生成周报 |
| [feedback-synthesis](feedback-synthesis/SKILL.md) | 分析 `10-feedback/`（只读）→ synthesis |
| [prd-writer](prd-writer/SKILL.md) | 写 PRD（含 TGA、隐私、危害三项必填） |
| [refactor-large-file](refactor-large-file/SKILL.md) | 代码文件超过 1000 行时按职责拆分重构（hook / pre-commit / CI 自动触发） |
| [legal-reference-check](legal-reference-check/SKILL.md) | 查阅本地法律文件，生成 PRD 和设计必需的"法律依据"一节 |
| [tga-boundary-check](tga-boundary-check/SKILL.md) | 功能 / 文案的 TGA 边界检查 |
| [marketing-copy-check](marketing-copy-check/SKILL.md) | 对外内容合规检查 |
| [compliance-review](compliance-review/SKILL.md) | 合规总表复核 |
| [adr](adr/SKILL.md) | 新建决策记录 |
| [onboard-member](onboard-member/SKILL.md) | 新成员入职 |
| [inbox-triage](inbox-triage/SKILL.md) | 整理 inbox |
| [incident-triage](incident-triage/SKILL.md) | 事故 / 数据泄露初步响应 |

## 新增 skill
1. 新建 `12-skills/<kebab-name>/SKILL.md`，必须有 `name`（与目录名一致）和 `description`（写清楚什么时候该用、什么时候不该用）
2. 正文用英文写步骤（两个工具执行最稳定），产出内容按 AGENTS.md 的语言规则
3. 需要的脚本或参考资料放在同一目录下（`scripts/`、`references/`）
4. 更新上表
5. 所有 skill 都必须遵守：不写 `10-feedback/`、不编造、遇到人工确认步骤就停下
