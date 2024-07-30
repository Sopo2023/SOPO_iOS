import SwiftUI
import SDS

struct PortfolioCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                if let url = URL(string: "") {
                    AsyncImage(url: url) { image in
                        image.image?
                            .resizable()
                            .scaledToFill()
                    }
                }
                else {
                    Color.common(.w100)
                        .overlay {
                            Image(sopo: .Logo)
                                .resizable()
                                .scaledToFit()
                                .padding(52)
                        }
                }
            }
            .frame(height: 186)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 4))
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("독종 개발자 신민호입니다.")
                    .font(.headline2(.bold))
                    
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 8) {
                        
                        
                        PortfolioBadge(caption: "Flutter 개발자")
                        
                        PortfolioBadge(caption: "독종 개발자")
                        
                        PortfolioBadge(caption: "DGSW 8기")
                        
                        PortfolioBadge(caption: "iOS 개발자")
                        
                        PortfolioBadge(caption: "개발자")
                        
                        
                        
                        
                    }
                    
                    
                }
                
                HStack(spacing: 0) {
                    Text("by 노영재")
                        .font(.label(.bold))
                        .foregroundStyle(Color.label(.assitive))
                    
                    
                    Spacer()
                    
                    SopoIcon.dots.image
                        .foregroundStyle(Color.common(.w0))
                    
                }
            

            }

        }
    }
}

#Preview {
    PortfolioCell()
}
