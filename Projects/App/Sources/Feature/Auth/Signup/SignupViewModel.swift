import SwiftUI
import Moya

class SignupViewModel: ObservableObject {
    @Published var request = SignupRequest()
    
    let provider = MoyaProvider<AuthService>()

    func sendEmail() {
        provider.request(.sendEmail(email: request.memberEmail)) { response in
            switch response {
            case .success(let result):
                print(try? result.mapJSON())
            case .failure(_):
                print("F")
            }
        }
    }

    func signup() {
        provider.request(.signup(request)) { response in 
            switch response {
            case .success(let result):
                print(result)
            case .failure(_):
                print("F")
            }
        }
        
    }
}
