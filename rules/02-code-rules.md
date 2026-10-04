---
paths:
  - "06-app-development/**"
  - "scripts/**"
  - "**/*.{ts,tsx,js,jsx,mjs,cjs,py,go,rs,java,kt,swift,sql,sh}"
---

# 代码规范 (Code Rules)

Owner: Lin (Tech Lead) · Approver: Lightman · Last reviewed: 04/10/2026
适用：careKind 所有代码（App、后端、脚本、基础设施），包括 AI agent 写的代码。技术栈以 ADR 为准（`06-app-development/engineering/adr/`）；本规范与语言无关，示例用 TypeScript。

---

## 0. 16 条核心要求（必须遵守，PR 审查逐条检查）

| # | 要求 | 必须做到 | 详细 |
|---|---|---|---|
| 01 | **Single Responsibility 单一职责** | 一个函数或模块只做一件事；一个变化的原因只影响一处 | §2.3 S |
| 02 | **Clear Naming 清晰命名** | 变量和函数名说人话、表达业务含义；禁止 `a`、`tmp`、`data2`、`foo`、`obj` 这类名字（循环下标 `i`、`j` 除外） | §4 |
| 03 | **No Hard-Coded Secrets 不硬编码密钥** | API key、密码、token 一律放 `.env`（本地）或密钥管理服务（生产），**禁止**写进代码或提交到 git | §7 |
| 04 | **Comments First 先写注释** | 复杂逻辑**先**写一句"为什么"，再写代码；不是写完再补 | §4 |
| 05 | **Test-Driven 测试驱动** | 关键逻辑先写测试用例；至少写完立刻补测试，和代码在同一个 PR 里 | §6 |
| 06 | **Explicit Error Handling 显式错误处理** | 错误要显式抛出或处理；**禁止空 catch**，禁止静默吞掉错误 | §5 |
| 07 | **Validate at Boundaries 在边界校验** | 只在系统边界校验（用户输入、外部 API、LLM 输出、CMS 数据、数据库读出的旧数据）；内部代码互相信任，**不要层层判空** | §5 |
| 08 | **Secure by Default 默认安全** | 默认最小权限、最严设置；放开权限必须显式声明并写明理由 | §7 |
| 09 | **No Placeholder / Fake Data 不交付占位或假数据** | 禁止交付 `TODO`、Lorem ipsum、编造的数字；没有真实数据就明确说明（例如界面显示"暂无数据"，文档写 `未验证`） | §4、§6 |
| 10 | **Performance Boundaries 性能底线** | 不可接受的性能底线写死在规范和测试里（见下表），超过就算不合格 | §0.1 |
| 11 | **Minimal Dependencies 最少依赖** | 能用标准库或现有依赖解决就不装新包；装之前先回答"真的需要吗"，并在 PR 里写明理由 | §2.1 |
| 12 | **YAGNI** | 不为"将来可能用到"写代码，只写现在要用的 | §2.1 |
| 13 | **Code for the Reader 为读者写代码** | 代码首先是给人看的；可读性优先于炫技 | §2.1 |
| 14 | **Explicit Types on Exports 导出必须写类型** | 每个导出的函数、变量、常量都显式声明参数和返回类型，不依赖隐式推断 | §5 |
| 15 | **"No any" Unless Whitelisted 禁用 any** | 禁用 `any`；只有在白名单里明确批准的情况（如没有类型定义的第三方库）才允许 | §5 |
| 16 | **File ≤ 1000 Lines 单文件不超过 1000 行** | 代码文件超过 1000 行时**自动触发重构**（`refactor-large-file` skill），按职责拆分，每个文件目标 ≤ 500 行 | §0.2 |

