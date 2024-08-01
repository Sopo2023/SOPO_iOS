import SwiftUI
import Moya

protocol BaseService: TargetType {
    
    var lead: String { get }

    
}

extension BaseService {

    var baseURL: URL {
        .init(string: Constants.url)!
        .appendingPathComponent(lead)
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}
