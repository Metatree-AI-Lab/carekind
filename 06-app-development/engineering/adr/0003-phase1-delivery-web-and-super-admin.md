# ADR-0003：第一阶段交付形态——护士端 Web App + 独立的 React Super Admin

- 状态：**Accepted**（产品范围，Lightman 18/10/2026 在对话中决定）· 技术细节待 Lin 复核
- 日期：18/10/2026
- Driver：Lightman · Approver：Lightman（范围）/ Lin（技术实现）· Contributors：Claude（起草）· Informed：Gary、Windston

## 背景
- 主 PRD §10 和 Shift Capture PRD 把"原生 App vs PWA"列为待决策，理由是整班后台录音很可能需要原生 App。
- 18/10/2026 的调研建议 MVP 先做"按住说话、只录护士本人"，暂不做整班录音。原因是各州监控设备法（`03-legal-compliance/references/state-by-state-comparison.md` §3.10、§4.11）：NSW、WA、SA、TAS、ACT 一般要求对话全体参与方同意，录音上传给 vendor 是否算"传播"也还没有律师意见。
- careKind 要同时服务多家 provider 和多家养老院。上线、配置和支持都需要一个 careKind 内部工具，而不能靠手工改数据库。

## 选项
| 选项 | 优点 | 缺点 |
|---|---|---|
| A. 护士端原生 App（iOS / Android）+ 管理功能放在同一后台 | 后台长时间录音、设备端声纹过滤更可行 | 开发和发布成本高；要走应用商店审核；机构设备管理（MDM）更复杂；第一阶段用不上整班录音 |
| **B. 护士端 Web App（响应式，手机和电脑浏览器都能用）+ 独立的 React Super Admin App** | 一套代码覆盖手机、平板和护士站电脑；上线快，不用应用商店；适合"按住说话"；super admin 和护士端分开部署，权限边界清楚 | 浏览器后台录音和设备端声纹过滤受限；离线缓存只能用浏览器存储，安全性要专门设计；麦克风权限因浏览器而异 |
| C. 只做护士端，机构配置由 careKind 员工直接改数据 | 最省事 | 不可审计、容易出错、违反最小权限；没法同时支持多家机构 |

## 决定
采用 **B**：
1. **护士端第一阶段做 Web App，不做 mobile app。** 只支持"按住说话"，不做整班后台录音。离线时草稿不丢失，但要有加密本地缓存和过期策略，并经 Lin 做安全设计评审。
2. **Super Admin 是单独的 React JS App，第一阶段就交付。** 由 careKind 内部员工使用，管理多个 provider、多家养老院、单元、名单、用户角色和配置（分级规则、启用的文书模板、州规则包、保留期、功能开关等）。它有单独部署和单独域名（不做 MFA、不做 IP allowlist，见 ADR-0005）。
3. Super Admin **默认看不到任何住户健康信息**。查看客户数据必须有工单授权，并且限时、全程审计（`rules/01-operations-rules.md` §4）。
4. 详细规格写在 `docs/prds/2026-10-18-super-admin-multi-facility-console.md`（**尚未编写**）。

**不在本 ADR 内决定**：后端语言和框架、护士端用什么前端框架、数据库、多租户隔离方式。分别归技术 ADR-0001（技术栈）和 ADR-0002（多租户隔离），由 Lin 负责。本 ADR 只确定 super admin 用 React JS。

## 后果
**正面**
- 第一阶段可以更快进试点；Demo 也可以直接在浏览器里体验。
- 多机构配置有审计、可复用，州差异可以按 Facility 自动带出。

**负面 / 风险**
- 整班录音（主 PRD 突破 1）推迟到原生 App 或专用设备阶段，Shift Capture PRD 的"平台"一项要随之调整。
- 浏览器离线缓存健康信息有风险：共享电脑、清除缓存、设备丢失。需要过期删除、退出即清除，并禁止在共享电脑上离线缓存（待 Lin 设计）。
- 新增一个高权限内部应用，是攻击面，需要纳入安全评估（Essential Eight、最小权限、审计）。

**需要更新的文档**
- `docs/PRD.md` §5、§8、§10、§13（**尚未修改**，待 Lightman 确认后更新）
- `docs/prds/2026-10-04-shift-capture-and-resident-records.md` §10"平台"一行（由该 PRD 的 assignee Lin 更新）
- `06-app-development/engineering/architecture.md`（Lin）
- `04-security/`：super admin 的访问控制和 break-glass 流程
- 隐私政策和 DPA：说明 careKind 员工在什么情况下可以访问客户数据

## 复盘时间
第一个试点进行 4 周后，或者决定开始做整班录音时，以先到者为准。
