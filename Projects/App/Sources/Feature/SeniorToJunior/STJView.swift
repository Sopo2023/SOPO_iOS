import SwiftUI
import SDS

private extension View {
    @ViewBuilder
    func scrollDismiss() -> some View {
        if #available(iOS 16, *) {
            self
                .scrollDismissesKeyboard(.immediately)
        }
    }
}

struct STJView: View {
    
    var body: some View {
        VStack(spacing: 22) {
            SopoSearchField(text: .constant(""), prompt: "검색어를 입력해주세요.")
                .padding(.horizontal, 28)
            
            Text("인기 ")
            
            ScrollView {
                VStack {
                    ForEach(0..<4) { _ in
                        STJCell()
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .scrollDismiss()
            
            
        }
        .padding(.top, 12)
    }
}

#Preview {
    NavigationView {
        STJView()
    }
}
