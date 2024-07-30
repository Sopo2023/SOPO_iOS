import SwiftUI
import Moya

class SigninViewModel: ObservableObject {
    @Published var request = SigninRequest()
    
    let provider = MoyaProvider<AuthService>()
    
    func signin() {
        provider.request(.signin(request)) { response in
            switch response {
            case .success(let result):
                
                
                print(try? result.mapJSON())
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
