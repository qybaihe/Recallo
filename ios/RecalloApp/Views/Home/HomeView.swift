import SwiftUI
import Charts

struct HomeView: View {
    let heatmap = [[0,1,0,2,1,3,2],[1,2,2,1,0,3,4],[0,1,3,2,2,4,3],[1,0,2,3,1,2,4]]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("欢迎回来，小鹤")
                            .foregroundStyle(.secondary)
                        Text("今天还有 18 个知识点待复习")
                            .font(.system(size: 30, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    RecalloCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("今日复习")
                                .font(.headline)
                            ForEach(MockData.tasks) { task in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(task.title)
                                        Text(task.subtitle).font(.caption).foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Text(task.priority)
                                        .font(.caption.bold())
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(task.priority == "高" ? Color.red.opacity(0.2) : Color.blue.opacity(0.2))
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }

                    HStack(spacing: 12) {
                        metric(title: "掌握度", value: "72%")
                        metric(title: "遗忘风险", value: "6")
                        metric(title: "连续学习", value: "14天")
                    }

                    RecalloCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("近 7 天复习趋势")
                                .font(.headline)
                            Chart(MockData.trend) {
                                LineMark(x: .value("日期", $0.label), y: .value("数值", $0.value))
                                    .foregroundStyle(.purple)
                                AreaMark(x: .value("日期", $0.label), y: .value("数值", $0.value))
                                    .foregroundStyle(.purple.opacity(0.18))
                            }
                            .frame(height: 180)
                        }
                    }

                    RecalloCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("学习热图")
                                .font(.headline)
                            VStack(spacing: 6) {
                                ForEach(0..<heatmap.count, id: \.self) { row in
                                    HStack(spacing: 6) {
                                        ForEach(0..<heatmap[row].count, id: \.self) { col in
                                            RoundedRectangle(cornerRadius: 6)
                                                .fill(colorFor(heatmap[row][col]))
                                                .frame(width: 28, height: 28)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.black)
            .navigationTitle("回想 Recallo")
        }
    }

    func metric(title: String, value: String) -> some View {
        RecalloCard {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.caption).foregroundStyle(.secondary)
                Text(value).font(.title3.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    func colorFor(_ level: Int) -> Color {
        switch level {
        case 0: return .gray.opacity(0.2)
        case 1: return .indigo.opacity(0.4)
        case 2: return .indigo.opacity(0.6)
        case 3: return .purple.opacity(0.75)
        default: return .blue.opacity(0.9)
        }
    }
}
