# DESIGN.md — careKind AI 设计规范（Source of Truth）

Owner: Lightman (PO) · Assignee: Gary · Reviewer: Lin · Status: **Draft** · Last reviewed: 11/10/2026
PRD：[`docs/prds/2026-10-11-carekind-design-system.md`](../../docs/prds/2026-10-11-carekind-design-system.md)（本文件是其工作包 DS-1 的产出，并为 DS-2、DS-3、DS-4 提供基础）

> **所有人和所有 AI agent：做任何界面、组件、插画、文案之前，先读本文件。** 设计稿、前端代码、营销页、演示都以这里为准；本文件与别处冲突时以这里为准（法律和 PRD §9 护栏除外，护栏优先）。运营参考，不是法律意见。

---

## 0. 怎么用、怎么改

| 内容 | 唯一来源 | 怎么改 |
|---|---|---|
| **数值**（颜色、字号、间距、圆角、阴影、尺寸、动效、对比度要求） | [`design-system/tokens.json`](design-system/tokens.json) | 改 `tokens.json` → 运行 `scripts/build-design-system.sh` → 一起提交（生成 `tokens.css` 和下面 §3 的表格；**不要手改**） |
| **规则**（什么时候用什么、组件怎么用、不能做什么） | 本文件 §1–§2、§4–§10 | 直接改，PR 里写理由 |
| **预览** | [`design-system/preview.html`](design-system/preview.html) | 用浏览器打开；它引用生成的 `tokens.css`，不另存数值 |
| **唯一视觉入口** | [`design-system/preview.html`](design-system/preview.html) | Hero、Typography、颜色、组件和状态集中在同一页；不再生成独立文档 HTML |

- pre-commit 会运行 `scripts/build-design-system.sh --check`：生成文件过期、或任何前景 / 背景组合的对比度低于 WCAG 2.2 AA 的要求，都会拒绝提交。
- **治理**：改 token 的数值由 Gary 提 PR；涉及临床确认和 AI 内容的规则（§7.4）由 Lin 评审，状态由 Lightman 批准。状态只能由人从 `Draft` 改为 `Approved`。
- 我们的**参考风格**由 Lightman 在 11/10/2026 选定（见 §1.2）。参考图是第三方设计（Microva+，Rylic Studio），**未存入本仓库**（版权），只记录从中提取的风格和实测数值。

---

## 1. 设计立场

### 1.1 一句话
**温暖、清楚、专业、不炒作**（`07-marketing-ops/brand/brand-guide.md`）。像一位可靠的同事：安静、留白多、字大、按钮明确，让护士把注意力放在照护上。

### 1.2 参考图落地：Microva+ 的连续编辑式页面

11/10/2026 按 Lightman 再次提供的两张原始截图重新校准。上一版的无衬线大标题、圆角 sheet 堆叠、大范围阴影及全药丸 tab 均不符合参考，已修正。下表规定实际形态，而非抽象风格关键词。

| 参考图的具体特征 | 标准实现 | 验收方式 |
|---|---|---|
| 米色外框 / 白色连续内页 / 浅灰分区 / 黑色页脚 | canvas / surface / surface-subtle / ink；只有最外画布是米色 | preview.html 一页展示四种底色；不得每节套米色圆角卡片 |
| 高对比衬线大标题，正文是中性 sans | family-display / family-sans；标题 regular 400 | Hero、章节标题、字号样张、页脚都必须真实渲染衬线 |
| Hero 左大标题、右小浮卡，标题有短行节奏 | ck-hero；桌面 2:1；标题 measure-hero；手机单列 | 不能改为全居中模板；不强制手机沿用桌面断行 |
| 三联人物媒体，中间明显更宽 | ck-media-grid；比例 1:2.8:1；小圆角、窄间隔 | 原创线稿构图样张标明媒体位置；没有授权照片时不冒充成品照片 |
| 小白色 pill 标签 + 黑色 pill CTA | ck-tag / ck-btn；少量彩色点 + 文字 | 装饰标签与可点击目标分开；触控目标至少 target-min |
| 白色浮卡叠于媒体角落 | ck-floating-card；细描边 + 极轻阴影 | 仅浮卡和弹层使用阴影；普通区块不悬浮 |
| 产品套件是矩形白色横条，选中项黑色小圆角 | ck-segmented--bar；radius-sm | 不将该变体画成胶囊；手机两列重排 |
| 横向图标条、灰底承托的小白卡 | ck-feature-strip / ck-card--outlined | 对齐、分隔线、小圆角与图一致 |
| 黑色页脚，衬线巨型字标 | ck-brand-footer / ck-wordmark | 手机完整显示；不裁切品牌名称 |

