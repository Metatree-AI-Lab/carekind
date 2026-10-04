# CLAUDE.md — 适配器层（adapters）

> 层级：子部门 / 功能区 · 路径：`06-app-development/app/src/adapters/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
外部系统的实现：stt/（语音转写）、llm/（含 prompts/）、voiceprint/、cms/、storage/、auth/。实现 domain 定义的接口。

## 在这里通常要做的事
- 在本层实现或修改代码

## 本目录特有的规则（在根目录规则之外）
- 所有供应商必须在澳洲区域；新增供应商先走 04-security 的子处理方评估
- LLM 输出视为不可信输入，在这里做 schema 校验
- 提示词和模型 ID 放在 llm/prompts/ 并纳入版本控制

## 关键文件
- （技术栈确定后补充）

## 不要做
- 不要把供应商类型泄露到 domain 层
- 不要在日志里记录健康信息

## 相关
- ../CLAUDE.md（仓库）
- rules/02-code-rules.md §3
