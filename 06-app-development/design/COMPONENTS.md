# COMPONENTS.md — careKind AI 组件规格（Source of Truth）

Owner: Lightman (PO) · Assignee: Gary · Reviewer: Lin · Status: **Draft** · Last reviewed: 18/10/2026
上级规范：[`DESIGN.md`](DESIGN.md)（风格、tokens、全局规则）· PRD 工作包：DS-2 通用组件规格（[`docs/prds/2026-10-11-carekind-design-system.md`](../../docs/prds/2026-10-11-carekind-design-system.md)）

> **做任何界面之前，先在这里找现成的组件。** 能用现成组件就不要自己画；确实需要新组件或新变体，先在这里补规格，再实现。本文件和 `DESIGN.md` 冲突时，以 `DESIGN.md` 为准。运营参考，不是法律意见。

---

## 0. 怎么用

| 内容 | 位置 | 说明 |
|---|---|---|
| 规格（用途、变体、状态、键盘、无障碍、文案） | 本文件 | 唯一来源 |
| 参考实现（CSS） | [`design-system/components.css`](design-system/components.css) | 与框架无关；类名前缀 `ck-`；只引用 token。先引入 `tokens.css` 再引入它 |
| 交互样例 | [`design-system/preview.html#components`](design-system/preview.html#components) | 已展示组件的变体和状态，可用键盘试用；其余组件保留规格，内容全部是合成示例 |
| 数值 | [`design-system/tokens.json`](design-system/tokens.json) | 规格引用 token 名；具体数值见 DESIGN.md Typography 与 tokens.json |
| 唯一视觉入口 | [`design-system/preview.html`](design-system/preview.html) | 新版单页展示；本文件保留为组件规格源码 |

- 选定技术栈（ADR-0001）后，DS-5 按本文件把组件实现到代码组件库；**规格变了先改这里**，再改代码。
- 本文件不定义临床确认与 AI 内容的专用模式（AI 草稿标注、原文并排、老人归属选择、敏感事件逐条确认），那些属于 **DS-4（R3，需 Lin 评审）**，见 §13。

---

## 1. 总则（所有组件都要满足）

### 1.1 状态
每个可交互组件都要设计并实现这些状态（不适用的写"不适用"）：

| 状态 | 视觉 | 说明 |
|---|---|---|
| 默认 default | — | |
| 悬停 hover | 背景变为 `color-surface-subtle` 或加深 | 只在有指针的设备上出现；**不能承载信息** |
| 聚焦 focus-visible | `focus-ring`（白色内圈 + 黑色外圈） | **不得去掉**；键盘用户靠它定位 |
| 按下 active | 轻微变化 | |
| 选中 selected / checked | 颜色 + 字重或图标变化 | **不能只靠颜色** |
| 禁用 disabled | `color-ink-soft` 文字、`color-surface-subtle` 底 | 旁边说明为什么不可用 |
| 加载 loading | spinner + 文字保留 + `aria-busy="true"` | 防止重复提交 |
| 错误 error | `color-danger-ink` 边框 + 图标 + 正文字号的原因 | 说明怎么改，不只说"无效" |

### 1.2 尺寸与触控
- 所有可点击元素的点击区域 ≥ `size-target-min`；控件默认高度 `size-control-height`，主要确认操作用 `size-control-height-lg`。
- `size-control-height-sm`（紧凑）**只用于桌面端的密集表格**，触屏和戴手套的场景不用。
- 相邻点击目标之间至少留 `space-2`，避免误触。

### 1.3 颜色、图标、文字
- 状态色成对使用：文字 / 图标用 `-ink`，背景用 `-tint`（`DESIGN.md` §7.1）。原色（`green`、`blue`、`amber`、`purple`）只用于小圆点、图形、进度条。
- **任何状态都要有文字或图标**，颜色不能是唯一的信息来源。
- 图标：24 网格、线宽 1.75、圆角端点、颜色继承文字（`currentColor`）；尺寸 `size-icon-sm` / `md` / `lg`。图标**必须**配文字，或有可访问名称（`aria-label`）；装饰性图标加 `aria-hidden="true"`。
- 界面文字：动词开头、具体（"Confirm note"，不是 "OK"）；澳式英语；跑 `tga-boundary-check`；不用 detect / predict / monitor / risk / insights。

### 1.4 无障碍基线
- 全部操作可用键盘完成；Tab 顺序与视觉顺序一致。
- 优先使用原生元素（`button`、`a`、`input`、`select`、`dialog`、`details`）；自定义组件按 WAI-ARIA Authoring Practices 的对应模式实现（每个组件的"键盘与 ARIA"一节）。⚠️ 模式细节以 W3C 官方原文为准，本地资料库没有收录，需核实。
- 动态变化（保存结果、上传进度、错误）要让屏幕阅读器知道：`role="status"`（礼貌播报）或 `role="alert"`（立即播报，只用于错误）。
- 尊重"减少动态效果"：动画关闭或改为淡入淡出（`components.css` 已处理）。

### 1.5 careKind 特别规则
- **不提供**评分、风险等级、趋势预测、"改善 x%" 类组件（`DESIGN.md` §7.3）。
- 示例、占位符、截图只用合成数据（"Resident A"），不出现真实住户或员工信息。
- 错误、日志、分析事件里不记录文件名、住户名等个人信息（`06-app-development/engineering/engineering-standards.md`）。

---

## 2. 组件总览

| 类别 | 组件 | 类名 | 何时用 |
|---|---|---|---|
| 操作 | 按钮 Button | `ck-btn` | 执行一个操作 |
| 操作 | 图标按钮 Icon button | `ck-icon-btn` | 空间有限、含义通用的操作（关闭、搜索），必须有 `aria-label` |
| 操作 | 链接 Link | `ck-link` | 跳转到另一个页面或位置 |
| 表单 | 字段 Field | `ck-field` / `ck-label` / `ck-hint` / `ck-error` | 所有输入的外壳 |
| 表单 | 输入框 / 多行 / 搜索 | `ck-input` / `ck-textarea` / `ck-input--search` | 自由输入 |
| 表单 | 原生下拉 Select | `ck-select` | 从选项中选一个值（**默认选它**） |
| 表单 | 自定义下拉 Dropdown | `ck-dropdown` / `ck-listbox` / `ck-option` | 选项需要辅助文字或图标时 |
| 表单 | 复选框 / 单选 / 开关 | `ck-check` / `ck-switch` | 多选 / 单选 / 立即生效的开关 |
| 表单 | 上传 Upload | `ck-dropzone` / `ck-file` | 选择并上传文件 |
| 操作 | 菜单 Menu | `ck-menu` / `ck-menu-item` | 一组相关操作 |
| 导航 | 标签页 Tabs | `ck-tablist` / `ck-tab` | 同一页里切换内容区 |
| 导航 | 分段控件 Segmented | `ck-segmented` | 切换视图或过滤 |
| 导航 | 面包屑 / 分页 | `ck-breadcrumb` / `ck-pagination` | 层级位置 / 分页列表 |
| 导航 | App bar / Tab bar | `ck-appbar` / `ck-tabbar` | 手机 App 的顶部栏和底部主导航 |
| 展示 | 标签 Tag / 徽标 Badge / 头像 Avatar | `ck-tag` / `ck-badge` / `ck-avatar` | 状态、数量、人员 |
| 展示 | 卡片 / 列表 / 表格 / 手风琴 / 分割线 | `ck-card` / `ck-list` / `ck-table` / `ck-accordion` / `ck-divider` | 内容组织 |
| 反馈 | 提示 Alert | `ck-alert` | 页面内、持续存在的状态说明 |
| 反馈 | Toast | `ck-toast` | 操作后的短暂反馈 |
| 弹层 | 对话框 Dialog | `ck-dialog` | 需要用户决定才能继续 |
| 弹层 | Tooltip | `ck-tooltip` | 补充说明（不能承载必须看到的信息） |
| 加载 | 进度 / Spinner / 骨架 / 空状态 | `ck-progress` / `ck-spinner` / `ck-skeleton` / `ck-empty` | 等待与无内容 |
| 管理端（§12A） | 应用框架 / 侧边导航 / 页面头部 | `ck-app-shell` / `ck-sidenav` / `ck-page-header` | Super Admin 与机构管理端的桌面页面框架 |
| 管理端（§12A） | 数据表扩展 / Combobox / 日期时间 | `ck-table-toolbar` / `ck-bulkbar` / `ck-combobox` / `ck-input--date` | 筛选、排序、批量操作；多选项搜索；日期输入与 DD/MM/YYYY 显示 |
| 管理端（§12A） | 抽屉 / 步骤条 / 差异 / 审计 / 名称确认 / 数字卡片 | `ck-drawer` / `ck-stepper` / `ck-diff` / `ck-audit-list` / `ck-dialog--confirm-name` / `ck-stat` | 行详情；分步导入；版本对比；只追加日志；危险操作；计数 + 口径 |

---

## 3. 按钮 Button · 图标按钮 · 链接

**用途**：执行操作。跳转页面用链接，不用按钮。

| 变体 | 类名 | 规则 |
|---|---|---|
| 主按钮 | `ck-btn ck-btn--primary` | 每个界面区域**最多一个** |
| 次按钮 | `ck-btn` | 次要操作 |
| 文字按钮 | `ck-btn ck-btn--text` | 低强调操作 |
| 危险（描边） | `ck-btn ck-btn--danger` | 可撤销的删除类操作 |
| 危险（实心） | `ck-btn ck-btn--danger-solid` | **只**用于不可撤销操作在确认对话框里的最终按钮 |
| 大 / 紧凑 | `ck-btn--lg` / `ck-btn--sm` | 大：主要确认操作；紧凑：仅桌面端密集表格 |
| 图标按钮 | `ck-icon-btn`（无边框：`ck-icon-btn--plain`） | 必须有 `aria-label`；含义不通用时改用带文字的按钮 |

- **状态**：§1.1 全部。加载时保留文字（"Saving…"），加 `aria-busy="true"`，并阻止重复点击。禁用时在旁边说明原因；如果用户需要知道为什么，优先让按钮可点并在点击后说明。
- **键盘**：原生 `button`，Enter / Space 触发。
- **文案**：动词开头（"Confirm note"、"Save draft"）。图标放文字右侧（箭头）或左侧（上传图标），不能只有图标。
- **不要**：并列多个主按钮；用按钮做页面跳转；用"OK / Yes / No"做按钮文字。

## 4. 表单字段 Field · Input · Textarea · Search

- **结构**：标签 `ck-label`（永远可见，在输入框上方）→ 输入框 → 提示 `ck-hint`（可选）→ 错误 `ck-error`（出错时）。可选字段在标签后写 "(optional)"，不给必填字段加星号。
- **宽度**：字段占满容器，上限 `size-field-max`；宽度应大致匹配预期内容长度。
- **占位符**只写示例（"e.g. 12B"），**不能代替标签**。
- **错误**：`aria-invalid="true"` + `aria-describedby` 指向错误文字；错误用正文字号，说明怎么改（"Enter a room number, for example 12B."）；在用户离开字段或提交时校验，不要边输入边报错。
- **搜索**：`ck-input-wrap` + 搜索图标 + `ck-input--search`（药丸形），`type="search"`。
- **多行**：`ck-textarea`，至少两行高，可纵向拉伸；口述转写类长文本用它。
- **键盘与 ARIA**：原生元素；标签用 `<label for>` 关联。

## 5. 下拉选择：原生 Select 与自定义 Dropdown

| 情况 | 用什么 |
|---|---|
| 默认、简单文本选项、手机 / 平板 | **原生 `select`**（`ck-select-wrap` + `ck-select`）：系统选择器最顺手，无障碍最好 |
| 选项需要辅助文字、图标或禁用说明，或桌面端需要统一外观 | 自定义 Dropdown（`ck-dropdown`） |
| 选项很多（约 15 个以上）、需要搜索 | 可搜索下拉 Combobox（§12A.4） |
| 选项 ≤ 5 个且都要一眼看到 | 单选 `radio`，不用下拉 |
| 执行操作，而不是选值 | 菜单 Menu（§6） |

**自定义 Dropdown 规格**
- **结构**：触发按钮 `ck-select-trigger`（`role="combobox"`、`aria-haspopup="listbox"`、`aria-expanded`、`aria-controls`）+ 列表 `ck-listbox`（`role="listbox"`）+ 选项 `ck-option`（`role="option"`、`aria-selected`）。
- **显示**：选中后触发按钮显示所选值；未选显示占位文字（`color-ink-soft`），但字段**仍要有标签**。选中项加粗并显示对勾。列表最大高度 `size-listbox-max-height`，超出滚动；宽度至少等于触发按钮。
- **禁用选项**：`aria-disabled="true"`，键盘跳过，文字说明原因（"(closed)"）。
- **键盘**：↓ / ↑ 打开并移动（跳过禁用项）；Home / End 到首尾；Enter / Space 选择并关闭；Esc 关闭不改值；Tab 关闭并离开；输入字母跳到匹配项。当前项用 `aria-activedescendant` 指示，焦点留在触发按钮上；选择后焦点回到触发按钮。
- **鼠标**：点击外部关闭。
- **不要**：用下拉做导航；在下拉里放操作按钮；选项超过一屏又不提供搜索。

## 6. 菜单 Menu

- **用途**：一组与当前对象相关的操作（"Edit note"、"Copy"、"Discard draft"）。不是选值。
- **结构**：触发按钮（`aria-haspopup="menu"`、`aria-expanded`、`aria-controls`）+ `ck-menu`（`role="menu"`）+ `ck-menu-item`（`role="menuitem"`）；分组用 `ck-menu-sep`（`role="separator"`）。危险操作 `ck-menu-item--danger` 放在最后并用分割线隔开。
- **键盘**：Enter / Space / ↓ 打开并聚焦第一项，↑ 打开并聚焦最后一项；菜单内 ↑↓ 循环、Home / End；Esc 关闭并把焦点还给触发按钮；Tab 关闭。
- **规则**：不可撤销的危险操作，菜单项触发后**必须**再弹确认对话框（§11.3）；可撤销的用 Toast 提供撤销（§11.2）。

## 7. 复选框 · 单选 · 开关

| 组件 | 用途 | 生效时机 |
|---|---|---|
| 复选框 `ck-check` + `checkbox` | 多选；或单个"同意 / 不同意" | 提交表单时 |
| 单选 `ck-check` + `radio` | 互斥选项（≤ 5 个且需要一眼看到） | 提交表单时 |
| 开关 `ck-switch` | 设置项的开 / 关 | **立即生效** |

- **结构**：整行（方框 + 文字）都是点击区域，高度 ≥ `size-target-min`；方框尺寸 `size-checkbox`。一组选项用 `fieldset` + `legend`。
- **复选框**支持半选（`indeterminate`，用于"部分已选"的父项）。
- **开关**：`button role="switch" aria-checked`；旁边文字写当前状态（"Auto-save drafts: On"），不能只靠滑块位置和颜色。开关变化如果需要确认或会失败，改用复选框 + 保存按钮。
- **键盘**：复选框 / 开关 Space 切换；单选 ↑↓ 在组内移动并选择。
- **不要**：用开关做需要提交的表单项；用复选框做立即生效的设置。

## 8. 上传 Upload

- **结构**：上传区 `ck-dropzone`（一个 `label`，内含视觉隐藏的 `input type="file"`）+ 文件列表 `ck-file-list`，每个文件一行 `ck-file`：文件图标、文件名、元信息（大小 · 状态）、操作按钮、进度条。
- **选择前说清限制**：在上传区写明支持的类型和大小上限（`ck-dropzone-hint`）。**真实的类型和大小限制是产品决定：`{{TBD}}`**（样例页里的限制只是演示）。
- **状态**

| 状态 | 上传区 / 文件行 | 操作 |
|---|---|---|
| 空闲 | 虚线框、上传图标、标题、限制说明 | 点击或拖放 |
| 拖入中 | 实线框 `is-dragover` | 松开上传 |
| 上传中 | 文件行显示进度条和百分比文字（"Uploading 54%"） | 取消 |
| 完成 | 元信息 `color-green-ink`（"Uploaded"） | 移除 |
| 失败（网络等临时原因） | 文件行红色边框 + 原因（正文字号） | **重试** + 移除 |
| 校验不通过（类型、大小） | 同上，原因写清楚怎么办 | 只给**移除**（重试一定失败） |
| 禁用 | `is-disabled`，说明原因 | — |

- **反馈**：错误**只在文件行内显示**，不再重复弹 Toast；后台上传完成可以用成功 Toast 告知。进度条有 `role="progressbar"` 和 `aria-valuenow`，文件列表用 `aria-live="polite"` 播报状态变化。
- **键盘**：Tab 聚焦上传区（整个区域显示焦点框），Enter / Space 打开系统文件选择器；拖放只是增强，**不能是唯一方式**。
- **careKind 特别规则**：上传的音频和文件属于健康信息，只上传到批准的澳洲境内存储（`docs/PRD.md` §9 G9）；不在日志、错误监控里记录文件名；不显示住户照片缩略图，除非该功能的 PRD 明确允许。
- **不要**：上传后才告诉用户格式不对；只用颜色表示失败；静默失败。

## 9. 导航 Tabs · Segmented · Breadcrumb · Pagination · App bar · Tab bar

| 组件 | 用途 | 键盘与 ARIA |
|---|---|---|
| 标签页 `ck-tablist` / `ck-tab` / `ck-tabpanel` | 同一页里切换内容区 | `role="tablist"` / `tab` / `tabpanel`；←→ 移动并切换，Home / End；漫游 tabindex（只有选中的 tab 可 Tab 到） |
| 分段控件 `ck-segmented` | 切换视图或过滤（2–4 项） | 按钮 + `aria-pressed`；不是页面导航 |
| 面包屑 `ck-breadcrumb` | 显示层级位置 | `nav aria-label="Breadcrumb"`；当前页 `aria-current="page"`，不是链接 |
| 分页 `ck-pagination` | 长列表分页 | `nav aria-label="Pagination"`；当前页 `aria-current="page"`；上一页 / 下一页有 `aria-label` |
| App bar `ck-appbar` | 手机顶部：返回、标题、1–2 个操作 | 返回和操作是图标按钮，必须有 `aria-label` |
| Tab bar `ck-tabbar` | 手机底部主导航（3–5 项） | 每项**图标 + 文字**；当前页 `aria-current="page"`，加粗 + 顶部横线，不只靠颜色 |

- 选中的标签页：加粗 + 3px 下划线，不只靠颜色。
- Tab bar 放在拇指能到的位置；Toast 出现在它上方，不遮挡它。

## 10. 展示 Tag · Badge · Avatar · Card · List · Table · Accordion

- **标签 Tag** `ck-tag`：分类与状态（Draft、Confirmed、Needs review、AI draft、Failed）。状态变体 `ck-tag--success / info / warning / ai / danger`；小圆点 `ck-dot` **必须**配文字。标签不可点击；可点击的筛选用分段控件或复选框。
- **徽标 Badge** `ck-badge`：数量。必须有可读的名称（`aria-label="3 unread"`）。不用于表示严重程度。
- **头像 Avatar** `ck-avatar`（`--sm` / 默认 / `--lg`）：首字母或经授权的照片；旁边总有姓名文字，头像本身 `aria-hidden`。**住户照片只有在功能 PRD 允许且有同意时才显示。**
- **卡片 Card** `ck-card`：默认细描边、无阴影；真正悬浮的品牌卡片用 `ck-floating-card`。整张可点击用 `ck-card--interactive`（一个链接或按钮包住整张卡片），卡片里不要再放其他可点击元素。
- **列表 List** `ck-list` / `ck-list-item`：每行 ≥ `size-target-min`；主文字 + 次要文字（`ck-list-item-sub`）+ 右侧状态或操作。
- **表格 Table** `ck-table`（外层 `ck-table-wrap` 负责横向滚动）：有 `caption`；表头 `th scope="col"`，吸顶；数字列右对齐并用等宽数字（`is-num`）；可排序列的表头是按钮，`th` 上标 `aria-sort`。手机上列多时改用列表，不要硬塞表格。
- **手风琴 Accordion** `ck-accordion`：用原生 `details` / `summary`；用于 FAQ、次要信息。**关键临床信息不要折叠起来。**
- **分割线** `ck-divider`：只在留白不够区分时使用。


## 11. 反馈：Alert · Toast · Dialog · Tooltip

### 11.1 选哪个
| 情况 | 用什么 |
|---|---|
| 页面里持续存在的状态（离线、缺少信息） | 提示 Alert |
| 操作完成后的短暂反馈（已保存、已上传） | Toast |
| 可撤销的操作（丢弃草稿） | Toast + **Undo** |
| 不可撤销的操作，或必须做决定才能继续 | 对话框 Dialog |
| 某个字段 / 某个文件出错 | **行内错误**（不用 Toast） |
| 补充说明一个图标或术语 | Tooltip |

### 11.2 Toast
- **外观**：`color-ink` 底、`color-on-ink` 字、`radius-lg`、`shadow-2`；左侧状态图标（成功 / 信息 / 提醒 / 错误，颜色 + 图标形状不同）；标题 + 一句说明；可选一个操作按钮（如 Undo）；右侧关闭按钮。
- **位置**：底部居中，宽度上限 `size-toast-width`；手机上在 Tab bar 上方。最多同时 3 个，新的在下方。
- **时间**：成功 / 信息至少显示 **8 秒**后自动消失；**鼠标悬停或键盘聚焦时暂停**，离开后继续剩余时间。**错误和带操作的 Toast 不自动消失**，必须手动关闭。
- **ARIA**：成功 / 信息 / 提醒 `role="status"`；错误 `role="alert"`。关闭按钮 `aria-label="Dismiss notification"`。
- **不要**：用 Toast 承载必须看到才能继续的信息；Toast 里放多个操作；对行内已显示的错误再弹 Toast。

### 11.3 对话框 Dialog
- 用原生 `dialog` + `showModal()`（浏览器提供焦点限制、Esc 关闭、背景不可操作）；遮罩 `color-overlay`；宽度 `size-dialog-sm`（确认）/ `size-dialog-md`（表单）。
- **结构**：标题（问题形式："Discard this draft?"）+ 正文（说明后果）+ 底部按钮（右对齐；安全选项在左，主操作在右）。`aria-labelledby` 指向标题，`aria-describedby` 指向正文。
- **初始焦点**：确认类对话框聚焦**最安全的选项**（"Keep draft"），防止习惯性按 Enter 误操作；表单对话框聚焦第一个输入框。关闭后焦点回到触发按钮。
- **按钮文字**写清楚动作（"Discard draft" / "Keep draft"），不用 "OK / Cancel"。不可撤销操作的最终按钮用 `ck-btn--danger-solid`。
- 点击遮罩可以关闭（等同取消）；有未保存输入时，不要因为点遮罩就丢弃内容。
- **不要**：对话框套对话框；用对话框显示长内容（改用页面）；用对话框做营销弹窗。

### 11.4 提示 Alert
`ck-alert--success / info / warning / danger`（AI 相关 `ck-alert--ai` 的具体用法属于 DS-4）：图标 + 标题 + 说明，`-tint` 底 + `-ink` 字。错误用 `role="alert"`，其他用 `role="status"`；页面加载时就存在的提示不需要 live region。

### 11.5 Tooltip
`ck-tooltip-wrap` + `ck-tooltip`（`role="tooltip"`，触发元素用 `aria-describedby` 关联）。悬停和键盘聚焦都能显示；**Esc 可关闭**；鼠标可移到提示上而不消失；不放链接或按钮；不承载必须看到的信息（触屏上没有悬停）。

## 12. 加载与空状态

- **进度条** `ck-progress`：已知进度（上传）用确定进度，旁边写百分比文字；未知进度用 `ck-progress--indeterminate`。`role="progressbar"` + `aria-valuenow`（确定进度）+ `aria-label`。**只表示任务进度，不表示健康状况或评分。**
- **Spinner** `ck-spinner`：短时等待（< 几秒）且位置明确（按钮内、列表加载）；旁边有文字，或 `role="status"` + `aria-label`。
- **骨架屏** `ck-skeleton`：首次加载内容区时，形状接近真实内容；对屏幕阅读器隐藏，用一个 `role="status"` 文字说明正在加载。
- **空状态** `ck-empty`：图标 + 标题（说明现在是什么情况）+ 一句话（说明为什么 / 接下来会怎样）+ 最多一个主操作。不用"暂无数据"这种模糊说法。

## 12A. 管理端组件（18/10/2026）

> 状态：**已写规格，待 Lin 评审**。Super Admin（`docs/prds/2026-10-18-super-admin-multi-facility-console.md` §9.1）和机构管理端（`docs/prds/2026-10-18-provider-portal-facility-admin.md` §9.1）共用，规格只写一份。参考 CSS 在 `components.css` 末尾"管理端组件"一节；`preview.html` 还没有这些组件的交互样例（待补）。
> 管理端是**桌面优先**（`size-breakpoint-md` 以上），但所有组件在手机宽度下必须可用、无横向页面滚动（表格区域自身可横向滚动）。示例只用虚构的 Wattle Grove Care Group 数据，并标注 fictional。
> 涉及**住户归属选择、同名提示**的界面仍属于 DS-4（R3），不能用本节的 Combobox 自行实现。

### 12A.1 桌面应用框架 `ck-app-shell` + 侧边导航 `ck-sidenav`（18/10/2026 由 `ck-shell` 改名：与 editorial.css 预览页外框 `.ck-shell` 冲突）
- **何时用**：Super Admin 和机构管理端的每个登录后页面。手机 App 仍用 App bar / Tab bar（§9），两套不混用。
- **结构**：
  | 区域 | 类名 | 内容 |
  |---|---|---|
  | 跳转链接 | `ck-skip-link` | 页面第一个可聚焦元素："Skip to main content"，指向 `ck-shell-main`（`id="main"`、`tabindex="-1"`） |
  | 持续标识条 | `ck-shell-banner`（Demo）/ `ck-shell-banner--support`（支持访问会话） | 见下方"持续标识" |
  | 侧栏 | `ck-sidenav`（`nav aria-label="Main"`） | 产品名 `ck-sidenav-brand` → **租户切换位置** `ck-sidenav-switcher` → 导航分组 `ck-sidenav-heading` + `ck-sidenav-group` → 底部 `ck-sidenav-footer`（版本、帮助链接） |
  | 顶栏 | `ck-shell-topbar` | 当前租户上下文 `ck-shell-context`（`ck-shell-context-label` + `ck-shell-context-value`）+ 用户菜单 `ck-shell-user`（头像 + 姓名 + 角色 + Sign out） |
  | 主区域 | `ck-shell-main`（`main`） | 页面头部 `ck-page-header`（§12A.2）+ 内容 |
- **租户切换位置**（`ck-sidenav-switcher`，只有一个）：
  - 机构管理端：公司层 / 单院层切换，用自定义下拉 `ck-dropdown`（≤ 15 个选项）或 Combobox `ck-combobox`（更多）。第一项是公司层 "All facilities — Wattle Grove Care Group"，其余每项写院名 + 城市 + 州（"Banksia Park Aged Care · Geelong VIC"）。
  - Super Admin：默认在平台层；进入某个 Provider 时用 Combobox 选择，选择后顶栏显示该 Provider。
  - 切换会**重新加载该租户的数据**并回到对应列表页；有未保存输入时先弹确认（§11.3）。切换结果用 `role="status"` 播报："Now viewing Banksia Park Aged Care"。
- **持续标识**（不随滚动消失，不能被关闭）：
  - 顶栏 `ck-shell-context` 永远写出当前租户全称："Viewing: Wattle Grove Care Group / Banksia Park Aged Care (VIC)"。不只用 Logo 或颜色区分租户。
  - Demo 身份：`ck-shell-banner`（`color-blue-tint` 底 + `color-blue-ink` 字，`role="region" aria-label="Demo workspace"`），文字写明 "Demo workspace — fictional data. Signed in as Helen Tran (fictional), Owner." + 一个 "Exit demo" 操作（返回自己的工作区）。
  - 支持访问会话（Super Admin 进入客户租户）：`ck-shell-banner--support`（`amber` 一对），写明 Provider、范围、结束时间："Support access to Wattle Grove Care Group · read-only · ends 18/10/2026 3:45 pm AEDT" + "End session"。
- **导航项**：链接 `a`，图标 + 文字（不能只有图标），当前页 `aria-current="page"`：白底 + 加粗 + 左侧 3px 竖线。分组标题是文字，不是可点元素。导航项 ≤ 约 9 个；没有权限的项**不显示**（不是灰掉），避免暴露不存在的能力。
- **窄屏**（< `size-breakpoint-md`）：侧栏移到顶栏下方，默认收起，用 `ck-sidenav-toggle`（`button aria-expanded aria-controls`，文字 "Menu"）展开；收起的内容放在 `ck-sidenav-collapsible` 里并紧跟在按钮之后。
- **键盘与 ARIA**：Tab 顺序 = 跳转链接 → 标识条操作 → 侧栏 → 顶栏 → 主区域；导航用普通链接 Tab 移动，不做方向键漫游。地标：`header`、`nav`、`main` 各一个（标识条用 `role="region"`）。
- **不要**：把 Demo / 支持访问标识做成可关闭的提示；只用颜色区分 Demo 和正式租户；在侧栏里放主操作按钮；多层嵌套折叠导航。

### 12A.2 页面头部 `ck-page-header`
- **结构**：面包屑 `ck-breadcrumb`（可选，深层页面才用）→ 标题 `ck-page-header-title`（页面唯一的 `h1`）→ 一句说明 `ck-page-header-desc`（可选，说明这页做什么）→ 元信息 `ck-page-header-meta`（状态标签，如 "Published v3"）→ 右侧操作 `ck-page-header-actions`。
- **操作**：最多一个主按钮（`ck-btn--primary`），加 1–2 个次按钮；更多操作放进菜单 `ck-menu`（"More actions"）。危险操作（暂停、终止）放在菜单最后或详情页底部，**不放**在头部主按钮位置。
- **手机**：标题与操作上下排列，操作左对齐；标题降一级字号（`font-size-heading-sm`）。
- **文案**：标题是名词（"Staff"、"Banksia Park Aged Care"），主按钮动词开头（"Invite staff"、"Import roster"）。
- **不要**：在头部放统计数字；一个页面多个 `h1`；用头部承载错误（错误用 `ck-alert`）。

### 12A.3 数据表扩展（在 `ck-table` 基础上）
- **何时用**：员工、住户名单、Provider、养老院、规则包版本等列表。手机上列多时仍可用表格区横向滚动，但第一列（名称）要能识别行。
- **结构（自上而下）**：筛选栏 `ck-table-toolbar` → 已选筛选 `ck-filter-chips` → 批量操作条 `ck-bulkbar`（有选中行时出现）→ `ck-table-wrap` + `ck-table` → 底部 `ck-table-footer`（结果数 + 分页 `ck-pagination`）。
- **筛选栏**：搜索 `ck-input--search`（`type="search"`，标签可视觉隐藏但要有 `<label>`）+ 1–3 个原生下拉 `ck-select`（状态、养老院、角色）+ 右侧 `ck-table-toolbar-end`（"Clear filters" 文字按钮 + 结果数 `ck-table-count`）。搜索输入后约 300ms 防抖再请求（⚠️ 数值待 Lin 定）。结果数放在 `role="status"` 里播报："12 staff match your filters"。
- **已选筛选**：每个筛选一个 `ck-filter-chip`（`button`，文字 "Status: Active" + 关闭图标，`aria-label="Remove filter Status: Active"`）。筛选条件写进 URL 查询参数，刷新和分享链接后保留。
- **排序**：可排序列的表头是 `button`，`th` 上写 `aria-sort="ascending | descending | none"`；同一时间只按一列排序。方向用图标形状（`ck-sort-icon`，降序旋转 180°）+ `aria-sort` 表达，不只靠颜色。默认排序在规格里写明（如员工按姓氏升序）。
- **行选择与批量操作**：
  - 第一列 `ck-col-select`：每行一个复选框（`aria-label="Select Grace Liu"`）；表头复选框只选**当前页**，部分选中时为 `indeterminate`（`aria-label="Select all staff on this page"`）。
  - 选中行加 `is-selected`：浅灰底 + 左侧 3px 竖线（不只靠底色）。
  - `ck-bulkbar`（`role="region" aria-label="Bulk actions"`）：已选数量 `ck-bulkbar-count`（"3 selected"，`role="status"`）+ 操作按钮 + "Clear selection"。跨页全选必须是显式操作："Select all 48 matching staff"。
  - 批量危险操作（停用、移除）**必须**弹确认对话框，并列出受影响的数量和被阻断的行（例如有未确认草稿、是通知路由的备用联系人）；能部分完成时，结果逐行报告，不只说"失败"。
- **行操作**：每行最后一列 `ck-col-actions` 放一个菜单按钮（`aria-label="Actions for Grace Liu"`）；打开详情用第一列名称的链接（或打开 Drawer 的按钮），**不做整行点击**。
- **状态**：
  | 状态 | 显示 | ARIA |
  |---|---|---|
  | 加载中（首次） | 表头保留，5 行骨架 `ck-table-skeleton-cell` | `ck-table-wrap aria-busy="true"` + 一个 `role="status"` "Loading staff" |
  | 加载中（翻页、排序） | 保留旧数据并禁用交互，表头旁 spinner | 同上 |
  | 还没有数据 | `ck-table-state`（一行 `td colspan`）里放 `ck-empty`：说明为什么 + 一个主操作（"Import roster"） | — |
  | 筛选后无结果 | `ck-empty`："No staff match these filters" + "Clear filters" | 结果数播报 |
  | 加载失败 | `ck-table-state` 里放 `ck-alert--danger`：发生了什么 + "Try again" | `role="alert"` |
- **密度**：默认行高满足 `size-target-min`；`ck-table--dense` + `ck-btn--sm` 只用于桌面端密集表格。
- **careKind 特别规则**：Super Admin 的列表**不出现住户姓名和临床内容**，只显示数量与 ID；表格里不做排名列（员工按产出、记录数排序展示属于绩效排名，禁止，PRD §4.7 / §9）。
- **不要**：整行点击；只用颜色标记选中；把批量操作藏在右键菜单；分页之间悄悄保留选中而不告诉用户。

### 12A.4 可搜索下拉 Combobox `ck-combobox`
- **何时用**：选项多（约 15 个以上）或需要按名称搜索：选 Provider、州、模板、员工、养老院。≤ 15 个用 `ck-select` / `ck-dropdown`（§5）。
- **结构**：`ck-field` 标签 → `ck-combobox` 外壳 → `input.ck-input`（`role="combobox"`、`aria-autocomplete="list"`、`aria-expanded`、`aria-controls`、`aria-activedescendant`）+ 清除按钮 `ck-combobox-clear`（`aria-label="Clear selection"`，有值时显示）→ 列表复用 `ck-listbox`（`role="listbox"`）/ `ck-option`（`role="option"`、`aria-selected`）。选项可以两行：`ck-option-text` 主文字 + `ck-option-sub`（"Geelong VIC"）；匹配字用 `mark`（加粗 + 下划线，不只靠颜色）。
- **行为**：只允许从列表里选（不接受自由文本）。输入即过滤；远程搜索时显示 spinner 和 `ck-listbox-message`（"Searching…"、"No matching facilities"、"Type at least 2 characters"）。结果数用独立的 `role="status"` 播报（"5 results"）。失焦时如果文字不对应已选项，恢复为上一个已选值，并在 `ck-error` 里说明。
- **键盘**（WAI-ARIA combobox 模式；⚠️ 细节以 W3C APG 原文为准，需核实）：↓ 打开并移到下一项，↑ 上一项；Alt + ↓ 只打开；Enter 选择当前项并关闭；Esc 先关闭列表，列表已关闭时清空输入；Tab 关闭并离开（不自动选中当前项）；Home / End 在输入框里移动光标。焦点始终留在输入框，当前项用 `aria-activedescendant` 指示并加 `is-active`。
- **状态**：默认、聚焦、展开、搜索中、无结果、已选、错误（`aria-invalid`）、禁用。
- **careKind 特别规则**：选项只显示区分所需的最少信息（姓名 + 养老院 / 角色），**不显示**健康信息；搜索词不写进日志和分析事件。
- **不要**：自由文本 + 自动补全混用；用 Combobox 做导航；把住户归属选择做成 Combobox（DS-4）。

### 12A.5 日期 / 时间
- **何时用**：合同日期、入住、离开、转院日期、审计日志的时间范围。
- **输入**：**优先原生** `input type="date"` / `type="time"`（`ck-input ck-input--date` / `ck-input--time`），值用 ISO（`YYYY-MM-DD`）提交。页面 `lang="en-AU"`，使浏览器的原生控件按 DD/MM/YYYY 显示（⚠️ 各浏览器表现不同，需核实）。日期范围用 `fieldset.ck-date-range` + `legend`（"Date range"），"From" / "To" 两个字段。
- **显示**（只读文字、表格、审计日志）：一律 **DD/MM/YYYY**（"18/10/2026"）；带时间写 "18/10/2026 2:30 pm"，跨州或审计场景加时区缩写（AEST / AEDT），时区按**养老院所在地**（VIC 用 Australia/Melbourne，NSW 用 Australia/Sydney；10 月至次年 4 月为夏令时 AEDT，⚠️ 夏令时起止以官方为准）；用 `time datetime="2026-10-18T14:30+11:00"` + `ck-datetime` 包住。不用 "10/18"、"Oct 18" 或相对时间（"2 hours ago"）作为唯一显示；相对时间可以作为补充。
- **校验**：提示文字写格式（`ck-hint` "For example, 18/10/2026"）；错误说明怎么改（"Enter a move-out date on or after the move-in date, 01/03/2026."）。
- **不要**：自己做日历弹层（除非有 PRD 需求并补规格）；用美式日期；日期显示成纯数字而没有标签。

### 12A.6 侧边抽屉 Drawer `ck-drawer`
- **何时用**：在不离开列表的情况下看行详情、编辑少量字段、更多筛选。内容长、要分享链接、或有多步流程时用独立页面。手机底部抽屉（Bottom sheet）仍待做。
- **结构**：原生 `dialog.ck-drawer` + `showModal()`（焦点限制、Esc 关闭、背景不可操作由浏览器提供）；`ck-drawer-header`（标题 `ck-drawer-title` + 关闭图标按钮 `aria-label="Close"`）→ `ck-drawer-body`（可滚动）→ `ck-drawer-footer`（操作，右对齐，主操作在右）。宽度默认 `size-dialog-sm`，`ck-drawer--wide` 用 `size-dialog-md`；手机全宽。`aria-labelledby` 指向标题。
- **键盘**：打开后焦点到标题或第一个输入框；Esc / 关闭按钮 / 点遮罩关闭；关闭后焦点回到触发按钮。有未保存输入时关闭前先确认，不因点遮罩丢失内容。
- **不要**：抽屉里再开抽屉；在抽屉里做不可撤销操作的最终确认（用对话框）；用抽屉显示住户临床内容（属于护士端）。

### 12A.7 分步流程 Stepper `ck-stepper`
- **何时用**：有固定顺序、每步要检查的任务：名单 CSV 分步导入（Upload → Map columns → Review changes → Confirm import）。2–5 步；只有一页表单时不用。
- **结构**：`nav.ck-stepper aria-label="Import steps"` + `ol` + 每步 `li.ck-step`：序号圆 `ck-step-marker`（数字或对勾图标）+ `ck-step-label`（步骤名 + `ck-step-status` 状态文字）。当前步 `aria-current="step"`；内容区标题重复当前步名（"Step 3 of 4: Review changes"）；底部 `ck-stepper-footer`："Back"（左）+ 下一步主按钮（右，"Continue to review"）。
- **状态**（每步都有**文字**，不只靠颜色或图标）：
  | 状态 | 视觉 | 状态文字 |
  |---|---|---|
  | 未开始 | `line-strong` 描边圆、次要文字 | "Not started" |
  | 当前 | `ink` 描边圆、加粗 | "Current step" |
  | 已完成 `is-complete` | 黑底白对勾、可点击回到该步（链接） | "Completed" |
  | 需处理 `is-error` | `danger-ink` 描边与文字 + 提醒图标 | "Needs attention: 2 rows" |
- **行为**：后面的步骤不能跳过；回到前面的步骤不丢已填内容；最后一步写清楚将发生什么（"This will add 12 residents and update 3."）。导入在服务端执行时用 `ck-progress` 表示任务进度。
- **不要**：把 Stepper 当标签页用；在最后一步之前就写入数据；超过 5 步（拆成独立流程）。

### 12A.8 差异对比视图 `ck-diff`
- **何时用**：名单导入前的差异、州规则包 / 模板 / 流程配置的版本对比、发布前确认。
- **结构**：摘要 `ck-diff-summary`（"3 added · 2 changed · 1 removed"，每项是 `ck-tag`）→ 列表 `ul.ck-diff` → 每条 `li.ck-diff-row ck-diff-row--added | --changed | --removed`：状态标签 + 标题 `ck-diff-title`（对象名或 ID）+ 字段对比 `dl.ck-diff-fields`（每个字段：`dt` 字段名、`dd` 新值、`dd.ck-diff-old` 旧值）。
- **状态不只靠颜色**：每条同时有 ① 标签文字（`ck-tag--success` "＋ Added" / `ck-tag--warning` "~ Changed" / `ck-tag--danger` "− Removed"）② 符号 ③ 左侧 3px 竖线；旧值删除线 + `color-ink-soft`，并有视觉隐藏前缀 "Previous value:"，新值前缀 "New value:"。
- **行为**：默认只显示有变化的字段；可切换 "Show unchanged fields"（分段控件）。条目多时分组或分页，并可按类型筛选。需要逐条决定（例如可能重复的行）时，每条带单选或操作按钮，决定结果写在行内。
- **careKind 特别规则**：只对比管理字段（姓名、房号、角色、状态、配置项）；**不对比临床内容**。删除的住户在机构管理端写 "Moved out / Removed from roster"，不是"删除记录"（记录按保留期保留）。
- **不要**：只用红绿底色表示变化；把增删改混在一个无标签的列表里；在差异视图里直接写入（写入在 Stepper 最后一步确认后）。

### 12A.9 审计日志视图 `ck-audit-list`
- **何时用**：审计日志页、单个对象的"History"标签页、支持访问记录。数据只追加，界面**没有**编辑和删除。
- **结构**：上方用数据表筛选栏（§12A.3：操作人、动作类型、对象类型、日期范围 §12A.5）→ `ol.ck-audit-list`（按时间倒序）→ 每条 `li.ck-audit-entry`：时间 `ck-audit-time`（`time` 元素，DD/MM/YYYY + 时间 + 时区）→ 动作 `ck-audit-action`（"Grace Liu changed the Tier 3 notification route"）→ 元信息 `ck-audit-meta`（操作人角色、养老院、对象 ID `ck-audit-id`、来源：Web / API / Support access）→ 原因 `ck-audit-reason`（支持访问、暂停租户等需要填写原因的动作）。需要排序或多列对比时可改用 `ck-table`，内容规则相同。
- **显示规则**：只显示**谁、何时、做了什么、对哪个对象（ID）、改了哪些字段名**；**不显示**字段的健康信息内容、记录正文、转写文本。Super Admin 视图里住户只显示 ID（"Resident R-0193"）。非临床配置字段（例如开关从 Off 到 On）可以显示前后值。
- **键盘与 ARIA**：列表是普通 `ol`；加载更多用按钮（"Load older entries"），不做无限滚动；导出用按钮并写明格式。
- **不要**：在审计日志里显示可编辑控件；截断时间戳；用"刚刚"代替绝对时间；显示 IP 以外的设备指纹（⚠️ 是否显示 IP 待 PRD 确认）。

### 12A.10 危险操作确认对话框（输入名称确认，基于 `ck-dialog`）
- **何时用**：后果严重且难以撤销的操作：暂停 / 终止租户、发布州规则包、停用整个养老院。普通的可撤销删除仍用 §11.3 的确认对话框或 Toast + Undo。
- **结构**：`dialog.ck-dialog.ck-dialog--confirm-name`：标题（问题形式 + 提醒图标："Suspend Wattle Grove Care Group?"）→ 后果列表 `ck-confirm-consequences`（谁会受影响、多少人、能否恢复、恢复方式）→ 原因字段（必填，写入审计日志）→ 确认字段：标签 "Type **Wattle Grove Care Group** to confirm"（名称放在 `ck-confirm-phrase` 里）→ 底部：安全选项（"Keep tenant active"，左）+ 最终按钮 `ck-btn--danger-solid`（"Suspend tenant"，右）。
- **行为**：名称匹配规则：去掉首尾空格后**区分大小写**完全一致；允许粘贴（无障碍）。最终按钮保持可点（§3）：不匹配时点击显示行内错误 "The name doesn't match. Type Wattle Grove Care Group exactly."，不提交。在确认字段里按 Enter **不提交**。提交时按钮 loading（"Suspending…"、`aria-busy`），成功后关闭并用 Toast 告知，同时写审计。
- **初始焦点**：原因字段（第一个输入框）；关闭后焦点回到触发按钮。点遮罩不关闭（有输入）。
- **不要**：只用一个"确定"按钮；把名称预填进输入框；用这个模式处理日常操作（会让用户习惯性输入）。

### 12A.11 数字卡片 Stat card `ck-stat`
- **何时用**：Owner 看板、Super Admin 运营监控中展示**计数类**数字（例如 "Active staff"、"Notes confirmed this week"）。
- **结构**：`ul.ck-stat-grid` → `li.ck-stat`：标签 `ck-stat-label`（名词："Notes confirmed"）→ 数字 `ck-stat-value`（等宽数字，可带单位 `ck-stat-unit`）→ **测量口径** `ck-stat-measure`（必填：统计范围、时间段、数据来源，"Confirmed by nurses at Banksia Park, 13/10/2026–19/10/2026. Source: careKind records."）→ `ck-stat-footer`：数据标记 `ck-tag`。
- **数据标记**（必填其一）：Demo 和预生成数据显示 `ck-tag` "Pre-generated sample"（并在页面标识条说明 fictional）；真实数据显示更新时间（"Updated 18/10/2026 9:00 am AEDT"）。没有数据时数字位置写 "No data yet" 并说明原因，**不显示 0 冒充**。
- **careKind 特别规则（禁止）**：**禁止**趋势箭头、上升 / 下降颜色、迷你走势图、评分、等级、"改善 x%" / "节省 x 小时"、红黄绿风险色、员工个人排名。卡片默认中性配色（`ink` / `ink-soft` / `line`），不按数字大小变色；不能由系统推算或补全数字（DESIGN.md §7.3、PRD §9 G3、机构管理端 PRD §4.7）。
- **不要**：没有口径的裸数字；把临床事件次数做成看板"指标"；点击卡片跳到住户临床内容。

### 12A.12 法律依据与边界
- 查阅：`docs/PRD.md` §9（G1–G11）、`03-legal-compliance/tga-samd-boundary.md`（不做评分、风险、趋势）、两份管理端 PRD §4 / §9.1；未新增数据收集或临床功能。tga-boundary-check：🟢（只有管理界面组件，界面文字不含 detect / predict / monitor / risk）。审计与支持访问的具体字段以 PRD 为准。运营参考，不是法律意见。

## 13. 待做与不在本文件范围

| 组件 / 模式 | 状态 | 说明 |
|---|---|---|
| 可搜索下拉 Combobox | 已写规格（18/10/2026，待 Lin 评审） | §12A.4；`preview.html` 交互样例待补 |
| 日期 / 时间选择 | 已写规格（18/10/2026，待 Lin 评审） | §12A.5：原生 input，显示 DD/MM/YYYY |
| 侧边抽屉 Drawer | 已写规格（18/10/2026，待 Lin 评审） | §12A.6 |
| 底部抽屉 Bottom sheet | 待做（DS-2 第二批） | 手机上的次要操作和筛选 |
| 步骤条 Stepper | 已写规格（18/10/2026，待 Lin 评审） | §12A.7：机构管理端名单 CSV 分步导入 |
| 数字输入 | 待做 | 有具体需求时再做（YAGNI） |
| 桌面应用框架与侧边导航 | 已写规格（18/10/2026，待 Lin 评审）（§12A.1、§12A.2 页面头部） | Super Admin、机构管理端都需要；现有 App bar / Tab bar 是手机用（`docs/prds/2026-10-18-super-admin-multi-facility-console.md` §9.1、`2026-10-18-provider-portal-facility-admin.md` §9.1） |
| 数据表：筛选 / 排序 / 批量操作 | 已写规格（18/10/2026，待 Lin 评审）（§12A.3） | 在 `ck-table` 基础上扩展；员工、住户、Provider 列表 |
| 差异对比视图 | 已写规格（18/10/2026，待 Lin 评审）（§12A.8） | 名单导入差异、配置和流程版本对比 |
| 审计日志视图 | 已写规格（18/10/2026，待 Lin 评审）（§12A.9） | 只追加记录的浏览和筛选；不显示健康信息内容 |
| 危险操作确认（输入名称确认） | 已写规格（18/10/2026，待 Lin 评审）（§12A.10） | 在 `ck-dialog` 基础上扩展；终止 / 暂停租户、发布规则包 |
| 数字卡片 Stat card | 已写规格（18/10/2026，待 Lin 评审）（§12A.11） | 数字 + 测量口径 + 样例标记；禁止趋势、评分、风险色 |
| AI 草稿标注、原文并排、新增 / 改写高亮、低置信度标记 | **DS-4（R3）** | 需 Lin 评审和可用性测试，不要自行发明 |
| 老人归属选择与同名提示、敏感事件逐条确认、确认动作 | **DS-4（R3）** | 同上 |
| 深色模式 | 待做（DS-1 后续） | |
| 代码组件库（React / React Native 等） | **DS-5** | 等 ADR-0001 技术栈 |

## 14. 变更记录
| 日期 | 变更 | 作者 |
|---|---|---|
| 11/10/2026 | 初稿：通用组件规格（按钮、表单、下拉与菜单、选择、上传、导航、展示、反馈、弹层、加载与空状态），参考 CSS 与交互样例；在浏览器里用键盘逐项测试 | Gary（演示）/ Claude Code |
| 18/10/2026 | 新增 §12A 管理端组件规格（应用框架与侧边导航、页面头部、数据表扩展、Combobox、日期时间、Drawer、Stepper、差异对比、审计日志、名称确认对话框、数字卡片）与 `components.css` 参考实现；§13 对应条目改为待 Lin 评审。**未做浏览器测试，`preview.html` 尚无样例** | Claude Code |

> 运营参考，不是法律意见。

## 14. 参考图对应的品牌组件（11/10/2026 重制）

| 组件 / 类 | 形态与规格 | 响应式 / 状态 |
|---|---|---|
| Hero / ck-hero | 左侧衬线 display 标题 + CTA；右侧原创线稿与小浮卡；2:1 | 小屏单列；CTA 是有效页内导航 |
| 连续章节 / ck-section | 白底或 full-width subtle；无圆角 wrapper；大留白 | 内边距响应式；完整保留内容 |
| 三联媒体 / ck-media-grid | 1:2.8:1；小圆角、窄缝、白色标签、角落浮卡 | 小屏堆叠；浮卡回正常文档流 |
| 悬浮信息卡 / ck-floating-card | 白底、line 边、radius-lg、shadow-1；品牌标题衬线 | 不承载真实住户信息；不将审核操作藏在覆盖图层 |
| 分段套件条 / ck-segmented--bar | 外条 radius-sm；选中项黑底，正文字号；全宽等分 | 手机两列；button + aria-pressed；键盘 Tab / Enter / Space |
| 横向类别条 / ck-feature-strip | 图标 + 文本，上下细分隔线 | 小屏两列；最后一项可占满 |
| 标题 / ck-display、ck-section-heading、ck-brand-title | display font + regular；其余工作文字 sans | 按 DESIGN.md §4 的明确层级缩放 |
| 页脚 / ck-brand-footer | ink 底、on-ink 字；巨型衬线 wordmark | 手机完整呈现；链接有焦点环 |
| 装饰图 / ck-decoration | 透明 PNG，保持比例；图库复用 ck-component-grid / ck-component-panel，下载用 ck-btn--editorial | 品牌层使用；手机单列；下载有名称、键盘焦点和完整原图 |
| 文案状态样例 | unsaved / saved / loading / error 分开，保留文字与状态图标 | 合成输入只在当前页内存；保存按钮明确说明是设计演示 |


装饰图纯点缀时用空 alt；图库提供描述性 alt 与标题。小幅变体 `ck-decoration--accent` 用 space-9，
媒体变体 `ck-decoration--media` 在现有媒体卡内使用；只引用现有 tokens。
图片不作为错误、审核或保存状态的唯一表达；关联下载链接沿用 Button 的 focus/hover 状态。

Mini 图库 `ck-mini-grid`：沿用 Card / Button，默认三列、手机两列；使用
`repeat(auto-fit, minmax(min(100%, size-dialog-sm / 3), 1fr))` 保证极窄与大字号回流。
`ck-decoration--mini` 宽度为 space-8 × 2；`ck-decoration--mini-sm/md` 分别为 space-8 / space-9。
不新增交互状态；下载与焦点沿用现有控件。

品牌文字按钮 `ck-btn--editorial` 为黑字加箭头；工作层 `ck-btn--text` 的链接表现保留。普通 `ck-card` 默认细描边、无阴影；真正悬浮的卡片另用 `ck-floating-card`，避免所有卡片漂浮。

法律依据：沿用 DESIGN.md §7、§9 及主 PRD §9，未新增临床功能。tga-boundary-check：🟢，仅设计构图与文书界面样例，无评分 / 诊断 / 疗效承诺。运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

## 18/10/2026 后台统一视觉修订（Draft）
- Owner: Lightman · Status: Local revision · Last reviewed: 18/10/2026
- 登录和登录后均采用白底、sans 工作标题、同一 Button / Field / Card / Tag。不在工作页使用营销 Hero 或装饰浮卡。
- AppShell：桌面细分隔侧栏、带线性图标的导航、轻量顶栏；姓名和角色分两行。Super Admin 顶栏只写职能，完整权限组放侧栏底部；不改变权限过滤。
- 窄屏：品牌与 Menu 同行，顶栏显示紧凑账户信息；菜单在导航后自动收起。所有内容能回流。
- PageHeader：统一间距、medium 标题、底部分隔；详情和新建页用既有 Breadcrumb。Form：左侧说明、右侧 Card 内单表单，窄屏单列；同一表单只有一个 submit。
- Table / DataTable：桌面细边框、较宽行距，名称链接使用 ink + underline。手机呈现带字段名的逐条记录；保留原生表格及显式 table/row/cell 角色、caption、排序按钮；排序头仅展示可排序列，字段标签不代替原有表头关联。长 ID 可换行，空状态和加载不伪造记录。
- 所有数值使用现有 tokens；不新增色板、依赖、诊断/评分/趋势组件或业务能力。共享组件修订也会影响采用这些组件的 Provider Portal，其运行界面不在本次验收范围。

## 18/10/2026 品牌插画与界面动效（Owner 请求的视觉增强）
Owner: Lightman · Status: Local revision · Last reviewed: 18/10/2026

- Owner 明确要求页面增加图片、动画及更 cool 的视觉表现；工作页允许在 PageHeader 使用辅助品牌插画，替代此前“不用装饰图”的一般指导；临床/数据字段不加入装饰。
- `WorkspaceArtwork`：复用设计系统原创透明 PNG（hands-and-heart、nurse-review、companionship），由 shared brand 原样提供；care / notes / connections 三个主题使用既有 media-sage / media-warm / surface-subtle。纯装饰，容器 aria-hidden，图像空 alt，不代表用户成果、AI 执行或健康状态。
- 登录为视觉面板 + 工作表单双栏；手机将品牌缩为紧凑图文条，表单保持主要区域。后台 PageHeader 可选 artwork，工作标题仍为 sans，插画与操作分开。
- 动效：一次性短入场（opacity/translate）、插画一次性展开、按钮/导航 hover 微位移；不循环、不闪烁、不移动数据行，不改变权限或提交语义。所有时间与位移由现有 token 推导。
- `prefers-reduced-motion: reduce` 时关闭新增动画及位移，内容始终可见；不依赖动画完成才允许操作。键盘焦点沿用 shared。
