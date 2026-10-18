# PRD：营销网站（Marketing Website）——信任、成果预览、Demo 入口与试点申请

Owner: Lightman (PO) · Status: **Draft** · Last reviewed: 18/10/2026
Parent: [docs/PRD.md](../PRD.md)
Related: [Demo 工作区与合成示例数据](2026-10-18-demo-workspace-and-synthetic-data.md) · [机构管理端 Provider Portal](2026-10-18-provider-portal-facility-admin.md) · [Super Admin 控制台](2026-10-18-super-admin-multi-facility-console.md) · [设计系统 PRD](2026-10-11-carekind-design-system.md) · `06-app-development/design/DESIGN.md` · `06-app-development/design/COMPONENTS.md` · `07-marketing-ops/`（营销合规、品牌、ICP、销售、试点）· `11-workflows/marketing-content-publish.md` · `03-legal-compliance/privacy-program.md` · `09-templates/privacy-policy-draft.md` · `04-security/vendor-subprocessor-register.md`

> 一句话：careKind AI 的公开网站。它要让四类读者（买单的 business owner、临床决策者、IT / 隐私负责人、一线护士）在**注册或付款之前**就看到一个完整的虚构成果示例，找到 Demo 入口，看清楚 careKind **做什么、不做什么、哪些已经做到、哪些还在计划中**，然后申请试点。
>
> 证据等级：案头调研；**用户访谈 n = 0**（`10-feedback/` 为空），**客户数 = 0、试点数 = 0**。网站上不能出现客户 logo、推荐语、试点结果或效率数字。
> 说明：`rules/04-prd-rules.md` §1 要求流程图用 Mermaid；本 PRD 按 Owner 要求（在终端阅读）全部使用**纯文本 ASCII**。网站文案草稿用澳式英语，其余中文。运营参考，不是法律意见。

## 1. 问题

### 1.1 谁、在什么场景、遇到什么问题
| 读者 | 场景 | 问题（假设，n = 0） |
|---|---|---|
| **买单方**：养老院 business owner / CEO / 多院集团 Managing Director（画像 David，`icp-and-personas.md`） | 听说 careKind（LinkedIn、引荐、行业活动）后上网查 | 看不到"买了以后得到什么"；担心风险（临床、隐私、声誉）；需要知道试点要投入什么、多院怎么管 |
| **临床决策者**：DON / Clinical Care Manager（画像 Helen） | 评估是否值得推动试点 | 需要确认护士仍是作者、敏感事件有人把关、AI 不会编内容、记录经得起追问 |
| **IT / 隐私 / 风险负责人**（画像 Sam） | 做供应商尽调 | 需要数据在哪、谁能访问、子处理方、是否训练模型、安全资料包；竞品在这点上普遍不透明（`how-competitors-solve-it.md` §11 #2） |
| **一线护士 / PCW**（画像 Priya、Maria） | 机构准备试点，护士先上网了解 | 担心"AI 写错算我头上""又一个系统""录音是不是监控我" |

### 1.2 为什么现在要做
- 销售流程第 3 步"演示"和第 4 步"尽调"需要一个可以发给客户的公开入口（`07-marketing-ops/sales/sales-process.md`）；营销计划把官网列为必备渠道（`marketing-plan.md`"官网必备页面"）。
- TGA 在 2026-10 审查 12 个 digital scribe，认为其中 8 个可能构成医疗器械，并指出"免责声明不足以决定是否属于医疗器械"（`how-competitors-solve-it.md` §11 #1，媒体来源 S99）。**预期用途由我们的全部对外表述决定**（`tga-samd-boundary.md`），所以网站文案本身就是合规对象，不是装饰。
- Owner 规则（2026-10-17）：公开介绍页必须能预览成果、找到 Demo 入口，并靠近价值说明和开始入口。

### 1.3 证据（诚实标注）
| 证据 | 来源 | 强度 |
|---|---|---|
| 访谈 / 反馈 | `10-feedback/` 为空 | **n = 0** |
| "说一次，生成多份文书"是公开资料中最清楚的空白，应作为 demo 主线 | `how-competitors-solve-it.md` §10 #2、§12 | 中（公开资料） |
| 竞品数据处理不透明是行业痛点，透明度可以成为卖点 | `how-competitors-solve-it.md` §11 #2（S101–S103） | 中（监管 / 媒体） |
| 买方决策链 DON → COO/CEO → IT/隐私 | `docs/PRD.md` §12；`icp-and-personas.md` | 弱（假设） |
| 买单方 = Provider business owner，一家公司多家院 | ADR-0004；Provider Portal PRD §1.2 | 产品决定 |

## 2. 目标与指标

### 2.1 目标
1. 每类读者在 3 次点击内找到自己关心的答案（§4.1 的问题 → 页面映射）。
2. 首页和 How it works 页能看到**完整的虚构成果示例**，并有明显的 "Try the demo" 入口。
3. 所有对外陈述都能对应到仓库里的证据（§4.6 声明登记表）；每条都标明 `Available now` / `Pilot scope` / `Planned`。
4. 表单只收集联系所需的最少信息，**不收集任何住户信息**；营销邮件符合 Spam Act。
5. 默认不把访客数据发给不必要的第三方。

### 2.2 指标（不编目标数字；上线 4 周后由 Lightman 设定）
| 指标 | 定义与测量方法 | 目标 |
|---|---|---|
| ⭐ Demo 进入率 | 点击 "Try the demo" 的访问数 ÷ 网站访问数；用不设 cookie 的聚合统计（§4.9），按周汇总 | {{TBD：4 周后设定}} |
| Book a pilot 提交数 | 表单后端收到的有效提交数（去掉垃圾和测试）；每周人工计数 | 跟踪 |
| 合格线索数 | 提交中符合 ICP（residential、2–20 个 home、首批 VIC）的数量；销售在 CRM 中人工标记 | 跟踪 |
| Demo → Book a pilot | 从 Demo 横幅 "Talk to us about a pilot" 进入表单页的次数（URL 参数 `from=demo`，不带个人标识） | 跟踪 |
| 尽调资料请求 | "Request our security & privacy pack" 的请求数 | 跟踪 |
| **未审查文案上线** | 线上页面中没有对应 marketing-copy-check 审查表的数量；每次发布核对 | **0** |
| **退订处理超时** | 退订请求到生效超过 5 个工作日的次数；从邮件工具日志核对 | **0** |
| **表单收到住户信息** | 提交中出现疑似住户姓名或健康信息的次数；人工处理时登记 | 跟踪；每次按 §6.4 处理 |
| 无障碍问题 | 每次发布前自动检查 + 每季度人工键盘 / 读屏抽查的未修复 AA 问题数 | 上线时 **0** 个阻断项 |
| 性能 | 每个页面模板用 Lighthouse（实验室模式，本地或云端工具，不在访客端埋点）测 Core Web Vitals 档位 | 全部 "Good" 档（阈值以 web.dev 官方定义为准 ⚠️ 需核实） |

## 3. 用户故事
| 角色 | 用户故事 |
|---|---|
| Business owner（多院集团） | 作为一家 3 家院集团的 MD，我想在一页里看到试点要投入什么、多院怎么管、员工能不能看到住户数据，**以便决定要不要让 DON 安排试点**。 |
| DON | 作为 DON，我想看到一次跌倒口述怎样变成记录、谁确认、哪些地方 AI 不能写，**以便判断临床风险**。 |
| IT / 隐私负责人 | 作为隐私负责人，我想看到数据存储地区、子处理方清单、是否训练模型和尚未完成的事项，**以便开始尽调而不用先约会议**。 |
| 护士 | 作为 RN，我想知道我是不是记录的作者、录音会不会被用来考核我，**以便放心参加试点**。 |
| 访客 | 作为访客，我想不留姓名就进入 Demo 点开示例班次。 |
| 访客 | 作为访客，我想申请试点时清楚知道我的信息会被怎么用，并且可以不订阅营销邮件。 |
| Lightman | 作为审批人，我想每次改文案都有审查表，**以便确认没有误导性陈述**。 |

