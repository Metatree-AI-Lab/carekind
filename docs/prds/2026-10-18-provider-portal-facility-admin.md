# PRD：机构管理端（Provider Portal）——多院层级、员工与住户管理、流程管理、Business owner 看板

Owner: Lightman (PO) · Status: **Draft** · Last reviewed: 18/10/2026
Parent: [docs/PRD.md](../PRD.md)
Related: [ADR-0003](../../06-app-development/engineering/adr/0003-phase1-delivery-web-and-super-admin.md) · [ADR-0004](../../06-app-development/engineering/adr/0004-phase1-facility-admin-portal.md) · Super Admin PRD `2026-10-18-super-admin-multi-facility-console.md`（编写中，⚠️ 两份 PRD 的层级、角色、Demo 数据必须一致）· [分级审核与审计链](2026-10-18-tiered-review-and-audit-trail.md) · [ISBAR 交接与覆盖](2026-10-18-isbar-handover-and-care-coverage.md) · [导出与 CMS 集成](2026-10-18-record-export-and-cms-integration.md) · [Demo 工作区](2026-10-18-demo-workspace-and-synthetic-data.md) · [Shift Capture + 老人档案](2026-10-04-shift-capture-and-resident-records.md) · `03-legal-compliance/references/paperwork-requirements-by-event.md` §1、§15、§16、§18 · `04-security/`

> 本 PRD 定义"养老院自己用的管理端"。它**不重复**分级审核、交接、导出、Demo 的规则细节，只说明这些功能的**配置界面和管理视图在管理端实现**，规则以各自 PRD 为准（§4.10）。
> 证据等级：案头调研 + Owner 18/10/2026 的口头要求；**用户访谈 n = 0**，所有"机构会……"都是假设。

---

## 1. 问题

### 1.1 谁、在什么场景、遇到什么问题
| 用户 | 场景 | 问题（假设，n = 0） |
|---|---|---|
| **Business owner / Executive**（买单方，例如一家有 3 家院的 Managing Director） | 决定是否续费、扩到更多院 | 看不到"买到了什么"：各院有没有在用、记录是否及时、上线是否完成；不能也不应该去翻住户临床记录 |
| **Facility Manager** | 新员工入职、员工离职、住户入住 / 转院 / 离开 | 每改一次名单、角色都要找 careKind（ADR-0004 选项 C 的问题）；名单错一行就可能把记录写到别人名下 |
| **Clinical Lead（DON / Clinical Care Manager）** | 设定本院的审核规则、升级路由、跨班次待办时间表 | 需要按本院政策配置，但不能把敏感事件调松；区域 DON 同时负责多院 |
| **Care Manager** | 每天看单元总览、交接、待办 | 主 PRD §7.5 的流程目前没有落脚的界面 |
| **Provider admin / IT / Privacy officer** | 用户与权限、审计、APP 12 访问请求、批准 careKind 支持访问 | 需要证明"谁在什么时候看了什么"，回答尽调问卷时只能写已做到的事（`rules/01-operations-rules.md` §2） |

### 1.2 证据（诚实标注）
| 证据 | 来源 | 强度 |
|---|---|---|
| Owner 要求：管理护士、住户、本院员工；一家公司多家院多地点；要有流程管理；买单的是 business owner；护士属于养老院 | Lightman 18/10/2026 对话；ADR-0004 | 产品决定（不是用户证据） |
| 多院 provider 是目标买方（2–20 个 home） | `docs/PRD.md` §12（假设） | 弱，待访谈 |
| 没有竞品公开处理州法差异、约束性措施提示，可做成配置 | `01-strategy/competitive-research/how-competitors-solve-it.md` §10 第 3 条 | 中（公开资料） |
| 机构上线需要的机构侧文件 19 项，其中 #6 员工告知模板缺失、#14 TierRule 配置 | `paperwork-requirements-by-event.md` §18 | 中（法规 + 仓库现状） |
| 用户访谈 / 反馈 | `10-feedback/` 为空 | **n = 0** |

---

## 2. 目标与指标

### 2.1 目标
1. 机构可以**自助**管理员工、住户、本院流程，careKind super admin 不用代办，也不用接触健康信息（ADR-0004）。
2. 名单和转院操作**不制造错配**：任何导入、转院、房间变动都不会让记录挂到错误住户名下（护栏 G4、HAZ-003、HAZ-009 Proposed）。
3. 流程配置只能在 careKind 底线之上**调严**，每次改动有版本、原因和审计。
4. Business owner 能看到**有测量方法**的使用和流程指标，不看到住户临床内容、员工个人排名或未经测量的"节省时间"。

### 2.2 指标（试点；测量方法必须写清）
| 指标 | 目标 | 测量方法 |
|---|---|---|
| 因名单导入 / 转院导致的错配进入正式记录 | **0** | 每次 Amended 的原因类别 = "wrong resident" 时，回溯该住户最近一次 ImportBatch / Transfer；按月人工复核 |
| 导入校验拦截的问题行 | 跟踪（不设目标） | ImportBatch 中状态为 Conflict / Possible match 的行数 ÷ 总行数 |
| 流程配置改动有原因 + 审计 | **100%** | PolicyVersion 中 `reason` 非空的比例；自动化测试 + 季度抽查 |
| 机构员工 / 住户变更需要 careKind 代办的次数 | 试点第 4 周起 ≤ {{TBD：1}} 次/月 | 支持工单分类"admin change on behalf" |
| 离职员工在停用后仍被路由 Tier 3 | **0** | 路由日志中收件人状态 ≠ Active 的次数 |
| careKind 支持访问全部经机构批准、限时、可审计 | **100%** | SupportAccessGrant 有批准人、起止时间、访问日志 |
| 机构 Owner 看板周活跃 | 跟踪 | Owner 角色账号每周 ≥ 1 次打开看板（只统计到 Provider 层，不用于评价个人） |

---

## 3. 用户故事
| 角色 | 故事 |
|---|---|
| Owner（Helen Tran，虚构） | 作为 business owner，我想在一个页面看到 3 家院的使用率、记录确认及时性和上线进度，以便判断续费和扩院，而不需要看住户的临床记录。 |
| Owner | 作为 Owner，我想在公司层统一流程（例如 Tier 3 备岗时限），以便 3 家院一致；单院只能比公司更严。 |
| Facility Manager | 作为院长，我想邀请新员工、给他分配角色和一家或多家院，并在他完成录音告知和培训后才开通口述，以便不漏掉上线步骤。 |
| Facility Manager | 作为院长，我想用 CSV 导入住户名单并在生效前逐行看到差异和冲突，以便名单错误不会进入护士端。 |
| Clinical Lead | 作为区域 DON，我想在我负责的多家院之间切换，配置每家院的审核链和升级路由，以便 Tier 3 一定有人接。 |
| Care Manager | 作为护理经理，我想看单元总览、未接收的交接和未关闭事项（界面规则见 ISBAR PRD §4.8）。 |
| Privacy officer | 作为隐私官，我想审批 careKind 的支持访问请求、处理住户的 APP 12 访问请求、查询审计日志。 |
| PCW / RN | 作为一线员工，我离职后，我确认过的记录仍然显示我是作者，不会被改成别人。 |

---

## 4. 方案

### 4.1 数据层级（与 Super Admin PRD 必须一致）
```
Provider Organisation  = 租户 = 买单方（business owner）
│   例：Wattle Grove Care Group（虚构）
│   · 套餐 / 床位数 / 账单（super admin 管理，管理端只读）
│   · 公司层流程（Provider policy）
│
├── Region（可选分组，例如 "VIC Metro"）
│       只用于汇总和权限范围，不承载数据、不改变规则
│
└── Facility 养老院（一个地点）
    │   地址 · 州/领地 ──► 自动带出【州规则包】（super admin 定义，只读）
    │   是否州政府运营 ──► 附加【公营合同包】（只读）
    │   单院流程覆盖（Facility override，只能调严）
    │
    ├── Unit / wing（例：Wattle wing、Banksia wing (memory support)）
    │
    ├── Resident 住户
    │     属于且只属于一家 Facility；房间 / 床位；Unit
    │     同公司转院 = Transfer 记录（有审计），不是删除再新建
    │
    └── StaffAssignment 员工分配
          Staff（雇佣关系在 Provider）──► 分配到 1..n 家 Facility（可选到 Unit）
          只能访问"被分配 + 当前开着班次"的 Facility 的临床数据（护士端）

不同 Provider 之间：数据绝对隔离。同一个人在两家公司工作 = 两个独立账号。
```

