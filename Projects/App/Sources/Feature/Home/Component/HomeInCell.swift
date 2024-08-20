import SwiftUI

struct HomeInCell<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.line(.normal).clipShape(RoundedRectangle(cornerRadius: 8)))
    }
}

#Preview {
    HomeInCell {
        HStack {
            Text("대소고에서 살아남기? 너무 쉬 · · · ")
            
            Spacer()
            
            Text("by 신민호")
        }
        .font(.pretendard(.bold, size: 16))
    }
}
