# src

Owner: Lin (Tech Lead) · Last reviewed: 04/10/2026

## 用途
App 源代码的四层结构。

## 内容
- domain/ — 业务规则（10 个功能模块）
- application/ — 用例编排
- adapters/ — 外部系统
- interfaces/ — API 和 App 界面

## 怎么用
- 依赖方向：interfaces → application → domain；adapters 实现 domain 接口
