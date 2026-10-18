# CLAUDE.md

Owner: Lightman · Status: Active · Last reviewed: 18/10/2026

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

## 这个仓库是什么
careKind AI 的 Company OS / meta repo：公司文档、规则、PRD、ADR、设计规范、共用工具和 AI 修改记录放在这里；代码及博客通过下列 7 个独立私有仓库的 submodule 管理。清单已核对远端 main 的 `.gitmodules`；当前有冲突的工作区可能尚未同步全部配置。

| Submodule 路径 | 独立私有仓库 | 用途 |
|---|---|---|
| `06-app-development/app/` | [Metatree-AI-Lab/carekind-api](https://github.com/Metatree-AI-Lab/carekind-api) | 后端 API（仓库已从 carekind-app 更名，目录仍保留 app） |
| `06-app-development/provider-portal/` | [Metatree-AI-Lab/carekind-provider-portal](https://github.com/Metatree-AI-Lab/carekind-provider-portal) | 机构管理端 |
| `06-app-development/super-admin/` | [Metatree-AI-Lab/carekind-super-admin](https://github.com/Metatree-AI-Lab/carekind-super-admin) | 平台管理端 |
| `06-app-development/website/` | [Metatree-AI-Lab/carekind-website](https://github.com/Metatree-AI-Lab/carekind-website) | 官网 |
| `06-app-development/shared/` | [Metatree-AI-Lab/carekind-shared](https://github.com/Metatree-AI-Lab/carekind-shared) | 跨端共享代码 |
| `06-app-development/nurse-web/` | [Metatree-AI-Lab/carekind-nurse-web](https://github.com/Metatree-AI-Lab/carekind-nurse-web) | 护士 Web 端 |
| `07-marketing-ops/blog/` | [Metatree-AI-Lab/carekind-blog](https://github.com/Metatree-AI-Lab/carekind-blog) | 博客内容与每日新闻 Markdown 草稿 |

API 的仓库名已改成 `carekind-api`，目录暂时仍为 `app/`。不要把路线图中的 mobile 或单独 Demo repo 写成已存在。进入子仓库前读其上下文；技术栈和可运行命令以对应 repo 和已接受 ADR 为准，不能以建库状态推断产品完成。

## 常用命令
```bash
git clone --recurse-submodules git@github.com:Metatree-AI-Lab/carekind.git   # 连同全部 submodule 一起 clone
scripts/setup.sh                                     # 旧设置脚本：先读脚本；hooks 目前只覆盖 meta + app
git submodule update --init --recursive              # 初始化全部 submodule 并对齐锁定 SHA
scripts/sync-app-tooling.sh                          # 当前仅向 app 同步共用工具，尚未覆盖全部 repo
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
- **各独立仓库**：只有获得相应 Git 授权后，才先在子仓库提交并推送，再在 meta repo 更新对应指针；先核对 hooks 和 workflows，不自动触发 CI/CD。共用工具以 meta repo 为准，旧同步脚本尚未覆盖全部仓库。Blog 新闻任务仅写本地草稿，AI changelog 统一记在 meta repo。
- **两个只读区域**：`10-feedback/` 是人工录入的原始反馈（只能读）；`03-legal-compliance/references/` 的原始 PDF 不能修改，其中的模板大多只允许非商业使用。

## Claude Code 专属
- Skills 也可以用 `/skill-name` 显式调用。
- 后台调研类任务可以用 subagent，但子任务同样不能写入 `10-feedback/`，并且要限定写入目录。