### 4.2 角色与权限
**管理端角色**（一个账号可以同时有护士端角色和管理端角色；每个角色都带**范围**：Provider / Region / 指定 Facility 集合）

| 能力 | Owner / Executive | Facility Manager | Clinical Lead | Care Manager | Provider admin / IT / Privacy |
|---|---|---|---|---|---|
| 范围 | 整个 Provider | 指定院 | 指定院（可多院） | 指定院 / 单元 | 整个 Provider |
| 汇总看板（§4.7） | ✅ 全部院 | ✅ 本院 | ✅ 本院 | ✅ 本单元 | ✅ |
| 住户临床内容（记录、草稿、原话） | ❌ 默认（见下） | ❌ 默认；可授予 | ✅ need-to-know | ✅ 本单元 | ❌ 默认；处理 APP 12 时按请求临时授予 |
| 员工：邀请、角色、分配、停用 | ✅ | ✅ 本院 | 只能**证明** RN/EN 资质（attest） | ❌ | ✅ |
| 住户：入住、转院、离开、房间、同意、联系人、CSV 导入 | ❌ | ✅ 本院 | ✅（同意 / 联系人） | 只读 | ✅（导入） |
| 流程：公司层 | ✅ 非临床项；临床项需 Clinical Lead 共同批准 | — | ✅（Provider 范围的 Clinical Lead） | — | ✅ 非临床项 |
| 流程：单院覆盖 | — | ✅ 非临床项 | ✅ 临床项 | — | — |
| 新增 Facility（受套餐限制） | ✅ | ❌ | ❌ | ❌ | ✅ |
| 审计日志查询 | 只看配置和权限类事件 | 本院 | 本院 | ❌ | ✅ 全部 |
| 批准 careKind 支持访问 | ✅ | ❌ | ❌ | ❌ | ✅ |
| APP 12 访问请求 | ❌ | 协助（本院） | 协助（本院临床内容） | ❌ | ✅ 负责 |
| 套餐 / 床位 / 账单 | 只读 | ❌ | ❌ | ❌ | 只读 |

规则：
1. **Owner 默认看汇总，不看住户临床内容**（健康信息 need-to-know，`04-security/access-control.md` 原则）。Owner 确有需要时，由 Provider admin / Privacy officer 授予一个**临床角色**（Clinical Lead 或 Care Manager，限定到某些院），并且需要**第二人批准**（Privacy officer 授予时由 Clinical Lead 批准，反之亦然）；授予、批准、范围、原因写审计；季度权限复核（access-control.md "每季度权限审查"）中逐条列出。
2. "临床项"指流程 §4.6 中的第 1、2、3、5、6 项；"非临床项"是第 4、7、8 项。
3. 一线员工（PCW / EN / RN / lifestyle / 行政等）在护士端工作，不进管理端。
4. careKind 员工**不在**这张表里：他们在 Super Admin 中工作，访问机构数据必须经 §4.8 的支持访问审批。

### 4.3 公司层 / 单院层切换与州规则包
- 页面顶部有**范围选择器**：`Wattle Grove Care Group` → `VIC Metro` → `Grevillea House`。只显示当前账号有权限的范围。切换时页面标题、面包屑、所有数据都按范围过滤；**写操作必须在单一 Facility 或明确的"公司层"范围内进行**，不在 Region 范围写数据。
- 每家 Facility 页面显示 `Rules pack: NSW · v{{版本}}`、`Public sector: No`。州规则包由 super admin 定义（内容见 Super Admin PRD），管理端**只读**，可以看"这个包改变了什么"：

| 规则包带出的内容（例） | 来源 | 在产品里的作用 |
|---|---|---|
| 适用的州健康记录法（VIC HRA / NSW HRIPA / ACT HR(P&A) Act / 无） | `state-by-state-comparison.md` 表 A、§4.1 | 隐私资料包和删除日志要求（ACT Principle 4.2、NSW s25） |
| 健康记录最低保存期的显示（成人 7 年 / 未成年至 25 岁） | 同上 §3.2 | careKind 端删除前的提示；provider 仍是 record of truth（导出 PRD §4.9） |
| 约束性措施同意来源的选项列表（VIC Tier 1–4 / NSW guardian RP function / …） | `state-clinical-practice-rules.md` §1.3 | 只改变下拉选项；**AI 不推断、不预填** |
| 决策人文件类型的官方名称 | 同上 §2.3 | 联系人登记表单（§4.5） |
| 公营合同包：泄露通知时限、数据驻留要求 | `state-by-state-comparison.md` §4.4、§4.10 | 事故流程与合同；管理端只显示 |

- **跨州**：同一 Provider 的 VIC 院和 NSW 院各用各的规则包；公司层流程照常适用，州规则包只能让结果更严（取更严者，见 §4.6.0）。
- Facility 的州/领地字段**锁定**：首次由 super admin 代建时设定；管理端自助新增时由 Owner / Provider admin 填写并**二次确认**（"This facility is in NSW. NSW rules will apply."）；之后修改只能经 super admin（防止 HAZ-P-PP-09）。

### 4.4 员工管理
**范围**：MVP 只管理**需要使用 careKind 的员工账号**（临床员工、lifestyle、行政等确实要写或看记录的人）。不做 HR、排班、薪资。

**字段（最小化，`rules/00-company-rules.md` §3 禁止放员工个人档案）**
| 字段 | 必填 | 说明 |
|---|---|---|
| 姓名、偏好称呼 | ✅ | 显示在记录作者处 |
| 登录标识（工作邮箱或用户名） | ✅ | 同一邮箱在两家 Provider = 两个独立账号（身份按租户隔离，归 ADR-0002） |
| 护士端角色：PCW / EN / RN / Other staff | ✅ | 决定能确认哪个 Tier（分级审核 PRD §4.1） |
| 注册类型与 AHPRA 编号 | 可选 | RN / EN 角色**需要 Clinical Lead attest**（"I have checked this person's registration"）；careKind 不核验 AHPRA，不存注册条件 |
| 分配的 Facility（1..n）及可选 Unit | ✅ | 决定护士端能开哪家院的班次 |
| 管理端角色 + 范围 | 可选 | §4.2 |
| 状态与上线步骤完成日期 | 系统 | 见下方状态机 |
| 首选语言 | 可选 | 供多语言 PRD 使用 |

**不收集**：出生日期、住址、police certificate、薪资、绩效。这些是 provider 自己的 aged care worker record（Rules 154-905，保存 7 年由 provider 负责），留在 provider 的 HR 系统。

**员工状态**
```
Invited ──► Onboarding ──────────────► Active ──► Suspended ──► Active
  │          · 录音 / AI 告知已确认        │            │
  │          · careKind 培训已确认          │            │
  │          · RN/EN 资质已 attest          ▼            ▼
  └──(邀请过期)                         Deactivated（离职 / 合同结束）
                                         · 不能删除，不能复用给别人
```
- **Onboarding 未完成不能口述、不能确认记录**（流程第 7 项）。
- **停用前检查（阻断式）**：系统列出此人名下的 ① 未处理的 Tier 2/3 审核项 ② 被指定为升级路由或备岗人的位置 ③ 未关闭的 FollowUp ④ 未接收的交接。全部重新分配或关闭（写原因）之后才能停用；紧急情况（例如即刻解雇）可以"先停用后处理"，此时 ①–④ 自动转给该院的**角色收件人**（RN in charge / Care Manager），并通知 Facility Manager。
- **停用即时生效**：撤销所有会话；护士端下次联网时清除本地加密缓存（ADR-0003 的离线缓存要求）；访问控制"离职当天撤销全部访问"（`access-control.md`）。
- **作者身份保留**：记录上的作者、审核人保存的是**确认当时的快照**（姓名、角色、注册类型），不是对账号的实时引用。停用后显示 "Daniel Reyes RN (former staff)"；审计链不变（G7）。账号本身按 `data-classification-and-retention.md` "合同期 + 30 天"处理时，只删除登录信息，作者快照随记录保留。
- **跨院分配**：一名 RN 可以分配到多家院；护士端开班次时只能选其中一家，班次期间只看这家院（护栏 G4：只在本班名单内匹配）。
- **批量邀请**：CSV 邀请员工（同样走 §4.5 的分步校验，但没有住户匹配风险，规则较轻）。

