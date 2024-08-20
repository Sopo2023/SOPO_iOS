import SwiftUI
import SDS

struct CompetitionCutCell: View {
    var body: some View {
        HStack(spacing: 12) {
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
            
            VStack(alignment: .leading, spacing: 12) {
                Text("녕안녕안")
                    .font(.label(.bold))
                
                Text("디지털 신기술(AI, BC, Data, N/W, IoT, 기타)을 \n활용한 지역사회 및 산업 문제 해결 아이디어 기획 및 SW개발 공모")
                    .font(.caption(.medium))
                
                HStack(spacing: 0) {
                    Text("by 노영재")
                        .font(.caption(.bold))
                        .foregroundStyle(Color.label(.assitive))
                    
                    Spacer()
                    
                    SopoIcon.dots.image
                        .foregroundStyle(Color.common(.w0))
                    
                }
            }
        }    }
}

#Preview {
    CompetitionCutCell()
}