### 1.2.1 数值来源与保留内容
- **实测仅四个颜色**：原始图像像素频次确认 canvas `#EAE6DE`、surface `#FFFFFF`、surface-subtle `#F7F7F7`、ink `#111111`。其余尺寸、字重、行高、圆角、阴影是推导或提议，不能称为截图实测。
- **确切字体未知**：截图清楚显示衬线，但不能据此确定字体文件。采用 Times New Roman / Georgia 系统字体族复现形式；最终字体许可仍待确认。中文标题用宋体回退。
- 采用构图、排版和控件形态；参考图的 Logo、照片、插画、文案不入库。预览使用原创线稿和明确标注的合成界面。
- careKind 的内容仍为文书辅助；参考图的健康评分、改善百分比、效果证言不转为 careKind 功能或证据。任务进度组件可用于上传 / 同步。

### 1.3 设计原则（继承 `ux-principles.md`，并变成可检查的规则）
1. **单手、戴手套、被打断**：主操作按钮 ≥ `size-control-height-lg`；自动保存草稿。
2. **护士是作者**：确认是有意识的动作；AI 内容必须看得出来（§7.4）。
3. **不用颜色单独表达意思**：状态一律「颜色 + 文字或图标」。
4. **字够大**：App 正文 ≥ 16px；记录正文 18px。
5. **低带宽**：不依赖网络字体；图片可延迟加载；动效可关闭。
6. **尊重的语言**：person-centred（"older person"、"resident"）。
7. **只用合成数据**：设计稿、预览、截图里**不得**出现真实住户或员工信息。

---

## 2. 两层：品牌层与工作层
| | 品牌层（营销页、引导、演示） | 工作层（护士日常使用的 App） |
|---|---|---|
| 目的 | 让人信任、愿意试用 | 让护士快速、准确地完成记录 |
| 排版 | 可用 `display` 大标题、大留白、插画 | **不用** `display`；标题最大 `heading`；信息密度更高但留白仍充足 |
| 动效 | 轻微的进入动效 | 几乎没有；只有状态反馈 |
| 点击区域 | ≥ `size-target-min` | ≥ `size-target-min`，主操作 `size-control-height-lg` |
| 图片 | 可用人物照片（需同意 / 授权） | 不用装饰性照片；用图标和文字 |
| 颜色 | 全套 | 以 `ink` / `surface` / 状态色为主；强调色只用于状态和 AI 标记 |

---

## 3. Design tokens

<!-- tokens:begin -->

> 本节由 `scripts/build-design-system.sh` 从 `design-system/tokens.json` 生成，**不要手工修改**。来源：measured = 从选定的参考图实测；derived = 由实测值推导（满足 WCAG 2.2 AA）；proposed = 参考图里没有，我们提议的值，待确认。

#### 颜色（`color`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--color-canvas` | `#EAE6DE` | measured | 两张原始参考图的米色外画布，RGB (234,230,222)，像素频次采样 |
| `--color-surface` | `#FFFFFF` | measured | 参考图白色主体，像素频次采样 |
| `--color-surface-subtle` | `#F7F7F7` | measured | 参考图浅灰横向分区，RGB (247,247,247)，像素频次采样 |
| `--color-ink` | `#111111` | measured | 参考图近黑按钮与页脚，RGB (17,17,17)，像素频次采样 |
| `--color-ink-soft` | `#5F5F5F` | derived | 次要文字（参考图的浅灰字对比度不足 AA，这里加深） |
| `--color-on-ink` | `#FFFFFF` | derived | 深色底上的文字 |
| `--color-line` | `#E6E6E3` | derived | 中性细分隔线；参考图中的连续白色版面，不用米色描边包住每个区块 |
| `--color-line-strong` | `#767676` | derived | 输入框、复选框等控件边界（与背景对比度 ≥ 3:1） |
| `--color-green` | `#00A84E` | derived | 强调色（大字、图形）；不能用于小号正文 |
| `--color-green-soft` | `#42A572` | derived | 进度条填充等图形 |
| `--color-green-ink` | `#007A3D` | derived | 绿色的文字 / 图标版本（成功状态） |
| `--color-blue` | `#45B1FF` | derived | 数据点、进度条；对比度不足 3:1，必须配文字或图案 |
| `--color-blue-ink` | `#0B6BCB` | derived | 蓝色的文字 / 图标版本（信息状态、链接） |
| `--color-amber` | `#FDB43C` | derived | 状态小圆点；必须配文字 |
| `--color-amber-ink` | `#8A5A00` | derived | 琥珀色的文字 / 图标版本（提醒状态） |
| `--color-purple` | `#A078F9` | derived | AI 相关标记的装饰色 |
| `--color-purple-ink` | `#5B3FC2` | derived | AI 草稿标记的文字 / 图标版本 |
| `--color-danger-ink` | `#C62828` | proposed | 错误与不可撤销操作（参考图里没有红色，这是我们提议的值） |
| `--color-green-tint` | `#E6F6EC` | derived | 成功状态的浅底 |
| `--color-blue-tint` | `#E5F3FF` | derived | 信息状态的浅底 |
| `--color-amber-tint` | `#FFF4DB` | derived | 提醒状态的浅底 |
| `--color-purple-tint` | `#F1ECFF` | derived | AI 内容的浅底（AI 新增 / 改写内容的高亮） |
| `--color-danger-tint` | `#FCEBEB` | proposed | 错误状态的浅底 |
| `--color-overlay` | `rgba(17, 17, 17, 0.5)` | proposed | 弹窗背后的遮罩 |
| `--color-media-warm` | `#DDD5C8` | derived | 由米色画布推导的媒体构图底色；仅装饰 |
| `--color-media-sage` | `#D5DED6` | derived | 低饱和照护媒体底色；仅装饰 |

