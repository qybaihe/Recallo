import SwiftUI

struct SettingsViewScreen: View {
    @State private var notification = true
    @State private var aiSummary = true

    var body: some View {
        NavigationStack {
            Form {
                Section("账户") {
                    Label("小鹤", systemImage: "person.crop.circle")
                    Label("iCloud 同步（规划中）", systemImage: "icloud")
                }

                Section("学习偏好") {
                    Toggle("每日复习提醒", isOn: $notification)
                    Toggle("AI 自动总结", isOn: $aiSummary)
                }

                Section("关于") {
                    Label("Recallo 0.1", systemImage: "info.circle")
                    Label("反馈与建议", systemImage: "paperplane")
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("设置")
        }
    }
}