## 4. 方案

### 4.1 受众分层：要回答的问题 → 页面
| 受众 | 他们要回答的问题 | 主页面 | 次页面 |
|---|---|---|---|
| 买单方 | 买了得到什么？风险谁担？试点投入多少人和时间？多院怎么管？价格怎么谈？ | For owners & multi-site groups | How it works · Pilot program · Pricing · Trust & safety |
| 临床决策者 | 护士是不是作者？敏感事件谁把关？AI 会不会编内容？记录能不能追溯到原话？ | How it works | Trust & safety · Demo |
| IT / 隐私 | 数据在哪？谁能访问？子处理方？训练？泄露怎么办？还有哪些没做完？ | Trust & safety | Privacy policy · Contact（请求资料包） |
| 一线护士 | 我还要做什么？出错算谁？录音会不会监控我？会不会更麻烦？ | For nurses | How it works · Demo |

### 4.2 站点地图
```
careKind AI website (static HTML)
|
+-- /                         Home
|     +-- Result preview: one fall, several drafts (Fictional example)
|     +-- [Try the demo] ------------------------> Demo environment (external link)
|     +-- [Book a pilot] ------------------------> /contact/
|
+-- /how-it-works/            How it works
|     +-- 1 Speak  -> 2 Draft  -> 3 Review & approve  -> 4 Export
|     +-- Wattle Grove (fictional) walkthrough, status labels per document
|
+-- /for-owners/              For owners & multi-site groups
+-- /for-nurses/              For nurses
+-- /trust/                   Trust & safety
|     +-- #nurse-is-the-author
|     +-- #what-careKind-doesnt-do   (intended purpose, TGA boundary)
|     +-- #privacy-and-data          (Australia, no training, access)
|     +-- #sub-processors            (live table, "To be confirmed" rows)
|     +-- #status                    (Available now / Pilot scope / Planned)
|
+-- /demo/                    Demo  (what you'll see + [Start the demo] -> external)
+-- /pilot/                   Pilot program (steps + paperwork overview)
+-- /pricing/                 Pricing  ("Talk to us", no prices)
+-- /about/                   About
+-- /contact/                 Contact / Book a pilot (form)
|     +-- /contact/thanks/
|
+-- /privacy/                 Privacy policy
+-- /terms/                   Website terms of use
+-- /accessibility/           Accessibility statement
+-- /404.html
|
+-- Footer (every page): intended purpose statement, links to Trust,
    Privacy, Terms, Accessibility, ABN {{TBD}}, contact
```
- 全站导航（桌面）：How it works · For owners · For nurses · Trust & safety · Pilot · 右侧次按钮 "Try the demo" + 主按钮 "Book a pilot"（DESIGN.md §6.8：每区域一个主按钮）。手机：折叠菜单，两个按钮保留在菜单顶部。
- 不做：博客（内容支柱见 `marketing-plan.md`，另立 PRD）、登录入口（第一阶段 App 有独立域名，ADR-0003；网站页脚放 "Sign in" 文字链接即可，等 App 上线后再加）、客户案例页（n = 0）。

### 4.3 状态标注（全站统一，每个能力描述都要带）
| 标注 | 什么时候用 | 界面文字 |
|---|---|---|
| `Available now` | 已在正式环境上线、经过验证。**网站首次上线时预计没有任何一项符合**，不要提前用 | "Available now" |
| `Pilot scope` | 主 PRD §8 MVP 范围内、ADR-0003 确认的第一阶段能力，在开发中、计划随首个试点交付 | "Pilot scope — in development" |
| `Planned` | Phase 2 及以后（incident 草稿、跌倒后记录、ABC、food & fluid、家属沟通、两级 PCW → RN 审核、多语言口述、CMS 集成、ISO 27001 等） | "Planned" |
| `Fictional example` | 所有截图、示例、人物和机构 | "Fictional example — Wattle Grove Residential Care and everyone in it are made up" |
- 依据：`rules/01-operations-rules.md` §2"路线图上的事要明确标注'计划中'"；Owner 规则第 7 条。**每次产品发布后**按主 PRD §8 和 registry 同步更新标注（§10）。
- ⚠️ 注意 ADR-0003：第一阶段只做"按住说话"，**不做整班录音**。网站不能描述 Shift Capture（整班口述）为 Pilot scope；如提到只能标 `Planned`，并且不放在首页。

### 4.4 每页规格与文案草稿
> 文案为草稿，**上线前必须逐页跑 `marketing-copy-check` + `tga-boundary-check`**（§4.7）。我已按两个 skill 的步骤做了初查，结果见 §5 和 §4.7.2。

#### P1 Home `/`
- **目的**：10 秒内说清 careKind 是什么、谁在控制、能看到什么成果；把人送到 Demo 或 Book a pilot。
- **内容块**：Hero（衬线 display 标题 + 两个 CTA）→ 成果预览（Edna 跌倒示例，§11）→ 三点价值（说一次 / 你来确认 / 数据在澳洲的承诺）→ "What careKind doesn't do"摘要 → 面向四类读者的入口卡 → 试点邀请 → 页脚。
- **主 CTA**：Book a pilot；次 CTA：Try the demo（就在成果预览下方）。
- **文案草稿**：
  - H1: "Documentation help built for Australian residential aged care."
  - Sub: "Your team describes what happened in their own words. careKind AI drafts the record. You review and approve every note before it's saved."
  - CTA: "Try the demo" · "Book a pilot"
  - Preview caption: "Fictional example. One spoken account of a fall, drafted as a progress note and a handover point. Other documents shown are Planned."
  - Value 1 "Say it once": "One spoken account can be drafted into the notes your facility needs, so the same facts aren't typed twice." + 标注 "Progress note and handover: Pilot scope. Other documents: Planned."
  - Value 2 "You stay the author": "careKind only organises what staff said. Anything the AI reworded is highlighted, and nothing is saved until a staff member approves it."
  - Value 3 "Built to keep data in Australia": "Our commitment: customer data, including AI processing, is stored and processed in Australia and never used to train AI models. See exactly where we are up to on our Trust & safety page."
  - Pilot band: "We're looking for Victorian residential aged care providers to help shape careKind in an 8–12 week pilot." CTA "Book a pilot"
- **不放**：客户 logo、"trusted by"、效率数字、"AI-powered" 大标题、评分或仪表盘截图。

#### P2 How it works `/how-it-works/`
- **目的**：用 Wattle Grove（虚构）示例把一次口述 → 多份文书 → 确认 → 导出讲清楚；临床决策者的主页面。
- **内容块**：四步条（`ck-segmented--bar` 或步骤列表）→ 每步一个示例面板（来自 Demo 数据集的静态渲染，标 `Fictional example`）→ "Who approves what" → "What the AI will never write for you" → CTA。
- **四步与文案**：
  1. "Speak" — "Press and hold to describe what happened, the way you'd tell a colleague." 示例：Priya（PCW，fictional）15:35 的口述原文。标 `Pilot scope`。
  2. "Draft" — "careKind drafts a progress note and a handover point from what was said. Times, names and numbers are copied exactly as spoken. If something wasn't said, the draft shows 'Please complete' instead of guessing." 示例：Edna 的 progress note 草稿，AI 改写处高亮（样式按 DESIGN.md §7.4 / DS-4）。另列 incident report、post-fall record、family communication、SIRS assessment prompt，均标 `Planned`。
  3. "Review & approve" — "You see the draft next to the original words. Edit anything, then approve. Nothing reaches the record until you do." 示例：Daniel Reyes RN（fictional）补充自己的评估并确认。两级审核（PCW 提交 → RN 逐条确认敏感事件）标 `Planned`。
  4. "Export" — "Copy approved notes into your clinical system, or download a PDF." 标 `Pilot scope`；CMS 集成标 `Planned`。
  - "What the AI will never write for you": "careKind doesn't add diagnoses, treatment advice, medication decisions or risk ratings. It doesn't decide whether an incident is reportable — your facility's process does."
