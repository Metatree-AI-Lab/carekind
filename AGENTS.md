# AGENTS.md — careKind AI Company OS

> 所有 AI agent（Claude Code、Codex 等）共用的规则。`CLAUDE.md` 通过 `@AGENTS.md` 引入本文件。**改规则只改这里。**

这个仓库是 careKind AI（澳洲 aged care 护士 AI 文书记录创业公司）的 Company OS。不是代码仓库。

## 你（AI agent）在这里的角色
- 帮创始人维护、更新、查询公司文档；起草政策、模板、对外文件；做合规差距分析。
- 回答问题时**先查本仓库**，以仓库内容为准；仓库没有的再用通用知识，并说明出处。

## 写作规则
- 内部文档：中文为主，法律/监管/行业术语保留英文原名（如 Privacy Act 1988、APPs、SIRS）。
- 对外文件（隐私政策、合同、客户材料）：澳式英语（organisation、licence、colour），日期 DD/MM/YYYY，金额 AUD，财年 1 July – 30 June。
- 每个文件头部保留 `Owner` / `Status` / `Last reviewed` 元信息；改动后更新 `Last reviewed`。
- 不编造：不确定的法规细节、数字、竞品信息标 `⚠️ 需核实`；未知的公司信息用 `{{TBD: 说明}}` 占位。
- 法律内容一律附免责：运营参考，不是法律意见。

## 规范（rules/）
所有工作都要遵守 `rules/`。Claude Code 通过 `.claude/rules` 自动加载；**Codex 和其他 agent 必须按任务类型主动读取**：
| 任务 | 必读 |
|---|---|
| 任何任务 | `rules/00-company-rules.md` |
| 运营、营销、销售、客户、财务 | `rules/01-operations-rules.md` |
| 写或改代码 | `rules/02-code-rules.md`（**§0 的 16 条核心要求**；Tab 缩进宽度 4；SOLID / DRY / KISS；性能底线）。**每次修改代码文件后都要运行 `scripts/check-file-length.sh <改动的文件>`；超过 1000 行就立即运行 `refactor-large-file` skill**（Claude Code 有 hook 自动触发，Codex 必须手动执行这一步） |
| 产品设计、界面文字、模板 | `rules/03-product-design-rules.md` + `rules/legal-reference-map.md` |
| 修改了任何文件 | `rules/05-changelog-rules.md`（任务结束前写 changelog 摘要） |
| 写或改 PRD | `rules/04-prd-rules.md` + `rules/legal-reference-map.md`；**必须先跑 `legal-reference-check` skill** |

## AI 修改记录（changelog）
**每完成一个修改了文件的任务，在回复用户之前，在 `changelog/YYYY-MM.md` 末尾追加一条摘要**（模板见 `changelog/README.md`，规则见 `rules/05-changelog-rules.md`）。只追加、不改历史、如实写验证结果。Claude Code 的编辑明细由 hook 自动记录，没写摘要时会在结束前被 Stop hook 拦下；**Codex 修改文件后运行 `scripts/ai-changelog.sh --manual codex <文件>...`**。

## 分层上下文文档
每一层目录（部门 → 子部门 → 代码仓库 → 功能模块）都有 `CLAUDE.md`（给 AI）和 `README.md`（给人）；子目录的 `AGENTS.md` 是指向 `CLAUDE.md` 的软链接。
- **进入一个目录工作前，先读该目录和上级目录的 CLAUDE.md / AGENTS.md。**
- 新建目录、新增功能模块或大函数时，同步创建或更新这两份文档（模板在 `09-templates/`），完成后运行 `scripts/check-context-docs.sh`。
- 规则见 `rules/00-company-rules.md` §4.1。

## App 代码仓库（submodule）
`06-app-development/app/` 是 git submodule（`Metatree-AI-Lab/carekind-app`）。**如果这个目录是空的，先运行 `scripts/setup.sh`（或 `git submodule update --init --recursive`），不要在空目录里新建文件。**修改 App 代码要分两步：先在 submodule 里提交并推送，再回到 meta repo 提交 submodule 指针。不要在 meta repo 里直接提交 App 代码文件。共用工具（`.editorconfig`、`scripts/check-*.sh`）以 meta repo 为准，修改后运行 `scripts/sync-app-tooling.sh` 同步。

## 产品文档
产品做什么、怎么做以 `docs/PRD.md` 为准；功能 PRD 在 `docs/prds/`。写代码、写文案、做运营之前先读主 PRD 的 §6 产品逻辑和 §9 护栏。

## 关键约束（任何产出都不能违反）
1. Human-in-the-loop：AI 生成的临床记录必须经护士审核后才能写入客户系统。
2. 不做诊断、治疗建议、用药决策——那会把产品推进 TGA 医疗器械 (SaMD) 监管范围。见 `03-legal-compliance/tga-samd-boundary.md`。
3. 健康信息 = Privacy Act 下的 sensitive information；处理方式见 `03-legal-compliance/privacy-program.md`。
4. 不在营销材料里做无法证实的 AI 能力声明（Australian Consumer Law 误导性陈述风险）。

## 🚫 10-feedback/ 是只读的原始数据
`10-feedback/` 存放人工录入的用户原始反馈。**AI agent 只能读，不能新建、编辑、改写、润色、翻译、总结或删除其中任何反馈文件**（`README.md`、`CLAUDE.md`、`AGENTS.md` 这几个说明文件除外，且只在用户明确要求时才改）。分析结果写到 `06-app-development/research/synthesis.md`，并引用原始文件路径。

## 参考资料与版权
- 法律原文和文书模板在 `03-legal-compliance/references/`。大部分模板**只允许非商业使用**，不能原样放进产品，也不能对外分发。产品模板要自己设计，或者取得授权；每个文件的许可说明见 `references/paperwork-templates/index.md`。
- 竞品资料在 `01-strategy/competitive-research/`。其中的数字对外引用前要打开原始来源复核。

## 重大决策
记录到 `02-operating-system/decisions/`，用 `09-templates/adr-template.md`，编号递增。

## 待填信息
全仓库 `{{TBD` 占位符清单：`grep -rn "{{TBD" .`

## 团队
Lightman（Founder · Product Owner，暂兼运营/合规/HR/销售）· Lin（Developer · Tech Lead，承担 CTO 职责）· Gary（Developer）· Windston（Developer）。名册：`05-hr-teams/team-members.md`。三人均为员工。公司注册地：Melbourne, VIC。

## Workflows & Skills
- `12-skills/`：可复用的单项能力，每个 skill 一个目录，入口是 `SKILL.md`（Agent Skills 标准格式）。`.claude/skills` 和 `.agents/skills` 是指向这里的软链接，所以 Claude Code 和 Codex 都能自动发现。
- `11-workflows/`：由多个 skill 串起来的流程（runbook）。用户说"跑 / 执行 XX workflow"时，读取 `11-workflows/<name>.md`，按步骤执行，每一步调用对应的 skill。
- 执行 workflow 时：每完成一步就报告进度；遇到标 `🧑 人工确认` 的步骤要停下来等用户确认；结束时在 `11-workflows/runs/` 写一份运行记录。
- 无人值守运行：`scripts/run-workflow.sh <workflow> [claude|codex]`。
