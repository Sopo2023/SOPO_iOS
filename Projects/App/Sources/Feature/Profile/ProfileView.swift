import SwiftUI
import SDS

struct ProfileView: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Circle()
                    .frame(width: 69, height: 69)
                    .foregroundStyle(Color.avatar(.background))
                    .overlay {
                        SopoIcon.user.image
                            .resizable()
                            .foregroundStyle(Color.avatar(.icon))
                            .padding(20)
                    }
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("이해준")
                        .font(.headline(.medium))
                        .foregroundStyle(SopoColor.Pallete.DarkGray.w10.color)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("이미지 업로드")
                                .font(.pretendard(.semibold, size: 9))
                                .foregroundStyle(Color.common(.w100))
                                .padding(.horizontal, 14)
                                .padding(.vertical, 7)
                                .background(Color.primary(.normal).clipShape(RoundedRectangle(cornerRadius: 3)))
                        }
                        
                        Button {
                            
                        } label: {
                            Text("이미지 제거")
                                .font(.pretendard(.semibold, size: 9))
                                .foregroundStyle(Color.primary(.normal))
                                .padding(.horizontal, 14)
                                .padding(.vertical, 7)
                                .background(Color.line(.normal).clipShape(RoundedRectangle(cornerRadius: 3)))
                        }

                    }
                }
                
                Spacer()
                
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            Button {
                KeyChain.delete()
                rootVM.objectWillChange.send()
            } label: {
                
                Text("로그아웃")
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileView()
}
