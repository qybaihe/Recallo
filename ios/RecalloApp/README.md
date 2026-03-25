# RecalloApp

这是基于 Recallo Stitch 设计稿翻译出来的一套完整 SwiftUI App 源码结构。

## 当前包含页面
- 首页 Home
- 学科详情 Subject Detail
- 学习进度 Progress
- AI 学习助手 Assistant
- 设置 Settings
- 引导页 Onboarding

## 目录结构
- `App/`：App 入口与 Tab 容器
- `Models/`：示例数据模型
- `Components/`：通用卡片等基础组件
- `Views/`：按页面拆分的 SwiftUI 页面
- `Assets/`：预留资源目录

## 状态说明
当前仓库内已具备：
1. Stitch 导出的完整设计稿资产
2. 对应的 SwiftUI 页面源码
3. 一个最小 `RecalloDemo` 和一个更完整的 `RecalloApp` 源码结构

## 注意
当前这台机器没有完整 Xcode.app，只有 Command Line Tools，因此这里提供的是**可直接纳入 Xcode 的源码结构**，但没有在本机生成 `.xcodeproj` 并做真机构建验证。

如果你在装有 Xcode 的机器上：
- 新建一个 iOS App 工程
- 把 `RecalloApp/` 下源码拖进去
- 即可继续编译运行和迭代
