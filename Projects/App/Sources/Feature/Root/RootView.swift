import SwiftUI
import Moya
import SDS

struct RootView: View {
    @StateObject var rootVM = RootViewModel.shared
    @StateObject var signupVM = SignupViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if rootVM.isSigned {
                    
                    SopoTabView(selection: $rootVM.tabSelection) {
                        
                        switch rootVM.tabSelection {
                        case .home:
                            Text("홈")
                        case .note:
                            STJView()
                        case .archive:
                            PortfolioView()
                        case .award:
                            CompetitionView()
                        case .profile:
                            ProfileView()
                        }
                        
                    }
                    .hideBar(false)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Group {
                                switch rootVM.tabSelection {
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
                        }
                        
                    }
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                }
                else {
                    Group {
                        switch rootVM.signTab {
                        case .onboard:
                            OnboardingView()
                            
                        case .signin:
                            SigninView()
                                .transition(.slide)
                            
                        case .firstSignup:
                            FirstSignupView()
                                .environmentObject(signupVM)
                        
                        case .secondSignup:
                            SecondSignupView()
                                .environmentObject(signupVM)
                        }
                        
                    }
                    
                }
                
            }
            .environmentObject(rootVM)
            .navigationBarBackButtonHidden()
            
        }
    }
}

#Preview {
    RootView()
}
