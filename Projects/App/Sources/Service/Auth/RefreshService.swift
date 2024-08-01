import SwiftUI
import Moya

enum RefreshService {
    
    case refresh( token: String )
    
}


extension RefreshService: BaseService {
    var lead: String {
        ""
    }
    
    var path: String {
        switch self {
        case .refresh: "re_provide"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .refresh: .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .refresh( let token ):
                .requestParameters(parameters: ["refreshToken": token], encoding: JSONEncoding.default)
        }
    }
    
    

}
