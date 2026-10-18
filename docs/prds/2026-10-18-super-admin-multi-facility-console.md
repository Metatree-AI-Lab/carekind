# PRD：Super Admin 多机构控制台（careKind 内部，独立 React App）

Owner: Lightman (PO) · Status: **Draft** · Last reviewed: 18/10/2026
Parent: [docs/PRD.md](../PRD.md)
Related: [ADR-0003](../../06-app-development/engineering/adr/0003-phase1-delivery-web-and-super-admin.md) · [ADR-0004](../../06-app-development/engineering/adr/0004-phase1-facility-admin-portal.md) · Provider Portal 功能 PRD（`2026-10-18-facility-admin-portal.md`，同期起草，**数据层级与本文件必须一致**）· [分级审核与审计链](2026-10-18-tiered-review-and-audit-trail.md) · [ISBAR 交接与覆盖](2026-10-18-isbar-handover-and-care-coverage.md) · [记录导出与 CMS 集成](2026-10-18-record-export-and-cms-integration.md) · [Demo 工作区](2026-10-18-demo-workspace-and-synthetic-data.md) · [Shift Capture](2026-10-04-shift-capture-and-resident-records.md) · `04-security/` · `06-app-development/product/document-templates/`

> 一句话：Super Admin 是 careKind 内部员工用的**控制面（control plane）**：开通和管理多个 Provider（公司 = 租户 = 买单方）及其多家养老院，记录签约与合规状态，维护州规则包、全局文书模板库、流程模板与下限、功能开关和套餐限额，看运营指标。它**默认看不到任何住户健康信息**；支持访问必须"工单 + 机构批准 + 限范围限时 + 全程审计 + 机构可见"。
>
> 说明：`rules/04-prd-rules.md` §1 要求用 Mermaid；本 PRD 按 Owner 要求（用户在终端阅读）把图改为**纯文本 ASCII**。运营参考，不是法律意见。

---

## 1. 问题

### 1.1 谁、在什么场景、遇到什么问题
- **careKind 实施 / 客户成功**：每签一家 Provider，要建公司、建多家养老院和单元、开第一个管理员、按州配好规则、跟踪 Pilot Agreement / DPA / PIA / 保险证书是否到位、核对 `paperwork-requirements-by-event.md` §18 的 19 项上线文件。没有工具时只能改数据库或靠表格，既不可审计，也违反最小权限（ADR-0003 选项 C 的缺点）。
- **careKind 内容 / 临床治理**：文书模板、州差异提示、流程下限会变（例如 01/12/2026 约束性措施同意过渡期、NSW 药品法 05/11/2026 换代，`state-clinical-practice-rules.md` §0）。改动要版本化、可回滚、知道推给了哪些机构，否则会把错的州规则推到错的养老院。
- **careKind 支持 / on-call**：客户报问题时，支持人员需要看一部分数据才能排查，但 `rules/01-operations-rules.md` §4 要求工单授权 + 审计；现在没有"产品内支持模式"（`04-security/access-control.md`"内部访问"一行只是原则）。
- **买单方（Provider business owner）与机构的隐私负责人**：要能相信 careKind 员工看不到住户内容，除非他们批准；终止合同时能拿回数据并得到删除证明（DPA 大纲 `09-templates/dpa-outline.md` 第 12 条）。

### 1.2 证据（诚实标注）
| 证据 | 来源 | 强度 |
|---|---|---|
| Owner 决定第一阶段就做独立 React Super Admin，默认看不到健康信息 | ADR-0003（Accepted，18/10/2026） | 决策，不是用户证据 |
| 一家公司多家养老院、员工属于养老院、买单方是 business owner | ADR-0004；Owner 18/10/2026 原话要点 | 决策 |
| 州政府运营养老院的采购会要求境内托管、Essential Eight、事件通报时限 | `state-by-state-comparison.md` §3.11、§4.3、§4.4 | 二手研究（官方页面部分已核实） |
| 机构侧上线需要 19 项文件 | `paperwork-requirements-by-event.md` §18 | 内部整理 |
| 用户访谈 / 反馈 | `10-feedback/` 为空 | **n = 0**；本 PRD 中关于机构 IT / 隐私负责人期望的描述都是**假设** |

### 1.3 本 PRD 回应的调研缺口
- 状态机缺"租户层"：Provider / Facility 的开通、暂停、终止没有定义 → §4-D。
- 州差异只写在研究文档里，产品没有承载方式 → 州规则包 §4-H。
- 分级规则"只能调严"在 tiered-review PRD §4.1 定义了，但谁设下限、怎么分发、怎么版本化没有定义 → §4-G、§4-J。
- 支持访问只有原则 → §4-M。

---

## 2. 目标与指标

### 2.1 目标
1. 新 Provider 从签约到第一家养老院可用，**所有配置都在 Super Admin 里完成并留审计**，不需要直接改数据库。
2. careKind 员工默认对健康信息**零可见**；任何例外都可以被机构看到、追溯和撤销。
3. 州规则、模板、流程下限的每次变更都有版本、审批人和推送范围，可以回滚。
4. 终止合同时，按 DPA 完成数据返还 + 删除 + 删除证明，且不会删除机构的"唯一副本"。

### 2.2 指标（全部来自 Super Admin 自身的审计事件，不含健康信息）
| 指标 | 测量方法 | 试点目标 |
|---|---|---|
| 直接改生产数据库的配置操作次数 | 云数据库审计日志中非服务账号的写操作 ÷ 上线配置任务数 | **0** |
| 未经机构批准的 careKind 健康信息访问 | 健康数据访问日志中没有有效 `SupportAccessGrant` 的读取次数 | **0** |
| 租户隔离测试 | CI 中跨租户读写用例的通过率（每次发布） | **100%**，否则不发布 |
| 上线清单完成度 | 每家 Facility 的必填项完成数 ÷ 必填项总数，按日快照 | 上线前 = 100% |
| 规则包 / 模板误推 | 推送后 7 天内因"推错版本 / 推错州"回滚的次数 | **0**（任何一次都按事故复盘） |
| 支持访问平均时长 | grant 实际使用时长的中位数（只用于检查是否过度授权） | 只观察，不设目标 |

---

## 3. 用户故事
| 角色 | 故事 |
|---|---|
| careKind 实施（Implementation） | 作为实施人员，我想用向导新建 Provider、首个 Owner 账号、Facility 和 Unit，并看到上线清单哪些项还缺，以便按计划上线而不漏文件。 |
| careKind 内容治理（Content & Clinical Governance） | 作为内容负责人，我想起草新版本的州规则包或模板，交给第二个人批准后再按租户分批推送，以便出错时影响面小、能回滚。 |
| careKind 支持（Support） | 作为支持人员，我想针对一个工单申请只读、限范围、限时的访问，机构批准后才生效，以便排查问题且留下证据。 |
| careKind 账务（Commercial） | 作为负责合同的人，我想记录套餐、席位或床位上限、账单状态和合同日期，以便限额能在产品中生效。 |
| careKind 安全审计（Security Auditor，只读） | 作为审计人，我想查到每一个 careKind 员工在 Super Admin 里做过什么，而且这些记录没人能改。 |
| Provider 隐私负责人（间接用户，在 Provider Portal 中） | 作为隐私负责人，我想批准或拒绝 careKind 的支持访问，并在本组织审计日志里看到他们看了什么。 |
| Provider business owner（间接） | 作为买单方，我想知道合同终止后数据如何返还、何时删除，并拿到删除证明。 |

---

## 4. 方案

