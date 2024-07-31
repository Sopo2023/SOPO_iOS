import SwiftUI
import Alamofire
import Moya

class SigninViewModel: ObservableObject {
    @Published var request = SigninRequest()
    
    let provider = MoyaProvider<AuthService>()
    
    func signin( onCompleted: (() -> Void)? ) {
        provider.request(.signin(request)) { response in
            switch response {
            case .success(let result):
                if let decodedData = try? JSONDecoder().decode(BaseResponse<SigninResponse>.self, from: result.data) {
                    KeyChain.create(token: decodedData.data)
                    
                    if let onCompleted = onCompleted {
                        onCompleted()
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
