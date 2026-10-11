# CLAUDE.md — design-system（设计 tokens 与预览）

> 层级：子部门 / 功能区 · 路径：`06-app-development/design/design-system/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
设计系统的 tokens（唯一数值来源）、生成的 CSS 变量和预览页。规则在上一级的 `DESIGN.md`。

## 在这里通常要做的事
- 改 tokens 的数值，然后运行 `scripts/build-design-system.sh`
- 更新预览页

## 本目录特有的规则（在根目录规则之外）
- **改数值只改 `tokens.json`**，然后重新生成；`tokens.css` 和 `DESIGN.md` 里"tokens:begin/end"之间的表格是生成物，**不要手改**
- 新增颜色要在 `tokens.json` 的 `contrast` 里登记使用场景，对比度不达标（WCAG 2.2 AA）不能提交
- `source` 必须如实标注：measured（从参考图实测）/ derived（推导）/ proposed（提议，待确认）；**不要把 proposed 写成 measured**
- 参考图是第三方设计，不得存入仓库，也不得复制其照片、插画、Logo、文案
- 预览页和示例只用合成数据，不出现真实住户或员工信息
- 不新增评分、风险、趋势类组件（TGA 红灯，见 DESIGN.md §7.3）
- 改组件样式先改 `../COMPONENTS.md` 的规格，再改 components.css 和样例；改完在浏览器里用键盘测一遍

## 关键文件
- tokens.json
- tokens.css（生成）
- preview.html（风格总览）
- components.css（组件参考实现）
- components.html（组件交互样例）

## 不要做
- 不要在代码或设计稿里写死十六进制颜色或像素值
- 不要手改生成的文件

## 相关
- ../DESIGN.md
- scripts/build-design-system.sh
- docs/prds/2026-10-11-carekind-design-system.md
