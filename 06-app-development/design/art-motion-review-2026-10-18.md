# Super Admin 插画与界面动效

Owner: Lightman · Status: Local revision · Last reviewed: 18/10/2026

## 交付内容
用户要求“页面不够 cool，缺少图片、动画”。在端口 5174 实际服务的 au-state-regs-competitors 工作树实现：登录双栏视觉面板；手机紧凑图文条；后台 Providers、Detail、New provider、Audit log、404 页头插画。Facilities 复用 Detail 的页头。沿用共享设计系统的白底、sage/warm 装饰底和正式控件。Owner 本次要求是工作页头插画的具体例外，不扩展临床或数据能力。

新增共享 WorkspaceArtwork，care / notes / connections 对应原创手绘 PNG；素材母版来自 design-system，源提示词见 decorations-prompts.json。人物为虚构插画，无真实用户资料。复制不修改像素，未新增外部生成调用、网络字体或依赖。

动效：页面进入 0.4s、插画进入 0.8s、悬停 transform 过渡 0.2s、导航轻移和按钮按压反馈。全为有限次数，不循环、不闪烁；不对数据行做单独动画，不靠动效表达业务状态。prefers-reduced-motion 时关闭新增动画及变换。

## 验证
- 真实页面已打开：登录、Providers、Overview、New provider、Audit log；1440×1000 桌面和 390×844 手机截图，详情 320px 宽无文档横向溢出。
- 正常模式 computed style：ck-art-reveal / 0.8s、ck-workspace-enter / 0.4s；插画悬停实际 transform matrix 对应约 -1° / -4px，transition 0.2s。
- 模拟 prefers-reduced-motion: reduce：插画和页面进入 animationName 均为 none，按钮 transitionDuration 为 0s；检查后已恢复设置。
- 登录新布局的空提交仍显示邮箱/密码错误；用本地虚构种子员工登录成功，已有 Provider 详情、Tabs 和审计可读；未创建或修改 Provider/Facility。
- PNG 在真实浏览器渲染可见；hash 核对母版与副本一致。输入、表格、权限及 API 契约未改。
- 改动 10 个 TS/TSX 的单文件语法转译检查通过（不是类型检查）；行数及两个代码仓库 whitespace 检查通过。未运行全量 lint / typecheck / test / build 或 CI。
- 没有新增产品成果数据或临床 Demo。插画不冒充成果、真实用户、AI 执行或保证效果。共享组件改变会影响 Provider Portal，未对该端运行验收。

## 素材校验
- `decoration-hands-and-heart-v1.png`：`cb0414bf60b4175599a6c7f72b397d8b28c45c01005e9b819e6933f2bbecc4bd`（母版/副本一致）
- `decoration-nurse-review-v1.png`：`6d66db19fb748caffd857ef7a62025a14e11ff41d8bb5258ad91d44d6bc8865f`（母版/副本一致）
- `decoration-companionship-v1.png`：`b09d3c772cc9dc3a01dd14896aa3a2bba1ed83d31b3a51156747d0e0259c4c4a`（母版/副本一致）

## 截图
[登录桌面](art-motion-login-desktop-2026-10-18.png) · [登录手机](art-motion-login-mobile-2026-10-18.png) · [手机错误](art-motion-login-mobile-errors-2026-10-18.png) · [后台桌面](art-motion-providers-desktop-2026-10-18.png) · [后台手机](art-motion-providers-mobile-2026-10-18.png) · [详情桌面](art-motion-detail-desktop-2026-10-18.png) · [详情手机](art-motion-detail-mobile-2026-10-18.png) · [新建](art-motion-new-provider-desktop-2026-10-18.png) · [审计](art-motion-audit-desktop-2026-10-18.png)。截图体现静态外观；动效检查依据上面的浏览器样式与实际悬停操作。

## 法律依据与边界
沿用 docs/PRD.md §6 / §9、03-legal-compliance/tga-samd-boundary.md 和 references/law-library/tga-digital-scribes-summary.md 的用途边界：仅插画、排版与短动效；不新增诊断、治疗、预测、评分或效果承诺，不新增敏感数据收集。未触及录音、监控、生物特征等本地资料缺口；未进行法规更新或有效性认定。
TGA boundary check：🟢，纯视觉与品牌文案。运营参考，不是法律意见。运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

## 状态
本地已修改，未提交、推送、部署，未触发 CI。浏览器 viewport 和 reduced-motion 模拟均已恢复；最终保留登录预览。

- context-check: 未通过，既有 07-marketing-ops/blog 缺 README.md / CLAUDE.md；本次未修改该目录。
