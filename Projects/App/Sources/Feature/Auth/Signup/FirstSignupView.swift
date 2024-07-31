import SwiftUI
import SDS

struct FirstSignupView: View {
    @EnvironmentObject var signupVM: SignupViewModel

    @EnvironmentObject var rootVM: RootViewModel
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            
            
            Spacer()
                .frame(maxHeight: 16)
            
            HStack {
                VStack(alignment: .leading, spacing: 24) {
                    Text("소포가 처음이라면? ")
                        .font(.pretendard(.bold, size: 26))
                    
                    Text("이름과 이메일을 입력하세요")
                        .font(.headline2(.bold))
                }
                .foregroundStyle(Color.common(.w0))

                
                Spacer()
            }
            .padding(.vertical, 16)
            
            
            VStack(spacing: 22) {
                SopoTextField(text: $signupVM.request.memberName, prompt: "이름을 입력해주세요")
                
                SopoTextField(text: $signupVM.request.memberEmail, prompt: "이메일을 입력해주세요")
            }
            
            VStack(alignment: .trailing, spacing: 20) {
                Button {
                    signupVM.sendEmail()
                } label: {
                    Text("이메일 인증번호 전송하기")
                        .font(.pretendard(.semibold, size: 14))
                        .foregroundStyle(Color.primary(.strong))
                }
                
                SopoTextField(text: $signupVM.request.authCode, prompt: "이메일 인증번호를 입력해주세요", isSecure: true)
                    .keyboardType(.numberPad)
            }
            
            Spacer()
            
            SopoBottomButton {
                rootVM.signTab = .secondSignup
            } text: {
                Text("계속하기")
                    .font(.body(.bold))
                    .foregroundColor(.common(.w100))
            }
            
            HStack(spacing: 4) {
                Text("계정이 있다면?")
                    .foregroundStyle(Color.label(.alternative))
                
                Button {
                    rootVM.signTab = .signin
                } label: {
                    Text("로그인")
                        .foregroundStyle(Color.primary(.light))
                }
            }
            .font(.pretendard(.semibold, size: 14))
            .padding(.bottom, 28)
            
        }
        .padding(.horizontal, 36)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                
                HStack(spacing: 14) {
                    Button {
                        rootVM.signTab = .onboard
                    } label: {
                        SopoIcon.arrowLeft.image
                    }
                    
                    Text("회원가입")
                        .font(.pretendard(.semibold, size: 16))
                    
                }
                .foregroundStyle(Color.common(.w0))
                .padding(.leading, 12)
            }
        }
    }
}

#Preview {
    NavigationView {
        
        FirstSignupView()
            .environmentObject(RootViewModel())
    }
}
