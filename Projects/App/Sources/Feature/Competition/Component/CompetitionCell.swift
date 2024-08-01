import SwiftUI
import SDS

struct CompetitionCell: View {
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
            
            
            Text("2024 충청권 ICT 이노베이션 아이디어 및 SW개발 공모")
                .font(.headline2(.bold))
            
            
            Text("디지털 신기술(AI, BC, Data, N/W, IoT, 기타)을 활용한 지역사회 및 산업 문제 해결 아이디어 기획 및 SW개발 공모")
                .font(.caption(.bold))
            
            VStack {
                CompetitionLabel(.subscribed, content: "2024.08.02.")
                
                CompetitionLabel(.closed, content: "2024.08.09.")

                CompetitionLabel(.headcount, content: "3명 / 5명")


            }
            
            HStack(spacing: 0) {
                Text("by 노영재")
                    .font(.label(.bold))
                
                Spacer()
                
                SopoIcon.dots.image
                    .foregroundStyle(Color.common(.w0))
                
            }
            
            
            .foregroundStyle(Color.label(.assitive))
            
        }
    }
}

#Preview {
    CompetitionCell()
}
