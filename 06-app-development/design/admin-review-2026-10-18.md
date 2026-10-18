# Super Admin 全后台视觉统一

Owner: Lightman · Status: Local revision · Last reviewed: 18/10/2026

## 请求与实现
用户要求登录后页面一起优化，统一整个后台。修改端口 5174 实际服务的 `au-state-regs-competitors` 工作树，保留已有未提交工作。范围为当前 Super Admin，不包含另一个 Provider Portal 的业务页面。

复用 DESIGN.md / COMPONENTS.md、tokens 和 shared 控件；白底、sans 工作标题、细分隔、统一间距。侧栏使用共享线性图标，账户名与职能分行，权限组移到侧栏底部。列表、详情、表单、审计和 404 共用同一 PageHeader，深层页面补 Breadcrumb。表单左说明右输入、手机单列，原有单 submit 和 schema 校验保留。详情重新组织 organisation 与 API 计数，不新增统计能力。Table 与 DataTable 手机按字段名逐条回流，保留 caption、排序和表格角色；审计长 ID 换行，日期及状态词保持完整。

共享 CSS 先改 meta repo `design/design-system/components.css`，再同步 `shared/src/styles/components.css`；只用既有 token。共享变更同样影响采用这些组件的 Provider Portal；该产品本次未运行验收。认证、API、角色权限、业务数据契约不变，无新依赖。

## 实际查看证据
- 本地登录虚构种子员工 Avery Collins (fictional)，进入正式 Super Admin 页面；不是新增 Demo 认证或权限绕过。
- 具体可打开内容：Wattle Grove Care Group (fictional) 的 organisation、ABN、状态、创建/更新日期；3 个 facility、9 个 staff account、9 个 resident 的既有 API 计数；Facilities 中现有 3 家院区及州、规则包、go-live checklist、床位。这些是本地合成数据，不是临床结果、保证效果或生产验收。
- 入口：[Providers](http://localhost:5174/providers) → Wattle Grove Care Group (fictional) → Overview / Facilities。列表、详情和表单均复用正式组件，没有另造展示站。
- 桌面 1440×1000 和手机 390×844 实际截图：Providers、Overview、Facilities、新建 Provider、Audit log；320px 检查 Overview / Providers / 404，无文档横向溢出。
- 搜索无结果与 Clear filters、Provider 排序按钮、手机 Menu 展开并在导航后收起、面包屑、404 返回均已操作。
- Facility 空提交和新建 Provider 缺 ABN 提交显示行内错误；后者保留已输入的合成名称，只有 1 个 submit；没有创建/修改 provider 或 facility。
- 已观察 loading 播报和骨架结构。只在此浏览器临时阻断 provider 列表 GET 请求，实际出现错误提示和 Try again；解除阻断后恢复 2 条既有 provider。已恢复网络与 viewport 设置。
- 键盘 Tab 到控件焦点状态已截图。未触发有效创建、保存成功或创建中的 disabled / loading 状态；未验证多会话 Demo 隔离、真实账号或真机。
- 改动 TSX 的单文件语法转译检查通过（不等于类型检查）；改动代码文件行数检查通过；两个代码仓库 diff whitespace 检查通过。未运行全量 typecheck / lint / test / build。
- 本次是存量 UI 视觉整理；未新增临床文书成果 Demo，也不据此宣称整个产品交付完整。

## 截图
[机构列表桌面](admin-providers-desktop-2026-10-18.png) · [机构列表手机](admin-providers-mobile-2026-10-18.png) · [详情桌面](admin-overview-desktop-2026-10-18.png) · [详情手机](admin-overview-mobile-2026-10-18.png) · [新建桌面](admin-new-provider-desktop-2026-10-18.png) · [手机表单错误](admin-new-provider-mobile-error-2026-10-18.png) · [手机无结果](admin-search-empty-mobile-2026-10-18.png) · [请求错误](admin-request-error-desktop-2026-10-18.png) · [审计桌面](admin-audit-desktop-2026-10-18.png) · [审计手机](admin-audit-mobile-2026-10-18.png) · [键盘焦点](admin-focus-desktop-2026-10-18.png) · [404](admin-404-mobile-2026-10-18.png)。

## 法律依据（本地参考文件）
| 主题 | 本地文件 | 位置 | 本次约束 |
|---|---|---|---|
| intended purpose | `03-legal-compliance/tga-samd-boundary.md` | 预期用途/红绿灯 | 管理文案，不加入诊断、治疗、预测或效果承诺 |
| TGA 文案 | `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | 对 careKind 的意义 | 不扩大产品预期用途 |
| 人工确认、数据边界 | `docs/PRD.md` | §6 / §9 | 不改变确认闭环、权限或数据范围，不显示住户健康记录 |

按 legal-reference-map，本次未新增数据收集、录音、临床、AI 分析、自动决策或法定义务功能。

### 本地资料缺口
未触及录音、监控、生物特征等缺口主题。

### 可能过时的资料
本地材料复核日期未超过六个月；没有进行法规更新或有效性认定。

TGA boundary check：🟢，仅管理页视觉、既有字段与文案；未发现需要替换的危险词，下一步无新增法规门槛。运营参考，不是法律意见。运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

## 交付状态
本地已修改，未提交、未推送、未部署，未触发 CI。文档结构检查若仍报告既有 `.playwright-mcp/` 缺上下文，不在本次添加无关文件。

最终上下文检查：未通过，当前 `07-marketing-ops/blog/` 缺 README.md / CLAUDE.md；该目录未在本次修改。
