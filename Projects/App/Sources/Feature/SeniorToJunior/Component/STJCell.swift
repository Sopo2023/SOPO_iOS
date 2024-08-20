import SwiftUI
import SDS

struct STJCell: View {
    
    let model: STJResponse
    
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
            
            
            Text(model.boardTitle)
                .font(.headline2(.bold))
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 16) {
                    Text("2024.08.01")
                    
                    Text("\(model.boardLikeCount)개의 좋아요 · 4개의 댓글")
                }
                .font(.caption(.medium))
                
                HStack(spacing: 0) {
                    Text("by \(model.memberName)")
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
