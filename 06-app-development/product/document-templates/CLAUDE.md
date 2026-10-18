# CLAUDE.md — 文书模板（careKind 自有）

> 层级：子部门 / 功能区 · 路径：`06-app-development/product/document-templates/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
careKind 自己设计的护理文书 Markdown 模板（progress note、incident、SIRS 准备、跌倒后记录、ABC、约束性措施、交接等），是产品"起草规则"的字段来源，也是 Demo 示例数据的结构基础。

## 在这里通常要做的事
- 新增或修改模板（`<category>-<slug>.md`，category：daily / incident / clinical / plan / eol）
- 字段变化时同步更新 `index.md` 和相关功能 PRD

## 本目录特有的规则（在根目录规则之外）
- **自己设计，不复制** `03-legal-compliance/references/paperwork-templates/` 里只允许非商业使用的模板原文、版式和措辞；只能参考其覆盖的主题和法规要求。
- 每份模板必须有：用途 · 触发事件 · 谁起草 / 谁签署 · 时限 · 法律 / 标准依据（能定位到条款）· 字段表（标注 AI 可起草 / 只能照录原话 / 必须人工填写）· 填写示例。
- 填写示例只用**明确标注为虚构**的合成住户和员工，不出现真实姓名、房号或健康信息。
- AI 不能起草的内容（诊断、治疗或用药决定、是否属于 reportable incident 的判定、同意本身）在字段表里标 `🧑 人工`。
- 法规内容附"运营参考，不是法律意见"；不确定的写 ⚠️ 需核实。

## 关键文件
- index.md — 模板清单、触发事件、AI 适合度
- README.md

## 不要做
- 不要把这些模板当作机构的正式政策；机构要按自己的政策和 CMS 字段调整
- 不要写入真实住户数据

## 相关
- 03-legal-compliance/references/paperwork-taxonomy.md（按文书类型）
- 03-legal-compliance/references/paperwork-requirements-by-event.md（按触发事件）
- docs/PRD.md §6.6、§14
