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

- pre-commit 会运行 `scripts/build-design-system.sh --check`：生成文件过期、或任何前景 / 背景组合的对比度低于 WCAG 2.2 AA 的要求，都会拒绝提交。
- **治理**：改 token 的数值由 Gary 提 PR；涉及临床确认和 AI 内容的规则（§7.4）由 Lin 评审，状态由 Lightman 批准。状态只能由人从 `Draft` 改为 `Approved`。
- 我们的**参考风格**由 Lightman 在 11/10/2026 选定（见 §1.2）。参考图是第三方设计（Microva+，Rylic Studio），**未存入本仓库**（版权），只记录从中提取的风格和实测数值。

---

## 1. 设计立场

### 1.1 一句话
**温暖、清楚、专业、不炒作**（`07-marketing-ops/brand/brand-guide.md`）。像一位可靠的同事：安静、留白多、字大、按钮明确，让护士把注意力放在照护上。

### 1.2 参考风格：采用什么，不采用什么
选定的参考风格有几个鲜明特征。我们**采用它的形式语言**，不采用它的内容模式。

| 采用（风格） | 在 careKind 里怎么落地 |
|---|---|
| 暖米色画布 + 白色卡片 + 近黑文字，整体柔和 | `color-canvas` / `color-surface` / `color-ink`（§3.1） |
| 近黑的**药丸形**主按钮，描边药丸做次按钮 | §6.1：按钮全部用 `radius-pill` |
| 药丸形标签 / 分段控件，标签前带彩色小圆点 | §6.2、§6.4；圆点**必须**配文字（颜色不能是唯一信息） |
| 大标题紧凑行高、略收紧字距，字重中等偏轻 | §4；仅营销页 / 引导页使用 `display` 级 |
| 很大的留白，内容分区清楚 | §5：区块间距 `space-9` |
| 白色悬浮卡片 + 很淡很散的阴影 | `shadow-1`（§3.5） |
| 手绘线稿插画（表情、气球等），让产品有温度 | §8：插画只用我们自己创作的线稿，不复制参考图里的任何插画 |
| 深色页脚 + 超大字母品牌名 | §6.8（仅营销页） |

| **不采用**（内容模式） | 原因 |
|---|---|
| "Health Score"、百分比评分、趋势曲线、"Improve up to 30%" 这类效果承诺 | 评分 / 预测 / 改善声明会把产品推向 TGA 医疗器械范围，也有 ACL 误导性陈述风险（`rules/01-operations-rules.md` §1；`rules/03-product-design-rules.md` §4）。careKind **不提供**评分、风险、趋势类组件 |
| "Insights"、"Science-backed"、"Personalized recommendations" 的措辞 | 禁用词：detect、predict、risk score、monitor condition、clinical insights（`rules/01` §1） |
| 浅灰小字（对比度不足） | 不达标。我们把次要文字加深（`color-ink-soft`），并强制检查对比度 |
| 图里的小号控件和紧凑点击区域 | 戴手套、单手场景，最小点击区域 `size-target-min`（§9） |
| 参考图的照片、插画、Logo、字体、文案 | 版权归原作者，不得复制。我们用自己的素材（§8） |

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
| `--color-canvas` | `#E8E4DC` | measured | 页面最外层的暖米色背景 |
| `--color-surface` | `#FFFFFF` | measured | 卡片、导航、输入框的底色 |
| `--color-surface-subtle` | `#F5F5F5` | measured | 分区背景、分段控件的底 |
| `--color-ink` | `#111111` | measured | 正文、主按钮底色、深色页脚 |
| `--color-ink-soft` | `#5F5F5F` | derived | 次要文字（参考图的浅灰字对比度不足 AA，这里加深） |
| `--color-on-ink` | `#FFFFFF` | measured | 深色底上的文字 |
| `--color-line` | `#DAD6CE` | derived | 装饰性分割线、卡片描边（不用于控件边界） |
| `--color-line-strong` | `#767676` | derived | 输入框、复选框等控件边界（与背景对比度 ≥ 3:1） |
| `--color-green` | `#00A84E` | measured | 强调色（大字、图形）；不能用于小号正文 |
| `--color-green-soft` | `#42A572` | measured | 进度条填充等图形 |
| `--color-green-ink` | `#007A3D` | derived | 绿色的文字 / 图标版本（成功状态） |
| `--color-blue` | `#45B1FF` | measured | 数据点、进度条；对比度不足 3:1，必须配文字或图案 |
| `--color-blue-ink` | `#0B6BCB` | derived | 蓝色的文字 / 图标版本（信息状态、链接） |
| `--color-amber` | `#FDB43C` | measured | 状态小圆点；必须配文字 |
| `--color-amber-ink` | `#8A5A00` | derived | 琥珀色的文字 / 图标版本（提醒状态） |
| `--color-purple` | `#A078F9` | measured | AI 相关标记的装饰色 |
| `--color-purple-ink` | `#5B3FC2` | derived | AI 草稿标记的文字 / 图标版本 |
| `--color-danger-ink` | `#C62828` | proposed | 错误与不可撤销操作（参考图里没有红色，这是我们提议的值） |
| `--color-green-tint` | `#E6F6EC` | derived | 成功状态的浅底 |
| `--color-blue-tint` | `#E5F3FF` | derived | 信息状态的浅底 |
| `--color-amber-tint` | `#FFF4DB` | derived | 提醒状态的浅底 |
| `--color-purple-tint` | `#F1ECFF` | derived | AI 内容的浅底（AI 新增 / 改写内容的高亮） |
| `--color-danger-tint` | `#FCEBEB` | proposed | 错误状态的浅底 |