### 4.5 住户管理
**字段**
| 分组 | 字段 | 说明 |
|---|---|---|
| 身份（≥ 3 项识别） | 法定姓名、偏好称呼、出生日期、机构住户 ID、可选 CMS ID、照片（可选，需同意） | 匹配键 = 机构住户 ID 或 CMS ID + 出生日期；**姓名永远不能单独作为匹配键** |
| 位置 | Facility、Unit、房间 / 床位、生效时间 | 房间变动有历史；护士端名单显示 "Room changed 18/10" 标记 {{TBD：72}} 小时 |
| 状态 | Pre-admission · Active · On leave · In hospital · Transferred · Departed · Deceased | 只有 Active / On leave 返回后进入本班名单 |
| 同意 | AI 文书：Informed / Consented / Opted out / Pending；录音：Opted out（是/否）；来源（本人 / 代表，姓名）；日期；录入人 | **退出即时生效**：推送到护士端，该住户不起草、提示手动记录（主 PRD §7.8）；历史保留 |
| 联系人 | 姓名、关系、角色类型（registered supporter / 按州的决策人文件类型 / 家属联系人）、电话 / 邮箱、文件引用、已查看人和日期 | 结构化登记；**不推导谁是 person responsible，不把"NOK"当作约束性措施同意人**（`state-clinical-practice-rules.md` §0 第 2 条、§2.3） |

**入住**：Facility Manager 新建（或导入）→ 状态 Pre-admission → 设定 start day → 入住清单（流程第 4 项）→ start day 当天进入名单。

**同公司转院（Transfer）**
```
发起院 FM 发起 Transfer（目标院、生效时间、原因类别）
        │
        ▼
阻断检查：发起院是否还有该住户的 未确认草稿 / 未分配片段 / 未关闭 FollowUp / 未接收交接？
        │ 有 → 必须由发起院 RN 处理完，或明确移交给目标院（逐项确认）
        ▼
目标院 FM 或 Clinical Lead 接收确认（核对 ≥ 3 项识别信息 + 照片）
        │
        ▼
生效时刻：
  · 住户 ID 不变（同一个人，同一条档案时间线）
  · 从发起院名单移除；加入目标院名单（新房间、新 Unit）
  · 新记录用目标院的州规则包和流程版本
  · 历史记录保留原 Facility 标签（"Recorded at Banksia Park"），作者快照不变
  · 发起院员工失去对该住户的访问（审计中可查曾经访问过）
  · 目标院临床员工可以看该住户此前的 careKind 记录（连续照护，SQS 2.7.2(a)）
        │
        ▼
Transfer 记录进入审计：谁发起、谁接收、时间、阻断项如何处理
```
- 转院**按住户 ID 进行，永远不按房间**；腾出的房间如果入住了新住户，护士端名单在两人身上都显示 "Room changed" 标记，降低按房间号口述导致的错配。
- **转到其他 Provider**（不同公司）不是 Transfer，而是 Departed + 按 Rules 149-80 应新 provider 请求在 28 天内转交记录：管理端提供"按住户导出"入口（导出 PRD 的 PDF / 结构化导出），careKind 不直接把数据发给另一个租户。
- **房间调换**（同院内）：记录原因类别（本人要求 / 同意 / 医学理由经评估 / 维修 / 紧急情况，Rules 149-70）；careKind 只登记，不判断理由是否充分。

**离开 / 去世**：状态改为 Departed / Deceased，生效时间后不进入名单；未关闭 FollowUp 必须关闭并写原因；记录保留（careKind 端保留期按导出 PRD §4.9，provider 保存 7 年）。

**名单 CSV 导入（错配是最大临床危害）**
```
上传 CSV（careKind 模板）
   │  文件只在澳洲区域处理；原文件处理完 {{TBD：24}} 小时内删除
   ▼
① 结构校验：必填列、日期格式、出生日期合理范围、房间格式、文件内重复行
   ▼
② 与现有名单比对，每行得到一个状态：
   New            ── 新住户，未找到任何相似记录
   Update         ── 匹配键完全一致，只有非身份字段变化（房间、偏好称呼）
   Possible match ── 姓名相似 / 出生日期不一致 / 匹配键缺失 → 必须人工逐行决定
   Conflict       ── 同一床位两人、同一住户 ID 两个出生日期、身份字段变化而该住户已有确认记录 → 阻断
   Missing        ── 现有 Active 住户不在文件里 → 只列出，**不自动办理离开**
   Near-name      ── 同院内出现近似名（Joan Walsh / June Walsh）→ 两人都加 "Similar name" 标记
   ▼
③ 差异预览：按状态分组；只有 New 和 Update 可以批量接受；
   Possible match 必须逐行选择"同一个人 / 不同的人"并写原因；Conflict 必须先修正文件
   ▼
④ 第二人确认（Facility Manager 导入，Clinical Lead 或另一位 FM 确认）—— 仅当本批含身份字段变化时
   ▼
⑤ 生效：生成 ImportBatch（ID、文件校验和、操作人、确认人、每行结果）；护士端名单在下一次刷新时更新
   ▼
⑥ 撤销：本批新建且尚未产生任何记录的住户可以整批撤销；已有记录的不能撤销，只能走身份更正
```
- **身份更正**（姓名拼写、出生日期错）对已有确认记录的住户：单独流程，需 Clinical Lead 批准，审计保留前后值；已导出到 CMS 的记录提示"请在 CMS 中核对"（导出 PRD §4.7 匹配失败规则）。
- **CMS 同步名单**（主 PRD §13 开放问题 5）属于导出 PRD Phase 3 双向同步；同步来的名单同样走 ②–⑤ 的校验，不绕过。

### 4.6 流程管理（只管文书流程，不做临床决策）

#### 4.6.0 配置模型（所有 8 项共用）
```
careKind 平台底线（Super Admin 定义，带版本；例：Tier 3 类别不可下调）
        │  只能更严 ▲
Provider 公司层流程（Owner / Provider 范围的 Clinical Lead）
        │  只能更严 ▲
Facility 单院覆盖（Facility Manager / 本院 Clinical Lead）
        │
        ▼
生效值 = 三层中"最严"的那个；州规则包如有要求，同样取更严者
```
- 每一项都定义"更严"的方向（例：备岗时限越短越严；需要第二位 RN 比不需要更严；多一项清单比少一项更严）。保存时系统比较，**放松的设置直接拒绝**并说明："Facility settings can only be stricter than your company policy (15 minutes)."
- **版本**：每次保存生成 `PolicyVersion`（项目、范围、旧值、新值、改动人、原因（必填）、批准人（临床项必填第二人）、生效时间）。默认**下一个班次开始时生效**，避免班中路由不一致；紧急调严可选"立即生效"（写原因）。
- 每条草稿、每次路由、每个提醒记录它是按哪个版本执行的（与分级审核 PRD 的 `TierRuleVersion` 一致，本 PRD 把它推广到全部流程项）。
- **回滚** = 用旧值生成一个新版本，不删除历史。
- 平台底线提高时（super admin 发布新底线），低于新底线的机构设置自动按底线执行，并通知该机构的 Clinical Lead 和 Owner。

