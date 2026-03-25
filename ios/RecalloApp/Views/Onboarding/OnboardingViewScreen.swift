import SwiftUI

struct OnboardingViewScreen: View {
    var body: some View {
        TabView {
            page(title: "导入你的知识库", subtitle: "把笔记、课程资料、错题和收藏内容统一收进来")
            page(title: "AI 自动拆解重点", subtitle: "自动提炼知识点、易错点和可复习卡片")
            page(title: "每天知道该学什么", subtitle: "根据遗忘风险和目标时间自动安排复习任务")
        }
        .tabViewStyle(.page)
        .background(Color.black)
    }

    func page(title: String, subtitle: String) -> some View {
        VStack(spacing: 18) {
            Spacer()
            Image(systemName: "sparkles.rectangle.stack.fill")
                .font(.system(size: 64))
                .foregroundStyle(.purple)
            Text(title)
                .font(.largeTitle.bold())
            Text(subtitle)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 32)
            Spacer()
        }
    }
}
