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
                    .keyboardType(.emailAddress)
                    .disabled(!signupVM.emailExpired)
            }
            
            VStack(alignment: .trailing, spacing: 20) {
                
                HStack {
                    if signupVM.emailCompleted {
                        Text(signupVM.remainTime)
                            .foregroundStyle(Color.primary(.normal))
                    }
                    
                    Spacer()
                    
                    Button {
                        signupVM.initEmail()
                        signupVM.sendEmail() {
                            rootVM.openAlert {
                                .init(title: Text("알림"),
                                      message: Text(signupVM.errorMessage),
                                      dismissButton: .cancel(Text("확인"))
                                )
                            }
                        }
                    } label: {
                        Text("이메일 인증번호 \(signupVM.emailCompleted ? "재" : "")전송하기")
                            .foregroundStyle(!signupVM.emailExpired ? Color.label(.disable) : Color.primary(.strong))
                    }
                    .disabled(!signupVM.emailExpired)
                }
                
                .font(.pretendard(.semibold, size: 14))
                
                
                if signupVM.emailCompleted {
                    SopoTextField(text: $signupVM.request.authCode, prompt: "이메일 인증번호를 입력해주세요", isSecure: false)
                        .keyboardType(.default)
                        .disabled(signupVM.emailExpired)
                }
                
                
            }
            
            Spacer()
            
            SopoBottomButton(
                action: {
                    signupVM.timer.invalidate()
                    signupVM.emailExpired = true
                    
                    rootVM.path.append(.secondsignup)
                }, text: {
                    Text("계속하기")
                        .font(.body(.bold))
                        .foregroundColor(.common(.w100))
                }, background: signupVM.firstCompleted ? Color.primary(.normal) : .label(.disable)
            )
            .disabled(!signupVM.firstCompleted)
            
            HStack(spacing: 4) {
                Text("계정이 있다면?")
                    .foregroundStyle(Color.label(.alternative))
                
                Button {
                    signupVM.initRequest()
                    rootVM.path.replace(rootVM.path, with: [.signin])
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
                        signupVM.initRequest()
                        rootVM.path.removeAll()
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
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    NavigationView {
        
        FirstSignupView()
            .environmentObject(RootViewModel())
            .environmentObject(SignupViewModel())
    }
}
