# RecalloDemo (SwiftUI MVP)

这是一个基于 ShipSwift 思路搭建的最小可运行 SwiftUI demo，用来验证 Recallo 的产品结构。

## 当前包含页面
- 首页（Dashboard）
- AI 助手页
- 设置页

## 代码结构
- `RecalloDemoApp.swift` — App 入口
- `ContentView.swift` — 底部 Tab 导航
- `DashboardView.swift` — 今日复习 / 掌握度 / 趋势 / 热图
- `AIAssistantView.swift` — AI 对话页
- `SettingsView.swift` — 设置页
- `Recipes/` — 从 ShipSwift MCP 拉下来的参考 recipes

## 说明
当前版本优先验证：
1. Recallo 的页面结构
2. Stitch 设计稿 → ShipSwift / SwiftUI 落地路径
3. iOS demo 的最小可运行性

后续可以继续替换为真正的 ShipSwift 组件实现，例如：
- Activity Heatmap
- Chat Module
- Settings View
- Onboarding View
