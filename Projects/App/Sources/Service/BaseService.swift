import Foundation
import Moya

enum BaseService {
    case loginDAuth(params: [String: Any])
    case getDAuthToken
}

extension BaseService: TargetType {
    var baseURL: URL {
        return .init(string: "https://dauth.b1nd.com/api/")!
    }
    
    var path: String {
        switch self {
        case .loginDAuth:
            return "auth/login"
        case .getDAuthToken:
            return "token"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .loginDAuth:
            return .post
        case .getDAuthToken:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .loginDAuth(let params):
            return .requestParameters(parameters:
                                        params.merging(["redirectUrl": "http://localhost", "clientId":"f9039078053044fdb7f09b59aede4ec8af28923b218f4089bad8c8353fe1e8c2", "clientSecret": "2fa6c958005d492e9d54025b78557f81bf804dc6aee74f7f93c4971ddda3481f"]) {_,_ in },
                                      encoding: JSONEncoding())
        case .getDAuthToken:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}