### 4-A 范围
| 范围内（MVP / 第一阶段） | 范围外 |
|---|---|
| Provider / Region / Facility / Unit 的建立与生命周期；首个 Owner 账号 | 管理护士和其他员工、住户名单（属于 Provider Portal，ADR-0004） |
| 签约与合规**状态**记录（状态、日期、负责人、文件存放位置的引用） | 存储合同、DPA、PIA、保险证书**原件**（原件放在合同管理系统 `{{TBD}}`，`rules/00-company-rules.md` §3） |
| 上线检查清单（对应 §18 的 19 项） | 在线支付、发票开具、自动扣款（**不在授权范围**） |
| 州规则包、全局模板库、流程模板库与下限、功能开关（定义、版本、推送） | 机构自己的流程配置界面（Provider Portal，只能在下限之上调严） |
| 套餐、席位或床位上限、账单状态（只记录 + 限额生效） | 查看住户内容、员工个人表现 |
| 支持访问申请（机构批准后才生效）、Super Admin 自身审计 | SSO 联合登录给客户（Phase 2）、客户自助开户 |
| 运营监控（聚合指标、系统健康） | 临床质量评分、任何风险评分 |
| Demo Provider：Wattle Grove Care Group（虚构），一键重置 | 公开访客进入 Super Admin（Demo 只给内部培训和销售讲解，见 §11） |

### 4-B 数据层级与隔离（与 Provider Portal PRD 一致）
```
careKind 平台（Super Admin = 控制面，看不到健康内容）
 |
 +-- Provider Organisation  [租户边界 = 隔离边界 = 买单方 business owner]
 |    |   tenant_id, legal name, ABN, 套餐, 合同状态, 生命周期状态
 |    |
 |    +-- Region（可选，例如 "VIC Metro"；只用于汇总和权限范围）
 |    |
 |    +-- Facility 养老院（地址, 州/领地 -> 自动带出州规则包, 是否州政府运营）
 |         +-- Unit / wing
 |         +-- Resident 住户        <-- 由 Provider Portal 管理，Super Admin 不可见
 |         +-- Staff assignment     <-- 雇佣在 Provider，分配到 1..n 家 Facility
 |
 +-- Provider Organisation B   (与 A 数据绝对隔离；同一个人在 A、B 工作 = 两个账号)
 |
 +-- Demo Provider: Wattle Grove Care Group（虚构） [独立 Demo 环境，不在生产]
```
- **两个平面**：控制面数据（租户元数据、配置、合同状态、聚合指标）和数据面数据（住户、记录、音频、草稿）分开存储、分开授权。Super Admin 的 API 只连控制面；它**没有**读数据面的常规接口，只有经 §4-M 授权后生成的短期只读会话。
- **隔离测试**：每次发布跑跨租户用例（A 的 token 读 B 的住户 / 记录 / 审计 / 导出任务 / 搜索结果 / 文件 URL / 缓存 / 后台任务），任何一条通过即阻断发布。Region 和 Facility 权限范围也要有同样的越权用例。具体隔离方式（库、schema、行级）由 Lin 在 ADR-0002 决定。
- **Facility 州字段**：只能由 Implementation 起草、第二人批准修改（four-eyes），修改会触发规则包重新绑定和受影响模板清单预览（防 HAZ-P-SA-01）。

### 4-C careKind 内部角色与职责分离
| 角色 | 可以 | 不可以 |
|---|---|---|
| Platform Owner（Lightman） | 批准终止、批准高风险推送、管理内部角色 | 自己批准自己发起的操作 |
| Implementation | 建 Provider / Facility / Unit、首个 Owner 邀请、上线清单、合同状态 | 发布规则包 / 模板；申请支持访问 |
| Content & Clinical Governance | 起草规则包、模板、流程模板与下限的新版本 | 发布自己起草的版本（须另一人批准） |
| Support | 发起支持访问申请；在获批范围内只读 | 写入任何客户数据；延长自己的授权 |
| Commercial | 套餐、限额、账单状态 | 修改配置下限、看任何客户用户列表以外的数据 |
| Engineer on-call | 系统健康、错误率（脱敏） | 通过 Super Admin 访问数据面；生产数据库访问走 `access-control.md` 的限时提权流程 |
| Security Auditor（只读） | 查看全部 Super Admin 审计日志 | 任何写操作 |

- **默认拒绝**；一个人可以有多个角色，但"发起"和"批准"同一操作必须是两个人（four-eyes）。适用：终止租户、修改 Facility 州、发布规则包 / 模板 / 流程下限、功能开关全局打开、恢复被暂停租户。
- 内部人数少（4 人团队），four-eyes 在有人缺席时可能卡住 → 允许 Platform Owner 用 **break-glass** 单人执行，但会立即通知全体内部角色并在 24 小时内复核（`access-control.md`"限时提权 + 审计 + 事后复核"）。

### 4-D 租户生命周期
```
 [Draft] --签约状态录入--> [Onboarding] --上线清单 100% + four-eyes--> [Active]
                               |                                        |   ^
                               | 放弃                         暂停原因   |   | 恢复 (four-eyes)
                               v                                        v   |
                           [Cancelled]                              [Suspended]
                                                                        |
                    Active / Suspended --终止通知 + four-eyes--> [Terminating]
                                                                        |
                         返还导出完成 + 机构书面确认已收到 + 保留期届满
                                                                        v
                                         [Terminated]（只保留不含健康信息的墓碑记录 + 删除证明）
```
| 状态 | 护士端 / Provider Portal 的行为 |
|---|---|
| Onboarding | 只有 Owner 和被邀请的管理员能登录配置；护士端不可录入 |
| Active | 正常 |
| Suspended | **不能新建口述和草稿；已有草稿不删除；已确认记录仍可查看和导出**（避免机构丢失记录）。除安全原因外，提前 {{TBD：7}} 天通知 Owner。界面："Your organisation's careKind access is paused. You can still view and export confirmed records. Contact support@carekind… for help."（域名待定） |
| Terminating | 只读 + 导出；Super Admin 生成"返还包"任务（PDF + 结构化文件，复用 export PRD 的格式）；Owner 在 Provider Portal 下载并确认收到 |
| Terminated | 数据面删除；控制面只保留租户墓碑（名称、ABN、日期、删除证明编号），审计日志按保留期处理 |

**终止时的数据返还与删除（按 DPA）**：
1. Commercial 录入终止通知日期和 DPA 约定的返还期（`dpa-outline.md` 第 12 条："终止后 {{30}} 天内返还并删除，提供删除确认"）。
2. 系统列出所有**尚未成功导出到机构 CMS** 的已确认记录（export PRD §"careKind 副本不进入删除倒计时"）。只要还有这类记录，删除任务不能启动——careKind 不能删除机构的唯一副本（Rules 154-1000 要求 provider 保存临床记录 7 年，见 §4.5）。
3. 生成返还包 → Owner 下载 → Owner 在 Provider Portal 点 "Confirm we have received our data"（书面确认）。
4. 删除任务按数据类别执行（音频、转写、草稿、记录副本、住户与员工账号、文件、搜索索引、缓存），备份按备份轮换周期过期并在证明上写明日期。
5. 生成**删除证明**（租户、数据类别、执行日期、备份过期日期、执行人和批准人）和**删除日志**（不含健康内容），满足 ACT Principle 4.2 销毁登记、NSW s25(2)–(3) 的思路（`state-by-state-comparison.md` §4.5，⚠️ 律师确认）。
6. 第 2–5 步每步都写 Super Admin 审计；第 4 步需要 four-eyes。