### 0.2 文件行数上限：超过 1000 行自动触发重构
- **上限**：任何代码文件不得超过 **1000 行**；重构后每个文件的目标是 **≤ 500 行**。函数一般不超过 40 行（§2.1）。
- **检查范围**：`.ts/.tsx/.js/.jsx/.py/.go/.rs/.java/.kt/.swift/.sql/.sh/.css/.vue/.svelte` 等代码文件；不检查文档、锁文件、生成代码、`node_modules`、`dist`、数据库 migration。脚本：`scripts/check-file-length.sh`。
- **自动触发**：
  | 环节 | 机制 | 结果 |
  |---|---|---|
  | Claude Code 编辑文件后 | `.claude/settings.json` 的 PostToolUse hook | 超限时把重构要求反馈给 Claude，Claude 立即运行 `refactor-large-file` skill |
  | 任何人或 Codex 提交前 | `.githooks/pre-commit`（`git config core.hooksPath .githooks`） | 暂存的文件超限则拒绝提交 |
  | CI | `scripts/check-file-length.sh --all` | 超限则 CI 失败，禁止合并 |
  | Codex 写代码时 | `AGENTS.md` 规定：每次修改代码后都要运行检查脚本 | 超限时运行 `refactor-large-file` skill |
- **怎么降低行数**：按职责拆分成多个模块（SRP），**禁止**用压缩代码、多条语句挤在一行、删除测试或注释、塞进 `utils.ts` 杂物间等方式凑行数。重构不能改变行为，必须测试通过。
- **例外**：确实无法拆分的文件（例如第三方生成代码）必须加入脚本的排除规则，并由 Lin 批准。

### 0.1 性能底线（初始值，Lin 可以按 ADR 调整）
| 场景 | 不合格线 | 目标 |
|---|---|---|
| 任何 API 请求（不含 AI 生成） | **p95 > 2 秒** | p95 ≤ 500 ms |
| App 冷启动到可以开始录音 | > 3 秒 | ≤ 1.5 秒 |
| 审核界面操作（确认、改归属、翻页） | > 300 ms | ≤ 100 ms |
| 一段口述到出现草稿 | > 5 分钟 | ≤ 2 分钟 |
| 音频分块上传失败后的自动重试 | 丢失任何一块 | 0 丢失 |
| 班末生成交接摘要 | > 30 秒 | ≤ 10 秒 |
性能底线要有自动化测试或监控告警来保证，不能只写在文档里。

---

## 1. 格式：Tab 缩进，宽度 4
- **必须用 Tab 缩进，Tab 显示宽度为 4。禁止用空格缩进代码**（YAML 例外，因为其语法禁止 Tab，用 2 个空格）。
- 根目录 `.editorconfig` 已经配置好；编辑器必须启用 EditorConfig 支持。
- 格式化工具必须配置成 Tab：
  - Prettier：`"useTabs": true, "tabWidth": 4`
  - ESLint（如果使用 stylistic 规则）：`indent: ["error", "tab"]`
  - Python（ruff format）：`indent-style = "tab"`；Go 的 gofmt 默认就是 Tab
  - Swift / Kotlin：在 IDE 和 formatter 里设置 "Use tab character"，宽度 4
- **对齐用空格，缩进用 Tab**：行首缩进用 Tab；行内对齐（如果需要）用空格。
- 其他：UTF-8、LF 换行、文件末尾留一个空行、去掉行尾空格；单行不超过 120 列（按 Tab = 4 列计算）。
- 格式化交给工具：CI 中格式检查不通过就禁止合并，**代码审查不讨论格式问题**。

## 2. 三大原则

### 2.1 KISS — 保持简单（排第一）
> 能读懂比写得巧更重要。护士和老人的安全依赖于我们能看懂自己的代码。

- **必须**：先写最直接的实现。只有在有测量数据证明需要时，才做性能优化或抽象。
- **必须**：函数只做一件事，一般不超过 40 行；嵌套不超过 3 层，用提前返回（guard clause）减少嵌套。
- **禁止**：为"将来可能需要"写的代码（YAGNI）。没有第二个用例就不写配置项、插件机制或泛型框架。
- **禁止**：炫技的写法（一行嵌套的三元表达式、隐式类型转换、元编程），除非有注释说明为什么必须这样写。
- 引入新依赖前先问：标准库或现有依赖能不能做到？