#### 4.6.1 八项流程配置
| # | 流程 | 可配置什么 | 默认值 | 下限（不能比它松） | 谁能改 | TGA |
|---|---|---|---|---|---|---|
| 1 | **审核链与分级** | 额外类别升到 Tier 3；PCW 能否确认 Tier 1；EN 能否确认 Tier 2；RN 自审 Tier 3 是否需要第二位 RN | PCW 确认 Tier 1：**Off**（机构主动开）；EN 确认 Tier 2：Off；RN 自审：允许，标 "self-confirmed" | 分级审核 PRD §4.1 的底线：Tier 3 类别不能下调；含数值 / 药名 / 剂量至少 Tier 2；Tier 3 只能 RN 逐条确认 | Clinical Lead + 第二人批准 | 🟢 |
| 2 | **升级与通知路由** | Tier 3 首要收件人；备岗人；备岗时限；SIRS 评估负责人（CM / DON） | 首要：本单元当班 RN in charge（**角色**）；备岗：Care Manager（角色）；时限 {{TBD：15}} 分钟；SIRS 负责人：Care Manager | 备岗人必须存在；时限上限 {{TBD：30}} 分钟；收件人只能是**角色**或本院 Active 员工；SIRS 负责人必须是人（不能"无"） | Clinical Lead + 第二人 | 🟢 路由本身；SIRS 相关的提示文字 🟡（只通知谁，不判断是否 reportable，G6） |
| 3 | **跨班次待办规则** | 机构 post-fall 观察时间表模板（时间点由 Clinical Lead 按本院政策录入，并填政策文件引用）；交接接收时限 | **不提供默认时间表**（ISBAR PRD §4.5）；接收时限 {{TBD：60}} 分钟 | FollowUp 不能删除只能关闭并写原因（固定）；提醒只说 "No linked note yet for 17:15" | Clinical Lead + 第二人 | 🟡 |
| 4 | **入住 / 转院 / 离开清单** | 机构自加清单项；指定每项负责角色 | 法定项（见下）预置并标 "Required by Aged Care Rules" | 法定项不能删除；可以加项、可以提前提醒 | Facility Manager | 🟢（按日期和状态的行政清单，不读临床内容） |
| 5 | **care plan 复核提醒** | 复核间隔（按机构政策）；事件后提示开关 | 间隔**留空**，提示 "Set your facility's review interval"（不写死 12 个月）；事件后提示：**Off** | 无（careKind 不设临床复核频率） | Clinical Lead | 间隔提醒 🟢；事件后提示 🟡 |
| 6 | **家属沟通政策** | 哪些事件类别在确认后提示"记录家属 / supporter 沟通" | Tier 3 类别全部提示 | 不能关闭 Tier 3 的提示；尊重住户"是否同意分享"的登记 | Clinical Lead | 🟡 |
| 7 | **员工上线流程** | 机构自加步骤（例：本院政策阅读确认） | 录音 / AI 告知确认 + careKind 培训确认 + RN/EN 资质 attest，三项都完成才 Active | 三项不可移除 | Facility Manager；培训确认人 = Clinical Lead 或 educator | 🟢 |
| 8 | **新养老院上线清单** | 机构侧各项的负责人和计划日期 | `paperwork-requirements-by-event.md` §18 的 19 项 | Go-live 门槛项不可跳过（见下） | Owner / Provider admin；careKind 侧项由 super admin 更新、管理端只读 | 🟢 |

**第 4 项预置的法定清单（只提醒有没有完成，careKind 不起草这些文件）**
| 事件 | 清单项 | 依据 |
|---|---|---|
| 入住 | care and services plan 已在 start day 当天或之前制定 | Rules 148-80(1)(a)（第 203–204 页） |
| 入住 / 每次更新 | 已给住户 care and services plan 副本 | Rules 148-80(4) |
| 入住 | Service agreement 在 start day 当天或之前 | Rules 148-65（`paperwork-requirements-by-event.md` §1） |
| 入住 | Start notification 在 start day 后 28 天内 | Rules 149-10(5)（同上 §1） |
| 入住 | AI 文书 / 录音告知已给住户或代表；同意状态已登记 | SQS 2.7.2(c)(d)；`09-templates/resident-ai-notice.md` |
| 入住 | registered supporter 联系方式已登记 | Rules 154-1000(1)(h) |
| 同院房间调换 | 调换原因类别已记录 | Rules 149-70 |
| 转到其他 provider | 应新 provider 请求，28 天内转交记录 | Rules 149-80(3) |
| 要求离开 | 至少 14 天书面通知 + continuity of care plan | Rules 149-60、149-65、149-75（同上 §15） |
| 离开 / 去世 | Cessation notification 28 天内 | Rules 149-20、149-25（同上 §15） |

**第 8 项 Go-live 门槛**（任何一项未完成，该 Facility 的护士端不能开班次；Demo 除外）：Pilot Agreement + DPA 已签（super admin 记录状态）· 员工告知与同意（每位员工的第 7 项）· 住户和家属告知已发出 · IMS / SIRS 流程不变的书面确认（§18 #13）· 第 1、2 项配置已由 Clinical Lead 确认（§18 #14）· 名单已导入并通过校验。

### 4.7 Business owner 看板
**原则**：只展示有测量方法的指标；每张卡片有 "How this is measured" 链接显示口径；最小单位是 **Unit / Facility**，少于 {{TBD：5}} 名活跃员工的单元只显示到 Facility 层，防止推断到个人。

| 卡片 | 口径（测量方法） | 数据来源 |
|---|---|---|
| 活跃员工 | 过去 7 天内至少提交过 1 次口述或做过 1 次审核动作的账号数 ÷ 已分配到该院的 Active 账号数 | 审计链事件 |
| 口述量 | 每天提交的口述事件数（Event 数），按院 / 单元；不按人 | Event 表 |
| 记录确认及时性 | 从口述提交到 Confirmed 的时长，**中位数**和 90 分位，按 Tier 分开；只统计本周期内确认的记录 | 审计链时间戳（分级审核 PRD §4.6） |
| Tier 3 确认时长 | 从 Tier 3 草稿生成到 RN 确认的时长：中位数（主）、平均值（辅）、90 分位；**只显示时长，不显示 Tier 3 事件数量或趋势** | 同上 |
| 时间点已过、仍无关联记录的跨班次待办 | 快照时刻 FollowUp 为 Open 且计划时间已过的数量；文案 "Follow-ups past their time with no linked note" | FollowUp（ISBAR PRD §4.5） |
| 覆盖情况 | 班次结束快照中 `No careKind notes this shift` 的住户数；`Recorded elsewhere`、`AI drafting off` 单列；固定说明 "This shows careKind notes only. It does not show whether care was provided." | CoverageSnapshot（ISBAR PRD §4.6） |
| 导出成功率 | Exported（有回执）÷（Exported + Failed + Unknown）；`Filed (attested)` 单列、不计入成功 | ExportJob（导出 PRD §4.5） |
| 上线清单完成度 | 第 8 项已完成项 ÷ 必需项，按院 | 本 PRD §4.6 |

**禁止**
- 员工个人绩效排名、个人口述量、个人确认时长、"最慢的审核人"（护栏 G10 精神；分级审核 PRD §4.4）。管理端**不提供**按员工导出使用数据给 HR。
- "节省 X 小时"、"提升 X%"等未经测量的数字（`rules/01-operations-rules.md` §1；ACL；`COMPONENTS.md` §1.5 不提供"改善 x%"类组件）。基线测量完成后如要展示时间对比，另写 PRD 并写清测量方法。
- 任何临床风险评分、"高风险住户"、跌倒次数趋势图（TGA 🔴 / 🟡，`tga-samd-boundary.md`）。
- Owner 看板上出现住户姓名。覆盖情况和待办的**住户名单**只对有临床角色的人可点开。

### 4.8 安全与隐私控制
| 控制 | 规则 |
|---|---|
| 登录 | 账号密码登录；**不做 MFA**（Lightman 18/10/2026 决定第一阶段不做 MFA，见 ADR-0005；作为已接受风险记录）。SSO 在 Phase 2 |
| 会话 | 管理端空闲 {{TBD：15}} 分钟锁定；不允许共享账号 |
| need-to-know | 临床内容只对 §4.2 中有临床角色、且范围包含该院的人可见；**每次打开住户临床内容都写读取审计**（谁、何时、哪位住户、从哪个页面） |
| 审计日志 | 所有写操作（员工、住户、同意、导入、转院、流程、权限、导出、支持访问审批）+ 临床内容读取；只追加，与分级审核 PRD §4.6 共用哈希链；日志不含健康内容正文；保留 {{TBD：≥ 7 年}}（`data-classification-and-retention.md` 待定项） |
| careKind 支持访问 | super admin 发起请求（工单号、目的、范围：哪家院、哪类数据、是否含健康信息、时长 ≤ {{TBD：4}} 小时）→ 管理端 Owner 或 Provider admin **批准 / 拒绝** → 限时生效、到期自动失效、可随时撤销 → 期间每次访问写入机构可见的审计 → 结束后机构收到访问摘要。默认请求不含健康信息（ADR-0003 第 3 条；`rules/01-operations-rules.md` §4） |
| APP 12 访问请求 | Privacy officer 在管理端登记请求（请求人、与住户关系、身份核验方式、范围）→ 系统生成该住户的记录包（复用分级审核 PRD §4.6 的审计包和导出 PRD 的 PDF）→ Privacy officer 审阅、处理 APP 12.3 例外（例如涉及他人隐私的内容）→ 交付并记录日期。计时显示 "Received 18/10/2026 · general guide: respond within 30 days"（APP 12.4(a)(ii) 对 organisation 是 "reasonable period"，OAIC 指引一般不超过 30 个日历日）。直接寄给 careKind 的请求转交 provider（`privacy-program.md` APP 12） |
| 员工数据 | 员工账号数据和使用日志是个人信息；**Privacy Act s7B(3) 员工记录豁免只适用于"雇主"本身的行为，careKind 不是雇主，很可能不能依赖这项豁免** ⚠️ 需律师确认；按 APPs 处理，最小化，不做绩效统计 |
| 导出与下载 | 名单导出、APP 12 包、审计导出只能下载到机构指定位置；管理员可以关闭下载（导出 PRD §4.3 同规则） |
| 租户隔离 | 管理端所有查询带 Provider 上下文；范围检查在后端执行；自动化测试覆盖跨租户、跨院越权（`information-security-policy.md` 租户隔离基线） |

