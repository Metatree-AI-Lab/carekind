# CLAUDE.md — changelog（AI 修改记录）

> 层级：部门 · 路径：`changelog/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
AI 对仓库所有修改的记录：`YYYY-MM.md` 是任务摘要（AI 写），`ai-edits/YYYY-MM.jsonl` 是编辑明细（hook 或脚本写）。规则：`rules/05-changelog-rules.md`。

## 在这里通常要做的事
- 每完成一个修改了文件的任务，在当月 `YYYY-MM.md` **末尾追加**一条摘要（模板见 README.md），然后再回复用户
- 分析 AI 的修改记录（README.md 有 jq / grep 示例）

## 本目录特有的规则（在根目录规则之外）
- **只追加**：不修改、不删除历史条目；写错了追加 `type: correction`
- 严格按模板的 `- key: value` 格式，方便解析
- `ai-edits/*.jsonl` 由脚本写，**不要手工编辑**
- 不写住户信息、员工个人信息、密钥、健康信息

## 关键文件
- README.md（模板和分析示例）
- `YYYY-MM.md`（当月摘要）
- `ai-edits/`（编辑明细）
- `../scripts/ai-changelog.sh`（hook 和手动记录脚本）

## 不要做
- 不要把摘要写成"做了很多改进"这种无法分析的话；写具体文件和原因
- 不要谎报验证结果

## 相关
- rules/05-changelog-rules.md
- .claude/settings.json（PostToolUse、Stop hook）
