# CLAUDE.md — scripts（脚本）

> 层级：部门 · 路径：`scripts/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
自动化脚本：setup.sh（第一次使用：安装 submodule 和 hooks）、run-workflow.sh（无人值守运行 workflow）、check-file-length.sh（单文件 ≤ 1000 行检查）、check-context-docs.sh（检查 CLAUDE.md / README.md 是否齐全）、ai-changelog.sh（AI 修改记录的 hook 和手动记录）、sync-app-tooling.sh（把共用工具同步到 App submodule）。

## 在这里通常要做的事
- 修改或新增脚本

## 本目录特有的规则（在根目录规则之外）
- 脚本也遵守代码规范（Tab 缩进 4、set -euo pipefail、显式错误处理）
- 修改后用模拟输入测试
- hook 和 pre-commit 依赖这些脚本，改接口前检查 .claude/settings.json 和 .githooks/

## 关键文件
- run-workflow.sh
- check-file-length.sh
- check-context-docs.sh

## 不要做
- 不要在脚本里写密钥

## 相关
- .claude/settings.json
- .githooks/pre-commit
