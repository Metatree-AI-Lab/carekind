# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

## 这个仓库是什么
careKind AI 的 Company OS：Markdown + Git 管理的公司文档、规范、AI skill 和 workflow，外加 App 代码仓库：`06-app-development/app/` 是 **git submodule**，对应独立的私有仓库 `Metatree-AI-Lab/carekind-app`。App 的技术栈还没有确定（待 `06-app-development/engineering/adr/`），**目前没有 build、lint 或 test 命令**；技术栈确定后在本节补充，并更新 `06-app-development/app/CLAUDE.md`。

## 常用命令
```bash
git clone --recurse-submodules git@github.com:Metatree-AI-Lab/carekind.git   # 连同 App submodule 一起 clone
scripts/setup.sh                                     # 第一次使用：初始化 submodule、两个仓库启用 pre-commit、submodule.recurse、检查工具
git submodule update --init --recursive              # 06-app-development/app/ 是空的时候
scripts/sync-app-tooling.sh                          # 把共用工具（.editorconfig、检查脚本）同步到 App 仓库
scripts/check-file-length.sh <file>...               # 代码文件 ≤ 1000 行；也支持 --all / --staged / --hook
scripts/check-context-docs.sh [--fix-links]          # 每层目录都要有 README.md + CLAUDE.md + AGENTS.md 软链接
scripts/ai-changelog.sh --manual <agent> <file>...    # 手动记录 AI 编辑明细（Codex 用；Claude Code 由 hook 自动记录）
scripts/run-workflow.sh <workflow> [claude|codex]    # 无人值守运行 11-workflows/ 里的流程（遇到 🧑 人工确认会停下）
pdftotext -layout <pdf> -                            # 读取 03-legal-compliance/references/ 里的法律原文 PDF
```

## 需要跨多个文件才能看懂的结构
- **规则加载链**：`AGENTS.md`（共用规则，Codex 读它）← 本文件通过 `@AGENTS.md` 引入。`rules/*.md` 经 `.claude/rules → rules/` 软链接自动加载，每个文件 frontmatter 的 `paths` 决定什么时候加载（例如代码规范只在改代码文件时加载）。各子目录的 `CLAUDE.md` 在读取该目录时加载；`AGENTS.md` 是它的软链接。
- **Skills 和 workflows**：`12-skills/<name>/SKILL.md` 是唯一来源，`.claude/skills` 和 `.agents/skills` 都软链接到这里，Claude Code 和 Codex 共用。`11-workflows/*.md` 把多个 skill 串成流程，由 `run-workflow` skill 执行，运行记录写到 `11-workflows/runs/`。
- **自动检查**：`.claude/settings.json` 的 PostToolUse hook 在每次 Edit/Write 后运行 `check-file-length.sh --hook`，超过 1000 行会要求运行 `refactor-large-file` skill。`.githooks/pre-commit` 运行文件行数检查和上下文文档检查。
- **产品 → 法律 → 代码的链路**：产品做什么以 `docs/PRD.md` 为准（§6 产品逻辑、§9 护栏 G1–G11），功能 PRD 在 `docs/prds/`。写 PRD 或做产品设计前必须运行 `legal-reference-check` skill，按 `rules/legal-reference-map.md` 查阅 `03-legal-compliance/references/` 的本地文件。PRD §6 的每个逻辑块对应 `06-app-development/app/src/domain/` 下的一个功能模块，模块的 `CLAUDE.md` 登记关键函数、不变量和测试门槛。
- **AI 修改记录**：PostToolUse hook 把每次编辑写进 `changelog/ai-edits/YYYY-MM.jsonl`，并标记会话"待写摘要"；AI 在 `changelog/YYYY-MM.md` 写完摘要后标记清除；Stop hook 在还有待写摘要时阻止结束。
- **App submodule**：改 App 代码时，先在 `06-app-development/app/` 里提交并推送到 carekind-app，再回到 meta repo 提交 submodule 指针（`git add 06-app-development/app`）。共用工具以 meta repo 为准，改完运行 `scripts/sync-app-tooling.sh`。AI changelog 统一写在 meta repo。
- **两个只读区域**：`10-feedback/` 是人工录入的原始反馈（只能读）；`03-legal-compliance/references/` 的原始 PDF 不能修改，其中的模板大多只允许非商业使用。

## Claude Code 专属
- Skills 也可以用 `/skill-name` 显式调用。
- 后台调研类任务可以用 subagent，但子任务同样不能写入 `10-feedback/`，并且要限定写入目录。
