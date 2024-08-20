import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                HomeCell(icon: .note, title: "선배가 후배에게") {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("오늘의 인기글 보러가기")
                            .font(.caption(.bold))
                            .foregroundStyle(Color.label(.assitive))
                        
                        
                        HomeInCell {
                            HStack {
                                Text("대소고에서 살아남기? 너무 쉬................. ")
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(1)
                
                                
                                Spacer(minLength: 16)
                                
                                Text("by 신민호")
                                    .foregroundStyle(Color.label(.alternative))
                            }
                            .font(.pretendard(.bold, size: 16))
                        }
                        
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
        .padding(.top, 16)
    }
}

#Preview {
    HomeView()
        .background(Color.background(.normal))
}
