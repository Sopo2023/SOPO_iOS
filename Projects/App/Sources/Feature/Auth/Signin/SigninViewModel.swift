import SwiftUI
import Alamofire
import Moya

class SigninViewModel: ObservableObject {
    @Published var request = SigninRequest()
    
    let provider = MoyaProvider<AuthService>()
    
    func signin( onCompleted: @escaping () -> Void, onError: @escaping () -> Void ) {
        
        
        provider.request(.signin(request)) { response in
            switch response {
            case .success(let result):
                guard let decodedData = try? JSONDecoder().decode(BaseResponse<SigninResponse>.self, from: result.data) else {
                    onError()
                    return
                }
                
                
                
                if decodedData.status == StatusCode.OK.rawValue {
                    
                    guard let data = decodedData.data else {
                        return
                    }
                    
                    guard KeyChain.create(token: data) else {
                        return
                    }
                        
                    onCompleted()
                }
                
                else {
                    onError()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                onError()
            }
        }
    }
}