### 4-E 新建 Provider 与首次上线流程
```
 Implementation                    Super Admin                     Provider（Owner / 管理员）
 --------------                    -----------                     ---------------------------
 1. 新建 Provider（Draft）  ---->  校验 ABN 格式、名称唯一
 2. 录入签约状态            ---->  Pilot Agreement / DPA / PIA / 保险证书
                                   状态 + 日期 + 负责人（不存原件）
 3. 代建 Facility / Unit    ---->  按地址州自动绑定州规则包 vX
                                   显示"本院将启用的模板 + 州提示"预览
 4. 选择套餐与限额          ---->  席位或床位上限、可启用 Facility 数
 5. 邀请首个 Owner          ---->  发送邀请（一次性链接，72h 过期）  ---->  Owner 设置密码
                                                                     ---->  在 Provider Portal 建员工、
                                                                           住户、流程（只能调严）
 6. 跟踪上线清单            <----  清单自动打勾（来自双方系统事件）  <----  员工告知、培训确认等
 7. 申请转 Active           ---->  检查：清单 100%、DPA = Signed、
                                   保险 = Current、隔离测试通过
 8. 第二人批准（four-eyes） ---->  Active；通知 Owner
```
**上线清单**（每家 Facility 一份；条目来自 `paperwork-requirements-by-event.md` §18，标 ★ 的是转 Active 的硬门槛）：
| # | 条目 | 状态来源 |
|---|---|---|
| ★1 | Pilot Agreement 已签 | 合同状态 |
| 2 | 书面成功标准已约定 | 合同状态 |
| ★3 | DPA / Privacy Schedule 已签 | 合同状态 |
| ★4 | careKind MVP PIA 已完成并向 Provider 提供摘要 | 合同状态 |
| 5 | Provider 自己的 PIA / 隐私政策更新（含 APP 1.7–1.9） | Provider 自报 |
| ★6 | 参与员工的告知与同意已记录 | Provider Portal 员工上线流程 |
| ★7 | 住户和家属告知已发出；退出登记可用 | Provider Portal |
| 8–9 | 安全问卷回复、子处理方清单已提供 | 合同状态 |
| ★10 | 保险证书在有效期内 | 合同状态（到期前 30 天提醒） |
| ★11 | 泄露通报联系人和时限已登记（见 §4-F） | Super Admin |
| 12 | 临床安全资料包已提供 | 合同状态 |
| ★13 | Provider 书面确认 IMS / SIRS 流程不变（careKind 不判定、不上报） | Provider 自报 |
| ★14 | 分级规则、模板、导出方式已配置 | Provider Portal 配置版本 |
| 15 | 基线测量完成 | 合同状态 |
| 16 | 进场人员 police check / 疫苗已核验 | careKind 人员登记（不存证件原件） |
| 17 | 是否需通知 Commissioner（⚠️ 需核实） | Provider 自报 |
| ★18 | 支持 SLA 与支持访问审批人已登记 | Super Admin |
| 19 | 结束条款（返还 / 删除）已在合同中 | 合同状态 |

### 4-F 签约与合规状态记录
- 记录对象：Pilot Agreement、MSA（以后）、DPA、PIA（careKind 的 + Provider 的）、保险证书（PI / cyber / public liability）、安全问卷、子处理方清单版本。
- 每项字段：`status`（Not started / Drafting / Sent / Signed / Expired / Not applicable）、生效日、到期日、careKind 负责人、Provider 负责人（姓名 + 职位）、原件存放位置引用（只写系统名和编号，不存文件、不存链接中的令牌）、备注（禁止填健康信息，输入框下方提示 "Do not enter resident or health information"）。
- **偏离标准条款**：勾选"Non-standard terms"时必须填 Lightman 批准日期（`rules/01-operations-rules.md` §2：偏离由 Lightman 批准；不能让步的条款列表显示为只读核对项：客户数据归客户、不训练、境内、护士负临床责任、责任上限与保额匹配）。
- **泄露通报登记**（`state-by-state-comparison.md` §4.4）：Provider 的泄露联系人、适用制度（私营 NDB / NSW 公营 / QLD 公营 / VIC OVIC 等，按"是否州政府运营 + 州"带出建议）、careKind 承诺时限（默认 24 小时；NSW 公营建议 12 小时）。这只是**登记和提醒**，真正的事件处理走 `data-breach-response-plan.md`。
- **州政府运营**的 Facility 额外显示 §3.11 的采购要求清单（境内托管、Essential Eight 成熟度声明、FOCI 声明、人员 police clearance），作为 Commercial 的核对项。

### 4-G 配置分层模型（所有可配置项共用）
```
 Layer 0  careKind 硬底线（代码内，任何人都不能改）     例：G1 人工确认、G5 Tier 3 逐条确认、
          |                                              G7 只能更正不能删除、数值至少 Tier 2
 Layer 1  careKind 全局默认 + 下限（Super Admin 发布）    例：默认 Tier 映射、可启用模板集合
          |  只能调严 ↓
 Layer 2  Provider 统一配置（Provider Portal，Owner/Provider admin）
          |  只能调严 ↓
 Layer 3  Facility 覆盖（Provider Portal，Facility Manager / Clinical Lead）
          v
 生效配置 = 逐层取"更严"的值；每层都有版本号
```
- **"更严"的定义按配置项类型写死**：Tier 只能上调；"谁可以确认"只能缩小角色集合；提醒时间点只能提前或增加；保留期在合同约定范围内只能缩短（不能短于法定或 DPA 下限）；模板只能在全局已发布集合中启用 / 停用。系统在保存时校验，校验失败给出原因："This setting can only be made stricter than the careKind minimum."
- **版本与生效**：每个已发布版本不可修改；新版本有 `effective_from`（默认下一班开始，与 tiered-review PRD §4.1 一致）；每条草稿和记录都写入生成时的配置版本号，方便事后追溯。
- **下限上调时的冲突**：若 careKind 把某下限调严，而 Provider 当前值更松，系统自动按新下限生效，并在 Provider Portal 通知 Owner 和 Clinical Lead（"careKind has raised a minimum setting. Your setting has been updated to match."），写审计。
- **推送**：所有 Layer 1 变更走"起草 → 第二人批准 → 先推 Demo Provider → 选择推送范围（全部 / 某州 / 指定租户）→ 发布"。发布前显示受影响的 Provider、Facility 数和差异。可一键回滚到上一版本（回滚也是新版本，留审计）。

### 4-H 州规则包（State rule pack）
- **是什么**：每个州 / 领地一个包，内容只有三类：①**提示文字**（在特定模板的特定字段旁显示的静态说明）；②**字段配置**（显示哪些字段、字段的选项列表，例如 RP 同意来源类型按州切换）；③**参考链接**（指向机构政策或官方页面的名称）。
- **不是什么**：不做判断，不根据记录内容触发任何提示，不预填 🧑 人工字段，不决定谁有权同意、是否 reportable、是否须报 coroner（`state-clinical-practice-rules.md` §7 的"AI 不能做"一列）。内容触发的流程提示（如 SIRS 提示）属于 tiered-review PRD，单独做 TGA 🟡 评审。
- **绑定**：按 Facility 的州自动绑定当前发布版本；同一 Provider 跨州时各院各用自己的包（Demo：Grevillea House 用 NSW 包）。
- **版本化**：`rule_pack_id = <STATE>-<YYYY.MM>-<n>`，例如 `NSW-2026.10-1`；每个版本记录来源文件和核实日期（例如 `state-clinical-practice-rules.md` §1.2，18/10/2026），标 ⚠️ 的内容在包里也显示 "To be verified" 内部标签，**未核实项默认不对客户显示**。
- **发布门槛**：Content & Clinical Governance 起草 → 临床顾问 + 法律审阅人（{{TBD}}）批准 → TGA 文字检查（§5 表格）→ four-eyes 发布。
- **01/12/2026 约束性措施同意过渡期开关**（`state-clinical-practice-rules.md` §1.3："这个开关要可配置，不写死日期"）：
  - 配置项 `rp_consent_cth_transition`：`active` / `ended` / `extended_until:<date>`，由 Super Admin 在全局设置，可按州覆盖。
  - 默认值：`active` 直到 Lightman 根据官方公告改为 `ended` 或 `extended_until`；**不会到日期自动切换**（日期是否延期 ⚠️ 未核实，自动切换可能显示错误提示）。到 24/11/2026 系统提醒 Content 负责人核实。
  - 效果：只改变 `clinical-restrictive-practice-consent-record` 模板中"联邦 hierarchy"选项旁的提示文字（§5 表格第 2 行），不改变任何记录、不阻止保存。

