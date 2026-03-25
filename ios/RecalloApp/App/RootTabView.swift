import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("首页", systemImage: "house.fill") }

            SubjectDetailView()
                .tabItem { Label("学科", systemImage: "book.fill") }

            ProgressViewScreen()
                .tabItem { Label("进度", systemImage: "chart.line.uptrend.xyaxis") }

            AssistantViewScreen()
                .tabItem { Label("AI 助手", systemImage: "sparkles") }

            SettingsViewScreen()
                .tabItem { Label("设置", systemImage: "gearshape.fill") }
        }
    }
}
