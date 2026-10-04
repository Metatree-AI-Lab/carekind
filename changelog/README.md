# changelog — AI 修改记录

Owner: Lightman · Last reviewed: 04/10/2026

AI 对本仓库的每一次修改记录。规则见 [`rules/05-changelog-rules.md`](../rules/05-changelog-rules.md)。

## 内容
- `YYYY-MM.md`：**任务摘要**（AI 每完成一个任务写一条，只追加）
- `ai-edits/YYYY-MM.jsonl`：**编辑明细**（Claude Code hook 自动写；Codex 用脚本手动写）
- `.pending/`：hook 用的临时标记（已加入 .gitignore）

## 摘要模板（严格按格式，每行 `- key: value`）
```markdown
### 2026-10-04 21:30 · claude-code · rules
- session: <会话 ID，Stop hook 的提示里会给出；不知道就写 unknown>
- requested-by: Lightman
- request: <用户要求的一句话摘要>
- type: feat | docs | rules | config | research | fix | refactor | correction
- area: <受影响的部门目录，如 rules, docs, 06-app-development>
- files: <主要改动的文件，逗号分隔；超过 10 个写目录 + 数量>
- why: <为什么这样改；关键取舍>
- verification: <怎么验证的，例如"脚本 pipe-test 通过" / "未验证">
- status: done | partial | reverted
- follow-ups: <需要人做的后续事项；没有写 none>
```

## 分析示例
```bash
# 每个 agent 的编辑次数
cat changelog/ai-edits/*.jsonl | jq -r '.agent' | sort | uniq -c
# 改动最频繁的目录（取前两级）
cat changelog/ai-edits/*.jsonl | jq -r '.path' | cut -d/ -f1-2 | sort | uniq -c | sort -rn | head
# 某个文件被 AI 改过几次、什么时候
jq -c 'select(.path == "docs/PRD.md")' changelog/ai-edits/*.jsonl
# 任务类型分布 / 修正次数
grep -h '^- type:' changelog/[0-9]*.md | sort | uniq -c
grep -c 'type: correction' changelog/[0-9]*.md
# 部分完成或被回滚的任务
grep -B6 'status: \(partial\|reverted\)' changelog/[0-9]*.md
```