#### 字体（`font`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--font-family-sans` | `Arial, "Helvetica Neue", "PingFang SC", "Microsoft YaHei", sans-serif` | proposed | 正文与控件用中性无衬线系统字体，避免默认粗重系统标题；不依赖网络字体 |
| `--font-size-caption` | `0.875rem` | proposed | 14px。只用于次要说明，不能承载必须看到的信息 |
| `--font-size-body` | `1rem` | proposed | 16px。App 正文的最小字号 |
| `--font-size-body-lg` | `1.125rem` | proposed | 18px。审核界面的记录正文 |
| `--font-size-title` | `1.25rem` | proposed | 20px。卡片标题 |
| `--font-size-heading-sm` | `1.5rem` | proposed | 24px。页面小标题 |
| `--font-size-heading` | `2rem` | proposed | 32px。页面标题 |
| `--font-size-display-sm` | `2.5rem` | proposed | 40px。营销页小号大标题 |
| `--font-size-display` | `3.5rem` | proposed | 56px。仅营销页和引导页的大标题，临床工作界面不用 |
| `--font-weight-regular` | `400` | proposed | 正文 |
| `--font-weight-medium` | `500` | derived | 按钮和界面标签；品牌衬线标题使用 regular 400 |
| `--font-weight-semibold` | `600` | proposed | 小标题、强调 |
| `--font-leading-tight` | `1.05` | derived | 大标题的紧凑行高（参考图的特征） |
| `--font-leading-heading` | `1.2` | proposed | 标题行高 |
| `--font-leading-body` | `1.5` | proposed | 正文行高 |
| `--font-tracking-display` | `-0.035em` | derived | Times 衬线大标题光学校准字距；是推导值，不是原图可测值 |
| `--font-family-display` | `"Times New Roman", Georgia, "Songti SC", "Noto Serif CJK SC", serif` | derived | 品牌标题与页脚采用高对比衬线系统字体；参考图确为衬线，确切字体未知，未声称同款。中文回退宋体 |
| `--font-size-hero` | `4.5rem` | derived | 桌面 Hero 72px；由参考图比例推导；移动端 40px |
| `--font-size-section` | `3.5rem` | derived | 品牌章节标题 56px，移动端 32px |
| `--font-size-wordmark` | `clamp(2.5rem, 12vw, 11rem)` | derived | 巨型页脚衬线字标；字号随容器收缩 |
| `--font-measure` | `64ch` | derived | 正文最大行长；长段落不跨整屏 |
| `--font-measure-hero` | `16ch` | derived | Hero 标题行长，参考图多行短句的比例 |

#### 间距（`space`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--space-1` | `4px` | proposed | 基础网格 4px |
| `--space-2` | `8px` | proposed |  |
| `--space-3` | `12px` | proposed |  |
| `--space-4` | `16px` | proposed |  |
| `--space-5` | `24px` | proposed |  |
| `--space-6` | `32px` | proposed |  |
| `--space-7` | `48px` | proposed |  |
| `--space-8` | `64px` | proposed |  |
| `--space-9` | `96px` | derived | 区块之间的大留白（参考图的特征：留白很大） |
| `--space-section` | `80px` | derived | 桌面连续页面的章节上下内边距；手机 48px |

#### 圆角（`radius`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--radius-sm` | `4px` | proposed | 矩形分段条、嵌套小面板 |
| `--radius-md` | `8px` | derived | 普通卡片、输入框、媒体卡 |
| `--radius-lg` | `12px` | derived | 大幅媒体、悬浮卡；整页主体不设圆角 |
| `--radius-pill` | `999px` | derived | 按钮、标签、分段控件：参考图最鲜明的特征 |

#### 阴影（`shadow`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--shadow-1` | `0 4px 16px rgba(17, 17, 17, 0.04)` | derived | 仅悬浮信息卡，轻阴影推导值，不能铺满全页 |
| `--shadow-2` | `0 2px 4px rgba(17, 17, 17, 0.08), 0 16px 40px rgba(17, 17, 17, 0.10)` | proposed | 弹层、菜单 |
| `--shadow-none` | `none` | derived | 静态卡片无阴影；用细描边或浅灰衬底 |

