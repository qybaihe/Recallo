import SwiftUI

struct SettingsView: View {
    @State private var notifications = true
    @State private var aiSummary = true

    var body: some View {
        NavigationStack {
            Form {
                Section("账号") {
                    Label("小鹤", systemImage: "person.crop.circle")
                    Label("同步到 iCloud（预留）", systemImage: "icloud")
                }

                Section("学习偏好") {
                    Toggle("每日复习提醒", isOn: $notifications)
                    Toggle("AI 自动总结", isOn: $aiSummary)
                }

                Section("关于") {
                    Label("版本 0.1 Demo", systemImage: "info.circle")
                    Label("反馈与建议", systemImage: "paperplane")
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("设置")
        }
    }
}
