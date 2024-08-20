import SwiftUI
import Moya
import SDS

struct RootView: View {
    @StateObject var rootVM = RootViewModel.shared
    @StateObject var signupVM = SignupViewModel()
    
    @StateObject var profileVM = ProfileViewModel()
    @StateObject var stjVM = STJViewModel()
    
    var body: some View {
        NavigationStack(path: $rootVM.path) {
            
            Group {
                
                if rootVM.isSigned {
                    
                    ZStack {
                        Group {
                            switch rootVM.tabSelection {
                            case .home:
                                Color.background(.normal)
                            default:
                                Color.white
                            }
                            
                        }
                        .ignoresSafeArea()
                        
                        
                        SopoTabView(selection: $rootVM.tabSelection) {
                            
                            switch rootVM.tabSelection {
                            case .home:
                                HomeView()
                            case .note:
                                STJView()
                                    .environmentObject(stjVM)
                            case .archive:
                                PortfolioView()
                            case .award:
                                CompetitionView()
                            case .profile:
                                ProfileView()
                                    .environmentObject(profileVM)
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
                        .onAppear {
                            profileVM.getProfile()
                            stjVM.getSTJ()
                        }
                        
                        
                    }
                    
                    
                }
                else {
                    OnboardingView()
                        .environmentObject(rootVM)
                }
                
            }
            .environmentObject(rootVM)
            .navigationDestination(for: StackViewType.self) { type in
                Group {
                    switch type {
                    case .signin: SigninView()
                    case .firstsignup: FirstSignupView().environmentObject(signupVM)
                    case .secondsignup: SecondSignupView().environmentObject(signupVM)
                    }
                }
                .environmentObject(rootVM)
            }
        }
        .alert(isPresented: $rootVM.isAlert) {
            rootVM.alertContent
        }
    }
}

#Preview {
    RootView()
}