- **主 CTA**：Try the demo（"Open the Wattle Grove example shift"）。

#### P3 For owners & multi-site groups `/for-owners/`
- **目的**：回答买单方的五个问题；突出多院、风险控制、试点投入。
- **内容块**：Why providers look at documentation tools（只陈述公开、有来源的行业事实，如 7 年记录保存义务、SIRS 时限——引用法规原文，不渲染恐慌）→ What you get in a pilot → Running careKind across several homes（`Pilot scope` / `Planned` 分开标）→ Your risks, and how we handle them → Pricing "Talk to us" → CTA。
- **文案草稿**：
  - H1: "For owners and multi-site groups."
  - "careKind is a documentation assistant for residential aged care. Your staff remain the authors of every record, and your existing clinical system stays your system of record."
  - Multi-site: "Set up each home, its units and its staff list from one organisation account. Facility managers manage their own teams." → 标注按 Provider Portal PRD 实际排期（⚠️ 该 PRD 尚为 Draft；上线前与 Lin 确认哪些属于 Pilot scope）。
  - "Your staff's work, not their performance": "Dictation isn't used to check or rate staff performance." （护栏 G10）
  - "careKind staff can't see your residents' information by default. Support access needs your approval, is time-limited and logged." → 标 `Pilot scope`（Super Admin PRD 设计；上线前确认已实现才可改为 `Available now`）。
- **禁止**：ROI 计算器、"saves X hours"、"reduce agency costs"、"helps meet care minutes"、"audit-ready / pass your audit"。
- **主 CTA**：Book a pilot。

#### P4 For nurses `/for-nurses/`
- **目的**：建立护士信任；回答"出错算谁""会不会监控我""会不会更麻烦"。
- **内容块**：You're the author → What careKind won't do → Recording and your privacy → What training looks like（30 分钟 + 速查卡，`pilot-playbook.md`）→ If careKind gets something wrong → 多语言（`Planned`）→ CTA。
- **文案草稿**：
  - H1: "You're the author. careKind helps you write it up."
  - "careKind turns what you say into a draft in clear, person-centred English. You check it against your own words, change what you need, and approve it. Your name is on the note because you approved it."
  - "If the draft gets something wrong, fix it before you approve, and use 'Report a problem' so we can look into it."
  - "Recording: only you, only when you press and hold. Recordings aren't used to check your performance." （ADR-0003；G8、G10；"录音短期保留"的具体天数 `{{TBD}}`，确定前不写天数）
  - "If careKind isn't working, keep documenting the way your facility already does."
  - Multilingual: "Dictating in languages other than English is Planned."
- **主 CTA**：Try the demo（"See a review as Daniel, RN (fictional)"）；次 CTA："Share this page with your manager"（只是复制链接，不收集邮箱）。

#### P5 Trust & safety `/trust/`
- **目的**：尽调起点；**只写已经做到的，承诺与计划分开**。这是差异化页面（竞品不透明，§1.2）。
- **内容块**（锚点见站点地图）：
  1. **Nurse is the author**：G1、G5、G7 的对外表述。
  2. **What careKind doesn't do / intended purpose**：完整引用预期用途声明（`tga-samd-boundary.md`）：
     > "careKind AI is a documentation assistant that helps aged care staff draft records from their own spoken or written notes. All drafts are reviewed and approved by the staff member before being saved. careKind AI does not diagnose, recommend treatment, or make clinical decisions."
     + "We review every release against this statement." （有流程依据：TGA 页面要求开发者持续评估；`tga-samd-boundary.md` 流程）。**不写** "TGA approved"、"TGA compliant"、"not a medical device"（TGA 指出自我声明不足以定性，§1.2；后一句改用预期用途声明表达）。
  3. **Privacy & data**：三列表 "Commitment / Status / Evidence"：
     | Commitment（对外文案） | 状态 | 依据 |
     |---|---|---|
     | "Customer data, including AI processing, will be stored and processed in Australia." | `Pilot scope`；"Our hosting provider and region will be listed below before our first pilot starts." | 护栏 G9；`privacy-program.md` §4；登记表云平台 `{{TBD}}` |
     | "We don't use customer data to train AI models." | Commitment，将写入 DPA（`dpa-outline.md`）；DPA 签署前标 "Will be in our contract" | `rules/01-operations-rules.md` §2 不可让步条款 |
     | "Your organisation owns its data. At the end of a contract we return or delete it." | 同上 | DPA 大纲第 12 条（Super Admin PRD 引用） |
     | "careKind staff can't see your residents' information by default." | `Pilot scope` | Super Admin PRD；`rules/01` §4 |
     | "We'll tell you about a data breach that affects your data." | Commitment；时限 `{{TBD}}`，确定前不写小时数 | `data-breach-response-plan.md`；`sales-process.md` |
     | Security certifications | `Planned`："We're working towards the ASD Essential Eight and ISO 27001. We hold no certifications yet." | `sales-process.md`（当前已完成 `{{}}`） |
  4. **Sub-processors**：从 `04-security/vendor-subprocessor-register.md` 生成的公开表格（供应商、用途、数据类别、地区、状态）；未选型的行显示 "To be confirmed"。**网站自己的工具**（托管、表单、邮件、分析）单列一节 "Tools this website uses"。
  5. **Status**：本页所有项的 `Available now / Pilot scope / Planned` 汇总 + "Last reviewed: DD/MM/YYYY"。
  6. "Request our security & privacy pack" → `/contact/?topic=security`（资料包内容以 `04-security/` 为准，只写已做到的）。
- **主 CTA**：Request our security & privacy pack。

#### P6 Demo `/demo/`
- **目的**：Demo 的落地页；说明进去会看到什么、Demo 的边界，然后外链到 Demo 环境（§4.10）。
- **文案草稿**：
  - H1: "Try a fictional shift at Wattle Grove."
  - "No sign-up, no personal details. You'll see one PM shift at Wattle Grove Residential Care — a made-up facility with made-up residents and staff. Review Priya's drafts as Daniel Reyes RN, approve a note, read the handover, then reset and start again."
  - "What's real and what isn't: drafts in the demo are pre-generated examples. Your edits stay in your demo session and are deleted within 24 hours. Nothing is sent anywhere."
  - "Please don't type real resident or staff information into the demo."
  - CTA: "Start the demo"（外链，新标签页打开时须有可见提示 "opens the demo site"）。
- 角色、标注、会话时长等以 Demo PRD §4 为准；本页文字与 Demo 横幅文字保持一致。

#### P7 Pilot program `/pilot/`
- **目的**：让买单方和 DON 知道试点怎么走、双方要准备什么。
- **内容块**：Pilot at a glance（8–12 周、1–2 个 home、progress notes + 可选 handover，`pilot-playbook.md`）→ Timeline（-2 周到第 12 周）→ Paperwork we'll prepare together → What success looks like（"agreed in writing with you before we start"，不写任何目标数字）→ Fees "Talk to us"（试点费用 `{{TBD}}`）→ CTA。
- **Paperwork 简述**（依据 `paperwork-requirements-by-event.md` §18）：
  - "Pilot Agreement and Data Processing Agreement" · "Written success measures, agreed before we start" · "Our insurance certificates" · "A privacy impact summary" · "Staff and resident information notices — we provide templates; your facility informs residents and families and handles any consents" · "A baseline measurement of current documentation time and quality" · "Our on-site staff hold current police checks and meet your site requirements"。
  - 每项标 "We provide" / "You provide" / "Together"。⚠️ 当前 Pilot Agreement、DPA、员工告知模板尚未起草（§18 #1、#3、#6）——页面只描述流程，不写"已备好"。
- **文案**："Your facility's existing incident and SIRS processes don't change. careKind doesn't decide whether an incident is reportable and doesn't report on your behalf." （G6）
- **主 CTA**：Book a pilot。

