import SwiftUI

struct AssistantViewScreen: View {
    @State private var input = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 14) {
                        chatBubble("今天建议你先复习高等数学中的积分应用，再刷 5 道操作系统错题。", ai: true)
                        chatBubble("帮我解释一下为什么我总在微分方程上出错。", ai: false)
                        chatBubble("你的错误主要集中在题型识别。我已经帮你整理了 3 张重点概念卡，可以直接开始复习。", ai: true)
                    }
                    .padding()
                }

                HStack(spacing: 12) {
                    TextField("问 AI 一个复习问题…", text: $input)
                        .textFieldStyle(.roundedBorder)
                    Button("发送") {}
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(.purple)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .background(Color.black)
            .navigationTitle("AI 学习助手")
        }
    }

    func chatBubble(_ text: String, ai: Bool) -> some View {
        HStack {
            if ai {
                Text(text)
                    .padding(14)
                    .background(Color.indigo.opacity(0.22))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                Spacer(minLength: 40)
            } else {
                Spacer(minLength: 40)
                Text(text)
                    .padding(14)
                    .background(Color.white.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
        }
    }
}
