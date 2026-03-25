import Foundation

struct StudyTrendPoint: Identifiable {
    let id = UUID()
    let label: String
    let value: Int
}

struct SubjectChapter: Identifiable {
    let id = UUID()
    let title: String
    let mastery: Int
    let risk: String
}

struct ReviewTask: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let priority: String
}

enum MockData {
    static let trend: [StudyTrendPoint] = [
        .init(label: "周一", value: 42),
        .init(label: "周二", value: 50),
        .init(label: "周三", value: 47),
        .init(label: "周四", value: 58),
        .init(label: "周五", value: 63),
        .init(label: "周六", value: 71),
        .init(label: "周日", value: 76)
    ]

    static let chapters: [SubjectChapter] = [
        .init(title: "极限与连续", mastery: 82, risk: "低"),
        .init(title: "导数与微分", mastery: 74, risk: "中"),
        .init(title: "积分应用", mastery: 61, risk: "高"),
        .init(title: "微分方程", mastery: 55, risk: "高")
    ]

    static let tasks: [ReviewTask] = [
        .init(title: "操作系统：进程调度", subtitle: "建议 15 分钟", priority: "高"),
        .init(title: "高数：定积分 6 题", subtitle: "建议 20 分钟", priority: "中"),
        .init(title: "英语：长难句复习", subtitle: "建议 10 分钟", priority: "高")
    ]
}
