import SwiftUI
import SDS

struct SigninView: View {
    @State var id: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            
            HStack {
                Text("다시 만나 반가워요")
                    .font(.pretendard(.bold, size: 26))
                    .foregroundStyle(Color.common(.w0))
                
                Spacer()
            }
            .padding(.vertical, 16)
            
            
            SopoTextField(text: $id, prompt: "아이디를 입력해주세요")
            
            SopoTextField(text: $id, prompt: "비밀번호를 입력해주세요", isSecure: true)
            
            
            Spacer()
            
            SopoBottomButton {
                print("s")
            } text: {
                Text("로그인")
                    .font(.body(.bold))
                    .foregroundColor(.common(.w100))
            }
            
            HStack(spacing: 4) {
                Text("계정이 없다면?")
                    .foregroundStyle(Color.label(.alternative))
                
                Button {
                    
                } label: {
                    Text("회원가입")
                        .foregroundStyle(Color.primary(.light))
                }
            }
            .font(.pretendard(.semiBold, size: 14))
            
        }
        .padding(.horizontal, 36)
    }
}

#Preview {
    SigninView()
}
