import SwiftUI
import SDS

struct STJCell: View {
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
                    Color.common(.w0)
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
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            
            Text("Dev.POST: AI가 써주는 기술 블로그")
                .font(.headline2(.bold))
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 16) {
                    Text("2024.08.01")
                    
                    Text("3개의 좋아요 · 4개의 댓글")
                }
                .font(.caption(.medium))
                
                HStack(spacing: 0) {
                    Text("by 노영재")
                        .font(.label(.bold))
                    
                    Spacer()
                    
                    SopoIcon.dots.image
                        .foregroundStyle(Color.common(.w0))
                    
                }
                    
            }
            .foregroundStyle(Color.label(.assitive))

        }
    }
}

#Preview {
    STJCell()
}