```ts
// ❌ 嵌套过深
function canConfirm(user, draft) {
	if (user) {
		if (draft.tier !== "TIER_3") {
			if (user.role === "PCW" && policy.pcwCanConfirmTier1) {
				return draft.tier === "TIER_1";
			}
		}
	}
	return false;
}

// ✅ 提前返回，一眼能看懂
function canConfirm(user: Staff, draft: Draft, policy: TierPolicy): boolean {
	if (draft.tier === "TIER_3") return user.role === "RN";
	if (draft.tier === "TIER_2") return user.role === "RN" || (user.role === "EN" && policy.enCanConfirmTier2);
	return user.role !== "PCW" || policy.pcwCanConfirmTier1;
}
```

### 2.2 DRY — 不要重复（但不要过早抽象）
- **必须**：同一条**业务规则**只能有一个实现。例如风险分级规则、老人归属阈值、保留期、角色权限，都要集中定义，不能散落在各处。
- **必须**：常量、枚举、文案模板集中管理；禁止在多处硬编码同一个阈值（如 `0.95`）。
- **三次法则**：同样的代码出现第三次才抽象。两段代码只是**看起来像**，但描述的是不同的业务概念时，**不要合并**（错误的抽象比重复更糟）。
- 数据结构的唯一来源：类型和校验 schema 从同一份定义生成（例如用 zod 定义，再推导出 TS 类型），不要手写两份。

```ts
// ❌ 阈值散落在各处
if (attribution.score > 0.95) autoAssign();      // attribution.ts
if (a.confidence >= 0.95) showAsConfirmed();     // review-ui.ts

// ✅ 业务规则只定义一次
// domain/attribution/policy.ts
export const ATTRIBUTION_POLICY = {
	autoAssignMinScore: 0.95,
	allowOutsideShiftRoster: false, // 护栏 G4：永远只在本班名单内匹配
} as const;
```

### 2.3 SOLID
| 原则 | 在 careKind 里的含义 | 例子 |
|---|---|---|
| **S** 单一职责 | 一个模块只有一个变化的理由 | `Transcriber` 只负责转写；`Attributor` 只负责分配老人；`DraftGenerator` 只负责起草。不要写一个"什么都做"的 `AIService` |
| **O** 开闭 | 新增文书类型时，加新文件，不改现有逻辑 | 每种文书一个 `DocumentTemplate` 实现，在注册表里登记；不要在一个大 switch 里一直加 case |
| **L** 里氏替换 | 实现类可以替换接口，不改变正确性 | 任何 `LlmProvider` 实现都必须满足同样的契约：境内端点、零保留、返回来源映射 |
| **I** 接口隔离 | 接口小而专 | `ReadsResidents` 和 `WritesRecords` 分开，审核界面不需要拿到写入 CMS 的能力 |
| **D** 依赖倒置 | 业务逻辑依赖抽象，不依赖具体供应商 | 领域层只依赖 `SpeechToText`、`LlmProvider`、`CmsExporter` 接口；AWS、Azure 或某家 CMS 的 SDK 只出现在 adapter 层 |

```ts
// ✅ 依赖倒置 + 单一职责：领域逻辑不知道用的是哪家 LLM
export interface LlmProvider {
	draft(input: DraftInput): Promise<DraftOutput>; // 必须返回每句的来源映射
}

export class DraftGenerator {
	constructor(
		private readonly llm: LlmProvider,
		private readonly factChecker: FactChecker,
	) {}

	async generate(event: AttributedEvent, template: DocumentTemplate): Promise<Draft> {
		const output = await this.llm.draft(template.buildInput(event));
		return this.factChecker.verify(event.transcript, output); // 护栏 G2/G3
	}
}
```

**原则冲突时的优先级**：安全与正确 > KISS > DRY > SOLID 的形式。不要为了"符合 SOLID"而增加没有必要的层。