#### 尺寸（`size`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--size-target-min` | `48px` | proposed | 最小可点击区域。戴手套、单手场景的提议值，⚠️ 需在 DS-2 用实测验证；WCAG 2.2 AA 的最低要求需对照官方原文核实 |
| `--size-control-height` | `48px` | proposed | 按钮、输入框的默认高度 |
| `--size-control-height-lg` | `56px` | proposed | 主要操作按钮（如确认）的高度 |
| `--size-control-height-sm` | `40px` | proposed | 紧凑控件。仅桌面端（指针精确）的密集表格里使用，触屏和戴手套场景不用 |
| `--size-listbox-max-height` | `320px` | proposed | 下拉列表的最大高度，超出滚动 |
| `--size-container` | `1200px` | derived | 营销页内容最大宽度（近似值） |
| `--size-breakpoint-md` | `900px` | proposed |  |
| `--size-breakpoint-lg` | `1200px` | proposed |  |
| `--size-icon-sm` | `16px` | proposed | 小图标（标签、行内） |
| `--size-icon-md` | `20px` | proposed | 默认图标（按钮内、输入框内） |
| `--size-icon-lg` | `24px` | proposed | 大图标（空状态、提示） |
| `--size-avatar-sm` | `32px` | proposed | 头像（列表） |
| `--size-avatar-md` | `40px` | proposed | 头像（默认） |
| `--size-avatar-lg` | `56px` | proposed | 头像（档案头部） |
| `--size-checkbox` | `24px` | proposed | 复选框 / 单选框的可见方框；外面的点击区域仍是 size-target-min |
| `--size-switch-width` | `52px` | proposed | 开关宽度 |
| `--size-switch-height` | `32px` | proposed | 开关高度；点击区域由外层补足到 size-target-min |
| `--size-toast-width` | `400px` | proposed | Toast 最大宽度（手机上占满宽度减边距） |
| `--size-dialog-sm` | `440px` | proposed | 确认类对话框宽度 |
| `--size-dialog-md` | `640px` | proposed | 表单类对话框宽度 |
| `--size-menu-min` | `200px` | proposed | 下拉列表和菜单的最小宽度 |
| `--size-field-max` | `480px` | proposed | 单个表单字段的最大宽度 |
| `--size-shell` | `1328px` | derived | 白色连续页面的最大宽度，外框露出米色 |
| `--size-page-inset` | `64px` | derived | 桌面白色主体左右内边距；移动端 space-5 |
| `--size-hero-aside` | `320px` | derived | Hero 右侧悬浮信息卡最大宽度 |
| `--size-media-height` | `360px` | derived | 桌面三联媒体的高度 |
| `--size-badge-height` | `28px` | derived | 非交互药丸标签；交互目标仍至少 48px |
| `--size-status-dot` | `8px` | derived | 标签装饰圆点 |
| `--size-breakpoint-sm` | `640px` | derived | 手机单列断点；CSS media query 用同值，变量不能用作查询条件 |

#### 层级（`z`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--z-dropdown` | `1000` | proposed | 下拉列表、菜单、弹出层 |
| `--z-sticky` | `1100` | proposed | 吸顶的导航、表头 |
| `--z-overlay` | `1200` | proposed | 遮罩 |
| `--z-modal` | `1300` | proposed | 对话框 |
| `--z-toast` | `1400` | proposed | Toast（要盖住对话框，否则看不到） |
| `--z-tooltip` | `1500` | proposed | Tooltip |

#### 焦点（`focus`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--focus-ring` | `0 0 0 2px #FFFFFF, 0 0 0 5px #111111` | proposed | 键盘焦点：白色内圈 + 黑色外圈，在深浅底上都清楚 |

#### 动效（`motion`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--motion-duration-fast` | `120ms` | proposed |  |
| `--motion-duration-base` | `200ms` | proposed |  |
| `--motion-easing-standard` | `cubic-bezier(0.2, 0, 0, 1)` | proposed | 用户设置了"减少动态效果"时，所有动效必须关闭或改为淡入淡出 |

#### 对比度检查（WCAG 2.2 AA：正文 ≥ 4.5:1，大字与图形 ≥ 3:1）

