# COMPONENTS.md — careKind AI 组件规格（Source of Truth）

Owner: Lightman (PO) · Assignee: Gary · Reviewer: Lin · Status: **Draft** · Last reviewed: 11/10/2026
上级规范：[`DESIGN.md`](DESIGN.md)（风格、tokens、全局规则）· PRD 工作包：DS-2 通用组件规格（[`docs/prds/2026-10-11-carekind-design-system.md`](../../docs/prds/2026-10-11-carekind-design-system.md)）

> **做任何界面之前，先在这里找现成的组件。** 能用现成组件就不要自己画；确实需要新组件或新变体，先在这里补规格，再实现。本文件和 `DESIGN.md` 冲突时，以 `DESIGN.md` 为准。运营参考，不是法律意见。

---

## 0. 怎么用

| 内容 | 位置 | 说明 |
|---|---|---|
| 规格（用途、变体、状态、键盘、无障碍、文案） | 本文件 | 唯一来源 |
| 参考实现（CSS） | [`design-system/components.css`](design-system/components.css) | 与框架无关；类名前缀 `ck-`；只引用 token。先引入 `tokens.css` 再引入它 |
| 交互样例 | [`design-system/components.html`](design-system/components.html) | 每个组件的变体和状态，可用键盘试用；内容全部是合成示例 |
| 数值 | [`design-system/tokens.json`](design-system/tokens.json) | 不在本文件写数值，只写 token 名 |
| 给人看的版本 | [`COMPONENTS.html`](COMPONENTS.html) | 由本文件生成，不要手改 |

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
| 选项很多（约 15 个以上）、需要搜索 | 可搜索下拉 Combobox（**待做**，§13） |
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
- **卡片 Card** `ck-card`：阴影（默认）或描边（`--outlined`）二选一。整张可点击用 `ck-card--interactive`（一个链接或按钮包住整张卡片），卡片里不要再放其他可点击元素。
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

## 13. 待做与不在本文件范围

| 组件 / 模式 | 状态 | 说明 |
|---|---|---|
| 可搜索下拉 Combobox | 待做（DS-2 第二批） | 选项多时使用；需要支持输入过滤和键盘 |
| 日期 / 时间选择 | 待做（DS-2 第二批） | 优先用原生 `input type="date" / "time"`；日期显示 DD/MM/YYYY |
| 底部抽屉 Bottom sheet / 侧边抽屉 Drawer | 待做（DS-2 第二批） | 手机上的次要操作和筛选 |
| 步骤条 Stepper、数字输入 | 待做 | 有具体需求时再做（YAGNI） |
| AI 草稿标注、原文并排、新增 / 改写高亮、低置信度标记 | **DS-4（R3）** | 需 Lin 评审和可用性测试，不要自行发明 |
| 老人归属选择与同名提示、敏感事件逐条确认、确认动作 | **DS-4（R3）** | 同上 |
| 深色模式 | 待做（DS-1 后续） | |
| 代码组件库（React / React Native 等） | **DS-5** | 等 ADR-0001 技术栈 |

## 14. 变更记录
| 日期 | 变更 | 作者 |
|---|---|---|
| 11/10/2026 | 初稿：通用组件规格（按钮、表单、下拉与菜单、选择、上传、导航、展示、反馈、弹层、加载与空状态），参考 CSS 与交互样例；在浏览器里用键盘逐项测试 | Gary（演示）/ Claude Code |

> 运营参考，不是法律意见。