## 3. 项目结构
```
src/
	domain/        业务规则（纯逻辑，不依赖框架和供应商）：attribution、tiering、drafting、review、records
	application/   用例编排：StartShift、ProcessSegment、ConfirmDraft、ExportRecord
	adapters/      外部系统：stt/、llm/、cms/、storage/、auth/
	interfaces/    API 路由、App 界面
	shared/        通用工具（谨慎添加，禁止变成杂物间）
```
- 依赖方向只能从外向内：`interfaces → application → domain`；`adapters` 实现 `domain` 定义的接口。
- `domain` 里**禁止**出现 HTTP、数据库、供应商 SDK。
- **每个功能模块目录必须有 `CLAUDE.md` + `README.md`**（`rules/00-company-rules.md` §4.1）；新增或修改大函数（> 40 行或核心算法）时，同步更新模块 `CLAUDE.md` 的"关键函数"一节。PR 审查要检查这一点。

## 4. 命名与注释
- 命名用英文，表达业务含义，和主 PRD 的术语一致：`Resident`、`ShiftSession`、`Event`、`Draft`、`Record`、`Tier`。
- 布尔值用 `is`/`has`/`can` 开头；函数用动词开头。
- 禁止糊弄名字：`a`、`tmp`、`data2`、`foo`、`obj`、`res2`；名字要说明业务含义，例如 `unassignedEvents`、`autoAssignMinScore`。
- **先写注释再写代码**：复杂逻辑先用一句话写清楚"为什么这样做"，然后再实现。注释解释**为什么**，不解释"做了什么"。涉及护栏时注明编号，例如 `// 护栏 G4`。
- 禁止提交被注释掉的代码。
- **禁止交付 `TODO`、`FIXME`、Lorem ipsum 或编造的示例数字**。没做完的事记到 issue 里；CI 会扫描 `main` 分支上的 `TODO` 和 `FIXME`。
- 界面上没有真实数据时显示"暂无数据"之类的明确状态，不能用假数据填充。

## 5. 类型与错误处理
- TypeScript 用 `strict` 模式。
- **导出必须写类型**：每个 `export` 的函数都要写参数类型和返回类型，导出的常量和变量也要写类型（ESLint：`@typescript-eslint/explicit-module-boundary-types`）。
- **禁用 `any`**（ESLint：`@typescript-eslint/no-explicit-any: error`）。确实需要时：先考虑用 `unknown` 再收窄；仍然需要 `any` 的，必须登记在 `06-app-development/engineering/any-whitelist.md`，经过 Lin 批准，代码处注释写明白名单编号。
- **只在边界校验**：外部输入（用户输入、API 请求、CMS 数据、LLM 输出、第三方 SDK 返回值）**必须**在进入系统的地方用 schema 校验。校验通过后，内部代码互相信任，靠类型系统保证，**不要层层判空**。
- **LLM 输出一律视为不可信输入**：必须做结构校验和事实一致性检查之后才能使用。
- **禁止空 catch**，禁止静默吞掉错误（ESLint：`no-empty`）。每个 catch 都要做到以下之一：处理并恢复、转换成领域错误后重新抛出、或者记录日志后重新抛出。
- 对外的错误信息不能泄露内部细节或健康信息。

```ts
// ❌ 静默吞掉错误：上传失败了却没人知道，录音丢了
try {
	await uploadChunk(chunk);
} catch (e) {}

// ✅ 显式处理：先保留在本地，再交给重试队列，并记录（不含音频内容）
try {
	await uploadChunk(chunk);
} catch (error) {
	await localBuffer.keep(chunk); // 护栏：音频不能丢失（HAZ-014）
	logger.warn("chunk upload failed, queued for retry", { chunkId: chunk.id, error });
	retryQueue.enqueue(chunk.id);
}
```
- 涉及临床数据的失败默认**安全失败**：宁可不出草稿让护士手动记录，也不能输出不确定的内容。

## 6. 测试
- **必须有测试的代码**：业务规则（分配、分级、权限、保留期）、租户隔离、事实一致性检查、数据删除。
- **测试驱动**：关键逻辑（分配、分级、权限、保留期、删除、事实一致性检查）先写测试用例再实现；其他代码至少在同一个 PR 里补齐测试。修 bug 先写一个能复现问题的测试。
- 测试里也不能有编造的"示例数字"冒充真实指标；性能底线（§0.1）要有对应的测试或监控。
- 领域层的单元测试覆盖率 ≥ 90%；整体 ≥ 70%（初期目标）。
- 测试数据**只用合成数据**，禁止使用真实住户数据。
- 提示词或模型变更必须跑 AI 评测（`06-app-development/clinical-safety/evaluation-plan.md`）。

