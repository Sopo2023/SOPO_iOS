import SwiftUI
import Moya
import SDS

struct ContentView: View {
    @State var selection: SopoTabItem = .home
    
    var body: some View {
        NavigationView {
            SopoTabView(selection: $selection) {
                switch selection {
                case .home:
                    Text("홈")
                case .note:
                    STJView()
                case .archive:
                    Text("아카이브")
                case .award:
                    Text("대회")
                case .profile:
                    Text("프로필")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Group {
                        switch selection {
                        case .home:
                            Text("홈")
                        case .note:
                            Text("선배가 후배에게")
                        case .archive:
                            Text("포트폴리오")
                        case .award:
                            Text("대회")
                        case .profile:
                            Text("내 프로필")
                        }
                    }
                    .font(.pretendard(.bold, size: 25))
                    .padding(.top, 30)
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