| 用途 | 前景 | 背景 | 对比度 | 要求 | 结果 |
|---|---|---|---|---|---|
| 正文 / 白底 | `--color-ink` | `--color-surface` | 18.88:1 | ≥ 4.5:1 | ✅ |
| 正文 / 米色底 | `--color-ink` | `--color-canvas` | 15.17:1 | ≥ 4.5:1 | ✅ |
| 正文 / 浅灰区 | `--color-ink` | `--color-surface-subtle` | 17.62:1 | ≥ 4.5:1 | ✅ |
| 次要文字 / 白底 | `--color-ink-soft` | `--color-surface` | 6.38:1 | ≥ 4.5:1 | ✅ |
| 次要文字 / 米色底 | `--color-ink-soft` | `--color-canvas` | 5.13:1 | ≥ 4.5:1 | ✅ |
| 主按钮文字、页脚文字 | `--color-on-ink` | `--color-ink` | 18.88:1 | ≥ 4.5:1 | ✅ |
| 控件边界 / 白底 | `--color-line-strong` | `--color-surface` | 4.54:1 | ≥ 3:1 | ✅ |
| 绿色大字、图形（不用于小号文字） | `--color-green` | `--color-surface` | 3.12:1 | ≥ 3:1 | ✅ |
| 进度条填充 | `--color-green-soft` | `--color-surface` | 3.06:1 | ≥ 3:1 | ✅ |
| 成功状态文字 | `--color-green-ink` | `--color-green-tint` | 4.87:1 | ≥ 4.5:1 | ✅ |
| 链接、信息文字 | `--color-blue-ink` | `--color-surface` | 5.27:1 | ≥ 4.5:1 | ✅ |
| 信息状态文字 | `--color-blue-ink` | `--color-blue-tint` | 4.67:1 | ≥ 4.5:1 | ✅ |
| 提醒状态文字 | `--color-amber-ink` | `--color-amber-tint` | 5.42:1 | ≥ 4.5:1 | ✅ |
| AI 草稿标记文字 | `--color-purple-ink` | `--color-purple-tint` | 6.19:1 | ≥ 4.5:1 | ✅ |
| AI 标记文字 / 白底 | `--color-purple-ink` | `--color-surface` | 7.15:1 | ≥ 4.5:1 | ✅ |
| 错误状态文字 | `--color-danger-ink` | `--color-danger-tint` | 4.87:1 | ≥ 4.5:1 | ✅ |
| 错误文字 / 白底 | `--color-danger-ink` | `--color-surface` | 5.62:1 | ≥ 4.5:1 | ✅ |
| 占位符、次要文字 / 浅灰区 | `--color-ink-soft` | `--color-surface-subtle` | 5.96:1 | ≥ 4.5:1 | ✅ |
| 悬停行、选中项的文字 | `--color-ink` | `--color-surface-subtle` | 17.62:1 | ≥ 4.5:1 | ✅ |
| 浅灰区上的控件边界 | `--color-line-strong` | `--color-surface-subtle` | 4.23:1 | ≥ 3:1 | ✅ |
| Toast、Tooltip 文字 | `--color-on-ink` | `--color-ink` | 18.88:1 | ≥ 4.5:1 | ✅ |
| 浅灰区上的链接 | `--color-blue-ink` | `--color-surface-subtle` | 4.92:1 | ≥ 4.5:1 | ✅ |
| 悬停的主按钮、Toast 按钮悬停 | `--color-on-ink` | `--color-ink-soft` | 6.38:1 | ≥ 4.5:1 | ✅ |
| 危险主按钮文字 | `--color-on-ink` | `--color-danger-ink` | 5.62:1 | ≥ 4.5:1 | ✅ |
| Toast 里的成功图标 | `--color-green` | `--color-ink` | 6.03:1 | ≥ 3:1 | ✅ |
| Toast 里的信息图标 | `--color-blue` | `--color-ink` | 8.08:1 | ≥ 3:1 | ✅ |
| Toast 里的提醒图标 | `--color-amber` | `--color-ink` | 10.58:1 | ≥ 3:1 | ✅ |
| Toast 里的错误图标 | `--color-danger-ink` | `--color-ink` | 3.35:1 | ≥ 3:1 | ✅ |
| 米色底上的次要文字 | `--color-ink-soft` | `--color-canvas` | 5.13:1 | ≥ 4.5:1 | ✅ |
| 媒体暖底文字 | `--color-ink` | `--color-media-warm` | 12.97:1 | ≥ 4.5:1 | ✅ |
| 媒体灰绿底文字 | `--color-ink` | `--color-media-sage` | 13.71:1 | ≥ 4.5:1 | ✅ |
<!-- tokens:end -->

### 3.x 使用规则
- **代码里只用 token 名**（如 `var(--color-ink)`），**不得写死十六进制、像素值**。设计稿里也只引用 token。例外：1–3px 的边框 / 笔画粗细、图标线宽、`0`、百分比，可以直接写。
- **成对使用**：文字用 `-ink` 版本，背景用 `-tint` 版本（例如 `--color-green-ink` 在 `--color-green-tint` 上）。`green`、`blue`、`amber`、`purple` 这几个原色只用于**图形、小圆点、进度条**，不用于小号文字。
- 新增颜色必须先过对比度检查（在 `tokens.json` 的 `contrast` 里登记使用场景），不过就不能进。
- `proposed` 来源的值是我们的提议，**在被 Lightman / Lin 确认前不要当作最终品牌色**（尤其是 `danger-ink`、`size-target-min`）。

---

## 4. Typography：衬线品牌标题 + 无衬线工作文字

| 角色 | 字族 / 字重 | 桌面 → 手机 | 行高 / 字距 | 用途 |
|---|---|---|---|---|
| Hero | family-display / regular | size-hero → size-display-sm（72 → 40px） | leading-tight / tracking-display | 左对齐，最多约三行，不用 sans 粗体替代 |
| 品牌章节标题 | family-display / regular | size-section → size-heading（56 → 32px） | leading-tight / tracking-display | 留白与标题共同构成分区 |
| 品牌卡片标题 | family-display / regular | size-heading-sm（24px） | leading-heading | 仅品牌展示卡 |
| 工作页标题 | family-sans / medium | size-heading（32px） | leading-heading | 日常工作界面，保持可扫读 |
| 工作卡片标题 | family-sans / semibold | size-title（20px） | leading-heading | 用于队列 / 表单 |
| 记录正文 | family-sans / regular | size-body-lg（18px） | leading-body（1.5） | 原文、草稿、需审核内容 |
| 正文 / 按钮 / 错误 | family-sans / regular 或 medium | size-body（16px） | leading-body；按钮继承 | 必须看到的信息不降为 caption |
| 标注 / 非关键说明 | family-sans / regular | size-caption（14px） | leading-body | token 名、示例说明 |
| 页脚字标 | family-display / regular | size-wordmark（响应式） | leading-tight / tracking-display | 黑底白字，不用加粗 sans |

