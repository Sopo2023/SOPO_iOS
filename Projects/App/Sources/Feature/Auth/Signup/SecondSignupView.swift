import SwiftUI
import SDS

struct SecondSignupView: View {
    @State var id: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            
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
                SopoTextField(text: $id, prompt: "아이디를 입력해주세요")
                
                SopoTextField(text: $id, prompt: "비밀번호를 입력해주세요", isSecure: true)
                
                SopoTextField(text: $id, prompt: "비밀번호를 재 입력해주세요", isSecure: true)

            }
            
            
            Spacer()
            
            SopoBottomButton {
                print("s")
            } text: {
                Text("회원가입")
                    .font(.body(.bold))
                    .foregroundColor(.common(.w100))
            }
            
            HStack(spacing: 4) {
                Text("계정이 있다면?")
                    .foregroundStyle(Color.label(.alternative))
                
                Button {
                    
                } label: {
                    Text("로그인")
                        .foregroundStyle(Color.primary(.light))
                }
            }
            .font(.pretendard(.semibold, size: 14))
            
        }
        .padding(.horizontal, 36)
    }
}

#Preview {
    SecondSignupView()
}
