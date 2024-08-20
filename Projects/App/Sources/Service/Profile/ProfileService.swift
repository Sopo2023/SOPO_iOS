import SwiftUI
import Moya

enum ProfileService {
    
    case getProfile
    
}

extension ProfileService: BaseService {
    var lead: String {
        "profile"
    }
    
    var path: String {
        switch self {
        case .getProfile: ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProfile: .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getProfile: .requestPlain
        }
    }
    
    
    var validationType: ValidationType {
        .successCodes
    }
    
}