- CSS 类：`ck-display`、`ck-section-heading`、`ck-brand-title`、`ck-wordmark`。统一定义于 `design-system/editorial.css`，预览和组件目录共用。
- 英文系统字族 Times New Roman / Georgia；中文 Songti SC 回退。不依赖外部字体请求；实际字体不是已识别的原图字体。
- 字号以 rem；正文行长不超过 measure；英文 Hero 行长 measure-hero。200% 文本放大时可增加行数，不截断。
- 字体、字号、字重、行高、字距分别控制，不能用默认浏览器 h1 / h2 样式代替。
- 两张参考图均为桌面版的不同缩放，**没有手机设计稿**；下列手机规则是此系统的响应式推导。


## 5. 布局与间距
- **外画布** canvas；**内页** surface，最大 shell，无圆角。桌面外边距 space-6，内边距 page-inset；手机外边距 space-3，内边距 space-5。
- 连续章节上下留白 space-section；手机 space-7。只在章节边界使用 line 细线，浅灰分区占满白色主体宽度。
- Hero 桌面为 2:1 文案 / 浮卡，三联媒体为 1:2.8:1；手机 Hero 和媒体改为单列，不裁掉必要信息。
- 浮卡最大 hero-aside，媒体高度 media-height。图片和浮卡用 radius-lg，普通展示卡和字段用 radius-md，分段横条用 radius-sm，按钮和标签才用 pill。
- 普通卡片默认细描边 + 无阴影；浮卡允许细描边 + shadow-1。不要给每个展示区块加阴影。
- breakpoints 640 / 900 / 1200px 来自 size-breakpoint-*。CSS 自定义变量不能用在 media query 条件；查询可使用 token 同值，变更时要同步。
- 工作层保留 target-min 和 control-height-lg，以戴手套和临床审核可读性为优先。响应式手机不使用 40px 紧凑按钮。

## 6. 组件规格
> 本节只列最基本的形态规则。**完整的组件规格**（用途、变体、状态、键盘与 ARIA、文案）在 [`COMPONENTS.md`](COMPONENTS.md)，参考 CSS 在 `design-system/components.css`，交互样例统一在 `design-system/preview.html#components`。两者冲突时以本文件为准。

### 6.1 按钮
| 类型 | 外观 | 用途 |
|---|---|---|
| 主按钮 | `color-ink` 底、`color-on-ink` 字、`radius-pill`、高 `size-control-height`；主要确认操作用 `size-control-height-lg` | 每个界面区域**最多一个** |
| 次按钮 | `color-surface` 底、1px `color-ink` 描边、`radius-pill` | 次要操作 |
| 文字按钮 | 无底、`color-ink` 文字 + 箭头（品牌层）；正文链接保持可识别下划线 | 低强调（"了解更多"） |
| 危险按钮 | `color-danger-ink` 描边或底，文字说明后果 | 不可撤销操作；`proposed` |
- 状态：默认 / 悬停 / 按下 / 聚焦（`focus-ring`）/ 禁用 / 加载。禁用态也要保证文字可读，并说明为什么不可用。
- 标签用动词（"确认记录"，不是"确定"）；图标放在文字**右侧**，并且文字不可省略（图标不能单独表达意思）。

### 6.2 标签（Chip / Tag）
药丸形、1px `color-line` 描边、`color-surface` 底；可带前置小圆点（状态色）。**圆点旁必须有文字**。仅用于分类和状态，不用于可点击的主操作。

### 6.3 输入框 / 选择器
`color-surface` 底、1px `color-line-strong` 边（控件边界对比度 ≥ 3:1）、`radius-md`、高 `size-control-height`；标签永远显示在外面（**不能只用占位符当标签**）；错误信息用 `color-danger-ink` + 图标 + 文字，并说明怎么改。

### 6.4 分段控件 / 标签页
选中项：`color-ink` 底 + `color-on-ink` 字；未选中项：`color-surface-subtle` 底；工作层 `radius-pill`；品牌套件条使用 `radius-sm` 的矩形 `ck-segmented--bar`；选中状态不能只靠颜色，要有字重或图标变化。

### 6.5 卡片
见 §5。品牌卡片标题用 family-display / heading-sm；工作卡片标题用 sans / title，内容 body；整张卡片可点击时，点击区域覆盖整张卡片并有清楚的聚焦样式。

### 6.6 进度条
轨道 `color-surface-subtle`，填充 `color-green-soft`（≥ 3:1）；旁边**必须**显示文字（"上传 70%"）。**只用于任务进度（上传、同步），不用于表示健康状况或评分。**

