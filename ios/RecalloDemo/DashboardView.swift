import SwiftUI
import Charts

struct DashboardView: View {
    let trend: [StudyTrend] = [
        .init(day: "周一", value: 38), .init(day: "周二", value: 44), .init(day: "周三", value: 52),
        .init(day: "周四", value: 47), .init(day: "周五", value: 60), .init(day: "周六", value: 66), .init(day: "周日", value: 72)
    ]

    let heatmap: [[Int]] = [
        [0,1,0,2,1,3,2],
        [1,2,2,1,0,3,4],
        [0,1,3,2,2,4,3],
        [1,0,2,3,1,2,4]
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    header
                    todayCard
                    masteryCards
                    trendCard
                    heatmapCard
                }
                .padding(20)
            }
            .background(Color.black)
            .navigationTitle("回想 Recallo")
        }
    }

    var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("晚上好，小鹤")
                .font(.title2)
                .foregroundStyle(.secondary)
            Text("今天还有 18 个知识点待复习")
                .font(.system(size: 30, weight: .bold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var todayCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("今日复习")
                .font(.headline)
            Text("高优先级：操作系统 / 计算机网络 / 英语长难句")
                .foregroundStyle(.secondary)
            Button("开始今天的复习") {}
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(LinearGradient(colors: [.indigo, .purple], startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(20)
        .background(Color(red: 0.07, green: 0.1, blue: 0.19))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    var masteryCards: some View {
        HStack(spacing: 12) {
            statCard(title: "掌握度", value: "72%", color: .green)
            statCard(title: "遗忘风险", value: "6", color: .orange)
            statCard(title: "连续复习", value: "14天", color: .blue)
        }
    }

    func statCard(title: String, value: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.title2.bold())
            Circle().fill(color).frame(width: 10, height: 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(.secondarySystemBackground).opacity(0.35))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    var trendCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("近 7 天复习趋势")
                .font(.headline)
            Chart(trend) {
                LineMark(x: .value("日期", $0.day), y: .value("复习量", $0.value))
                    .foregroundStyle(.purple)
                AreaMark(x: .value("日期", $0.day), y: .value("复习量", $0.value))
                    .foregroundStyle(.purple.opacity(0.2))
            }
            .frame(height: 180)
        }
        .padding(20)
        .background(Color(.secondarySystemBackground).opacity(0.35))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    var heatmapCard: some View {
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
        .padding(20)
        .background(Color(.secondarySystemBackground).opacity(0.35))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    func colorFor(_ level: Int) -> Color {
        switch level {
        case 0: return Color.gray.opacity(0.25)
        case 1: return Color.indigo.opacity(0.45)
        case 2: return Color.indigo.opacity(0.65)
        case 3: return Color.purple.opacity(0.75)
        default: return Color.blue.opacity(0.9)
        }
    }
}

struct StudyTrend: Identifiable {
    let id = UUID()
    let day: String
    let value: Int
}