#### P8 Pricing `/pricing/`
- 不放价格（计价单位未定：主 PRD §12 假设按床位，竞品研究提示按录音小时也可能，§12）。
- 文案："Pricing depends on the number of homes and how you'd like to use careKind. Talk to us and we'll put together a proposal for your organisation." CTA "Talk to us"。
- 不写 "from $X"、"free trial"、"cheaper than …"。

#### P9 About `/about/`
- 团队（Lightman、Lin、Gary、Windston；只放本人同意公开的姓名、职位、照片）、Melbourne, VIC、为什么做（不讲住户真实故事）、价值观（`rules/00-company-rules.md` §2 的对外版本）。
- 不写"aged care experts"之类无法证实的资历；临床顾问到位且同意后才写。

#### P10 Contact / Book a pilot `/contact/`
- 表单规格见 §4.8。页面同时提供邮箱 `{{TBD: hello@ 域名}}`；允许只写名字不写全名（APP 2，`privacy-program.md` §3）。
- 提交后 `/contact/thanks/`："Thanks — we'll reply within {{TBD}} business days." （回复时限确定前不写数字）

#### P11 Privacy policy `/privacy/`
- 基于 `09-templates/privacy-policy-draft.md`，**律师审核前不发布**（模板首行即如此要求）。网站相关补充：表单、邮件工具、分析方式、托管日志、Demo 会话数据（Demo PRD §6）、网站工具的境外披露（APP 8）。

#### P12 Terms `/terms/`
- 网站使用条款（不是产品 MSA）：内容仅供一般信息、Demo 为虚构数据、链接、知识产权、准据法 VIC。⚠️ 需律师起草。

#### P13 Accessibility statement `/accessibility/`
- "We aim to meet WCAG 2.2 Level AA." + 最近一次检查日期和方法 + 已知问题 + 反馈渠道。**完成第三方或完整内部审查前不写 "fully conforms"**。

### 4.5 截图与示例
- 只用 Demo 数据集（Demo PRD §4.4）的静态渲染；每张图或示例块在图上方或下方都有可见的 "Fictional example" 标签，图片 `alt` 也写明 "Fictional example: …"。
- 示例界面必须是正式组件渲染的真实输出结构，不能做只在网站成立的"美化版"（Owner 规则第 9 条）。截图与 Demo 数据集版本绑定（`manifest.json` 版本号记在 §4.6 登记表里）。
- 照片：只用有肖像授权的照片或自有插画（`06-app-development/design/design-system/decoration-*.png`）；不使用老人刻板形象（`marketing-compliance.md`"照片"）。

### 4.6 对外声明登记表（Claims register）
- 网站上每一条关于能力、安全、隐私的陈述登记一行：`页面 | 原文 | 状态标注 | 证据文件 | 核实人 | 核实日期`。
- 位置建议：`07-marketing-ops/marketing/website-claims-register.md`（**本 PRD 不创建**，由 assignee 建立）。
- 规则：没有证据的陈述不能上线；状态从 `Pilot scope` 改为 `Available now` 需要 Lin 确认功能已在正式环境上线。

### 4.7 内容发布流程
#### 4.7.1 流程
```
文案 / 页面改动
   |
   v
[1] marketing-copy-check（含 tga-boundary-check）--> 审查表
   |                         有 block 项?
   |----- 是 --> [2] 修改 --> 回到 [1]
   v 否
[3] 证据核对：claims register 每行有证据（Trust 页由 Lin 核对技术事实）
   |
   v
[4] 特殊审批（按需）
     - 临床示例 / "AI 不做什么"表述 --> 临床顾问
     - Privacy policy / Terms / 首次上线 / ACL 敏感表述 --> 律师
   |
   v
[5] 🧑 Lightman 批准发布（11-workflows/marketing-content-publish.md 第 4 步）
   |
   v
[6] 发布（按公司部署规则：只在 Lightman 明确要求部署时触发）--> 线上回读核对
```
- 每次上线或改文案（包括标注从 Pilot scope 改 Available now）都走 `11-workflows/marketing-content-publish.md`；审查表存档位置由 assignee 定（建议随 claims register）。
- 邮件渠道（试点回复模板、newsletter）额外确认 Spam Act 三项（同意、发件人身份、退订）。

#### 4.7.2 本 PRD 文案草稿的初查结果（marketing-copy-check 步骤）
| issue | quote | rule | severity | 处理 |
|---|---|---|---|---|
| 品牌定位句含未证实表述 | brand-guide："accurate, respectful records **in seconds**" | ACL；`marketing-compliance.md` 数字与绝对表述 | block（若照搬） | 网站不用这句；建议 Lightman 修订 brand-guide 定位句 |
| 时间节省暗示 | brand-guide 信息层级 1 "Time back to care" | 没有基线数据（主 PRD §11 北极星 `{{TBD}}`） | fix | 首页不用作标题；试点有测量结果后再用，并附测量方法 |
| 审计相关 | 主 PRD §4 "经得起 ACQSC 审计的 AI 记录" | "Guarantees audit success" 属禁用 | block（若对外） | 改为 "Every sentence links back to what was said" |
| 多文书 | "Say it once" | MVP 只有 progress note + handover | fix | 已在文案中加 `Pilot scope` / `Planned` 标注 |
| 数据在澳洲 | "data stays in Australia" | 云平台未选型（vendor register `{{TBD}}`） | fix | 已改为 "Our commitment … will be" + 状态 |
| 两级审核 | "sensitive events go to an RN" | Phase 2（主 PRD §8） | fix | 已标 `Planned` |
| 整班录音 | Shift Capture | ADR-0003 第一阶段不做 | block（若作为现有能力） | 不上首页；如提到标 `Planned` |
- 所有草稿已检查：使用 "residents"、"older people"；未使用 detect、predict、risk score、monitor condition、clinical insights、"saves X hours"、"guaranteed compliance"、"100% accurate"、"fully automated"、"helps meet care minutes"；未出现客户、试点结果或推荐语。

### 4.8 表单与数据
#### 4.8.1 Book a pilot / Contact 表单字段（最少）
| 字段 | 必填 | 说明 |
|---|---|---|
| Name | 是 | 可以只写名字（APP 2） |
| Work email | 是 | 用于回复 |
| Organisation | 是 | 机构名 |
| Your role | 是 | 选项：Owner / Executive · Director of Nursing / Clinical lead · IT / Privacy / Risk · Nurse or care worker · Other |
| State or territory | 是 | 选项：VIC、NSW、QLD、SA、WA、TAS、ACT、NT |
| Number of homes | 否 | 选项：1 · 2–5 · 6–20 · More than 20 |
| What would you like to talk about? | 否 | 选项：Book a pilot · Security & privacy pack · Pricing · Something else |
| Message | 否 | 字段说明（字段上方，不只用 placeholder）："Please don't include any information about residents, such as names, room numbers or health details." |
| Marketing consent | 否，默认不勾选 | "Send me occasional emails about careKind news and pilot openings. You can unsubscribe at any time." |
| 机器人防护 | — | 首选蜜罐字段 + 提交频率限制；不用会把访客数据发给第三方的 CAPTCHA，除非经子处理方评估 |
- 不收集：电话（除非访客自愿写在 message 里）、职称以外的个人信息、住户或员工健康信息、文件上传。

#### 4.8.2 收集告知（APP 5，放在提交按钮上方，链接到完整隐私政策）
> "careKind AI {{Pty Ltd, ABN TBD}} collects these details to reply to your enquiry and, if you ask, to discuss a pilot. If you don't provide your name, email and organisation we can't reply. We store your details with {{form/CRM provider, location}} and don't sell them. Our [Privacy Policy](/privacy/) explains how to access or correct your information, how to complain, and which overseas service providers, if any, we use. Questions: {{privacy@ email}}."
- 覆盖 APP 5.2 的主要事项：身份和联系方式（5.2(a)）、收集目的（5.2(d)）、不提供的后果（5.2(e)）、披露对象类型（5.2(f)）、隐私政策中的访问 / 更正 / 投诉（5.2(g)(h)）、可能的境外披露（5.2(i)(j)）。具体措辞需律师确认。