### 6.7 提示（Alert / Banner）
`-tint` 底 + `-ink` 文字 + 图标 + 文字标题；状态：成功（green）、信息（blue）、提醒（amber）、错误（danger）、AI（purple）。

### 6.8 导航与页脚（营销层）
导航：白底，品牌在左，链接居中，右侧登录 + 次按钮药丸。页脚：`color-ink` 底、`color-on-ink` 字，可用超大字母品牌名。工作层 App 的导航在 DS-2 设计。

### 6.9 待设计（不在本文件定稿）
- **DS-2 第一批已完成**（见 `COMPONENTS.md`）：按钮、表单字段、原生下拉与自定义 Dropdown、菜单、复选框 / 单选 / 开关、上传、标签页、分段控件、面包屑、分页、App bar、Tab bar、标签、徽标、头像、卡片、列表、表格、手风琴、Alert、Toast、对话框、Tooltip、进度、Spinner、骨架屏、空状态。
- **DS-2 第二批**：可搜索下拉 Combobox、日期 / 时间选择、底部抽屉 / 侧边抽屉；触控尺寸的戴手套实测。
- **DS-4（高风险，需 Lin 评审）**：AI 草稿标注、新增 / 改写内容高亮、原文并排、低置信度标记、老人归属选择与同名提示、敏感事件逐条确认、确认动作、安全失败。**这些在 DS-4 设计和可用性测试前，不要自行发明样式。**

## 7. 状态与 AI 内容
### 7.1 状态色
| 状态 | 文字 / 图标 | 底 | 注意 |
|---|---|---|---|
| 成功 | `color-green-ink` | `color-green-tint` | 配"已完成"之类文字 |
| 信息 | `color-blue-ink` | `color-blue-tint` | |
| 提醒 | `color-amber-ink` | `color-amber-tint` | 提醒不等于判断（不要写"风险"） |
| 错误 | `color-danger-ink` | `color-danger-tint` | 说明发生了什么、怎么办 |
| AI | `color-purple-ink` | `color-purple-tint` | 见 §7.4 |

### 7.2 颜色不是唯一信息
任何状态都要有文字或图标；彩色小圆点必须有同行文字；图表（如果有）要有图案或数据标签。

### 7.3 不显示评分与趋势
careKind **不提供**健康评分、风险等级、趋势预测、"改善 x%" 一类的组件或文案（TGA 红灯与 ACL 风险）。需要展示数字时，只展示**护士自己输入**的数值，系统不推算、不补全、不报警（`docs/PRD.md` §9 G3）。

### 7.4 AI 内容标记（原则；具体样式由 DS-4 设计）
- AI 起草 / 整理的内容**必须**看得出来：用 `color-purple-tint` 底 + `color-purple-ink` 的标签"AI 草稿"，文字旁有图标；**不能只靠颜色**。
- 护士自己说的原话与 AI 整理的内容要能分辨（并排显示、AI 新增 / 改写高亮）。
- 确认是**有意识的动作**：不用"一键全部确认"处理敏感事件；主确认按钮用 `size-control-height-lg` 并说明后果。
- 界面用语：只用"起草 / 整理 / 请你确认"，不用"检测 / 预测 / 监测"。

## 8. 图像与插画
- **插画**：手绘线稿风格（近黑线条、留白、少量强调色），让产品有温度。**只用我们自己创作或获得授权的插画**，不复制参考图里的人物、气球或任何素材。
- **照片**：真实人物（尤其是住户、员工）必须有**书面同意**或使用有授权的素材；演示和截图只用合成数据（`rules/01-operations-rules.md` §1）。人物要多样（年龄、文化、性别），表现尊重的照护场景。
- 不使用暗示"诊断 / 检测"的画面（例如体征仪读数大特写配"评分"）。
- 图片一律有 alt 属性；纯装饰且语义已由相邻文字表达时用 `alt=""`，承担独立信息时写简洁描述。


