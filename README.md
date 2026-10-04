# careKind AI — Company OS

> 帮澳洲 aged care 护士把 paperwork 时间还给照护。
> 这是 careKind AI 的公司操作系统：使命、战略、运营节奏、合规、安全、人事、产品、GTM、财务——所有"公司怎么运转"的单一事实来源 (Single Source of Truth)。

**状态**：Day 0（项目启动，2026-10）· **地点**：Australia · **最后更新**：2026-10-04

---

## 从这里开始

| 你是谁 | 先读 |
|---|---|
| 创始人（本周） | [`00-START-HERE.md`](00-START-HERE.md) — 前 30 天行动清单 |
| 新加入的同事 | [`00-company/mission-vision-values.md`](00-company/mission-vision-values.md) → [`05-hr-teams/onboarding/onboarding-checklist.md`](05-hr-teams/onboarding/onboarding-checklist.md) |
| 📘 所有人（产品 / 运营 / 开发） | [`docs/PRD.md`](docs/PRD.md) — 主 PRD：做什么、为什么、怎么做 |
| 写代码 / 做产品 | [`06-app-development/product/product-principles.md`](06-app-development/product/product-principles.md) → [`03-legal-compliance/ai-governance.md`](03-legal-compliance/ai-governance.md) |
| 去见客户 | [`07-marketing-ops/sales/sales-process.md`](07-marketing-ops/sales/sales-process.md) → [`07-marketing-ops/customer-success/pilot-playbook.md`](07-marketing-ops/customer-success/pilot-playbook.md) |
| 任意目录 | 每个目录都有 `README.md`（给人）和 `CLAUDE.md`（给 AI），先读它们 |
| Claude / Codex / AI agent | [`AGENTS.md`](AGENTS.md)（CLAUDE.md 引入它）→ [`11-workflows/`](11-workflows/) · [`12-skills/`](12-skills/) |

## 目录地图

```
rules/                 📏 规范：公司、运营、代码（SOLID/DRY/KISS，Tab 缩进 4）、产品设计、PRD（必须引用本地法律文件）
docs/                  📘 产品文档：主 PRD + 功能 PRD（所有运营、产品、开发人员的参考）
00-company/            公司是谁：使命愿景价值观、公司档案、产品论点、术语表
01-strategy/           往哪走：OKR、路线图、市场与竞品
02-operating-system/   怎么运转：节奏、决策机制、决策日志、指标
03-legal-compliance/   守什么规矩：合规总表、注册清单、隐私、aged care 监管、AI 治理、TGA 边界、数据泄露响应、保险、合同
04-security/           怎么保护数据：信息安全政策、数据分级与保留、访问控制、子处理方

05-hr-teams/           👥 HR 与团队
  ├─ policies/           雇佣合规、行为准则、WHS、请假等政策
  ├─ hiring/             招聘流程、JD、面试
  ├─ onboarding/         入职/离职清单
  └─ teams/              各团队主页：leadership / engineering / clinical / growth

06-app-development/    📱 App 开发
  ├─ product/            产品原则、路线图、PRD
  ├─ clinical-safety/    临床安全案例、危害日志、评测
  ├─ engineering/        架构、技术栈、开发规范、发布流程、技术 ADR
  ├─ design/             设计系统、UX 原则、无障碍
  ├─ research/           用户研究、访谈记录
  └─ app/                App 源码（git submodule → Metatree-AI-Lab/carekind-app）

07-marketing-ops/      📣 Marketing 与运营
  ├─ brand/              品牌、语气、视觉
  ├─ marketing/          ICP 与画像、内容、官网、渠道、营销合规
  ├─ sales/              销售流程、采购尽调包
  ├─ customer-success/   试点手册、上线与支持
  └─ operations/         内部运营：工具栈、供应商、行政

08-finance/            钱：财务运营、税务激励、融资
09-templates/          模板：周报、ADR、事故报告、隐私政策草稿、DPA 大纲
10-feedback/           🗣️ 用户原始反馈（RAW，人工录入，AI 不得编写）
11-workflows/          ⚙️ 工作流（多个 skill 串成的流程，Claude Code 和 Codex 都能执行）
12-skills/             🧩 Skills（Claude Code 和 Codex 共用，通过 .claude/skills 与 .agents/skills 软链接自动发现）
scripts/               无人值守运行脚本（run-workflow.sh）
changelog/             📝 AI 修改记录：任务摘要（YYYY-MM.md）+ 自动编辑明细（ai-edits/）
99-inbox/              随手记，定期整理进上面各目录
```

## 获取仓库
```bash
git clone --recurse-submodules git@github.com:Metatree-AI-Lab/carekind.git
cd carekind && git config core.hooksPath .githooks
(cd 06-app-development/app && git config core.hooksPath .githooks)
```

## 三条铁律

1. **护士永远是记录的作者。** AI 起草，护士审核签字。产品里任何地方都不能绕过这一步。
2. **健康信息是最高敏感级数据。** 默认存在澳洲境内、默认最小化、默认加密。
3. **不确定的合规问题，先问律师再上线。** 本仓库所有法律内容都是运营参考，**不是法律意见**。

> ⚠️ 免责声明：`03-legal-compliance/` 等目录是根据 2026-10 已公开的澳洲法规整理的运营清单，标注 `⚠️ 需核实` 的条目必须由澳洲执业律师 / 注册税务代理复核。
