# 产品论点 (Product Thesis)

Owner: Lightman · Status: Hypothesis — 待客户发现验证 · Last reviewed: 04/10/2026

## 问题
澳洲 residential aged care 的 RN / EN / PCW（personal care worker）每个班次要写大量记录：progress notes、incident reports、wound charts、behaviour charts、handover、care plan 更新、family communication log。
- 痛点假设 H1：文书占护士班次时间的显著比例（⚠️ 用访谈和时间测量验证，不要引用未核实的数字）。
- H2：记录质量参差（遗漏、不具体、措辞不够 person-centred），在 Quality Standards 审计和事故调查时成为风险。
- H3：英语非母语的护理员写记录更费时、更焦虑。
- H4：记录常常在班次结束后补写，细节丢失。

## 方案（MVP 范围）
护士用手机/平板**口述**或输入要点 → careKind 生成结构化、符合机构模板的**记录草稿** → 护士**审核、修改、确认** → 写回客户现有的临床管理系统（或先导出）。

MVP 优先场景（待验证排序）：
1. Progress notes（每日进展记录）
2. Incident report 初稿（含 SIRS 可能相关提示——**只提示，不判定**）
3. Shift handover 汇总
4. 多语言口述 → 英文记录

## 明确不做（MVP 期间）
- ❌ 诊断、治疗/用药建议、临床风险评分 → 避免进入 TGA SaMD 监管（见 `03-legal-compliance/tga-samd-boundary.md`）
- ❌ 没有护士确认就自动写入正式记录
- ❌ 自建完整临床管理系统（与现有系统集成，不替代）
- ❌ 环境对话录音（录到老人和他人的对话；隐私、同意、监控设备法风险太重）→ 只在 Phase 3 有条件考虑
- ✅ 已调整：**整班口述录音（只保留护士本人的语音）+ 按老人自动分配**列入 MVP，见 `docs/prds/2026-10-04-shift-capture-and-resident-records.md`

## 客户是谁
- **买单方**：aged care provider（运营 residential aged care homes）——决策人：CEO / COO、Director of Nursing / Clinical Governance、IT/Privacy
- **使用者**：RN、EN、PCW、Care manager
- **受益方**：住户 (older people) 及家属
详见 `07-marketing-ops/marketing/icp-and-personas.md`

## 商业模式假设
- SaaS，按 bed / 按 facility / 按用户 订阅（待定价实验）
- 试点：8–12 周付费或折扣试点 → 转年度合同

## 成功的样子（北极星指标候选）
**每位护士每班次节省的文书分钟数**（需要可审计的测量方法），辅以：记录被采纳率（AI 草稿被保留比例）、护士周活跃率、记录质量审核得分。

## 关键风险
| 风险 | 缓解 |
|---|---|
| AI 幻觉写入不存在的临床事实 | 只从护士输入生成；源句可追溯；审核界面高亮；评测集 |
| 集成难（各家临床系统 API 不开放） | 先做复制/导出，再挑 1–2 个系统深度集成 |
| 销售周期长 | 从中小型 provider 和创新型 provider 切入；试点手册标准化 |
| 隐私/安全尽调卡单 | 第一天就建安全与隐私文档包（`04-security/`） |
| 被大型临床系统厂商内置 AI 功能挤压 | 聚焦护士体验、多语言、aged care 专属模板 |
