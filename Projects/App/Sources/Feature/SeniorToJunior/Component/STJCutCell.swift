import SwiftUI
import SDS

struct STJCutCell: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            Group {
                if let url = URL(string: "") {
                    AsyncImage(url: url) { image in
                        image.image?
                            .resizable()
                            .scaledToFill()
                    }
                }
                else {
                    Color.primary(.normal)
                        .overlay {
                            Image(sopo: .Logo)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(Color.common(.w100))
                                .scaledToFit()
                                .padding(16)
                        }
                }
            }
            .clipped()
            .clipShape(Rectangle())
            .frame(maxWidth: 96)
            .frame(height: 52)

            
            VStack(alignment: .leading, spacing: 8) {
                Text("Dev.POST: AI가 써주는 기술 블로그입니다. AI가 뭐냐하면 인공지능인데")
                    .font(.label(.bold))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("2024.08.01.")
                    
                    Text("3개의 좋아요 · 4개의 댓글")
                }
                .font(.pretendard(.medium, size: 8))
                .foregroundStyle(SopoColor.Pallete.Neutral.w60.color)
                
                HStack {
                    Text("by 노영재")
                        .font(.caption(.bold))
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
    STJCutCell()
}