#### 字体（`font`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--font-family-sans` | `ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif` | proposed | 系统字体栈。参考图的显示字体没有识别出来（⚠️ 需核实）；品牌字体待 Lightman / Gary 选定并检查许可，选定前用系统字体，不引入网络字体 |
| `--font-size-caption` | `0.875rem` | proposed | 14px。只用于次要说明，不能承载必须看到的信息 |
| `--font-size-body` | `1rem` | proposed | 16px。App 正文的最小字号 |
| `--font-size-body-lg` | `1.125rem` | proposed | 18px。审核界面的记录正文 |
| `--font-size-title` | `1.25rem` | proposed | 20px。卡片标题 |
| `--font-size-heading-sm` | `1.5rem` | proposed | 24px。页面小标题 |
| `--font-size-heading` | `2rem` | proposed | 32px。页面标题 |
| `--font-size-display-sm` | `2.5rem` | proposed | 40px。营销页小号大标题 |
| `--font-size-display` | `3.5rem` | proposed | 56px。仅营销页和引导页的大标题，临床工作界面不用 |
| `--font-weight-regular` | `400` | proposed | 正文 |
| `--font-weight-medium` | `500` | measured | 大标题（参考图的标题是中等偏轻的字重）、按钮 |
| `--font-weight-semibold` | `600` | proposed | 小标题、强调 |
| `--font-leading-tight` | `1.05` | measured | 大标题的紧凑行高（参考图的特征） |
| `--font-leading-heading` | `1.2` | proposed | 标题行高 |
| `--font-leading-body` | `1.5` | proposed | 正文行高 |
| `--font-tracking-display` | `-0.02em` | measured | 大标题的字距略收紧 |

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
| `--space-9` | `96px` | measured | 区块之间的大留白（参考图的特征：留白很大） |

#### 圆角（`radius`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--radius-sm` | `8px` | proposed | 小元素、输入框内部 |
| `--radius-md` | `12px` | measured | 卡片（近似值，需在设计稿里核对） |
| `--radius-lg` | `20px` | measured | 大图片、大卡片（近似值） |
| `--radius-pill` | `999px` | measured | 按钮、标签、分段控件：参考图最鲜明的特征 |

#### 阴影（`shadow`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--shadow-1` | `0 1px 2px rgba(17, 17, 17, 0.06), 0 8px 24px rgba(17, 17, 17, 0.06)` | measured | 悬浮卡片：很淡很散的阴影（近似值） |
| `--shadow-2` | `0 2px 4px rgba(17, 17, 17, 0.08), 0 16px 40px rgba(17, 17, 17, 0.10)` | proposed | 弹层、菜单 |

#### 尺寸（`size`）

| Token | 值 | 来源 | 用途 |
|---|---|---|---|
| `--size-target-min` | `48px` | proposed | 最小可点击区域。戴手套、单手场景的提议值，⚠️ 需在 DS-2 用实测验证；WCAG 2.2 AA 的最低要求需对照官方原文核实 |
| `--size-control-height` | `48px` | proposed | 按钮、输入框的默认高度 |
| `--size-control-height-lg` | `56px` | proposed | 主要操作按钮（如确认）的高度 |
| `--size-container` | `1200px` | measured | 营销页内容最大宽度（近似值） |
| `--size-breakpoint-md` | `900px` | proposed |  |
| `--size-breakpoint-lg` | `1200px` | proposed |  |

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
| 正文 / 米色底 | `--color-ink` | `--color-canvas` | 14.89:1 | ≥ 4.5:1 | ✅ |
| 正文 / 浅灰区 | `--color-ink` | `--color-surface-subtle` | 17.32:1 | ≥ 4.5:1 | ✅ |
| 次要文字 / 白底 | `--color-ink-soft` | `--color-surface` | 6.38:1 | ≥ 4.5:1 | ✅ |
| 次要文字 / 米色底 | `--color-ink-soft` | `--color-canvas` | 5.03:1 | ≥ 4.5:1 | ✅ |
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
<!-- tokens:end -->

### 3.x 使用规则
- **代码里只用 token 名**（如 `var(--color-ink)`），**不得写死十六进制、像素值**。设计稿里也只引用 token。
- **成对使用**：文字用 `-ink` 版本，背景用 `-tint` 版本（例如 `--color-green-ink` 在 `--color-green-tint` 上）。`green`、`blue`、`amber`、`purple` 这几个原色只用于**图形、小圆点、进度条**，不用于小号文字。
- 新增颜色必须先过对比度检查（在 `tokens.json` 的 `contrast` 里登记使用场景），不过就不能进。
- `proposed` 来源的值是我们的提议，**在被 Lightman / Lin 确认前不要当作最终品牌色**（尤其是 `danger-ink`、`size-target-min`）。