#### 4.8.3 营销邮件（Spam Act 2003 / APP 7）
- **明示同意**：单独、默认不勾选的复选框；记录同意时间、页面、同意文字版本。回复咨询本身不是营销邮件；未勾选者不加入 newsletter 列表。
- **发件人身份**：每封营销邮件写明 careKind AI 实体名、ABN（取得后）和联系方式。
- **退订**：每封邮件有可用的退订链接；**5 个工作日内**生效（`rules/01-operations-rules.md` §1）；退订免费、不要求登录。
- 电话营销前查 Do Not Call Register（`marketing-compliance.md`）。

#### 4.8.4 表单数据存哪里
- 选项（由 Lin 写 ADR 决定，见 §4.11.2）：第三方表单服务 / 澳洲区域的轻量 serverless 端点写入 CRM 或邮箱。
- 不管哪种，**都要在 `04-security/vendor-subprocessor-register.md` 登记**（网站 / 营销工具一节；该文件对"子处理方"的定义是接触客户数据，网站工具接触的是商务联系人信息——是否放在同一表还是单列由 Lin 决定），并在隐私政策中披露；优先选数据存于澳洲的服务，境外时按 APP 8 披露国家。
- CRM `{{TBD}}`（`sales-process.md`）；保留期 `{{TBD}}`（建议：未成交线索 24 个月无联系后删除 → 需 Privacy Officer 确认），写入 `04-security/data-classification-and-retention.md`。

### 4.9 分析与 cookie
- **默认**：上线时不放任何第三方分析、广告像素、热图或会话录屏；不设非必要 cookie。
- 需要统计时，优先：托管平台自带的服务器端聚合统计，或可自托管 / 澳洲区域、不设 cookie、不保存完整 IP 的统计工具。启用前：
  1. 按 `vendor-subprocessor-register.md` 选型清单评估；
  2. 更新隐私政策（工具名称、收集什么、是否出境）；
  3. 在 Trust 页 "Tools this website uses" 列出。
- 指标只用页面级聚合计数（§2.2），不做个人级追踪；Demo 环境的统计按 Demo PRD §2.2 执行，两边不串联访客身份。
- 不嵌入会加载第三方脚本的视频、地图、社交插件；视频如需要，自托管或用 "click to load" 占位。

### 4.10 与 Demo、产品、销售的关系
```
Website (static)                      Demo environment (separate)          Sales
----------------                      ---------------------------          -----
Home / How it works --[Try the demo]--> guest demo session (Demo PRD)
/demo/ ---------------[Start the demo]->   banner: "Talk to us about a pilot"
                                               |
/contact/ <------------------------------------+  (?from=demo, no personal ID)
   |
   +--> form backend --> CRM / inbox --> sales-process.md stage 1-2 (lead -> discovery)
                                         -> stage 3 demo (same Wattle Grove story)
                                         -> stage 4 due diligence (Trust page + pack)
                                         -> stage 5 pilot agreement (pilot-playbook.md)
App sign-in (later) -- footer text link --> App domain (ADR-0003)
```
- "Try the demo" 只是链接，网站不创建 Demo 会话、不传任何访客信息。
- Demo 用的文字与网站一致：同一套 Wattle Grove 故事、同一套状态标注。
- Book a pilot 提交后进入 `sales-process.md` 阶段 1–2；演示（阶段 3）用同一个 Demo。

### 4.11 技术约束（Owner 决定 18/10/2026：纯 HTML）
#### 4.11.1 决定
- 营销网站用**纯静态 HTML + CSS**；**不用 Next.js** 或其他 SSR / SPA / UI 框架。
- **脚本统一用 TypeScript**（Owner 决定 18/10/2026：全项目统一 TypeScript）：页面上需要的少量脚本（菜单开合、表单校验与提交、外链提示）用 TypeScript 编写，用 `tsc` 编译成原生 JavaScript 后随静态文件发布；浏览器只加载编译产物，不加载 TS 运行时、框架或第三方脚本。编译与 §4.11.3 的页头页脚拼接放在同一个简单构建步骤里；`tsconfig` 目标版本、是否开 `strict` 由 Lin 在技术 ADR 中定（建议 `strict`）。无 JS 时页面与表单仍须可用（§9）。
- 原因与影响：

| 方面 | 影响 |
|---|---|
| 托管 | 只需静态托管（对象存储 + CDN，或静态站点托管服务）。托管商会产生访问日志（IP、User-Agent）→ 登记到 vendor register 的网站工具一节，隐私政策披露；优先澳洲区域或可以设置日志保留期的服务 |
| 表单 | 静态站没有服务端 → 表单需要**第三方表单服务**或**一个独立的小型后端端点**（§4.11.2）。两者都是处理访客个人信息的第三方 / 新系统，**必须登记并评估** |
| 共用页头页脚 | 13 个页面共用导航、页脚（含预期用途声明）→ 需要维护方案（§4.11.3），否则容易出现某页文案或标注没更新 |
| 设计系统 | 以 CSS 变量引入：直接引用 `06-app-development/design/design-system/` 生成的 `tokens.css`，以及 `editorial.css`、`components.css` 中的品牌层类（`ck-hero`、`ck-section`、`ck-brand-footer`、`ck-btn--editorial` 等）。**不写死颜色、字号、间距**；token 只改 `tokens.json` 再生成（DESIGN.md §0）。网站使用固定版本的拷贝，并记录对应的设计系统提交 |
| 字体 | 沿用 DESIGN.md §4：系统衬线 / 无衬线字族，不请求外部字体 → 无第三方请求，更快也更私密 |
| SEO 与性能 | 优势：每页都是完整 HTML，搜索引擎直接读取；无框架运行时，首屏快；JS 可以几乎为零。需要手动维护每页 `<title>`、meta description、canonical、Open Graph、`sitemap.xml`、`robots.txt` |
| 动态内容 | 无服务端渲染 → **Demo 入口是外链**到 Demo 环境（Demo PRD §12 Q2：域名待 Lightman 决定）；子处理方表格等"活"内容随发布更新，页面写 "Last reviewed" 日期 |
| 安全 | 攻击面小；仍需 HTTPS、HSTS、Content-Security-Policy（禁止第三方脚本，与 §4.9 一致）、表单端点限流 |

#### 4.11.2 表单处理方案选项（由 Lin 写 ADR 选择）
| 选项 | 优点 | 缺点 / 要核实 |
|---|---|---|
| A 第三方表单服务（托管表单后端，把提交发到邮箱或 CRM） | 最快；不用自己运维 | 数据存储地区多在境外 ⚠️ 需逐家核实；成为子处理方；可能带自家脚本或 cookie |
| B 澳洲区域的轻量 serverless 端点（接收提交 → 写 CRM / 发内部邮件） | 数据可留在澳洲；无第三方脚本；完全控制字段和保留期 | 要写和维护少量后端；需要限流、垃圾过滤、日志脱敏 |
| C CRM 自带的嵌入表单 | 直接进 CRM | 通常要加载 CRM 的第三方脚本和 cookie，与 §4.9 冲突 ⚠️ |
| ✗ `mailto:` 链接 | 无需后端 | 不能记录营销同意，也不能统一收集告知 → **不采用**（页面上可保留邮箱作为备选联系方式） |