### 4.9 与护士端、Super Admin 的接口
```
 Super Admin（careKind 内部）                管理端 Provider Portal                     护士端 Web App
 ─────────────────────────────              ─────────────────────────               ──────────────────
 建 Provider、首个 Owner、签约状态 ───────►  只读：签约状态、套餐、床位
 首次代建 Facility / Unit ────────────────►  Facility 列表（之后可自助新增）
 州规则包、公营合同包 ────────────────────►  每院只读显示 ─────────────────────────► 表单选项（例：RP 同意来源）
 平台底线、模板库、功能开关 ──────────────►  流程配置（只能调严）── PolicyVersion ──► 路由 / 提醒按版本执行
                                            员工、角色、分配 ─────────────────────► 能开哪家院的班次、能确认哪个 Tier
                                            住户名单、同意、房间 ─────────────────► 本班名单、退出即时生效、"Room changed"
 ◄──────────────── 支持访问请求 / 批准 ────  Owner / Provider admin 审批
                                            看板、单元总览、审计 ◄────────────────── 记录、审计链、FollowUp、覆盖快照、ExportJob
```
- 接口以**事件 + 版本号**传递：护士端缓存的名单和流程配置都带版本；版本过期时护士端提示刷新，离线时继续用已缓存版本并在恢复后对账。
- 退出 AI 文书、员工停用两类变更是**高优先级推送**：护士端在线时 {{TBD：60}} 秒内生效；离线设备在下次联网时先应用这两类变更再上传。

### 4.10 与已有 PRD 的关系（在管理端实现，规则不在这里重复）
| 已有 PRD | 在管理端实现的部分 | 规则以谁为准 |
|---|---|---|
| [分级审核与审计链](2026-10-18-tiered-review-and-audit-trail.md) | TierRule 配置界面和版本历史（本 PRD 流程第 1 项）；抽样审计看板；审计链查询与审计包导出 | 分级审核 PRD §4.1、§4.4、§4.6 |
| [ISBAR 交接与覆盖](2026-10-18-isbar-handover-and-care-coverage.md) | 护理经理单元总览（§4.8）；FollowUp 时间表模板配置（流程第 3 项）；接收时限 | ISBAR PRD §4.5–§4.8 |
| [导出与 CMS 集成](2026-10-18-record-export-and-cms-integration.md) | CMS 字段映射配置；谁能触发导出；PDF 下载开关；"未归档"列表；导出审计查询；careKind 端保留期配置；按住户导出（转出 provider、APP 12） | 导出 PRD §4.2–§4.9 |
| [Demo 工作区](2026-10-18-demo-workspace-and-synthetic-data.md) | 管理端 Demo 身份与多院数据（§12）；隔离、重置、标注沿用 | Demo PRD §4.2–§4.6 |
| [Shift Capture + 老人档案](2026-10-04-shift-capture-and-resident-records.md) | 名单、同意状态、音频保留期配置 | Shift Capture PRD §4、§7 |
| Super Admin PRD（编写中） | 本 PRD 只消费它定义的底线、规则包、套餐 | Super Admin PRD |

### 4.11 范围与分期
| ✅ MVP（试点） | ⏭ Phase 2 | ❌ 不做 |
|---|---|---|
| Provider / Facility / Unit 层级与范围切换（Region 可先只做显示分组） | Region 作为权限范围；SSO | HR、排班、薪资、员工档案 |
| 员工：邀请、角色、多院分配、上线步骤、停用前检查、作者快照 | 员工批量 CSV 邀请 | 员工个人绩效统计、HR 导出 |
| 住户：入住、同院转院、离开、房间、同意、联系人、CSV 分步导入 | CMS 名单同步（走同一校验） | 自动按姓名合并住户；自动办理离开 |
| 流程第 1、2、4、7、8 项 + 版本与审计 | 第 3、5（事件后提示）、6 项（🟡，审查通过后） | 系统建议观察频率、复核频率、是否通知家属 |
| 看板：活跃员工、口述量、确认及时性、Tier 3 确认时长、上线清单 | 待办、覆盖、导出成功率卡片（依赖 ISBAR、导出 PRD 的上线） | 风险评分、临床事件趋势、"节省时间" |
| 读取审计、支持访问审批 | APP 12 请求工作台（**MVP 先用手动流程 + 按住户导出**） | careKind 员工免审批访问 |

---

## 4.5 法律依据（本地参考文件）✅
> 已按 `legal-reference-check` 步骤手动执行；PDF 用 `pdftotext -layout` 打开核对，页码为文件内印刷页码。运营参考，不是法律意见。

| 主题 | 本地文件 | 条款 / 页码 | 对本功能的约束 |
|---|---|---|---|
| 员工记录豁免 | `03-legal-compliance/references/law-library/privacy-act-1988-compilation-2026-06-04.pdf` | s6 "employee record" 定义（第 17 页）；s7B(3)（第 71 页） | 豁免限于"is or was an employer"的组织、与雇佣关系和其持有的员工记录直接相关的行为。careKind 不是雇主 → 员工账号数据按 APPs 处理 ⚠️ 需律师确认 |
| 访问请求 | 同上 | APP 12.1、12.3、12.4（第 380–381 页） | organisation 须在 "reasonable period" 内响应、按请求方式提供；12.3 例外由 provider 判断 → 管理端只提供登记、计时、记录包、审阅，不替 provider 决定 |
| 访问请求时限指引 | `…/law-library/oaic-app-guidelines-consolidated-2026-05.pdf` | Chapter 12，APP 12 — organisations（"should not exceed 30 calendar days"） | 计时显示 30 天作为一般参考，文字写"general guide" |
| 自动化决策透明度（10/12/2026 起） | `…/law-library/oaic-app-1-7-1-9-adm-transparency-flowchart-2026-09.pdf` | 流程图："substantially and directly related"、"significantly affects rights or interests" | CSV 的 Possible match、路由选择收件人都由人决定或只是通知；初判不在范围内，但要写进 APP 1.7–1.9 披露包供 provider 判断 ⚠️ |
| care and services plan | `…/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 148-80(1)(a)、(4)、(5)（第 203–204 页） | 入住清单："start day 当天或之前"；每次更新给副本；12 个月复核只适用 (5)(6) 类别 → 第 5 项不写死 12 个月 |
| 房间调换 | 同上 | r 149-70(1)（第 215 页） | 只登记原因类别，不判断 |
| 转出 provider 时转交记录 | 同上 | r 149-80(2)–(4)（第 216 页） | 28 天内；管理端提供按住户导出，不跨租户直传 |
| 记录保存 | 同上 | r 154-1000(1)(c)(d)(h)、(2)（第 242–243 页） | care plan、progress notes、supporter 联系方式由 provider 保存 7 年 → 停用员工 / 离开住户都不能删除记录；作者快照随记录保留 |
| 员工记录（provider 义务） | 同上 | r 154-905、154-910（第 241–242 页） | 员工全名、出生日期、住址、筛查记录是 provider 的记录 → careKind 不收集这些字段 |
| 信息管理 | `…/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | Outcome 2.7，2.7.1、2.7.2(a)–(e)（第 19 页） | 安全管理记录；right information at the right time（转院后目标院可看历史）；同意与撤回 → 同意字段和即时生效 |
| 人力资源 | 同上 | Outcome 2.9，2.9.1、2.9.4（第 20 页） | 资质记录和培训是 provider 的义务 → 管理端只记"培训已确认"和资质 attest，不替代 provider 的 HR 系统 |
| 网络安全 | `…/law-library/asd-essential-eight-maturity-model-2023-11.pdf` | Multi-factor authentication："MFA is used to authenticate privileged users of systems"（ML1 起） | 管理端账号都是特权用户；E8 建议 MFA，但（Lightman 18/10/2026 决定第一阶段不做 MFA，见 ADR-0005；作为已接受风险记录）；机构安全尽调时需如实说明 |
| 专业责任 | `…/law-library/ahpra-ai-in-healthcare-summary.md` | Accountability；"practitioner is responsible for checking the accuracy" | 作者 / 审核人身份必须准确保留；RN/EN 角色需要 attest |
| 临床 AI 治理 | `…/law-library/acsqhc-ai-clinical-use-guide-2025-08.pdf` | "Comply with the governance and oversight for AI in your organisation" | 机构需要一个配置和监督 AI 文书流程的地方 → 流程管理 + 审计 |
| 州差异 | `03-legal-compliance/references/state-by-state-comparison.md` | §1、§3.2、§4.1、§4.4、§4.10 | 州规则包按 Facility 地址带出；公营合同包；泄露通知时限；删除日志（ACT Principle 4.2、NSW s25） |
| 州临床规则 | `03-legal-compliance/references/state-clinical-practice-rules.md` | §0 第 2 条、§1.3、§2.3、§7 | 联系人 / 决策人只做结构化登记，不推导；RP 同意人不等于 NOK；同意来源选项按州 |
| 事件文书与机构侧清单 | `03-legal-compliance/references/paperwork-requirements-by-event.md` | §1、§15、§16、§18 | 第 4 项法定清单；第 7 项员工上线；第 8 项 19 项上线清单 |
| 运营规范 | `rules/01-operations-rules.md` §2–§4；`rules/00-company-rules.md` §3 | — | 只写已做到的；查看客户数据须工单授权并留审计；员工个人档案不进系统 |
| 访问控制 / 数据保留 | `04-security/access-control.md`、`data-classification-and-retention.md`、`information-security-policy.md` | — | 最小权限、离职当天撤权、季度复核；账号"合同期 + 30 天"；审计 ≥ 12 个月（建议 7 年） |
| TGA 边界 | `03-legal-compliance/tga-samd-boundary.md` | 功能红绿灯 | 流程提示逐项判定（§5） |

