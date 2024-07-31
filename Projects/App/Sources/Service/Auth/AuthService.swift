import SwiftUI
import Moya


enum AuthService {
    
    case signin( _ request: SigninRequest )
    case sendEmail( email: String )
    case signup( _ request: SignupRequest )
    
}

extension AuthService: BaseService {
    var lead: String {
        switch self {
        case .sendEmail:
            "email"
        default:
            "auth"
        }
    }
    
    
    var path: String {
        switch self {
        case .signin: "/sign_in"
        case .signup: "/sign_up"
        case .sendEmail: ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signin: .post
        case .signup: .post
        case .sendEmail: .post
        }
    }
    
    
    var task: Moya.Task {
        switch self {
        case .signin( let request ):
            return .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        case .signup( let request ):
            return .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        case .sendEmail( let email ):
            return .requestParameters(parameters: ["email": email], encoding: URLEncoding.queryString)
        }
    }
    
    
}
