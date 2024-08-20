import SwiftUI
import Moya

class ProfileViewModel: ObservableObject {
    @Published var response = ProfileResponse(memberEmail: "", memberId: "", memberName: "", memberSchool: "")
    
    
    let profileProvider = MoyaProvider<ProfileService>(session: .init(interceptor: SopoInterceptor.shared))
    
    let memberProvider = MoyaProvider<MemberService>(session: .init(interceptor: SopoInterceptor.shared))
    
    
    
    func getProfile() {
        profileProvider.request(.getProfile) { response in
            switch response {
            case .success(let result):
                guard let decodedData = try? JSONDecoder().decode(BaseResponse<ProfileResponse>.self, from: result.data) else {
                    return
                }
                
                if let data = decodedData.data { self.response = data }
            case .failure(_):
                print("error")
            }
        }
    }
    
    func deleteMember(completion: @escaping () -> ()) {
        memberProvider.request(.deleteMember) { response in
            switch response {
            case .success(let result):
                print(result)
                completion()
                
            case .failure(let e):
                print(e.localizedDescription)
                return
            }
        }
    }
}
