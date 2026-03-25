import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("首页", systemImage: "house.fill") }

            AIAssistantView()
                .tabItem { Label("AI 助手", systemImage: "sparkles") }

            SettingsView()
                .tabItem { Label("设置", systemImage: "gearshape.fill") }
        }
        .preferredColorScheme(.dark)
    }
}
