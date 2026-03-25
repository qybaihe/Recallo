import SwiftUI
import Charts

struct ProgressViewScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    RecalloCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("学习进度")
                                .font(.largeTitle.bold())
                            Text("过去 7 天整体掌握度持续上升")
                                .foregroundStyle(.secondary)
                            Chart(MockData.trend) {
                                BarMark(x: .value("日期", $0.label), y: .value("数值", $0.value))
                                    .foregroundStyle(.blue.gradient)
                            }
                            .frame(height: 220)
                        }
                    }

                    RecalloCard {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("学科对比")
                                .font(.headline)
                            comparisonRow(name: "高等数学", value: 68)
                            comparisonRow(name: "操作系统", value: 75)
                            comparisonRow(name: "计算机网络", value: 71)
                            comparisonRow(name: "英语", value: 64)
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.black)
            .navigationTitle("学习进度")
        }
    }

    func comparisonRow(name: String, value: Int) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(name)
                Spacer()
                Text("\(value)%")
            }
            ProgressView(value: Double(value), total: 100)
                .tint(.purple)
        }
    }
}
