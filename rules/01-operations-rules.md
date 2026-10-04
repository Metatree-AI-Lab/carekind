# 运营规范 (Operations Rules)

Owner: Lightman · Last reviewed: 04/10/2026 · 适用：运营、销售、客户成功、营销、财务、行政

## 1. 对外内容与营销
- **必须**：所有对外内容（官网、LinkedIn、deck、邮件、视频）发布前跑 `marketing-content-publish` workflow（`marketing-copy-check` skill）。
- **禁止**的表述：
  - 无法证实的数字（"节省 2 小时"）；必须先有测量方法和数据。
  - "保证合规"、"100% 准确"、"全自动"。
  - detect、predict、risk score、monitor condition、clinical insights 等会扩大 TGA 预期用途的词。
  - 声称"帮助达到 care minutes 目标"（政府把写 care plan 算作 direct care）。
- **必须**：演示、截图、视频只用**合成数据**，禁止出现真实住户或员工信息。
- **必须**：客户案例和推荐语要有书面同意；住户故事要有本人或代表同意。
- **必须**：营销邮件符合 Spam Act 2003：有同意、标明发件人身份、可以退订，退订请求 5 个工作日内处理。

## 2. 销售与合同
- 使用标准合同包（`03-legal-compliance/contracts-register.md`）；偏离标准条款时，必须由 Lightman 批准，必要时问律师。
- **不能让步的条款**：客户数据归客户、不用客户数据训练模型、数据在澳洲境内、护士对记录内容负临床责任、责任上限与保额匹配。
- 回答安全或隐私尽调问卷时只写**已经做到**的事，路线图上的事要明确标注"计划中"。
- 签约后 3 个工作日内在合同登记表里登记。

## 3. 试点与客户成功
- 每个试点都按 `07-marketing-ops/customer-success/pilot-playbook.md` 执行。**成功标准必须在试点开始前和客户书面约定**。
- 试点前必须完成：Pilot Agreement + DPA 签署、保险证书、员工告知和同意、住户和家属告知、基线测量。
- 进入 aged care 现场的人必须持有有效的 police check，满足机构的疫苗等要求，遵守现场政策。
- **禁止**在现场录音、录像或拍照，除非试点协议明确授权。

## 4. 客户支持
- 按 `07-marketing-ops/customer-success/support.md` 的 SLA 响应：P1 1 小时、P2 4 个工作小时、P3 1 个工作日。
- 查看客户数据**必须**有工单授权，并留下审计记录。
- 客户报告"AI 写错了" → 当作安全事件处理（`incident-triage` skill），不能只当普通 bug。

## 5. 用户反馈与研究
- 访谈和反馈**人工原话录入** `10-feedback/`；录入时删除住户姓名、房号、健康细节等可识别信息。
- 访谈录音需要事先获得同意，存放在指定的安全位置，不放进本仓库。
- 分析结果写到 `06-app-development/research/synthesis.md`，并引用原始文件。

## 6. 供应商与工具
- 新工具先判断会不会接触客户数据；如果会，必须先按 `04-security/vendor-subprocessor-register.md` 的选型清单评估，再更新子处理方清单并通知客户。
- 每季度审查一次订阅。

## 7. 财务
- 公私账户严格分开；每笔支出都要有发票或收据。
- 单笔超过 {{TBD：$2,000}} 的支出要提前获得 Lightman 批准。
- 研发相关的工作**每月**记录到 R&D 证据中（`08-finance/finance-ops.md`）。
- 合规日历（BAS、super、ASIC、R&D 注册）见 `02-operating-system/operating-cadence.md`。

## 8. 节奏
- 每周五跑 `weekly-operating-review`；每季度跑 `quarterly-compliance-review`。
- 事故走 `incident-response`，**不允许**私下处理后不记录。
