import SwiftUI
import Moya

enum MemberService {
    
    case deleteMember
    
}

extension MemberService: BaseService {
    var lead: String {
        "member"
    }
    
    var path: String {
        switch self {
        case .deleteMember: ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .deleteMember: .patch
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .deleteMember: .requestPlain
        }
    }
    
    
}
