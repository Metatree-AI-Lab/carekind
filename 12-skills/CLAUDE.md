# CLAUDE.md — 12 Skills（AI 技能）

> 层级：部门 · 路径：`12-skills/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
Agent Skills 标准格式的 skill，Claude Code（.claude/skills）和 Codex（.agents/skills）通过软链接共用。

## 在这里通常要做的事
- 新增或修改 skill

## 本目录特有的规则（在根目录规则之外）
- 每个 skill 一个目录，入口 SKILL.md，frontmatter 的 name 与目录名一致
- description 写清楚什么时候用、什么时候不用
- 正文用英文写步骤
- 所有 skill 不能写 10-feedback/

## 关键文件
- README.md（skill 清单）

## 不要做
- 不要删除软链接 .claude/skills 和 .agents/skills

## 相关
- 11-workflows/
