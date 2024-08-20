import Moya


enum STJService {
    case getSTJ( _ request: PageRequest )
}

extension STJService: BaseService {
    var lead: String {
        "board"
    }
    
    var path: String {
        switch self {
        case .getSTJ: ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSTJ: .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSTJ( let request ): .requestParameters(parameters: request.params, encoding: URLEncoding.default)
        }
    }
    
    
}
