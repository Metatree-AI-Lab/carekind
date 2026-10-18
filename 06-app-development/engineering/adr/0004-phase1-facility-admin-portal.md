# ADR-0004：第一阶段增加养老院管理端（Facility Admin Portal）

- 状态：**Accepted**（产品范围，Lightman 18/10/2026 在对话中提出）· "独立 app 还是并入护士端"是 AI 的建议，待 Lightman / Lin 确认
- 日期：18/10/2026
- Driver：Lightman · Approver：Lightman（范围）/ Lin（技术实现）· Contributors：Claude（起草）· Informed：Gary、Windston
- 补充：[ADR-0003](0003-phase1-delivery-web-and-super-admin.md)（不取代它）

## 背景
ADR-0003 确定了第一阶段的两个前端：护士端 Web App，和 careKind 内部用的 Super Admin。但养老院自己也有一类用户，他们不写记录，而是负责管理和监督：Provider 管理员（IT、隐私）、DON、护理经理。主 PRD §5 已经列出这两个角色，§7.5 是护理经理流程。如果把这些功能都交给 careKind 的 super admin 代办，机构每改一次名单、角色都要找我们，super admin 也会被迫接触更多客户数据。

## 选项
| 选项 | 优点 | 缺点 |
|---|---|---|
| **A. 独立的养老院管理端 Web App（React）** | 主要在电脑上用，可以按桌面设计；权限边界清楚，护士端更简单；和 super admin 共用组件 | 多一个部署 |
| B. 并入护士端，按角色显示管理区 | 少一个应用；护理经理切换方便 | 护士端变复杂；权限出错的影响面更大 |
| C. 都由 careKind super admin 代办 | 第一阶段开发量最小 | careKind 员工接触客户数据过多，违背最小权限；机构不能自助 |

## 决定（建议）
采用 **A**，第一阶段共 4 个前端：

| 前端 | 谁用 | 范围 |
|---|---|---|
| 护士端 Web App | PCW、EN、RN | 口述、审核、交接、导出 |
| **养老院管理端（React）** | Provider 管理员、DON、护理经理 | 只管**本组织**：员工和角色、住户名单、单元总览、在 super admin 允许范围内调整配置、本组织审计日志、审批 careKind 的支持访问请求 |
| Super Admin（React） | careKind 内部员工 | 跨租户：新建 provider 和养老院、州规则包、全局模板、功能开关、系统健康；默认看不到健康信息 |
| Demo 环境 | 公开访客 | 虚构数据 |

**数据归属**（Lightman 18/10/2026：护士属于养老院；一家公司可能有多家养老院、多个地点；买单的是养老院的 business owner）：
```
Provider Organisation（公司 = 租户 = 买单方）
 ├─ （可选）Region 分组，例如 "VIC Metro"，只用于汇总和权限范围
 └─ Facility 养老院（地址、州/领地 → 自动带出州规则包）
     ├─ Unit 单元 / wing
     ├─ Resident 住户（属于某一家养老院；转到同公司另一家院 = 有审计的转移）
     └─ Staff 员工（雇佣关系在 Provider，分配到一家或多家养老院）
```
- 员工账号由**机构管理端**创建、分配角色、分配养老院、停用；careKind super admin 只建 Provider、首个 Owner 账号，以及首次上线时代建 Facility，不直接管理护士。
- 员工只能访问**被分配并且当前在上班**的养老院的数据；住户归属只在该养老院的本班名单里匹配（护栏 G4）。
- 同一公司内，一个账号可以分配到多家养老院，比如跨院的 RN、区域 DON。同一个人在**不同公司**工作时，是两个完全独立的账号，数据不互通。这一条修订了本 ADR 初稿里"一个账号只属于一家养老院"的写法。
- 管理端的使用者有 Owner / Executive（business owner，看所有养老院的汇总，默认不看住户临床内容）、Facility Manager、Clinical Lead（DON）、Care Manager、Provider admin / IT / Privacy。
- 管理端里的"员工"MVP 只包括需要使用 careKind 的人，不做完整的 HR、排班或薪资系统。
- 详细规格见 `docs/prds/2026-10-18-provider-portal-facility-admin.md`（编写中）。

**配置分两层**：super admin 设定上限和下限（例如哪些类别必须是 Tier 3、哪些模板可以启用），养老院管理端只能在这个范围内调整，**只能调得更严，不能调得更松**。

**不在本 ADR 内决定**：前端框架细节、是否和护士端共享代码库（monorepo），归 Lin 的技术 ADR-0001。

## 后果
- 主 PRD §5、§7.5、§8、§10 要加入养老院管理端（**尚未修改**）。
- 需要一份功能 PRD：`docs/prds/2026-10-18-facility-admin-portal.md`（**尚未编写**），可以和 super admin PRD 合写或分开写。
- 护理经理的单元总览来自 `docs/prds/2026-10-18-isbar-handover-and-care-coverage.md`，审计链视图来自 `2026-10-18-tiered-review-and-audit-trail.md`。这些功能改为在养老院管理端里实现。
- 安全：养老院管理端能看到本组织的健康信息，需要最小权限、所有操作写审计（不做 MFA，见 ADR-0005）；不显示员工个人绩效排名（护栏 G10 精神）。

## 复盘时间
同 ADR-0003：第一个试点进行 4 周后。