### 4-I 全局文书模板库
- 来源：`06-app-development/product/document-templates/`（26 份 careKind 自有模板，`index.md`）；**不得**收入 `paperwork-templates/` 的第三方原文（非商业许可）。
- 每个模板版本：`template_id`、语义版本号（字段增删 = 主版本，提示文字 = 次版本）、对应源文件路径和 git 提交号、默认 Tier、"🧑 人工字段"清单（发布时校验这些字段不能被标为 AI 可起草）、适用州（全部或指定）、状态（Draft / Published / Deprecated）。
- **推送规则**：主版本变化不自动替换机构正在使用的版本，Provider 在 Provider Portal 中选择升级时间；次版本可以随下一班生效。已生成的草稿和记录保留生成时的模板版本号，不会被新版本改写。
- **Phase 2 文书**（主 PRD §8 的 incident 草稿等）在库里可见但标 "Planned"，功能开关关闭时机构不能启用。

### 4-J 流程模板库与下限
Provider Portal PRD 负责"机构怎么配"；本 PRD 负责"careKind 提供哪些模板和下限"。
| 流程 | careKind 提供的模板（默认） | 下限（Layer 1，机构只能调严） |
|---|---|---|
| 审核链与分级 | 主 PRD §6.5 / tiered-review §4.1 默认表 | Tier 3 类别不能下调；数值和药名至少 Tier 2；PCW 默认不能确认 Tier 2/3 |
| 升级与通知路由 | Tier 3 → 当班 RN；{{TBD：15}} 分钟无人处理 → 备岗 RN / CM | 必须配置至少一个备岗；只通知，不判断是否 reportable |
| 跨班次待办 | 跌倒后记录时间点"按本院政策"空模板 | 不能删除已产生的待办；只提示"该时间点没有记录" |
| 入住 / 转院 / 离开清单 | care and services plan 在 start day 当天或之前存在（r 148-80）提醒 | 不能关闭该提醒 |
| care plan 复核提醒 | 无默认周期（r 148-80(5) 不适用 residential） | 不设下限；周期由机构政策决定 |
| 家属沟通 | 跌倒、转院、死亡事件后提示"是否已记录与家属沟通" | 只能增加事件类型 |
| 员工上线 | 录音告知与同意 → careKind 培训确认 → 开通权限 | 前两步未完成不能开通护士端 |
| 新养老院上线 | §4-E 清单 | ★ 项不能跳过 |

### 4-K 功能开关（Feature flags）
- **默认关**；作用范围：全局 / 州 / Provider / Facility；每次切换写审计（谁、何时、原因、范围）。
- 三类：①**发布开关**（新功能灰度，例如 `isbar_handover`）；②**风险开关**（需要法律前提的功能，例如 `whole_shift_capture`、`ambient_recording`）——在律师书面意见登记到 Super Admin 之前**界面上不能打开**（灰色并显示原因）；③**运维开关**（例如暂停某个 ASR 供应商）。
- 关闭一个开关不能删除已有数据；关闭后对应入口隐藏，已生成的草稿仍可审核（防止草稿丢失）。

### 4-L 套餐、席位或床位、账单状态（只记录 + 限额）
- 字段：套餐名称、计价单位（席位 / 床位 / Facility，⚠️ 商业模式未定，主 PRD §12）、上限值、合同起止、账单状态（Not invoiced / Invoiced / Paid / Overdue，**人工更新**，来源是会计系统 `{{TBD：Xero / MYOB}}`）。
- 限额生效：超过席位或可启用 Facility 数时，Provider Portal 中"新增员工 / 新增养老院"按钮禁用并提示 "Your plan allows 40 staff accounts. Contact careKind to change your plan."；**已有员工不会被停用**，护士端不受影响（不能因为账务原因中断临床记录）。
- 范围外：在线支付、银行卡、自动扣款、发票生成。

### 4-M 支持访问（Support access）
```
 Support(careKind)        Super Admin            Provider Portal (审批人)        数据面
 -----------------        -----------            ------------------------        ------
 1 关联工单 SUP-xxxx  -->  创建 AccessRequest
   填：原因、范围、时长    (状态 Pending)
                           校验：范围 <= 允许集合
                           时长 <= 4h（默认 2h）
                                     ---- 2 通知 ---->  Provider admin / Privacy officer
                                                       看到：谁、为什么、看什么、多久
                                     <--- 3 批准 ----  （或拒绝 / 缩小范围 / 缩短时长）
                                                       需重新登录确认
 4 开始会话（重新登录确认）--> 签发短期只读 grant ---------------------------------> 只读会话
                           （绑定人、工单、范围、到期时间）                      每次读取写审计
 5 只读查看（水印：姓名 + 工单号 + 时间；禁止下载 / 复制导出）
                                     ---- 6 实时可见 ->  "careKind support is viewing ..."
                                                       审批人可随时 Revoke
 7 结束 / 到期 / 被撤销  -->  grant 失效；生成访问摘要（看了哪些对象，不含内容）
                                     ---- 8 摘要 ---->  进入本组织审计日志
```
- **范围选项**（从小到大，默认最小）：①只看元数据（导出任务、错误代码、配置版本，无健康内容）——**大多数工单应只用这一级**；②某一条记录或某一个导出任务的内容；③某个 Unit 某一班的记录列表。没有"整个租户"选项。
- **只读**：支持会话不能确认、编辑、删除、导出、发送；不能看到音频（音频只在 Shift Capture 规定的短期保留期存在，支持排查用转写元数据）。
- **紧急情况**：P1 事故（`support.md`）中，机构联系人无法联系时，Platform Owner 可以 break-glass 签发 ≤ 1 小时的元数据级 grant，机构**事后**立即收到通知，24 小时内复核；内容级访问没有 break-glass。
- Provider Portal 可设置"始终拒绝内容级访问"（更严）。
- 所有 grant 和读取事件进入两处：careKind 不可修改审计 + 该 Provider 的审计日志。

### 4-N 安全控制
| 控制 | 设计 | 依据 |
|---|---|---|
| 独立部署与域名 | Super Admin 单独部署、单独域名（如 `admin.<内部域名>` {{TBD}}），与护士端、Provider Portal 不共用会话和 cookie；不在公开搜索中出现 | ADR-0003 决定 2 |
| 身份 | 只允许 careKind 员工账号登录（邮箱 + 密码，argon2id；按 ADR-0006，第一阶段不做 SSO，Workspace SSO 留到 Phase 2）；**不做 MFA**（Lightman 18/10/2026 决定第一阶段不做 MFA，见 ADR-0005；作为已接受风险记录）；没有共享账号；会话 {{TBD：8}} 小时、空闲 {{TBD：15}} 分钟超时 | `information-security-policy.md`"身份"；ADR-0005 |
| 网络 | **不做 IP allowlist**（Lightman 18/10/2026 决定，见 ADR-0005）；管理 API 单独域名、单独部署 | ADR-0005 |
| 最小权限 | §4-C 角色；权限 45 天不用自动停用，每 12 个月重新批准；每季度权限审查 | E8 Restrict admin privileges ML2；`access-control.md` |
| 审计不可修改 | Super Admin 所有操作（包括读取客户联系人列表、导出报表）写 append-only 审计，哈希链或 WORM 存储；任何人（包括 Platform Owner、工程师）不能改删；保留 {{TBD：≥ 7 年}} | E8 "Event logs are protected from unauthorised modification and deletion"；`data-classification-and-retention.md` |
| 日志不含健康信息 | 控制面日志、错误监控、分析事件只用 ID 和代码；输入框禁止健康信息提示；自动扫描日志中的姓名 / 出生日期模式并告警 | `architecture.md` 关键设计约束 |
| 租户隔离测试 | §4-B；每次发布必跑 | `information-security-policy.md`"租户隔离" |
| 数据驻留 | 控制面同样在澳洲区域；Super Admin 不调用任何境外服务（含错误监控） | `state-by-state-comparison.md` §4.3；G9 |
| 人员 | 能获得内容级支持访问或生产访问的人员须持有 police certificate | `state-by-state-comparison.md` §4.7、§3.11（WA Tier 1） |
| 设备 | 只能从公司管理设备登录（MDM） | `information-security-policy.md`"设备" |