### 本地资料缺口
- ⚠️ **工作场所监控法**（NSW Workplace Surveillance Act 2005、ACT Workplace Privacy Act 2011）：本地无资料，需律师确认 → **上线门槛**（看板的使用统计、读取审计是否构成工作场所监控，员工告知怎么写）。
- ⚠️ **监控设备法**（录音同意 / 退出字段）：本地无资料，需律师确认 → 上线门槛（与 Shift Capture PRD 共用）。
- ⚠️ **员工告知模板**：仓库没有（`paperwork-requirements-by-event.md` §18 #6）→ 第 7 项上线门槛。
- ⚠️ **员工记录豁免对 vendor 的适用性**：本地有法条原文，但适用结论需律师确认 → 上线门槛。
- ⚠️ **VIC HRA / NSW HRIPA / ACT 的访问请求时限和例外**：本地只有对照表，没有原文 → APP 12 工作台上线前需律师确认。
- ⚠️ OAIC PIA 指引本地未下载（同 §18 #4）。

### 可能过时的资料
- `04-security/` 各文件、`privacy-program.md`、`tga-samd-boundary.md`：Last reviewed 04/10/2026，Draft 状态。
- 约束性措施联邦 hierarchy 过渡期 01/12/2026（`state-clinical-practice-rules.md` §0 第 1 条）：州规则包里的 RP 选项必须可由 super admin 更新，不能写死。

---

## 5. TGA boundary check ✅
```
Verdict: 🟡（整体）——管理功能本身 🟢；流程第 3、5（事件后提示）、6 项和 SIRS 相关通知文字为 🟡
Reasons:
  · 员工、住户、权限、审计、导入、看板的运营指标：模板管理 / 流程工具，不解读临床数据 → 🟢
  · 流程第 1 项：配置谁能确认哪个 Tier，是审核路由，不是临床判断 → 🟢（分级判断本身见分级审核 PRD §5）
  · 流程第 2 项：配置"通知谁" → 🟢；"可能需要按 SIRS 评估"类提示 → 🟡（tga-samd-boundary.md 黄灯第 2 行），不判断是否 reportable（G6）
  · 流程第 3 项：按机构 / RN 选定的时间点提示"该时间点没有记录" → 🟡（research §11 第 14 条）；careKind 不提供默认时间表
  · 流程第 4 项：按日期和状态的行政清单（care plan 是否在 start day 前、28 天通知），不读临床内容 → 🟢
  · 流程第 5 项：按机构间隔提醒 → 🟢；"事件后 care plan 可能需要复核" → 🟡（research 5-8 §6.4）
  · 流程第 6 项：按事件类别提示"记录家属沟通" → 🟡（根据记录提示可能缺失的文书）
  · 流程第 7、8 项：员工和机构上线清单 → 🟢
  · 看板：只有使用和流程时长；不展示临床事件数量趋势（黄灯第 3 行）、不做风险评分（红灯）→ 🟢
Risky wording → safer alternative:
  "Overdue observations" → "No linked note yet for 17:15"
  "High-risk residents" / "Missed residents" → 不出现；"No careKind notes this shift"
  "SIRS alert" → "Your SIRS assessment lead has been notified about a new Tier 3 note"
  "Staff performance" / "Top reviewers" → 不出现；"Review timeliness (facility)"
  "Care plan review due because of risk" → "Your facility's review interval: next review 18/01/2027"
Required next step: 🟡 项（第 3、5 事件后提示、6 项、SIRS 通知文字）在 Phase 2 上线前由产品 + 临床顾问评审，必要时外部法规顾问，结论记入 ADR；MVP 只上线 🟢 项。
```
运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

---

## 6. 隐私影响 ✅
| 问题 | 回答 |
|---|---|
| 新增收集 | 员工：姓名、偏好称呼、登录邮箱、角色、可选 AHPRA 编号、分配、上线步骤日期、管理端使用日志。住户：出生日期、机构住户 ID、CMS ID、房间历史、照片（可选）、同意状态与来源。**第三方**：住户联系人 / supporter / 决策人的姓名和联系方式。支持访问记录、APP 12 请求登记、读取审计 |
| 必要性 | 每项都对应一个功能（匹配、路由、作者、同意、连续照护）；不收集员工出生日期、住址、筛查记录（provider HR 自己保存） |
| 存哪里 | 澳洲区域，与护士端同一租户隔离（G9、ADR-0001）；CSV 原文件处理后 {{TBD：24}} 小时内删除，只保留校验和与逐行结果 |
| 保留多久 | 员工账号：合同期 + 30 天（登录信息），作者快照随记录；住户管理数据：随记录保留期（导出 PRD §4.9）；审计：{{TBD：≥ 7 年}}；支持访问日志：同审计 |
| 新子处理方 | **邀请邮件 / 推送服务**：会接触员工邮箱或手机号 → 必须按 `vendor-subprocessor-register.md` 选型清单评估，优先澳洲境内；推送不含住户姓名（分级审核 PRD HAZ-P-TR-08） |
| 员工数据身份 | careKind 对员工用户信息是收集方（`privacy-program.md` §2）；员工记录豁免很可能不适用于 careKind ⚠️ |
| APP 1.7–1.9 | 初判不触发（人做决定或只通知），但写进 10/12/2026 前交付的披露包 ⚠️ |
| 需要更新 | MVP PIA（新增员工数据、第三方联系人、读取审计）；隐私政策（员工用户信息、支持访问）；DPA（支持访问审批流程、子处理方）；员工告知模板（新建，缺口） |

---

## 7. 临床危害 ✅
新提出（**Proposed**，等临床顾问接受后才写入 `hazard-log.md`；本 PRD 不改危害日志）。