#### 4.11.3 共用页头页脚的维护方案选项
| 选项 | 说明 | 评价 |
|---|---|---|
| 1 手动同步 + 检查 | 每页手写同一份页头页脚；发布前用脚本比对各页的页头页脚片段是否一致 | 零构建；页面一多容易漏改 |
| 2 简单构建步骤（推荐方向） | 源文件用"片段 + 页面"组织，发布前用一个很小的拼接步骤生成最终 HTML，同一步骤运行 `tsc` 编译页面脚本；输出仍是纯静态文件 | 改一处全站生效；反正 TypeScript 已需要构建，合并成一步成本最低；构建在发布流水线中按公司部署规则执行 |
| 3 托管商的服务端包含（SSI / edge include） | 由托管平台在返回时拼接 | 绑定托管商能力 |
| ✗ 用 JS 在浏览器里注入页头页脚 | — | 不采用：无 JS 时导航和预期用途声明消失，影响 SEO 和无障碍 |
- 无论哪种方案，预期用途声明、状态标注、"Fictional example" 标签都应来自同一个来源，避免各页不一致。

#### 4.11.4 不在本 PRD 决定
托管商、表单方案、构建方式、域名（`carekind.com.au` 需 ABN，`company-setup-checklist.md` §3）→ 技术 ADR（Lin）+ 域名决定（Lightman）。

### 4.12 范围
| ✅ 本 PRD | ❌ 不做 |
|---|---|
| §4.2 的 13 个页面 + 404 + 感谢页 | 博客 / 内容营销（另立 PRD） |
| 联系 / 试点表单、收集告知、营销同意 | 在网站上收集任何住户或员工健康信息 |
| 状态标注、claims register、发布流程 | 客户案例、推荐语、logo 墙（n = 0） |
| 静态成果预览 + Demo 外链 | 在网站内嵌可操作 Demo（Demo 在独立环境） |
| 英文（纯英文，Lightman 18/10/2026 决定） | 其他语言版本（不做） |
| | 价格表、ROI 计算器、竞品对比表 |

## 4.5 法律依据（本地参考文件）✅
> 按 `legal-reference-check` 步骤手动执行（18/10/2026）。已打开下列文件。运营参考，不是法律意见。

| 主题 | 本地文件 | 条款 / 页码 | 对本功能的约束 |
|---|---|---|---|
| TGA 预期用途 | `03-legal-compliance/tga-samd-boundary.md`；`03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | 预期用途声明、红绿灯表、流程第 3 条；TGA 页面 30/01/2026（"analyses or interprets … not explicitly stated … is considered a medical device"；"Developers must regularly assess…"） | 网站是预期用途证据：不写诊断、预测、风险、监测类表述；全站页脚放预期用途声明；每次发布前复核 |
| 营销合规 | `07-marketing-ops/marketing/marketing-compliance.md`；`rules/01-operations-rules.md` §1；`07-marketing-ops/brand/brand-guide.md` | 发布前检查清单全部项；§1 禁止表述；语气表 | 无证据的数字不用；不说"保证合规""全自动""100% 准确"；只用合成数据；推荐语需书面同意（当前没有，不放） |
| Care minutes | `03-legal-compliance/references/paperwork-templates/health-care-minutes-information-for-workers.pdf` | 第 1 页 "Direct care activities … writing up care plans … counts as direct care" | 不声称"帮助达到 care minutes 目标"、不暗示"把文书时间变成照护时间可以计入 care minutes" |
| 收集告知 | `03-legal-compliance/references/law-library/oaic-app-guidelines-consolidated-2026-05.pdf` | Chapter 5，第 5.1–5.9 段（APP 5.2(a)–(j) 事项） | 表单旁放收集告知（§4.8.2）；按"合理步骤"列出身份、目的、后果、披露对象、境外披露、隐私政策 |
| 直接营销 | 同上 | Chapter 7，第 7.8 段（Spam Act 适用时 APP 7 让位）、第 7.19–7.20 段（简单的退订方式）、第 7.48 段 | 营销邮件以 Spam Act 为主；APP 7 仍适用于 Spam Act 未覆盖的部分；退订方式要简单、容易找到 |
| 隐私政策 | 同上 | Chapter 1，第 1.15 段（APP 1.4 必含事项） | 隐私政策须列出收集的信息种类、方式、目的、访问更正、投诉、境外披露；网站工具要写进去 |
| 隐私方案 | `03-legal-compliance/privacy-program.md`；`09-templates/privacy-policy-draft.md` | §1"网站访客"数据类别、§3 APP 2（允许化名）、APP 7（住户数据绝不用于营销）、§7 待办；草稿首行"律师审核前不发布" | 隐私政策律师审核前不上线 = 网站上线门槛；Privacy Officer 联系方式须公布 |
| 子处理方 / 工具 | `04-security/vendor-subprocessor-register.md` | 选型检查清单 | 表单、托管、邮件、分析工具上线前评估并登记；Trust 页的子处理方表格以登记表为准 |
| 只写已做到的 | `07-marketing-ops/sales/sales-process.md`；`rules/01-operations-rules.md` §2 | 尽调预备答案；"路线图上的事明确标注计划中" | 认证写 "We hold no certifications yet"；Trust 页三态标注 |
| 试点 paperwork | `03-legal-compliance/references/paperwork-requirements-by-event.md`；`07-marketing-ops/customer-success/pilot-playbook.md` | §18 #1–#19；试点设计与时间线 | Pilot 页只描述流程；未起草的文件不写"已准备好"；SIRS 流程不变（G6） |
| 州隐私制度 | `03-legal-compliance/references/state-by-state-comparison.md` | §4.1（VIC HRA 2001 对 careKind 直接适用，无小企业豁免）、§4.3 数据驻留 | 若访客在 message 里写了住户健康信息，可能触发健康信息处理义务 → 表单提醒 + 收到后删除流程（§6.4）；"数据在澳洲"只作为承诺 + 状态表达 |
| 护士责任 | `03-legal-compliance/references/law-library/ahpra-ai-in-healthcare-summary.md`；`docs/PRD.md` §9 G1、G5、G6、G7、G10、G11 | — | 对护士的文案强调审核与确认是护士的专业责任；不说 AI 替护士负责；录音不用于绩效 |
| 设计与无障碍 | `06-app-development/design/DESIGN.md` §2、§4、§6.8、§9、§11 | — | 品牌层样式、token、对比度、焦点、200% 缩放 |

### 本地资料缺口
- ⚠️ **Australian Consumer Law / ACCC 误导性陈述指引**（含"关于未来事项的陈述须有合理依据"是否适用于 `Pilot scope` / Commitment 表述）：本地无资料，需律师确认 → **上线门槛**。
- ⚠️ **Spam Act 2003 原文 / ACMA 指引**：本地无原文（只在 APP 指引第 7.8、7.48 段被提及）；"5 个工作日"来自公司规则，需律师确认 → **启用营销邮件前的门槛**。
- ⚠️ **Do Not Call Register Act 2006**：本地无原文 → 电话营销前确认。
- ⚠️ **Cookie / 在线追踪**：本地无专门资料 → 采用 §4.9 的"默认不设"做法；如引入分析工具需律师确认披露方式。
- ⚠️ **Disability Discrimination Act 1992 与 WCAG 2.2 原文**：本地无资料（DESIGN.md §9 已列）→ 无障碍声明措辞需确认。
- ⚠️ **TGA 2026-10 scribe 审查**：只有媒体来源（S99、S100），本地无 TGA 原文 → 上线前复核 TGA 官网是否发布新的广告 / 预期用途指引。

### 可能过时的资料
- `marketing-compliance.md`、`brand-guide.md`、`sales-process.md`、`pilot-playbook.md`、`privacy-program.md`、`vendor-subprocessor-register.md` 最后复核 04/10/2026；上线前复核。
- APP 指引第 5、7 章版本为 2019 年（文件汇编日期 2026-05）。
- `tga-digital-scribes-summary.md` 抓取于 04/10/2026，之后 TGA 有审查动态 → 上线前重新抓取。

## 5. TGA boundary check ✅
```
Verdict: 🟢（网站不提供任何功能）；文案是预期用途证据 → 每次发布按本节复核
Reasons:
- 网站只描述文书辅助能力（转写、整理、person-centred 改写、交接复述、导出），都在红绿灯表 🟢 列。
- 🟡 项（SIRS 流程提示、缺失字段提示、覆盖情况）只能用流程语言描述，并标 Planned 或 Pilot scope：
  "shows which notes still need review" / "may need to be assessed under your facility's process"。
