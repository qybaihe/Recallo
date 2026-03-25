import SwiftUI

struct RecalloCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(20)
            .background(Color.white.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
