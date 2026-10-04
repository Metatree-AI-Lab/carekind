# scripts

Owner: Lin (Tech Lead) · Last reviewed: 04/10/2026

## 用途
自动化脚本。

## 内容
- setup.sh — **第一次使用必跑**：初始化 git submodule、两个仓库启用 pre-commit、开启 submodule.recurse、检查工具
- run-workflow.sh — 无人值守运行 workflow（claude / codex）
- check-file-length.sh — 代码文件 ≤ 1000 行检查（hook / pre-commit / CI）
- sync-app-tooling.sh — 把共用工具（.editorconfig、check-file-length.sh、check-context-docs.sh）同步到 App submodule
- ai-changelog.sh — AI 修改记录（Claude Code hook 自动调用；Codex 用 --manual 手动调用）
- check-context-docs.sh — 检查各层 CLAUDE.md 和 README.md 是否齐全

## 怎么用
- 新 clone 仓库后执行：git config core.hooksPath .githooks
