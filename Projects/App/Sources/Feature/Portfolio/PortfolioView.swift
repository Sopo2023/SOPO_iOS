import SwiftUI
import SDS

struct PortfolioView: View {
    var body: some View {
        VStack(spacing: 22) {
            SopoSearchField(text: .constant(""), prompt: "검색어를 입력해주세요.")
                .padding(.horizontal, 28)
            
            HStack(spacing: 18) {
                SopoIconButton(icon: .arrowRight, withLabel: "인기")
                
                SopoIconButton(icon: .clock, withLabel: "최신")
                
                Spacer()
            }
            .padding(.horizontal, 28)
            
            ScrollView {
                VStack(spacing: 20) {
                    PortfolioCell()
                    
                    
                    SopoDevider()
                    
                    
                    ForEach(0..<4) { _ in
                        PortfolioCutCell()
                        
                        SopoDevider()
                    }
                    
                    Spacer(minLength: 80)
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .scrollDismiss()
            
            
        }
        .padding(.top, 12)
    }
}

#Preview {
    PortfolioView()
}
