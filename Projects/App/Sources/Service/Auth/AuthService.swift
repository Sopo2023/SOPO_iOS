import SwiftUI
import Moya


enum AuthService {
    
    case signin( _ request: SigninRequest )
    
}

extension AuthService: BaseService {
    var lead: String {
        "auth"
    }
    
    
    var path: String {
        switch self {
        case .signin: "/sign_in"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signin: .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signin( let request ):
            return .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        }
    }
    
    
}
