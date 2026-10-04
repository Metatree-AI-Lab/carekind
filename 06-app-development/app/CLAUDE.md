# CLAUDE.md — careKind App 代码仓库

> 层级：代码仓库 · 路径：`06-app-development/app/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
careKind App 的源代码（后端 + 护士端 App）。技术栈还没有确定，以 `../engineering/adr/` 为准；在 ADR 确定之前，本仓库只有架构骨架和各功能模块的文档，**没有可运行的代码**。

## 在这里通常要做的事
- 实现 docs/PRD.md 中的功能
- 新增功能模块（必须同时创建 CLAUDE.md + README.md）
- 写测试和评测

## 本目录特有的规则（在根目录规则之外）
- **先读** `docs/PRD.md` §6 产品逻辑、§9 护栏，再读对应功能模块的 CLAUDE.md
- 代码规范：`rules/02-code-rules.md` —— 16 条核心要求、**Tab 缩进宽度 4**、单文件 ≤ 1000 行（超过会被 hook 拦下）、导出必须写类型、禁用 any
- 分层：`src/domain`（纯业务逻辑）← `src/application`（用例编排）← `src/interfaces`（API / App 界面）；`src/adapters` 实现 domain 定义的接口。domain 里禁止出现 HTTP、数据库、供应商 SDK
- **每个功能模块目录都必须有 CLAUDE.md 和 README.md**（`scripts/check-context-docs.sh` 会检查）；模块里新增大函数（> 40 行或核心算法）时，在该模块 CLAUDE.md 的"关键函数"一节登记
- 测试只用合成数据；日志里不能有音频、转写文本、住户姓名或任何健康信息
- 所有数据和 LLM 推理在澳洲境内（ADR-0001）

## 关键文件
- src/domain/<feature>/ —— 10 个功能模块（见下表）
- src/application/
- src/adapters/
- src/interfaces/
- ../engineering/architecture.md
- ../engineering/any-whitelist.md

## 不要做
- 不要在 ADR 确定前擅自选定技术栈或初始化框架
- 不要实现 TGA 红灯功能
- 不要在 domain 层直接调用供应商 SDK

## 功能模块地图（对应 docs/PRD.md §6）
| 模块 | 职责 | PRD |
|---|---|---|
| `shift-session` | 班次会话状态机 | §6.3 |
| `segmentation` | 把片段切成"每次只关于一位老人"的事件 | §6.2、§4.3 |
| `attribution` | 事件 → 老人归属（最关键的算法） | §6.4 |
| `tiering` | 风险分级与确认权限 | §6.5 |
| `drafting` | 一个事件生成多份文书草稿 | §6.6、§14 |
| `fact-check` | 草稿与原话的事实一致性检查 | §6.6、护栏 G2/G3 |
| `review` | 草稿审核状态机（PCW / RN） | §6.3、§7.2 |
| `records` | 已确认记录、老人档案时间线、更正 | §4.4、护栏 G7 |
| `handover` | ISBAR 交接摘要 | §7.4 |
| `consent` | 老人退出、声纹同意 | §7.8 |

## 相关
- docs/PRD.md
- rules/02-code-rules.md
- 06-app-development/clinical-safety/
