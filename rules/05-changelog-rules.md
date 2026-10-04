# AI 修改记录规范 (AI Changelog Rules)

Owner: Lightman · Last reviewed: 04/10/2026 · 适用：所有 AI agent（Claude Code、Codex、subagent）

> 目的：AI 对仓库的每一次修改都留下可分析的记录：改了什么、为什么、谁要求的、怎么验证的。用于以后分析 AI 的工作量、出错模式、哪些区域改动最频繁，以及审计。

## 1. 两层记录
| 层 | 文件 | 谁写 | 内容 |
|---|---|---|---|
| **编辑明细** | `changelog/ai-edits/YYYY-MM.jsonl` | Claude Code 由 hook **自动**写；Codex 用 `scripts/ai-changelog.sh --manual codex <文件>...` | 每次文件编辑一行：时间、agent、会话、工具、文件路径 |
| **任务摘要** | `changelog/YYYY-MM.md` | **AI 必须自己写** | 每个任务一条：用户的要求、改了什么、为什么、怎么验证、后续事项 |

## 2. 必须遵守
1. **每完成一个修改了文件的任务，就在当月的 `changelog/YYYY-MM.md` 末尾追加一条摘要**，在回复用户之前写。一个用户请求算一个任务；同一请求里的多次修改合并成一条。
2. 摘要格式必须严格按 `changelog/README.md` 的模板（每行 `- key: value`），方便脚本解析。
3. **只追加，不修改、不删除历史条目**。写错了就追加一条 `type: correction` 的更正。
4. 写真实情况：没有验证就写"未验证"；测试失败就写失败；被用户中途打断就写"部分完成"。
5. `request` 写用户要求的摘要；**不能写入**住户信息、员工个人信息、密钥或任何健康信息。
6. 只读不改的任务（回答问题、调研但没写文件）不需要记录。
7. Codex 没有 hook：每次修改文件后运行 `scripts/ai-changelog.sh --manual codex <改动的文件>`，任务结束时写摘要。

## 3. 自动执行（Claude Code）
- `.claude/settings.json` 的 PostToolUse hook 在每次 Edit / Write / MultiEdit / NotebookEdit 后写编辑明细，并把本会话标记为"待写摘要"。
- 写入 `changelog/YYYY-MM.md` 后标记清除。
- Stop hook：会话准备结束时，如果还有"待写摘要"，会拦下并要求先写摘要（每次最多提醒一次，避免循环）。
- 通过 Bash 修改的文件不会自动进入编辑明细；在摘要的 `files` 里列出即可。

## 4. 分析
示例查询见 `changelog/README.md`（用 `jq` 统计 jsonl，用 `grep` 统计摘要的 type 和 area）。