### 4-O 运营监控（只看运营指标）
| 指标 | 口径 | 粒度 |
|---|---|---|
| 租户数 | 按生命周期状态计数 | 全局 |
| 活跃用户 | 当天至少一次登录的去重账号数 | Provider / Facility |
| 草稿量 | 新建草稿数（不含内容） | Facility / 天 |
| 确认率 | 班次结束后 {{TBD：12}} 小时内已确认草稿 ÷ 该班草稿 | Facility / 周 |
| 导出成功率 | 成功导出任务 ÷ 导出任务（export PRD 审计事件） | Facility / 周 |
| 错误率 | 5xx、ASR / LLM 失败、超时 ÷ 请求 | 服务 / 小时 |
| 系统健康 | 可用性、p95 延迟、队列积压、备份成功 | 服务 |
- **不看**：住户姓名或内容、员工姓名、员工个人的草稿数 / 确认速度 / 排名（G10 精神）；"节省 X 小时"之类没有测量方法的数字。
- **小样本保护**：某 Facility 某天活跃用户 < 5 时，按 Facility 的分项指标只显示 "Fewer than 5"，避免反推到个人。
- 这些指标在 Super Admin 里只用于运营和支持，**不对外宣传**（对外引用前要跑 `marketing-copy-check`）。

### 4-P 护士端 Web App 的限制（对 Shift Capture PRD 的依赖说明，不修改那份 PRD）
| 能力 | Web App 第一阶段 | 说明 |
|---|---|---|
| 按住说话（press-to-talk） | ✅ 可行 | 浏览器麦克风 API，需 HTTPS 和用户手势；首次使用要授权麦克风；各浏览器表现不同，需要支持矩阵（Lin） |
| 整班后台录音（模式 A） | ❌ 推迟 | 浏览器切到后台或锁屏后录音不可靠；且有监控设备法门槛（`state-by-state-comparison.md` §4.11）。Super Admin 中 `whole_shift_capture` 为风险开关，不可打开 |
| 设备端声纹过滤 | ❌ 推迟 | 浏览器端不可行；声纹是生物特征信息（本地资料缺口） |
| 离线草稿 | ⚠️ 受限 | 加密本地缓存 + 过期删除 + 退出即清除；共享电脑禁止离线缓存（ADR-0003 后果）。Super Admin 提供按 Facility 的开关 `offline_cache_allowed`（默认关） |
- 影响：Shift Capture PRD §10"平台"一行（"MVP 很可能需要原生 App"）与 ADR-0003 冲突，由该 PRD 的 assignee Lin 更新；本 PRD 只把上面的开关做成 Super Admin 中的不可绕过配置。

---

## 4.5 法律依据（本地参考文件）✅
> 按 `legal-reference-check` 步骤手动执行（18/10/2026）：逐行过 `rules/legal-reference-map.md`，相关主题打开了下列文件（PDF 用 `pdftotext -layout` 读取）。运营参考，不是法律意见。

