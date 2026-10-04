# 前 30 天行动清单（Day 0 → Day 30）

Owner: Lightman · Status: Active · Last reviewed: 04/10/2026

按顺序做。每完成一项打勾，并把结果（编号、日期、文件链接）写回对应文档。

## Week 0 — 拿到仓库
- [ ] 按 `README.md` 的 **Setup** 一节 clone 仓库并运行 `scripts/setup.sh`（本仓库有 git submodule，必须安装）

## Week 1 — 公司实体 & 基础身份
- [ ] 确定创始人、股权比例、vesting（4 年 / 1 年 cliff 是常见做法）→ 记入 ADR-0002
- [ ] 申请 **Director ID**（每位董事，必须在任命前完成，ABRS）
- [ ] 在 ASIC 查名并注册 **careKind AI Pty Ltd**（或律师建议的名称）→ 得到 ACN
- [ ] 申请 **ABN**、**TFN**；评估是否现在就注册 **GST**（营业额 ≥ $75k 强制，早期可自愿注册以抵扣进项税）
- [ ] 签 **Shareholders' Agreement** + 创始人 **IP Assignment Deed**（把创始人在注册前写的代码/文档转让给公司）
- [ ] 开公司银行账户；上记账软件（Xero / MYOB）
- [ ] ⚠️ **已有 3 名员工**：签雇佣合同（含 IP 转让）、注册 PAYG W + STP、买 workers comp、安排 super → [`05-hr-teams/team-members.md`](05-hr-teams/team-members.md)
- 详见 [`03-legal-compliance/company-setup-checklist.md`](03-legal-compliance/company-setup-checklist.md)

## Week 2 — 品牌 & 防守
- [ ] IP Australia 商标检索 "careKind"（Class 9 软件、Class 42 SaaS、Class 44 医疗/护理服务）→ 提交申请
- [ ] 注册 carekind.com.au（需 ABN）+ carekind.ai / .com
- [ ] 建 Google Workspace / M365，开 MFA；建密码管理器
- [ ] 买保险前先要报价：Professional Indemnity / Tech E&O、Cyber、Public Liability → [`03-legal-compliance/insurance.md`](03-legal-compliance/insurance.md)

## Week 3 — 合规地基（卖给 aged care provider 之前必须有）
- [ ] 隐私政策 v1 上线官网（草稿见 [`09-templates/privacy-policy-draft.md`](09-templates/privacy-policy-draft.md)，律师审）
- [ ] 数据泄露响应计划 → [`03-legal-compliance/data-breach-response-plan.md`](03-legal-compliance/data-breach-response-plan.md)
- [ ] AI 治理政策 + TGA 边界声明 → [`03-legal-compliance/ai-governance.md`](03-legal-compliance/ai-governance.md)
- [ ] 确定云/LLM 供应商且数据处理在澳洲境内 → ADR-0001

## Week 4 — 客户发现
- [ ] 访谈 15+ 位 aged care RN / EN / 护理经理（脚本见 [`07-marketing-ops/marketing/icp-and-personas.md`](07-marketing-ops/marketing/icp-and-personas.md)）
- [ ] 跟 3 家 provider 聊试点意向
- [ ] 设定 Q4 OKR → [`01-strategy/okrs.md`](01-strategy/okrs.md)
- [ ] 开始每周节奏 → [`02-operating-system/operating-cadence.md`](02-operating-system/operating-cadence.md)

## 先找好的专业人士
| 角色 | 用途 | 状态 |
|---|---|---|
| 创业公司律师（懂健康科技） | 公司设立、SHA、MSA/DPA、隐私政策 | {{TBD}} |
| 注册税务代理 / 会计 | GST、BAS、R&D Tax Incentive、ESIC | {{TBD}} |
| 保险经纪 | PI / Cyber / PL 组合报价 | {{TBD}} |
| 临床顾问（aged care RN 背景） | 产品临床安全、客户信任 | {{TBD}} |
