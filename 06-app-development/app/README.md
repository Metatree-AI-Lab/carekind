# careKind App

Owner: Lin (Tech Lead) · Last reviewed: 04/10/2026

careKind 后端和护士端 App 的代码仓库。**技术栈待 ADR 确定**（`../engineering/adr/`），目前只有架构骨架和各功能模块的文档。

## 结构
```
src/
	domain/          业务规则，按功能模块分目录（每个模块都有 CLAUDE.md + README.md）
		shift-session/   segmentation/   attribution/   tiering/   drafting/
		fact-check/      review/         records/       handover/  consent/
	application/     用例编排
	adapters/        外部系统（语音转写、LLM、声纹、CMS、存储、认证）
	interfaces/      API 和 App 界面
```

## 开始之前
1. 读 `docs/PRD.md`（产品逻辑 §6、护栏 §9）
2. 读 `rules/02-code-rules.md`（Tab 缩进 4、16 条核心要求、单文件 ≤ 1000 行）
3. 执行一次 `git config core.hooksPath .githooks`
4. 编辑器开启 EditorConfig

## 文档约定
每个功能模块目录都必须有 `README.md`（给人看）和 `CLAUDE.md`（给 AI 看，含关键函数登记）；`AGENTS.md` 是指向 `CLAUDE.md` 的软链接，供 Codex 读取。
