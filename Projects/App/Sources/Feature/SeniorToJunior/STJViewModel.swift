import SwiftUI
import Moya


class STJViewModel: ObservableObject {
    
    @Published var pageRequest: PageRequest = .init()
    @Published var response: [STJResponse] = .init()
    
    let stjService = MoyaProvider<STJService>(session: .init(interceptor: SopoInterceptor.shared))
    
    func getSTJ() {
        stjService.request(.getSTJ(pageRequest)) { response in
            switch response {
            case .success(let result):
                guard let decodedData = try? JSONDecoder().decode(BaseResponse<[STJResponse]>.self, from: result.data) else {
                    return
                }
                
                if let data = decodedData.data {
                    self.response = data
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
