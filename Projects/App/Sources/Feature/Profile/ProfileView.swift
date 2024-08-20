import SwiftUI
import SDS

struct ProfileView: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    @EnvironmentObject var profileVM: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 12) {
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
                    
                    VStack(alignment: .center, spacing: 8) {
                        
                        Text(profileVM.response.memberName)
                            .font(.headline(.medium))
                            .foregroundStyle(SopoColor.Pallete.DarkGray.w10.color)
                        
                        HStack {
                            Button {
                                
                            } label: {
                                Text("프로필 수정")
                                    .font(.pretendard(.semibold, size: 9))
                                    .foregroundStyle(Color.common(.w100))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 6)
                                    .background(Color.primary(.normal).clipShape(RoundedRectangle(cornerRadius: 3)))
                            }
                            
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(Color.common(.w100))
                
                ScrollView {
                    
                    VStack(spacing: 8) {
                        VStack(spacing: 0) {
                            ProfileButton(title: "알림", trailer:  {
                                Toggle("", isOn: .constant(false))
                                    .foregroundStyle(Color.primary(.light))
                                    .disabled(true)
                            })
                            
                            ProfileButton(title: "북마크")
                            
                            
                            ProfileButton(title: "내가 신청한 대회")
                        }
                        
                        VStack(spacing: 0) {
                            ProfileButton(title: "로그아웃", type: .destructive) {
                                if KeyChain.delete() {
                                    rootVM.objectWillChange.send()
                                }
                            }
                            
                            ProfileButton(title: "회원 탈퇴", type: .destructive) {
                                
                                rootVM.openAlert {
                                    let primaryButton = Alert.Button.destructive(Text("확인")) {
                                        profileVM.deleteMember {
                                            if KeyChain.delete() {
                                                rootVM.objectWillChange.send()
                                            }
                                        }
                                    }
                                    
                                    let secondaryButton = Alert.Button.cancel(Text("취소")) {
                                        
                                    }
                                    
                                    return .init(title: Text("알림"),
                                                 message: Text("정말 회원을 탈퇴하시겠습니까? \n 탈퇴하시면 7일 뒤에 개인정보가 삭제됩니다."),
                                                 primaryButton: primaryButton,
                                                 secondaryButton: secondaryButton)
                                    
                                }
                            }
                        }
                        
                    }
                    .padding(.top, 8)
                    .background(Color.background(.normal))
                }
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
        }
        
    }
}

#Preview {
    ProfileView()
}
