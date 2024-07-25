import SwiftUI
import SDS

struct FirstSignupView: View {
    @State var id: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            
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
                SopoTextField(text: $id, prompt: "이름을 입력해주세요")
                
                SopoTextField(text: $id, prompt: "이메일을 입력해주세요", isSecure: true)
            }
            
            VStack(alignment: .trailing, spacing: 20) {
                Button {
                    
                } label: {
                    Text("이메일 인증번호 전송하기")
                        .font(.pretendard(.semiBold, size: 14))
                        .foregroundStyle(Color.primary(.strong))
                }
                
                SopoTextField(text: $id, prompt: "이메일 인증번호를 입력해주세요")
            }
            
            Spacer()
            
            SopoBottomButton {
                print("s")
            } text: {
                Text("넘어가요")
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
            .font(.pretendard(.semiBold, size: 14))
            
        }
        .padding(.horizontal, 36)
    }
}

#Preview {
    FirstSignupView()
}