- 全站页脚放预期用途声明；Trust 页说明 careKind 不做什么。
- 不写 "not a medical device" / "TGA approved"：TGA 审查指出免责声明不足以定性（§1.2），
  改用预期用途声明 + 功能限制的事实描述。
Risky wording → safer alternative:
- "detects falls" / "spots deterioration"        → "helps you document a fall"
- "predicts risk" / "flags high-risk residents"  → "shows which notes need RN review"（Planned）
- "monitors residents' conditions"               → "keeps each resident's approved notes in one timeline"
- "clinical insights" / "AI-powered care"        → "documentation help"
- "tells you if it's reportable"                 → "reminds you to check your facility's SIRS process; doesn't decide"
- "never misses an incident" / "100% accurate"   → 删除
- "audit-ready" / "ensures compliance"           → "every sentence links back to what was said"
Required next step: 首次上线前由产品 Owner + 临床顾问对全站文案复核；任何提到 SIRS、
限制性措施、覆盖情况的文案改动都要重新跑本检查。
```
运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

## 6. 隐私影响 ✅

### 6.1 产品设计前的问题（`rules/03-product-design-rules.md` §2）
| 问题 | 回答 |
|---|---|
| 1 TGA | 见 §5 |
| 2 新数据 | 表单：姓名、工作邮箱、机构、角色、州、home 数量、话题、留言、营销同意记录。托管：访问日志（IP、User-Agent、时间、URL）。可选：聚合统计 |
| 3 系统替人做选择？ | 否（没有自动化决策；线索打分如有也是人工） |
| 4 确认步骤 | 营销同意必须主动勾选 |
| 5 最坏情况 | 访客在留言里写住户健康信息；表单服务境外存储未披露；营销邮件发给未同意的人；网站文案被理解为医疗器械用途 |
| 6 provider 义务 | 不涉及住户数据；Pilot 页说明 provider 负责告知住户和获得同意 |
| 7 州差异 | VIC HRA 若收到健康信息即适用（§4.5）→ 删除流程 |
| 8 退出 | 退订、要求删除联系信息（隐私政策联系方式），不需要登录 |

### 6.2 存储与保留
| 数据 | 存哪里 | 保留期 | 子处理方 / 工具 |
|---|---|---|---|
| 表单提交 | 表单方案 ADR 决定（优先澳洲） | `{{TBD}}`（建议 24 个月无联系后删除，需 Privacy Officer 确认） | 表单服务或 serverless 平台；CRM `{{TBD}}` |
| 营销同意记录 | 邮件工具 / CRM | 至少与订阅期相同 + 退订记录 | 邮件工具 `{{TBD}}` |
| 托管访问日志 | 托管商 | 尽量短（建议 ≤ 30 天，`{{TBD}}`） | 托管商 `{{TBD}}` |
| 聚合统计 | 托管商或统计工具 | 不含个人信息 | 如启用需登记 |

### 6.3 需要更新的文件（本 PRD 不改，由 assignee 发起）
- 隐私政策：网站工具、表单、营销邮件、Demo 会话、境外披露（APP 8）→ 律师审核。
- `04-security/vendor-subprocessor-register.md`：网站 / 营销工具一节。
- `04-security/data-classification-and-retention.md`：网站线索、访问日志的保留期。
- PIA：网站流程不处理健康信息，建议在 MVP PIA 中加一节说明表单的"不收集住户信息"控制。

### 6.4 收到住户信息时
1. 收到的人不转发、不复制到其他系统；2. 从表单后端、邮箱、CRM 删除该段内容（保留"已删除"记录，不含内容）；3. 回复访客说明已删除并提醒不要发送；4. 按 `incident-triage` 判断是否构成隐私事件（`rules/00-company-rules.md` §3：1 小时内通知 Lightman）。

## 7. 临床危害 ✅
网站不进入照护流程，但会塑造用户对产品能力的预期，可能导致过度依赖。新提出的危害（`Proposed`，不写入 hazard-log.md，由临床顾问决定）：

| ID（临时） | 危害 | 原因 | 潜在伤害 | 控制措施 |
|---|---|---|---|---|
| HAZ-P-WEB-01 | 机构以为 careKind 会处理 SIRS 判定或上报，放松自己的流程 | 文案过度承诺（"handles incidents"） | 漏报或迟报 reportable incident，影响住户安全 | Pilot 页和 How it works 明确 "doesn't decide … doesn't report"；SIRS 相关文案临床顾问审核；试点培训重复（`pilot-playbook.md`） |
| HAZ-P-WEB-02 | 护士以为 AI 草稿"已经准确"而草率确认（自动化偏差） | 文案暗示准确或自动（"accurate"、"automatic"） | 错误记录进入正式记录 | 禁用词；文案强调 "check it against your own words"；只描述已高亮、"Please complete" 等真实控制 |
| HAZ-P-WEB-03 | 读者把 `Planned` 能力当成现有能力（如两级审核、敏感事件逐条确认）并据此设计试点流程 | 标注不清或过期 | 敏感事件没有 RN 审核 | 三态标注强制；每次产品发布同步更新；claims register |

## 8. AI 评测
- 网站不运行 AI，不需要模型评测。
- 网站上展示的 Demo 示例内容沿用 Demo PRD 的临床顾问审核和数据集一致性校验；网站截图须与数据集版本一致（§4.5）。

## 9. 无障碍与多语言
- **WCAG 2.2 AA**（目标；原文本地无资料 ⚠️）：语义化 HTML（landmarks、标题层级）；跳到正文链接；所有交互元素可键盘操作并有 `focus-ring`；对比度只用 DESIGN.md §3 已检查的组合；状态标注 = 文字 + 颜色；表单标签常显、错误与字段关联并说明怎么改；`prefers-reduced-motion` 时去掉进入动效；支持 200% 缩放和 320px 宽不出现横向滚动；图片有 alt（装饰图空 alt）；外链新窗口有提示。
- **移动端优先**：先设计 360px 宽布局；点击区域 ≥ `size-target-min`；断点用 DESIGN.md §5 的 640 / 900 / 1200；Hero、成果预览手机单列，不裁掉标注。
- **性能**：无框架运行时；JS 只用于菜单开合和表单校验，无 JS 时页面和表单仍可用；图片给出尺寸、用现代格式和懒加载；不请求外部字体和第三方脚本。
- **SEO**（方向，不堆砌）："aged care documentation"、"progress notes aged care"、"residential aged care software Victoria"、"AI documentation assistant aged care"、"nursing documentation Australia"、"aged care handover notes"。每页一个主题，标题和描述写给人看；结构化数据只用 Organization / WebSite，不加 Review / Rating（没有评价）。不用 "AI scribe medical" 之类会引向医疗器械语境的词。
- **语言**：**纯英文**（澳式英语，DD/MM/YYYY，AUD）——Lightman 18/10/2026 决定，不做中文或其他语言版本。

## 10. 上线计划与回滚

### 10.1 上线门槛（全部满足才能公开）
1. 🧑 隐私政策经澳洲隐私律师审核（`privacy-policy-draft.md` 首行要求）；Privacy Officer 已指定并公布联系方式。
2. 🧑 ACL 误导性陈述：律师确认 `Pilot scope` / Commitment 表述方式（本地无资料）。
3. 🧑 Terms 由律师起草。
4. 公司实体信息可用：实体名、ABN（隐私政策、邮件发件人身份需要）；域名已注册（`company-setup-checklist.md` §2–§3）；商标查重完成。
5. 表单方案 ADR 完成，表单 / 托管 / 邮件工具已登记到 vendor register 并写进隐私政策。
6. 全站文案跑完 `marketing-copy-check` + `tga-boundary-check`，无 block 项；claims register 每行有证据。
7. 临床顾问审核 How it works、Pilot、For nurses 的临床表述（临床顾问人选待定）。
8. Demo 已可用，或 "Try the demo" 改为 "Demo coming soon"（不能是死链）。
9. 无障碍：自动检查 + 键盘 / 读屏人工抽查（桌面和手机），无阻断项；截图存档。
10. 营销邮件：启用前确认 Spam Act（同意记录、身份、退订 5 个工作日）。未满足时先不开 newsletter 勾选框。

### 10.2 分阶段
| 阶段 | 内容 |
|---|---|
| W1 内容 | claims register、文案定稿、审查表 |
| W2 技术 | 托管、表单、页头页脚方案 ADR；页面开发（静态 HTML，token 引入） |
| W3 审核 | 律师、临床顾问、无障碍检查 |
| 上线 | 🧑 Lightman 批准；按公司部署规则执行（只在明确要求部署时触发 CI/CD）；线上回读每页、表单测试提交（用明确标注的测试数据，测试后删除） |

### 10.3 回滚与纠错
- 静态站回滚 = 重新发布上一个版本。
- 发现误导性或越界文案：立即下线或改为安全措辞，在 claims register 记录；如已用于销售材料，同步更正。
- 表单故障：页面显示邮箱作为备选联系方式。

## 11. Demo 与示例数据
| 项目 | 内容 |
|---|---|
| 网站上的结果预览 | 首页 + How it works：Wattle Grove Residential Care（虚构）PM 班次中 **Mrs Edna Hall（虚构，88 岁）** 18/10/2026 15:10 浴室跌倒、右手腕擦伤（graze）、意识清醒、已通知 RN 和女儿 **Karen Hall（虚构）** 的完整链路：Priya（PCW，虚构）15:35 口述原文 → progress note 草稿（改写处高亮、未说的字段 "Please complete"）→ **Daniel Reyes RN（虚构）** 补充自己的评估并确认 → 交接要点。incident report、post-fall record、family communication、SIRS assessment prompt 以卡片显示，标 `Planned`。 |
| 次要示例 | For nurses：**Mr Tomasz Nowak（虚构，81 岁，痴呆，有 BSP）** 16:40 的行为记录草稿，只描述可观察的行为（person-centred），显示 "Please check the BSP and consent record" 流程提示（标 `Planned`）。For owners：**Grace Liu（Care Manager，虚构）** 看到的"哪些住户本班还没有记录"列表（覆盖情况，标 `Pilot scope`）——不显示评分或趋势。**Dr Amelia Brooks（GP，虚构）** 只作为 Daniel 记录中的"已通知 15:45"出现。 |
| Demo 入口 | 首页成果预览下方、How it works 底部、For nurses、/demo/ 页 → 外链到 Demo 环境（Demo PRD）；导航右上角 "Try the demo" |
| 数据性质 | 全部为 **预生成示例**（Pre-generated example），来自 Demo PRD §4.4 的版本化数据集；网站不运行任何模型，不生成内容 |
| 标注 | 每个示例块都有 "Fictional example"；Phase 2 内容标 "Planned"；Demo 页说明 "drafts in the demo are pre-generated examples" |
| 验收 | ① 从首页、How it works、For nurses 三个入口都能到达 Demo（桌面 + 手机，截图存档）；② 成果预览中时间、人名、伤情与 Demo 数据集一致（与 Demo PRD 一致性校验同一套数据）；③ 每张截图带 "Fictional example"；④ 所有 `Planned` 内容都不在"现在可用"的区块里；⑤ Demo 横幅 "Talk to us about a pilot" 能回到 `/contact/?from=demo`；⑥ 网站本身不保存任何 Demo 输入。仅页面 HTTP 200 不算验收 |
| 剩余缺口 | Demo 环境尚未建设（Demo PRD Draft）；在 Demo 可用前，网站只展示静态成果预览，入口显示 "Demo coming soon" |

## 12. 风险
| 风险 | 影响 | 应对 |
|---|---|---|
| **误导性陈述（ACL）**：把计划能力说成现有能力、无依据的效率或准确性表述 | 高（监管、信任） | 三态标注、claims register、marketing-copy-check、律师门槛 |
| **过度承诺**：例如"数据在澳洲"在选型前作为事实陈述；"SIRS 支持"被理解为代为判定 | 高 | Commitment + 状态表达；G6 明确表述；每次产品发布同步 |
| **暗示是医疗器械**：评分、预测、"clinical"类词；或自称"不是医疗器械"被视为不足的免责 | 高（TGA 正在审查 scribe） | §5 替代词表；预期用途声明；上线前复核 TGA 官网 |
| 网站工具把访客数据发到境外或第三方 | 中 | §4.9 默认不设；登记与隐私政策披露；CSP 禁止第三方脚本 |
| 访客提交住户信息 | 中 | 表单提醒 + §6.4 删除流程 |
| 静态站页头页脚不一致，某页缺预期用途声明或标注过期 | 中 | §4.11.3 单一来源方案 + 发布前检查 |
| 品牌文件里的旧定位句被照搬 | 中 | §4.7.2 已标 block；建议修订 brand-guide |
| Demo 未就绪导致死链 | 低 | "Demo coming soon" 兜底 |

## 13. 开放问题与需要 Lightman 决定的事
1. 🧑 域名（`carekind.com.au` / `.ai` / `.com`）以及 Demo、App 放在哪个子域名（与 Demo PRD §12 Q2 一起决定）。
2. ✅ 已决定：网站纯英文（Lightman，18/10/2026）。
3. 🧑 是否在上线时开放 newsletter 勾选框（需要 Spam Act 门槛先满足）。
4. 🧑 试点是否收费、页面上如何描述（目前写 "Talk to us"）。
5. 🧑 About 页公开哪些团队信息（需每人同意）。
6. 🧑 是否修订 brand-guide 定位句（含 "accurate"、"in seconds"）。
7. 表单方案、托管商、页头页脚构建方式 → Lin 写技术 ADR。
8. 咨询回复时限、数据泄露通知时限、录音保留天数 → 确定前页面不写数字。
9. 临床顾问人选（How it works / Pilot / For nurses 审核需要）。

## 14. 建议 registry 登记行
| PRD | 标题 | 阶段 | Assignee | Reviewer | 复杂度 | 风险 | Parent | Blocked | 更新 |
|---|---|---|---|---|---|---|---|---|---|
| 2026-10-18-marketing-website | 营销网站（静态 HTML） | idea | （留空，需 Lightman 确认） | — | **M** | **R2** | — | 隐私政策律师审核 · ACL 律师确认 · 实体 / ABN / 域名 · 等 Lightman · 18/10/2026 | 18/10/2026 |

- **复杂度 M（4/8）**：范围 2（13 个页面、表单、法律页面、内容流程，跨营销 / 法律 / 设计 / Demo 多个模块）+ 技术面 1（静态前端 + 表单需要后端或第三方服务）+ 不确定性 1（托管、表单方案需要 ADR）+ 依赖 0–1（Demo PRD、设计系统；不阻塞其他 PRD）→ 4。
- **风险 R2**：对客户可见的文案 + 新的个人信息流（访客联系信息）+ 第三方工具；不接触住户健康数据，不在临床记录路径上。若表单方案选了境外服务或引入第三方分析，仍为 R2，但需 Privacy Officer 评审。

## 15. 审批
| 角色 | 姓名 | 日期 |
|---|---|---|
| 产品 | | |
| Tech Lead | | |
| 临床顾问 | | |
| 法律意见（隐私政策、Terms、ACL） | | |

## 变更记录
| 日期 | 版本 | 变更 | 作者 |
|---|---|---|---|
| 18/10/2026 | v0.1 | 初稿；含 Owner 决定的纯 HTML 技术约束与 TypeScript（tsc 编译）脚本约束（§4.11） | Claude（待 Lightman 审阅） |
