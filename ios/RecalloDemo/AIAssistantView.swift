import SwiftUI

struct AIAssistantView: View {
    @State private var input = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 14) {
                        bubble("今天建议你先复习操作系统的进程调度，再刷 5 道计算机网络错题。", fromAI: true)
                        bubble("为什么我总是记不住 TCP 三次握手？", fromAI: false)
                        bubble("因为你现在记的是过程，不是触发条件。要不要我把它改写成 3 张问答卡？", fromAI: true)
                    }
                    .padding()
                }

                HStack(spacing: 12) {
                    TextField("问 AI 你的复习问题…", text: $input)
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
            .navigationTitle("AI 助手")
        }
    }

    func bubble(_ text: String, fromAI: Bool) -> some View {
        HStack {
            if fromAI {
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
