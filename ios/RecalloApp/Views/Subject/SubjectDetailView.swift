import SwiftUI

struct SubjectDetailView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    RecalloCard {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("高等数学")
                                .font(.largeTitle.bold())
                            Text("掌握度 68% · 待复习 12 个知识点")
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    RecalloCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("章节掌握情况")
                                .font(.headline)
                            ForEach(MockData.chapters) { chapter in
                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Text(chapter.title)
                                        Spacer()
                                        Text("\(chapter.mastery)%")
                                    }
                                    ProgressView(value: Double(chapter.mastery), total: 100)
                                        .tint(chapter.mastery > 70 ? .green : (chapter.mastery > 60 ? .orange : .red))
                                    Text("遗忘风险：\(chapter.risk)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }

                    Button("开始本学科复习") {}
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(LinearGradient(colors: [.indigo, .purple], startPoint: .leading, endPoint: .trailing))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                }
                .padding(20)
            }
            .background(Color.black)
            .navigationTitle("学科详情")
        }
    }
}