| 主题 | 本地文件 | 条款 / 页码 | 对本功能的约束 |
|---|---|---|---|
| 安全与销毁（APP 11） | `03-legal-compliance/references/law-library/oaic-app-guidelines-consolidated-2026-05.pdf` | Chapter 11 ¶11.2、¶11.4（技术和组织措施）；¶11.25（员工和承包商的未授权访问也算，Ch.11 第 6 页）；¶11.29–11.32（不再需要时销毁，第 6–7 页） | careKind 员工就是"可能未授权访问"的主体 → 默认零可见、grant 机制、审计；终止后销毁并有证明；法律要求保留时不销毁 |
| 员工记录豁免 | `03-legal-compliance/references/law-library/privacy-act-1988-compilation-2026-06-04.pdf` | s7B(3)（印刷页 71） | 豁免只适用于**雇主**对 employee record 的行为；careKind 不是护士的雇主 → 本 PRD 按 APPs 处理首个 Owner 和员工账号信息（⚠️ 律师确认） |
| 临床记录保存 | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 154-1000(1)(d)、(2)（印刷页 242–243） | provider 须保存临床记录 7 年 → 终止删除前必须确认记录已在机构系统中（§4-D 第 2 步）；careKind 不能删除唯一副本 |
| 州健康记录法与删除登记 | `03-legal-compliance/references/state-by-state-comparison.md` | §1 第 1 条；§4.1（VIC HRA s11 直接适用；ACT record keeper）；§4.5（ACT Principle 4.2 销毁登记、NSW s25(2)–(3)） | 删除证明和删除日志（不含健康内容）；Facility 州字段决定适用制度 |
| 州政府 ICT / 驻留 | 同上 | §3.11 表（NSW MR 1.10 / 24h 事件；VIC VPDSS Standard 8；QLD IS18 v10；WA Tier 1；ACT V3.5 §4.3）；§4.3 | Facility 增加"州政府运营"属性并带出采购核对项；控制面也境内；Essential Eight 声明；police clearance |
| 泄露通报矩阵 | 同上；`03-legal-compliance/references/law-library/oaic-data-breach-preparation-and-response.pdf` | §4.4；NDB 指南"Data breaches involving more than one entity"（第 29–30 页，jointly held） | 每个 Provider 登记泄露联系人、适用制度、承诺时限（默认 24h，NSW 公营 12h）；DPA 要约定谁评估、谁通知 |
| 合同条款 | 同上；`rules/01-operations-rules.md`；`09-templates/dpa-outline.md` | §4.10；rules/01 §2（不能让步的条款、偏离须 Lightman 批准）、§4（工单授权 + 审计）；DPA 大纲第 12 条 | 合同状态字段、非标准条款批准、终止返还期、支持访问必须有工单 |
| 机构上线文件 | `03-legal-compliance/references/paperwork-requirements-by-event.md` | §18 第 1–19 项 | 上线清单条目与 ★ 硬门槛 |
| 约束性措施同意过渡 | `03-legal-compliance/references/state-clinical-practice-rules.md`；`06-app-development/product/document-templates/clinical-restrictive-practice-consent-record.md`；`state-by-state-comparison.md` | §0 第 1–2 条、§1.3（"开关要可配置，不写死日期"）；模板 §"careKind 起草规则"；§4.6 | `rp_consent_cth_transition` 开关；字段按州切换；AI 不判断同意人 |
| AI 不能起草 / 必须 RN 签署的内容 | `state-clinical-practice-rules.md` | §7 表 | 规则包和模板发布时校验 🧑 人工字段不能被改为 AI 可起草 |
| 网络安全（Essential Eight） | `03-legal-compliance/references/law-library/asd-essential-eight-maturity-model-2023-11.pdf` | Appendix B（ML2）印刷页 9–11：特权访问首次申请时验证、45 天不活动停用、12 个月重新验证、专用特权账号、特权事件集中记录、"Event logs are protected from unauthorised modification and deletion"；MFA 用于特权用户且防钓鱼 | 权限过期、不可修改审计照做；E8 的 MFA 要求（Lightman 18/10/2026 决定第一阶段不做 MFA，见 ADR-0005；作为已接受风险记录） |
| TGA 边界 | `03-legal-compliance/tga-samd-boundary.md`；`03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | 红绿灯表；预期用途声明 | 规则包只放静态提示和字段；运营指标不做风险评分（§5） |
| 隐私方案与数据分级 | `03-legal-compliance/privacy-program.md`；`04-security/data-classification-and-retention.md`；`04-security/access-control.md` | privacy-program §3（APP 8、11）、§4 第 4 条（支持工单访问需客户授权）；数据分级表；"内部访问"表 | 健康信息 = Restricted；支持访问需客户授权并留痕 |
| 公司保密规则 | `rules/00-company-rules.md` | §3 | 不存合同原件和凭证；内部人员不得把客户数据粘贴进未批准工具 |

### 本地资料缺口
- ⚠️ **员工信息是否适用 employee records 豁免（对 vendor）**：本地只有 s7B(3) 原文，无适用性分析 → 需律师确认（上线门槛：影响隐私政策和 DPA 措辞）。
- ⚠️ **careKind 员工支持访问的法律基础**：DPA 中"careKind 员工在什么条件下可访问客户数据"的条款尚未起草（ADR-0003"需要更新的文档"）→ 上线门槛。
- ⚠️ **终止后返还期、备份过期期限**：`dpa-outline.md` 为 `{{30}}` 占位 → 合同确认后填入 Super Admin。
- ⚠️ **OVIC 事件通报时限、NSW ICTA cl 22 时限**：`state-by-state-comparison.md` §4.4 标注未核实 → 卖给州政府运营养老院前确认。
- ⚠️ **OAIC PIA 指引**：本地未下载（§18 第 4 项）→ 做 MVP PIA 前补充。

### 可能过时的资料
- `asd-essential-eight-maturity-model-2023-11.pdf`：发布日期超过 6 个月，ASD 可能已更新 → 安全评审前核对最新版。
- `state-by-state-comparison.md` §3.4 未在 18/10/2026 复核；约束性措施内容以 `state-clinical-practice-rules.md` 为准。

---

## 5. TGA boundary check ✅
```
Verdict: 🟢
Reasons:
- Super Admin 是租户管理、配置、模板管理和运营监控工具（红绿灯表"模板管理、导出、集成"一行为 🟢）；不处理住户临床内容，不生成任何临床文字。
- 州规则包只含静态提示文字、字段配置和参考链接，按"Facility 州 + 打开的模板字段"显示，不根据记录内容触发，不做判断。
- 运营指标是使用量和系统指标，不是临床风险、质量评分或预测。
Risky wording → safer alternative: 见下表
Required next step: 规则包每个新版本发布前逐条过下表；内容触发的提示（SIRS 等）归 tiered-review PRD 的 🟡 评审，不得放进规则包。
```
**规则包提示文字逐项检查（MVP 首批）**
| # | 位置 | 提示文字（澳式英语） | 结论 |
|---|---|---|---|
| 1 | RP consent record · 同意来源（VIC） | "In Victoria, record the restrictive practices substitute decision-maker under the *Aged Care Restrictive Practices Substitute Decision-maker Act 2024* (Vic). Select the basis yourself — careKind does not decide who can give consent." | 🟢 字段说明，不判断 |
| 2 | RP consent record · 联邦 hierarchy 选项（开关 = ended） | "The Commonwealth transitional consent arrangements may no longer apply. Check current requirements against your organisation's policy." | 🟢 流程信息；不说"invalid"或"not compliant" |
| 3 | RP consent record · 同意来源（NSW） | "In NSW, check that the guardian or enduring guardian holds a restrictive practices function." | 🟢 |
| 4 | RP consent record · 同意来源（QLD） | "In Queensland, a general health care appointment may not cover restrictive practices. Check the appointment document." | 🟢 |
| 5 | Death record · coroner 字段 | "Whether a death is reportable to the coroner is decided by your organisation under {{state}} requirements. careKind does not make this decision." | 🟢 |
| 6 | Medication incident · 说明（所有州） | "Medication details come from your eNRMC. careKind does not record medication administration." | 🟢 |
| 7 | Admission checklist | "The care and services plan needs to be in place on or before the resident's start day." | 🟢 文书时限提醒 |
| 8 | ❌ 拒绝的写法 | "This restraint may be unlawful" / "High risk" / "Ensures compliance with NSW law" | 🔴/误导：判断或无法证实的合规声明，禁止 |

运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

---

## 6. 隐私影响 ✅
| 问题 | 回答 |
|---|---|
| 新收集什么 | ① Provider 业务信息（法定名称、ABN、地址、Facility 地址与州）；② Provider 联系人（Owner、泄露联系人、审批人：姓名、职位、工作邮箱、电话）——**个人信息，Confidential**；③ 合同与合规状态、套餐和账单状态（Confidential）；④ careKind 员工的 Super Admin 操作审计；⑤ 聚合运营指标（不含个人）；⑥ 支持访问 grant 和读取事件（含被读取对象 ID，不含内容） |
| 不收集 | 合同原件、证件原件、银行卡、住户健康信息（控制面中不存在） |
| 存储位置 | 澳洲区域，控制面独立存储；与数据面分开授权 |
| 保留期 | Provider 联系人：合同期 + {{TBD：30}} 天后删除（墓碑只保留公司名、ABN）；Super Admin 审计和支持访问记录：{{TBD：≥ 7 年}}（与记录追溯对齐，`data-classification-and-retention.md` 待定项）；删除证明：{{TBD：7 年}}（ACT 销毁登记思路） |
| 新子处理方 | 无强制新增；如用外部邮件服务发送邀请和审批通知，按 `vendor-subprocessor-register.md` 评估（只含工作邮箱和工单号，不含健康信息） |
| 支持访问 | 唯一可能接触 Restricted 数据的路径；需要机构批准、限范围、限时、水印、审计、机构可见 |
| 需要更新 | **MVP PIA**（新增控制面和支持访问流程）；**隐私政策**（说明 careKind 员工何时可以访问客户数据）；**DPA**（支持访问条款、终止返还与删除、删除证明）；`04-security/access-control.md`（Super Admin 角色、break-glass）——由 Privacy Officer / Lin 更新，本 PRD 不改 |
| 自动化决策（APP 1.7–1.9） | Super Admin 不对个人做自动化决定；限额只是阻止新建账号，不影响已有个人 → 预计不触发 ⚠️ 与 PIA 一起确认 |

---

## 7. 临床危害 ✅
新提出的危害（**Proposed**，由临床顾问接受后才写入 `hazard-log.md`；本 PRD 不改危害日志）：

| ID（临时） | 危害 | 原因 | 潜在伤害 | 初始风险 | 控制措施 |
|---|---|---|---|---|---|
| HAZ-P-SA-01 | 规则包配错州 | Facility 州字段填错；跨州 Provider 复制配置；规则包内容写错州 | 护士看到错误的同意来源说明 → 错误记录 RP 同意依据；coroner / 给药说明不适用 | 高 | 州由地址校验 + four-eyes 修改；修改时预览受影响模板；规则包注明来源和核实日期；未核实内容不显示；Demo 先推（Grevillea House NSW 用例） |
| HAZ-P-SA-02 | 模板版本误推 | 推错版本或范围；主版本自动替换；🧑 字段被改成 AI 可起草 | 草稿缺字段或 AI 起草了判断字段（例如 reportable） → 错误进入记录 | 高 | 起草 → 批准 → Demo → 分批；主版本由机构选择升级；发布时校验 🧑 字段；记录保存生成时版本号；一键回滚 |
| HAZ-P-SA-03 | 租户串数据 | 查询缺 tenant 过滤；缓存或文件 URL 共用；Region 权限越权 | 住户信息泄露给另一家 Provider；记录写入错误机构 | 高 | 控制面 / 数据面分离；每次发布跑跨租户用例，失败阻断；Region / Facility 越权用例；按事故处理（`incident-triage`） |
| HAZ-P-SA-04 | 支持访问越权 | 范围过大、时长过长、grant 未过期、break-glass 滥用 | 隐私泄露；机构失去信任 | 高 | 默认元数据级；最长 4h；机构批准 + 可撤销；水印、只读、不可导出；break-glass 只到元数据且事后复核；访问摘要进机构审计 |
| HAZ-P-SA-05 | 暂停 / 终止导致记录丢失或照护中断 | 欠费或误操作暂停；删除在导出前执行 | 交接信息缺失；机构失去唯一副本 | 中 | 暂停不删草稿、可看可导出；账务原因不停用已有员工；未导出记录阻断删除；返还需 Owner 确认；four-eyes |
| HAZ-P-SA-06 | 下限被放松 | 配置校验缺陷；Layer 1 发布错误把 Tier 3 类别调低 | 敏感事件未经 RN 逐条确认 | 高 | Layer 0 硬底线写在代码中且有测试；"只能调严"按类型校验；配置变更审计；草稿记录配置版本 |

---

## 8. AI 评测
本功能**不调用模型、不改变 AI 生成行为**，不新增模型评测场景。理由：Super Admin 只管理配置和元数据。
但它会影响 AI 管线的输入（模板版本、分级配置），所以新增**配置回归检查**作为发布门槛：模板或 Layer 1 配置的新版本推送前，在 Demo Provider 上用 `evaluation-plan.md` 现有黄金集跑一遍，确认 🧑 字段仍为空、Tier 路由与预期一致；不通过不推送。这是配置测试，不是模型评测。

---

## 9. 无障碍与多语言
- 内部工具也按 WCAG 2.2 AA（表格键盘可操作、状态不只用颜色表示）；按 `06-app-development/design/DESIGN.md` 和 `COMPONENTS.md` 复用组件（Table、Badge、Dialog、Alert）。危险操作（终止、发布）用确认 Dialog，并要求输入租户名称。
- 界面语言：英语（澳式）；内部说明可用中文。规则包和模板的客户可见文字只用澳式英语，日期 DD/MM/YYYY。
- 桌面优先；手机宽度只需支持只读查看和审批 four-eyes 请求。

## 9.1 设计参考（设计系统）
> Lightman 18/10/2026：MVP 先做管理端，**所有界面以设计系统为设计参考**。规范以 `06-app-development/design/DESIGN.md` 为准，组件以 `COMPONENTS.md` 为准，数值只引用 `design-system/tokens.json` 的 token 名，交互样例看 `design-system/preview.html`。代码组件放在 `carekind-shared`（DS-5，React）。

**页面 → 现有组件**
| 页面 | 用到的组件（`COMPONENTS.md`） |
|---|---|
| Provider / 养老院列表 | 表格 `ck-table`、搜索 `ck-input--search`、状态标签 `ck-tag`、分页 `ck-pagination`、空状态 `ck-empty` |
| Provider 详情 | 标签页 `ck-tablist`、卡片 `ck-card`、面包屑 `ck-breadcrumb`、提示 `ck-alert` |
| 新建 Provider / 首次上线 | 字段 `ck-field`、输入 `ck-input`、原生下拉 `ck-select`、复选框 `ck-check`、Toast `ck-toast` |
| 州规则包、模板库、流程模板 | 表格、字段、开关 `ck-switch`、标签（版本状态 Draft / Published）、对话框 `ck-dialog`（发布确认） |
| 功能开关 | 开关 `ck-switch`（默认关）、提示 `ck-alert`（影响范围说明） |
| 支持访问 | 对话框、标签（Pending / Approved / Expired）、提示（会话剩余时间） |
| 运营监控 | 卡片（只显示数字和口径，不做评分、风险或趋势类组件——`06-app-development/design/CLAUDE.md`）、表格 |
| 终止 / 暂停租户 | 对话框 + 输入租户名称确认（危险操作） |

**设计前置：组件缺口**（先在 `COMPONENTS.md` 补规格、经 Lin 评审，再实现；不要在页面里自行发明）
- DS-2 第二批（已列为待做）：可搜索下拉 Combobox（选 Provider、州、模板）、日期选择（合同日期，显示 DD/MM/YYYY）、侧边抽屉 Drawer（行详情、筛选）。
- 管理端新模式（`COMPONENTS.md` 里还没有）：桌面应用框架与侧边导航（现有 App bar / Tab bar 是手机用）、带筛选 / 排序 / 批量操作的数据表、配置版本的差异对比视图、审计日志视图、"输入名称确认"的危险操作对话框。
- 这些组件与机构管理端共用，规格只写一份。

---

## 10. 上线计划与回滚

### 10.1 工作包（同一 assignee 内部划分，不是子 PRD）
| WP | 内容 |
|---|---|
| SA-1 | 控制面数据模型、租户生命周期、身份（邮箱 + 密码，ADR-0006）、独立部署 |
| SA-2 | Provider / Facility / Unit 向导、首个 Owner 邀请、合同状态、上线清单 |
| SA-3 | 配置分层引擎（Layer 0–3、"只能调严"校验、版本、推送、回滚） |
| SA-4 | 州规则包、模板库、流程模板、功能开关 |
| SA-5 | 支持访问（与 Provider Portal 审批联动）、不可修改审计 |
| SA-6 | 运营监控、套餐限额、终止返还与删除 |
| SA-7 | Demo Provider 数据集与一键重置 |

### 10.2 上线门槛（全部满足才能对第一个真实租户启用）
1. 🧑 Lin 的 ADR-0001（技术栈）和 ADR-0002（多租户隔离）已 Accepted。
2. 跨租户与越权测试 100% 通过并进入 CI 必跑项；第三方渗透测试覆盖 Super Admin 和支持访问（`information-security-policy.md`"漏洞管理"）。
3. 不可修改审计已上线并经 Lin 验证。
4. DPA 支持访问条款、终止返还与删除条款经律师确认；隐私政策和 MVP PIA 已更新（§4.5 缺口）。
5. employee records 豁免适用性的律师意见（§4.5 缺口）。
6. 首批规则包（VIC、NSW）经临床顾问 + 法律审阅人批准，§5 文字检查通过；`rp_consent_cth_transition` 默认值由 Lightman 确认。
7. §11 Demo 验收全部通过并有截图证据。

### 10.3 发布顺序与回滚
- 先上 Demo 环境 → 内部演练（建一个虚构 Provider 到终止全流程）→ 第一家试点 Provider。
- 配置发布失败：回滚到上一版本（新版本号）；Super Admin 自身故障：护士端和 Provider Portal 不依赖 Super Admin 在线（生效配置缓存在数据面），可以继续工作。
- 发现串数据或越权访问：立即撤销所有 grant、冻结 Super Admin 写操作，走 `incident-triage` 和 `data-breach-response-plan.md`。

---

## 11. Demo 与示例数据
**Super Admin 的用户是 careKind 内部员工**，所以 Demo 的目标是：内部培训、销售讲解"careKind 如何开通和保护你的数据"、以及让买单方在 Provider Portal Demo 中看到支持访问审批的另一端。Super Admin Demo 不对公开访客开放（它展示内部操作界面）；公开介绍页的结果预览由 Demo 工作区 PRD 和 Provider Portal PRD 负责。

### 11.1 入口与隔离
- 入口：Super Admin 登录后顶部 "Open demo console"；进入后全程顶部横幅 "Demo console — fictional providers only. Nothing here affects real customers." 和 "Exit demo" 按钮。
- 运行在 Demo 环境（`2026-10-18-demo-workspace-and-synthetic-data.md` §4.5：独立部署、独立数据库、出口拦截）；每位体验者一个会话修改层，"Reset demo" 只清空本会话；24 小时过期。真实租户列表在 Demo 中**不存在**，不是隐藏。
- 邀请邮件、审批通知在 Demo 中显示为 "Simulated — no email was sent"。

### 11.2 示例数据（全部标注虚构；版本库中的确定性数据 `demo-data/super-admin/v1` {{TBD：路径由 Lin 定}}）
| 对象 | 内容 | 标注 |
|---|---|---|
| Provider | **Wattle Grove Care Group（虚构）**，Owner **Helen Tran（虚构，Managing Director）**；套餐：Pilot，席位上限 60，可启用 Facility 3 | Fictional |
| Facility 1 | Wattle Grove Residential Care（虚构，VIC，Melbourne）— Active；规则包 `VIC-2026.10-1`；Units: Wattle wing、Banksia wing (memory support)（虚构，与 Demo 工作区 PRD §4.4 一致）；主场景人物（Mrs Edna Hall、Mr Tomasz Nowak、Priya、Daniel Reyes RN、Grace Liu）只存在于数据面，Super Admin 只看到计数 | Fictional |
| Facility 2 | Banksia Park Aged Care（虚构，VIC，Geelong）— Active | Fictional |
| Facility 3 | Grevillea House（虚构，NSW，Albury）— Onboarding，上线清单 14/19，缺 ★6 员工告知、★7 住户告知；自动绑定 `NSW-2026.10-1`，预览显示 RP 同意来源提示第 3 行 | Fictional |
| 合同状态 | Pilot Agreement Signed 06/10/2026；DPA Signed 06/10/2026；careKind PIA summary Sent 08/10/2026；Insurance Current to 30/06/2027；Non-standard terms: No | Fictional，日期为示例 |
| 泄露登记 | 私营 · 联邦 NDB · careKind 承诺 24 小时 | Fictional |
| 支持访问 | 工单 SUP-0142（虚构）："PDF export failed for one record at Wattle Grove Residential Care"；范围：元数据级（导出任务 + 错误代码），2 小时；审批人 Provider admin（虚构，姓名与 Provider Portal PRD 统一）已批准；访问摘要：3 个导出任务对象，0 条记录内容 | Fictional；审批为预生成 |
| 配置版本 | Layer 1 `tier-floor v3`；Wattle Grove Care Group 的 Layer 2 把 "skin tear" 从 Tier 2 调为 Tier 3（更严，允许）；一次被拒绝的尝试："Set falls to Tier 2" → 显示下限错误 | Fictional |
| 运营指标 | 预生成 14 天的聚合数字（草稿量、确认率、导出成功率），Grevillea House 显示 "Fewer than 5"（尚未上线） | **Pre-generated example, not real usage** |

### 11.3 预生成 vs 真实执行
- 预生成：所有指标、历史审计、SUP-0142 的批准、合同日期。
- 在 Demo 会话中真实执行（只作用于本会话）：新建 Provider 向导、代建 Facility（选 QLD 地址可看到规则包自动绑定）、上线清单打勾、尝试放松下限（被拒）、起草规则包版本并模拟第二人批准、暂停 / 终止流程直到"返还包"预览（不生成真实文件）。
- 模拟（标 "Simulated"）：邮件、Provider Portal 的批准动作、删除执行。

### 11.4 验收（实际操作，保存桌面截图；手机宽度检查审批页）
| # | 步骤 | 通过标准 |
|---|---|---|
| 1 | 进入 Demo console | 横幅持续显示；看不到任何真实租户 |
| 2 | 打开 Wattle Grove Care Group → 三家 Facility | 状态、规则包版本、清单完成度与 §11.2 一致；看不到任何住户姓名 |
| 3 | 新建 Facility（QLD 地址） | 自动绑定 QLD 包；修改州需要第二人批准 |
| 4 | 把 falls 调到 Tier 2 | 被拒绝，显示下限原因；审计中有拒绝记录 |
| 5 | 查看 SUP-0142 | 显示范围、时长、批准人、访问摘要；无"整个租户"选项 |
| 6 | 对 Banksia Park 执行暂停 → 恢复 | 预览显示"可查看和导出"；恢复需要第二人 |
| 7 | 发起终止 | 有未导出记录时删除按钮不可用；显示返还包预览 |
| 8 | Reset demo；两个浏览器同时操作 | 回到初始状态；互不可见 |
| 9 | Exit demo | 回到自己的 Super Admin 首页，真实数据和设置未变 |
验收报告分别写：代码完成、Demo 本地可用、已部署、线上验收。

---

## 11.9 开发假设（18/10/2026，Lightman 指示先开发）
§12 的问题在 Lightman 决定前按下面的默认做；**能做成配置的都做成配置**，以后改决定不用改代码。
| # | 问题 | 开发默认 |
|---|---|---|
| 1 | 内部角色人选 | 角色做成可分配的权限组（Platform Owner、Onboarding、Content & Clinical Governance、Support、Read-only），不写死人名；第二批准人 = 任意另一位有该权限的用户 |
| 2 | 单人 break-glass | **不允许**（功能开关，默认关） |
| 3 | 计价单位 | 套餐记录"限额单位"（seat / bed / facility 三选一）和上限，只记录 + 限额生效，不做支付 |
| 4 | 暂停通知期、账务暂停 | 通知期配置项，默认 7 天；账务原因只限制新增，不暂停 |
| 5 | `rp_consent_cth_transition` | 版本化开关，默认 On（01/12/2026 前的现行安排），只能人工切换并写审计 |
| 6 | 合同原件、会计系统 | 只存外部引用（文本），不集成 |
| 7 | 审计与删除证明保留期 | 配置项，默认 7 年 |
| 8 | 与 Provider Portal 对齐 | 角色名、Demo 人名以 Provider Portal PRD 和 `docs/prds/2026-10-18-demo-workspace-and-synthetic-data.md` 为准 |

**第一阶段不做**：在线支付、SSO、客户自助开户、任何住户临床内容的查看界面。
**MFA**：不做（ADR-0005）。

## 12. 开放问题与需要 Lightman 决定的事
1. 🧑 **内部角色人选**：4 人团队里谁担任 Content & Clinical Governance、谁是第二批准人；临床顾问和法律审阅人是谁（规则包发布门槛依赖）。
2. 🧑 **break-glass**：是否允许 Platform Owner 单人执行 four-eyes 操作（§4-C），以及元数据级 P1 紧急访问（§4-M）。
3. 🧑 **计价单位**：席位、床位还是按 Facility（§4-L，主 PRD §12 未定）。
4. 🧑 **暂停通知期**（默认 7 天）和**账务原因能否暂停**（本 PRD 建议账务原因只限制新增，不暂停）。
5. 🧑 **`rp_consent_cth_transition` 的默认值与切换责任人**（建议 Lightman 根据官方公告手动切换）。
6. 合同原件存放系统（`{{TBD}}`）和会计系统（Xero / MYOB）——Super Admin 只存引用。
7. Super Admin 审计与删除证明的保留期（建议 7 年，待 Privacy Officer 与律师确认）。
8. 与 Provider Portal PRD 对齐：审批人角色名、Region 权限、Demo 中 Provider admin 的虚构姓名。

---

## 13. 建议 registry 登记行
| PRD | 标题 | 阶段 | Assignee | Reviewer | 复杂度 | 风险 | Parent | Blocked | 更新 |
|---|---|---|---|---|---|---|---|---|---|
| 2026-10-18-super-admin-multi-facility-console | Super Admin 多机构控制台（租户、规则包、模板、支持访问） | idea | （留空，需 Lightman 确认） | — | **L** | **R3** | — | ADR-0002 多租户隔离 + DPA 支持访问条款 · 等 Lin / Lightman · 25/10/2026 | 18/10/2026 |

- **复杂度 L（7/8）**：范围 2（新增子系统，覆盖租户、配置、内容、支持、监控）+ 技术面 2（多租户、鉴权、不可修改审计）+ 不确定性 1（依赖 ADR-0001 / 0002）+ 依赖 2（阻塞 Provider Portal，并承载 tiered-review、export、ISBAR、Demo PRD 的配置）。
- **风险 R3**：租户隔离与鉴权、支持访问会接触健康数据、配置下限关系到护栏 G1 / G5。Reviewer 须是 senior 以上且不是 assignee。

---

## 14. 审批
| 角色 | 姓名 | 日期 |
|---|---|---|
| 产品 | | |
| 临床顾问 | | |
| CTO | | |
| 法律意见（支持访问、终止删除、员工信息） | | |

## 变更记录
| 日期 | 版本 | 变更 | 作者 |
|---|---|---|---|
| 18/10/2026 | v0.1 | 初稿 | Claude（待 Lightman 审阅） |