| ID（临时） | 危害 | 原因 | 潜在伤害 | 初始风险 | 控制措施 |
|---|---|---|---|---|---|
| HAZ-P-PP-01 | 流程配置把 Tier 3 路由给离职 / 未分配到本院的员工 | 路由写了具体人名；停用时没检查 | Tier 3 没人看，照护和上报延误 | 高 | 默认路由到**角色**；保存时校验收件人 Active 且分配到本院；停用前阻断检查；路由日志指标 = 0 |
| HAZ-P-PP-02 | 转院后记录跟错住户 | 按房间号转移；新住户住进旧房间；转院时有未确认草稿 | 错误照护、隐私泄露 | 极高 | 按住户 ID 转院；阻断检查未确认项；"Room changed" 标记；目标院 ≥ 3 项识别 + 照片确认；关联 HAZ-003、HAZ-009（Proposed） |
| HAZ-P-PP-03 | Owner 被误开临床内容权限 | 为了"方便"给 Owner 加临床角色 | 健康信息超范围访问（隐私事件） | 高 | 默认无；授予需第二人批准；读取审计；季度复核逐条列出；看板不显示住户姓名 |
| HAZ-P-PP-04 | CSV 导入错配（两人合并、出生日期互换、房间错） | 姓名匹配、批量接受 | 记录写到别人名下 | 极高 | 匹配键不含姓名；Possible match 逐行人工；Conflict 阻断；身份字段变化需第二人；ImportBatch 可追溯 |
| HAZ-P-PP-05 | 文件里漏了一位住户 → 被自动办理离开 | 导入覆盖式更新 | 住户不在名单 → 口述进入待分配或无人记录 | 高 | Missing 只列出、不自动离开；离开只能逐人办理 |
| HAZ-P-PP-06 | 角色给错（PCW 被设为 RN） | 手工错误 | Tier 3 由无资质的人确认（违反 G5） | 高 | RN/EN 需 Clinical Lead attest；角色变更审计；季度权限复核；导出 PRD §4.2 第 2 条后端再校验 |
| HAZ-P-PP-07 | 住户退出没有传到护士端 | 离线设备、缓存 | 为已退出的住户起草 | 中 | 高优先级推送；离线设备联网先应用再上传；起草前后端再查同意状态 |
| HAZ-P-PP-08 | 班中改流程导致同一班路由不一致 | 立即生效 | 某条 Tier 3 按旧规则路由给错误的人 | 中 | 默认下一班生效；每条路由记录版本；紧急调严才立即生效 |
| HAZ-P-PP-09 | Facility 州别填错 | 自助新增时选错 | 错误的 RP 同意选项、保存期提示 | 中 | 二次确认；之后只能经 super admin 修改；Facility 页常显示规则包 |
| HAZ-P-PP-10 | 看板被当成照护质量或员工绩效的证据 | 覆盖 = "被忽视"；按单元反推个人 | 错误问责、员工不信任、漏补记 | 中 | 固定口径说明；最小单元人数；不做个人统计；关联 HAZ-P-HO-05 |
| HAZ-P-PP-11 | 联系人字段被当作约束性措施同意人 | 一个 "NOK" 字段 | 无权的人"同意"约束 | 高 | 联系人按角色类型分开；RP 同意来源只在 RP 同意模板里按州手动登记（`clinical-restrictive-practice-consent-record.md`） |
| HAZ-P-PP-12 | 停用员工的作者身份被改成接手人 | 实时引用账号 | 审计链失真、责任不清 | 中 | 作者快照；G7 |

---

## 8. AI 评测
**本 PRD 不新增 AI 评测场景**，原因：管理端不调用 ASR / LLM，不生成任何内容；CSV 匹配是确定性规则，不是模型。用确定性验收测试代替：

| 测试 | 通过标准 |
|---|---|
| 导入：合成名单 200 行，含 20 个故意错误（近似名、出生日期互换、同床两人、漏行、身份字段变化） | 20/20 被标为 Possible match / Conflict / Missing；0 行被自动合并或自动离开 |
| 转院：带未确认草稿的住户发起转院 | 被阻断；处理后转院，历史记录 Facility 标签与作者快照不变 |
| 放松配置：单院把 EN 确认 Tier 2 从 Off 改 On（公司层 Off） | 被拒绝并显示原因 |
| 停用：被设为备岗人的 RN | 停用被阻断，直到重新分配；路由日志 0 次发给非 Active |
| 越权：Owner 打开住户详情；A 公司账号访问 B 公司 Facility | 都返回无权限，并写审计 |
| 支持访问：到期后访问 | 拒绝 |

流程第 1 项改动会影响 Tier 路由，评测沿用分级审核 PRD §8（Tier 3 召回门槛）；每次平台底线变更要跑一次。

---

## 9. 无障碍与多语言
- 主要在电脑上使用（ADR-0004），但手机宽度可读（看板、审批）；目标 WCAG 2.2 AA；组件从 `06-app-development/design/COMPONENTS.md` 选用，不写死颜色和像素。
- 表格（名单、导入差异）支持键盘逐行操作和屏幕阅读器；状态用文字 + 图标，不只靠颜色（COMPONENTS §1.3）。
- 界面文字用澳式英语、日期 DD/MM/YYYY；示例：
  - "Rosa Bianchi has opted out of AI documentation. Staff will be asked to write their own notes."
  - "This change makes the rule stricter. It will apply from the start of the next shift."
  - "You can't deactivate Tom Becker yet. He is the backup contact for Tier 3 notes at Banksia Park."
  - "Helen, you're viewing group totals. Resident details are only shown to staff with a clinical role."
- 管理端用户多是英语流利的管理者，MVP 只做英语；员工上线告知需要多语言版本（与多语言 PRD 协调）。

---

## 10. 上线计划与回滚
1. **前置**：ADR-0002（多租户隔离）、身份方案、Super Admin PRD 的规则包和底线数据结构确定。
2. **法律门槛**：工作场所监控、员工记录豁免、员工告知模板、监控设备法（录音字段）律师意见；10/12/2026 前 APP 1.7–1.9 披露包。
3. **Alpha**：§8 全部确定性测试通过；跨租户越权测试；渗透测试范围包含管理端（`information-security-policy.md`）。
4. **试点**：先由 careKind 与机构一起完成第 8 项上线清单和第一次名单导入（第 -2 周）；机构自助从第 1 周开始；🟡 流程项不开启。
5. **Phase 2**：🟡 项经评审 + ADR 后按机构逐个开启；Region 权限、SSO、APP 12 工作台。
6. **回滚**：每个模块由 super admin 功能开关控制；流程配置回滚 = 生成旧值的新版本；导入可整批撤销（未产生记录时）。出现任何一次因导入 / 转院导致的错配进入正式记录 → P1 临床安全事件，冻结导入和转院功能，走 `incident-triage`。

---

## 11. 非功能需求
- 名单变更（导入、转院、退出、停用）到护士端生效：在线 ≤ {{TBD：60}} 秒；看板数据延迟 ≤ {{TBD：15}} 分钟（标明 "Updated 16:05"）。
- 导入 500 行的校验 ≤ {{TBD：10}} 秒；差异预览分页。
- 管理端独立部署、独立域名（ADR-0004）；所有接口带 Provider 上下文和范围检查。
- 日志、错误监控不含住户姓名和健康内容（`architecture.md`）。

---

## 12. Demo 与示例数据
> 全部**虚构**。管理端 Demo 是 Demo PRD 的扩展，沿用它的隔离、重置、标注规则；页面常驻 "Demo · Wattle Grove Care Group is fictional · Nothing here is real or sent anywhere"。