### 8.1 Decoration 配图库
- 四张透明 PNG 收录于 `design-system/decoration-*-v1.png`；实际提示词与原始出处见 `design-system/decorations-prompts.json`。
- [预览页 Decoration](design-system/preview.html#decorations) 展示陪伴沟通、护士审核、双手托心、茶杯与植物，并提供原图下载；人物均为 AI 生成虚构角色。
- 仅用于品牌层标题旁、介绍、流程说明和页尾，不替代工作层状态图标、审核按钮或记录信息。
- `ck-decoration` 保留原图比例与透明度，浅色底展示；小幅点缀使用 `space-9`，图库最大宽度使用 `size-hero-aside`。不得裁切或用 CSS filter 改色。
- 图库复用现有 Card、Grid 与 Button；手机单列。原图为 1254 × 1254 位图，未矢量化。
- Mini decoration：新增笑脸、单线爱心、枝叶、气球、小花、星芒六张更轻的透明底线描，见 [小配图库](design-system/preview.html#mini-decorations)。完整实际提示词见 `design-system/mini-decorations-prompts.json`。
- Mini 仅点缀品牌文字，默认用 `space-9` 显示；图库用 `space-8 × 2`，同时展示 `space-8`、`space-9`、`space-8 × 2` 的真实尺寸。保持原始线条，不通过降低 opacity 或 CSS filter 制造轻线效果。
- Mini 图库桌面三列、手机两列；极窄或放大文字时按最小宽度自动单列。星芒为装饰图，不替代标准 Logo 或 AI 状态图标。
- TGA boundary check：🟢，只表达陪伴、人工审核与休息意象，无新增临床功能或效果声明。依据主 PRD §9、`03-legal-compliance/tga-samd-boundary.md`。运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。

## 9. 无障碍（目标 WCAG 2.2 AA）
- **对比度**：由 `tokens.json` 的 `contrast` 列表强制检查（见 §3 的表）。
- **点击区域**：≥ `size-target-min`（我们的提议值，更严格；⚠️ 需在 DS-2 实测验证；WCAG 2.2 的具体成功标准需对照 W3C 官方原文核实，本地资料库没有）。
- **键盘与焦点**：所有可交互元素可用键盘操作，焦点样式用 `focus-ring`，**不得去掉**。
- **屏幕阅读器**：图标按钮有可访问名称；状态变化有 `aria-live` 提示；表单错误与字段关联。
- **缩放与字号**：支持系统字号放大到 200% 不丢内容；不锁定屏幕方向。
- **动效**：尊重"减少动态效果"；不使用闪烁。
- **多语言**：文本方向、长文本、字体回退都要测试。
- 本地资料缺口：⚠️ Disability Discrimination Act 1992 与 WCAG 2.2 原文本地无资料，需律师 / 官方来源确认（PRD §4.5）。

## 10. 文案（与 DS-3 衔接）
- 语气：温暖 · 清楚 · 专业 · 不炒作（`07-marketing-ops/brand/brand-guide.md`）。用 "older people"、"residents"，不用 "the elderly"、"patients"（居家以外场景）。
- 界面文字**必须**跑 `tga-boundary-check`；禁用词见 `rules/01-operations-rules.md` §1。
- 澳式英语（organisation、colour），日期 DD/MM/YYYY。
- 完整的文案规范和安全替代词表在 DS-3 产出，定稿后链接到这里。

## 11. Do / Don't
| ✅ Do | ❌ Don't |
|---|---|
| 只引用 token 名 | 写死十六进制颜色或像素值 |
| 状态 = 颜色 + 文字 / 图标 | 只用颜色表达状态 |
| 每个区域一个主按钮 | 多个并列的黑色主按钮 |
| 让确认成为有意识的动作 | "全部确认"处理敏感事件 |
| 用合成数据做设计稿和演示 | 出现真实住户或员工信息 |
| 用自己创作的插画和授权的照片 | 复制参考图的素材 |
| 展示护士输入的数值 | 展示评分、风险、趋势、"改善 x%" |
| 次要文字用 `color-ink-soft` | 用浅灰小字 |

## 12. 待确认（`{{TBD}}`）
| # | 事项 | Owner |
|---|---|---|
| 1 | Logo（本规范不含）与最终品牌主色是否沿用参考图的黑 + 米色 + 强调色 | Lightman |
| 2 | 原图字体准确识别与授权；当前品牌衬线使用 Times New Roman / Georgia 系统字体 | Lightman / Gary |
| 3 | `size-target-min`、`size-control-height*` 通过戴手套实测后确认 | Gary（DS-2）+ 护士测试 |
| 4 | `danger-ink`、`shadow-2` 等 `proposed` 值的确认 | Lightman / Lin |
| 5 | 深色模式 | Gary（DS-1 后续） |
| 6 | 参考图中 `radius-md/lg`、`shadow-1`、`size-container` 的近似值，在设计稿里核对 | Gary |
| 7 | WCAG 2.2 成功标准与 DDA 1992 的官方原文核实 | Lightman / 律师 |

## 13. 变更记录
| 日期 | 变更 | 作者 |
|---|---|---|
| 11/10/2026 | 初稿：Lightman 选定参考风格；从两张参考图实测颜色并建立 tokens；规范与生成脚本；对比度检查 | Gary（演示）/ Claude Code |

> 运营参考，不是法律意见。

## 13. 本次复核的法律依据与边界
- `docs/PRD.md` §6 / §9：预览仍以文书起草与人工审核为主题，不改变记录确认流程。
- `03-legal-compliance/references/law-library/tga-digital-scribes-summary.md` 与 `03-legal-compliance/tga-samd-boundary.md`：采用视觉形式，不复制健康评分、疗效改善数字、临床解读等内容。
- `03-legal-compliance/references/law-library/ahpra-ai-in-healthcare-summary.md`：保留人工审核表述。
- 八项设计问题的适用范围：无新数据流 / 第三方存储 / 自动决策 / provider 义务 / 州级规则；不新增临床风险或同意流程；预览字段仅合成输入且只存于页面内存。
- tga-boundary-check：🟢，设计样例仅描述起草、记录和人工审核；不改变预期用途。运营参考，不是法规意见；🟡/🔴 需要法规顾问确认。
