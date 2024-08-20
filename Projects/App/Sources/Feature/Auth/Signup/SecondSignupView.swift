import SwiftUI
import SDS

struct SecondSignupView: View {
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
                    
                    Text("아이디와 비밀번호를 입력해주세요!")
                        .font(.headline2(.bold))
                }
                .foregroundStyle(Color.common(.w0))

                
                Spacer()
            }
            .padding(.vertical, 16)
            
            
            VStack(spacing: 22) {
                SopoTextField(text: $signupVM.request.memberId, prompt: "아이디를 입력해주세요")
                
                SopoTextField(text: $signupVM.request.memberPassword, prompt: "비밀번호를 입력해주세요", isSecure: true)
                
                SopoTextField(text: $signupVM.request.memberPasswordConfirm, prompt: "비밀번호를 재 입력해주세요", isSecure: true)

            }
            
            
            Spacer()
            
            SopoBottomButton (action: {
                signupVM.signup {
                    rootVM.openAlert {
                        .init(
                            title: Text("알림"),
                            message: Text("회원가입이 완료되었습니다"),
                            dismissButton: .cancel(Text("확인")) {
                                
                                signupVM.initRequest()
                                rootVM.path.removeAll()
                            }
                        )
                    }
                } onError: {
                    rootVM.openAlert {
                        .init(
                            title: Text("알림"),
                            message: Text(signupVM.errorMessage),
                            dismissButton: .cancel(Text("확인"))
                              
                        )
                    }
                }
            }, text: {
                Text("회원가입")
                    .font(.body(.bold))
                    .foregroundColor(.common(.w100))
            }, background: signupVM.secondCompleted ? .primary(.normal) : .label(.disable))
            .disabled(!signupVM.secondCompleted)
            
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
                        rootVM.path.removeLast()
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
    SecondSignupView()
        .environmentObject(SignupViewModel())
        .environmentObject(RootViewModel())
}