| 项目 | 内容 |
|---|---|
| Demo 入口 | 产品介绍页 "For owners and managers" 区块（靠近价值说明和 "Talk to us about a pilot"）→ "See the provider portal demo"；Demo 工作区内 "Switch demo user" 可切到管理端身份；管理端空状态 "See an example group" |
| 虚构公司 | **Wattle Grove Care Group（虚构）**：Wattle Grove Residential Care（VIC，Melbourne，现有主场景）· Banksia Park Aged Care（VIC，Geelong）· Grevillea House（NSW，Albury，自动带出 NSW 规则包）；Region "VIC Metro & Regional"（虚构，含前两家） |
| Demo 身份 | Helen Tran（虚构，Managing Director，Owner）· Grace Liu（虚构，Wattle Grove 的 Care Manager）· 区域 DON（虚构，{{TBD：姓名与 Super Admin PRD 对齐}}，三院 Clinical Lead）· Banksia Park Facility Manager（虚构，{{TBD}}）· Privacy officer（虚构，{{TBD}}）。只开放受控操作 |
| 场景 1：Owner 看板 | Helen 看 12/10–18/10/2026 三院汇总（预生成）：活跃员工、口述量、确认及时性中位数、Tier 3 确认时长、Grevillea House 上线清单 16/19。点 "How this is measured" 看口径。尝试打开住户 → "Resident details are only shown to staff with a clinical role" |
| 场景 2：范围切换与跨州 | 切到 Grevillea House → 显示 `Rules pack: NSW`；打开 RP 同意来源选项看到 NSW 的 guardian / enduring guardian RP function（对比 Wattle Grove 的 VIC Tier 1–4） |
| 场景 3：CSV 导入 | Banksia Park FM 导入 `banksia-park-roster-fictional.csv`（40 行，含：近似名一对、已有住户出生日期不一致、同床两人、漏掉 1 位 Active 住户）→ 差异预览逐类处理；漏掉的那位显示 Missing，不被办理离开 |
| 场景 4：跨州转院 | Mrs Dorothy Fraser（虚构，79 岁）15/10/2026 从 Banksia Park（VIC）转到 Grevillea House（NSW）：发起时被 1 条未确认 Tier 2 草稿阻断 → 由 Banksia Park RN 处理 → Grevillea 确认接收；时间线显示 "Recorded at Banksia Park" 标签，之后的记录用 NSW 规则包 |
| 场景 5：员工离职 | Tom Becker RN（虚构，Banksia Park）停用 → 阻断：他是 Tier 3 备岗人 + 2 个未关闭 FollowUp → 重新分配后停用；他确认过的记录显示 "Tom Becker RN (former staff)" |
| 场景 6：流程配置 | 区域 DON 把 Grevillea 的 Fall 改成 Tier 2 → 被底线拒绝；Wattle Grove 想把"EN 确认 Tier 2"改 On（公司层 Off）→ 被拒绝；把备岗时限从 15 改 10 分钟 → 允许，写原因，生成 v3，"applies from next shift" |
| 场景 7：支持访问与同意 | 模拟 careKind 请求 CK-1042（Banksia Park，2 小时，不含健康信息）→ Privacy officer 批准 / 拒绝；Rosa Bianchi（虚构）的退出登记：来源 "Representative (son)"，与 Demo PRD 一致 |
| 预生成 vs 真实执行 | 看板汇总、历史版本、支持请求为**预生成**（标 "Pre-generated sample"）；权限检查、范围过滤、流程校验、导入分步校验、转院阻断、停用检查是**真实产品逻辑**，作用于本体验者隔离的 Demo 数据；邀请邮件、推送、支持访问**模拟**（"Simulated — nothing was sent"） |
| 数据位置（建议，未创建） | 在 Demo PRD 的数据集上扩展：`06-app-development/app/fixtures/demo/wattle-grove-care-group/v1/`（`provider.json`、`facilities.json`、`staff-assignments.json`、`policies.json`、`dashboard-aggregates.json`、`imports/banksia-park-roster-fictional.csv`）；叙事脚本 `06-app-development/product/demo-scenarios/wattle-grove-care-group-portal.md`；所有姓名带 fictional 标记，Wattle Grove 的 8 位住户与 Demo PRD §4.4 一致 |
| 命名注意 | Wattle Grove 内有 "Banksia wing (memory support)"，与 Banksia Park Aged Care 同名词；界面始终显示 "Facility · Wing"，叙事脚本中避免混淆 ⚠️ 需 Demo PRD assignee 确认是否改名 |
| 验收 | 实际验证：进入 4 个管理端身份；范围切换；Owner 无法打开住户；导入 4 类问题全部被拦；转院阻断 → 完成 → 时间线标签；停用阻断 → 完成 → 作者快照；放松配置被拒、调严生效；支持访问批准与到期；Reset 只影响本体验者；两位体验者并发隔离；Exit 回到自己的工作区且原有资料不变。桌面 + 手机宽度截图（看板、导入差异、转院、流程配置）存证 ⚠️ 目录待建 |
| 当前状态 | 未实现（PRD 阶段）；代码、Demo、部署、线上验收均未开始 |

---

## 13. 开放问题与需要 Lightman 决定的事
1. **Owner 默认不看临床内容**、授予需第二人批准——是否接受？（本 PRD 建议：是）
2. 管理端**独立 app 还是并入护士端**（ADR-0004 仍是建议）→ 🧑 Lightman + Lin。
3. MVP 范围：§4.11 的切分是否接受？特别是看板只上 5 张卡、APP 12 先用手动流程。
4. 流程第 1 项默认值："PCW 确认 Tier 1" 默认 Off 还是 On？（本 PRD 建议 Off，机构主动开）→ 🧑 Lightman + 临床顾问。
5. 转院后目标院默认能看此前 careKind 记录？（建议：能，连续照护；发起院失去访问）→ 🧑 Lightman + 律师。
6. 看板最小单元人数 {{TBD：5}}；套餐是否限制自助新增 Facility 数量（按床位计价，主 PRD §12）。
7. 区域 DON 等 Demo 人名与 Super Admin PRD 对齐。
8. 员工记录豁免、工作场所监控 → 律师。

---

## 14. 对主 PRD 的变更建议（不在本 PRD 内修改）
| 编号 | 位置 | 建议 |
|---|---|---|
| PP1 | §5 用户与角色 | 拆出 Owner / Executive（买单方，默认只看汇总）、Facility Manager、Clinical Lead、Care Manager、Provider admin / Privacy；写明一线员工不进管理端 |
| PP2 | §6.2 数据模型 | 新增 `REGION`、`STAFF_FACILITY_ASSIGNMENT`、`RESIDENT_TRANSFER`、`IMPORT_BATCH`、`POLICY_VERSION`（覆盖全部流程项，含 TierRuleVersion）、`STATE_RULE_PACK`、`SUPPORT_ACCESS_GRANT`、`RESIDENT_CONTACT`；`Resident` 挂 Facility（Unit 是属性），`Record` 存作者快照 |
| PP3 | §7.5 | 护理经理流程改为"在管理端完成"，链接本 PRD 和 ISBAR PRD §4.8 |
| PP4 | §7.7 | 上线流程改为管理端的第 8 项清单 + Go-live 门槛 |
| PP5 | §8 Manage 行 | 拆成 "Provider Portal" 和 "Super Admin" 两行，MVP 内容按本 PRD §4.11 |
| PP6 | §9 护栏 | 建议新增（需 ADR）：**G15 机构配置只能在 careKind 底线之上调严，每次改动有版本和原因**；与 ISBAR PRD 建议的 G12 合并表述"看板只做文书和流程统计，不做员工个人统计、临床事件趋势或风险评分" |
| PP7 | §10 架构 | 加入管理端和 Super Admin 两个前端、名单 / 流程的版本化推送 |
| PP8 | §13 开放问题 5 | "本班老人名单从哪里来"：MVP = 管理端维护 + CSV 分步导入；Phase 3 CMS 同步走同一校验 |

---

## 15. 建议 registry 登记行
（主 agent 登记；本 PRD 不改 registry.md。assignee 需 Lightman 确认。）
| PRD | 标题 | 阶段 | Assignee | Reviewer | 复杂度 | 风险 | Parent | Blocked | 更新 |
|---|---|---|---|---|---|---|---|---|---|
| 2026-10-18-provider-portal-facility-admin | 机构管理端（Provider Portal）：多院层级、员工与住户、流程管理、Owner 看板 | idea | | — | L | R3 | — | ADR-0002 多租户 · Super Admin PRD · 律师意见（员工记录豁免、工作场所监控）· 等 Lightman · {{TBD}} | 18/10/2026 |

- **复杂度 L（8）**：范围 2（新前端 + 员工、住户、流程、看板、审计多个模块）+ 技术面 2（多租户、鉴权与范围）+ 不确定性 2（独立 app 待定、规则包结构依赖 Super Admin PRD、身份方案）+ 依赖 2（Super Admin、分级审核、ISBAR、导出、Demo 共 5 个 PRD）。跨方向多（frontend、backend、infra-security、product-ux），建议安排协助者；是否拆子 PRD 由 Lightman 决定。
- **风险 R3**：租户隔离与鉴权；老人归属（名单导入、转院，G4）；健康数据访问控制；临床确认路径的配置（G5）；TGA 🟡 项。Reviewer 必须 senior 以上且不是 assignee。

---

## 16. 审批
| 角色 | 姓名 | 日期 |
|---|---|---|
| 产品 | | |
| 临床顾问 | | |
| CTO / Tech Lead | | |
| 法律意见（员工记录豁免、工作场所监控、APP 12 州法、监控设备法） | | |

## 变更记录
| 日期 | 版本 | 改动 | 作者 |
|---|---|---|---|
| 18/10/2026 | v0.1 | 初稿 | Claude（AI 起草，待 Lightman 审） |