## 7. 安全与隐私（写代码时）
- **禁止**在日志、错误监控、分析事件中记录：音频、转写文本、草稿内容、住户姓名、任何健康信息。只记录 ID。
- 每一次数据访问都必须带租户上下文；按租户过滤的查询要有自动化测试证明没有越权。
- **密钥不硬编码**：API key、密码、token 在本地开发时放 `.env`（已在 `.gitignore` 中排除），仓库里只提交不含真实值的 `.env.example`；staging 和生产环境用云平台的密钥管理服务注入。**禁止**把密钥写进代码、提交到 git、写进日志。CI 开启 secret scanning，一旦泄露立即轮换。
- **默认安全**：新的 API 默认需要登录且拒绝访问；角色默认最小权限；存储桶默认私有；CORS 默认关闭；功能开关默认关闭。放开任何一项都要在代码里显式声明，并在 PR 里说明理由。
- 生产数据禁止进入开发和测试环境。
- 新增会处理客户数据的第三方服务前，先走子处理方评估（`04-security/vendor-subprocessor-register.md`）。
- 依赖要做漏洞扫描；严重漏洞 48 小时内修复。

## 8. AI / LLM 相关代码
- 提示词、模型 ID、参数**纳入版本控制**，放在 `adapters/llm/prompts/`，禁止在业务代码里拼接长字符串。
- 锁定模型版本；更换模型或供应商必须写 ADR 并跑全量评测。
- 每个草稿都必须带"句子 → 原始片段"的来源映射；没有映射的句子不能显示为已确认内容。
- 代码中禁止实现 TGA 红灯功能：诊断、风险评分、治疗或用药建议、根据数值报警（主 PRD §9 护栏）。

## 9. Git 与代码审查
- 分支：`main` 受保护；功能分支命名为 `feat/…`、`fix/…`、`chore/…`。
- 提交信息用 Conventional Commits：`feat(attribution): ...`、`fix(review): ...`。
- **所有代码必须经过 PR 审查才能合并**，至少 1 名其他开发者批准；CI 必须全部通过（格式、lint、类型检查、测试、漏洞扫描、secret scanning）。
- PR 要小：一般不超过 400 行变更；描述里写清楚"为什么"和"怎么测试的"。
- 涉及临床逻辑、权限、数据删除、提示词的 PR **必须由 Lin 审查**。

### PR 审查清单
**16 条核心要求（§0）**
- [ ] 01 单一职责 · 02 命名清楚 · 03 没有硬编码密钥 · 04 复杂逻辑有"为什么"的注释
- [ ] 05 关键逻辑有测试 · 06 没有空 catch · 07 只在边界校验，内部没有层层判空 · 08 默认最严权限
- [ ] 09 没有 TODO、假数据、Lorem ipsum · 10 没有突破性能底线 · 11 没有不必要的新依赖 · 12 没有为"将来"写的代码
- [ ] 13 可读性优先 · 14 导出都写了类型 · 15 没有 `any`（或已登记白名单）· 16 没有超过 1000 行的文件
- [ ] 新增的目录有 CLAUDE.md + README.md；新增或修改的大函数已登记在模块 CLAUDE.md

**其他**
- [ ] 缩进是 Tab（宽度 4），格式检查通过
- [ ] KISS：有没有更简单的写法？有没有为"将来"写的代码？
- [ ] DRY：业务规则有没有重复定义？
- [ ] SOLID：职责是否单一？领域层有没有直接依赖供应商？
- [ ] 有测试，测试只用合成数据
- [ ] 日志里没有健康信息；租户隔离没有被破坏
- [ ] 没有违反主 PRD §9 的护栏
- [ ] 涉及新功能时，有对应的 PRD（`docs/prds/`）
