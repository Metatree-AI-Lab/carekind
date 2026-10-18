# Super Admin 登录页调整

Owner: Lightman · Status: Local revision · Last reviewed: 18/10/2026

## 范围与结果
用户反馈 `http://localhost:5174/login` 设计不好看。实际服务位于 `au-state-regs-competitors` 工作树的 super-admin 子仓库。本次调整该现有页面，不初始化主检出空目录、不改变认证或权限。

移除营销 Hero、装饰笑脸和浮卡；改为品牌栏、居中工作表单、满宽主按钮和简洁页脚。复用 shared TextInput / Button / Alert、现有 tokens、标准 SVG Logo，不新增依赖或设计体系。此页为内部工作入口，采用 DESIGN.md §2 工作层；品牌 Hero 规格继续用于营销页。

## 验证
- 已打开真实页面，桌面 1280px、手机 390×844px 查看完整截图。
- 手机文档宽度与 viewport 同为 390px，无横向溢出；标题换行、页脚回流。
- 空提交出现邮箱、密码行内错误；键盘 Tab 到密码的焦点环可见。
- 文件行数检查通过；子仓库 diff whitespace 检查通过。未运行全量 lint / typecheck / test / build。
- 未使用真实凭据或提交有效登录；API 失败、pending、disabled 未实际触发，沿用 shared 状态。此页无保存/未保存状态。
- 未新增用户功能或成果数据，本次仅视觉调整，不宣称完成产品成果 Demo。
- 本地已修改，未提交、未推送、未部署，未触发 CI。

截图：[桌面](login-desktop-2026-10-18.png) · [手机错误](login-mobile-error-2026-10-18.png) · [手机焦点](login-mobile-focus-2026-10-18.png)。

## 法律依据（本地参考文件）
| 主题 | 本地文件 | 条款 / 页码 | 对本次调整的约束 |
|---|---|---|---|
| 预期用途 | `03-legal-compliance/tga-samd-boundary.md` | 预期用途与红绿灯 | 文案限 provider / facility 管理，不添加临床判断或能力承诺 |
| TGA 文案 | `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` | 对 careKind 的意义 | 不使用诊断、预测、治疗声明 |
| 数据与人工确认 | `docs/PRD.md` | §6、§9 G1/G2/G9 | 不新增数据收集，不改变人工审核和敏感数据边界 |

按 legal-reference-map 检查，本次无新增临床、记录模板、录音、自动决策、AI、跨境处理或 provider 法定义务功能；只保留原有登录字段与路径。

### 本地资料缺口
本次未触及录音、监控、生物特征或营销承诺等缺口主题。

### 可能过时的资料
上述本地材料复核日期未超过六个月；本次没有进行联网法规更新或法律有效性认定。

TGA boundary check：🟢，纯管理登录文案；无危险词需要替换，下一步无新增法规门槛。

运营参考，不是法律意见。运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

上下文检查：`scripts/check-context-docs.sh` 未通过；既有 `.playwright-mcp/` 缺少 README.md / CLAUDE.md，本次未创建该目录，保留未修改。
