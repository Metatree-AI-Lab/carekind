# CLAUDE.md — standups（每日 Standup）

> 层级：子部门 / 功能区 · 路径：`02-operating-system/standups/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
每位成员每个工作日的 standup 记录，由 `standup` skill 写入 `members/<姓名>/YYYY-MM-DD.md`。

## 在这里通常要做的事
- 帮成员提交 standup（standup skill）
- 汇总今天谁已提交、blockers（`scripts/my-work.sh --all`，只读）

## 本目录特有的规则（在根目录规则之外）
- 规则：`rules/06-adlc-rules.md` §10
- **内容必须由成员本人确认**；agent 可以根据 registry 和工作记录给出草稿提示，但没有成员确认的内容不能写入
- 一个成员只能写自己的记录；agent 不能替别人提交
- 记录里不写住户信息、健康信息和个人原因（休假只写"休假"）
- 不用于绩效考核，不比较成员；不要从记录推断努力程度
- 已提交的记录只补充不删除：同一天再次提交写在原文件的"补充"一节
- 编辑这里的记录不需要写 changelog 摘要（编辑明细仍会自动记录）

## 关键文件
- members/<姓名>/YYYY-MM-DD.md

## 不要做
- 不要编造成员没说过的完成事项或 blocker
- 不要修改别的成员的记录

## 相关
- 12-skills/standup/SKILL.md
- scripts/my-work.sh
- docs/prds/registry.md
