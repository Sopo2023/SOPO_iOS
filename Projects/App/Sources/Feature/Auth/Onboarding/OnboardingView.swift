import SwiftUI
import SDS

struct OnboardingView: View {
    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            
            SopoAsset.creavity.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 228)
            
            Spacer()
            
            VStack(spacing: 28) {
                SopoBottomButton {
                    withAnimation {
                        rootVM.signTab = .signin
                    }
                } text: {
                    Text("로그인")
                        .font(.body(.bold))
                        .foregroundColor(.common(.w100))
                }
                
                SopoBottomButton(action: {
                    rootVM.signTab = .firstSignup
                }, text:  {
                    Text("회원가입")
                        .font(.body(.bold))
                        .foregroundColor(.common(.w100))
                    
                }, background: .label(.disable))
            }
            .padding(.horizontal, 28)
            
            Spacer()
                .frame(maxHeight: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background(.normal))
        
        
    }
}

#Preview {
    OnboardingView()
}