---

## 4. 排版
- **字体**：先用系统字体栈（`--font-family-sans`），**不引入网络字体**。品牌字体 `{{TBD：Lightman / Gary 选定，并检查许可}}`；选定前 DS-1 不得假设某款字体。
- **层级**：`display`（营销页）→ `heading` → `heading-sm` → `title` → `body-lg`（记录正文）→ `body`（默认）→ `caption`（仅次要说明）。
- 大标题（display、display-sm）：字重 `weight-medium`，行高 `leading-tight`，字距 `tracking-display`；**一屏最多一个**。
- 正文行高 `leading-body`；一行不超过约 70 个字符（中文约 35 个字）。
- **`caption`（14px）不能承载必须看到的信息**（时间、住户名、事件类型、错误原因）。
- 文字用 `rem`，**必须**随用户的系统字号放大而缩放（不能写死 px）。
- 界面语言与记录语言分开设置；组件必须容得下更长的翻译文本（不截断临床信息，不溢出布局）。

## 5. 布局与间距
- 4px 基础网格；间距只用 `space-*`。组件内部用 `space-2` 到 `space-4`，组件之间用 `space-5` 到 `space-6`，区块之间用 `space-8` 到 `space-9`。
- 营销页内容最大宽度 `size-container`；工作层 App 用满屏宽度，列宽由内容决定。
- 响应式断点：`size-breakpoint-md`、`size-breakpoint-lg`。小屏（手机）优先设计；单手操作时，主操作放在拇指能到的位置（屏幕下半部）。
- 卡片：`color-surface` 底，`radius-md`（大卡片 `radius-lg`），描边 `color-line` 或 `shadow-1`，**二选一**，不要同时叠加。

## 6. 组件规格
> 本节是 DS-2 的起点：先定形态和规则，尺寸细节、状态和代码在 DS-2 / DS-5 完成。预览见 `design-system/preview.html`。

### 6.1 按钮
| 类型 | 外观 | 用途 |
|---|---|---|
| 主按钮 | `color-ink` 底、`color-on-ink` 字、`radius-pill`、高 `size-control-height`；主要确认操作用 `size-control-height-lg` | 每个界面区域**最多一个** |
| 次按钮 | `color-surface` 底、1px `color-ink` 描边、`radius-pill` | 次要操作 |
| 文字按钮 | 无底、`color-blue-ink` 文字 + 可选箭头图标 | 低强调（"了解更多"） |
| 危险按钮 | `color-danger-ink` 描边或底，文字说明后果 | 不可撤销操作；`proposed` |
- 状态：默认 / 悬停 / 按下 / 聚焦（`focus-ring`）/ 禁用 / 加载。禁用态也要保证文字可读，并说明为什么不可用。
- 标签用动词（"确认记录"，不是"确定"）；图标放在文字**右侧**，并且文字不可省略（图标不能单独表达意思）。

### 6.2 标签（Chip / Tag）
药丸形、1px `color-line` 描边、`color-surface` 底；可带前置小圆点（状态色）。**圆点旁必须有文字**。仅用于分类和状态，不用于可点击的主操作。

### 6.3 输入框 / 选择器
`color-surface` 底、1px `color-line-strong` 边（控件边界对比度 ≥ 3:1）、`radius-md`、高 `size-control-height`；标签永远显示在外面（**不能只用占位符当标签**）；错误信息用 `color-danger-ink` + 图标 + 文字，并说明怎么改。

### 6.4 分段控件 / 标签页
选中项：`color-ink` 底 + `color-on-ink` 字；未选中项：`color-surface-subtle` 底；`radius-pill`；选中状态不能只靠颜色，要有字重或图标变化。

### 6.5 卡片
见 §5。卡片标题 `title`，内容 `body`；整张卡片可点击时，点击区域覆盖整张卡片并有清楚的聚焦样式。

### 6.6 进度条
轨道 `color-surface-subtle`，填充 `color-green-soft`（≥ 3:1）；旁边**必须**显示文字（"上传 70%"）。**只用于任务进度（上传、同步），不用于表示健康状况或评分。**

### 6.7 提示（Alert / Banner）
`-tint` 底 + `-ink` 文字 + 图标 + 文字标题；状态：成功（green）、信息（blue）、提醒（amber）、错误（danger）、AI（purple）。

### 6.8 导航与页脚（营销层）
导航：白底，品牌在左，链接居中，右侧登录 + 次按钮药丸。页脚：`color-ink` 底、`color-on-ink` 字，可用超大字母品牌名。工作层 App 的导航在 DS-2 设计。

### 6.9 待设计（不在本文件定稿）
- **DS-2**：表单、列表 / 表格、空状态、加载、离线 / 同步状态、触控尺寸实测。
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
- 图片一律有替代文字（alt）。

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
| 2 | 品牌字体（选定并检查许可）；选定前用系统字体 | Lightman / Gary |
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
