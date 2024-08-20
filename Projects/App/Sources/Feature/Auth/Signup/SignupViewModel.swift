import SwiftUI
import Moya
import Alamofire

class SignupViewModel: ObservableObject {
    @Published var request = SignupRequest()
    @Published var emailCompleted: Bool = false
    @Published var remainSeconds: Int = 300
    @Published var emailExpired: Bool = true
    
    @Published var errorMessage: String = "오류가 발생했습니다"
    
    var remainTime: String {
        let hour = String(self.remainSeconds / 60)
        let minute = String(self.remainSeconds % 60)
        
        let maxLength = 2
        
        
        return "\(String(repeating: "0", count: maxLength - hour.count) + hour):\(String(repeating: "0", count: maxLength - minute.count) + minute)"
        
    }
    
    var firstCompleted: Bool {
        return (request.params.values.filter { !($0 as! String).isEmpty }.count >= 4) && !emailExpired
    }
    
    var secondCompleted: Bool {
        return request.params.values.filter { !($0 as! String).isEmpty }.count >= 6 && !request.memberPasswordConfirm.isEmpty
    }
    
    @Published var timer = Timer()
    
    private let provider = MoyaProvider<AuthService>()
    
    func initEmail() {
        remainSeconds = 300
        emailExpired = true
        timer = Timer()
        request.authCode = ""
    }
    
    func initRequest() {
        request = SignupRequest()
        emailCompleted = false
        initEmail()
    }
    
    
    func sendEmail( onError: @escaping () -> () ) {
        
        self.emailExpired = false

        provider.request(.sendEmail(email: request.memberEmail)) { response in

            switch response {
            case .success(let result):
                
                guard let decodedData = try? JSONDecoder().decode(BaseResponse<Empty>.self, from: result.data) else {
                    return
                }
                print(decodedData)
                
                if decodedData.status == StatusCode.OK.rawValue {
                    self.startTimer(startTime: Date()) {
                        self.emailCompleted = true
                    }
                }
                else {
                    
                    self.errorMessage = decodedData.message
                    onError()
                    self.emailCompleted = false
                    self.emailExpired = true
                }
                
                
            case .failure(_):
                
                onError()
                
                self.emailCompleted = false
                self.emailExpired = true
            }
        }
    }
    
    func signup( onCompleted: @escaping () -> Void, onError: @escaping () -> Void ) {
        guard self.request.memberPassword == self.request.memberPasswordConfirm else {
            self.errorMessage = "비밀번호가 서로 일치하지 않습니다"
            
            onError()
            
            return
        }
        
        
        provider.request(.signup(request)) { response in
            switch response {
            case .success(let result):
                guard let decodedData = try? JSONDecoder().decode(BaseResponse<Empty>.self, from: result.data) else {
                    return
                }
                
                print(decodedData)
                
                if decodedData.status == StatusCode.OK.rawValue {
                    onCompleted()
                }
                
                else {
                    self.errorMessage = decodedData.message
                    
                    onError()
                }
                
                
            case .failure(_):
                onError()
            }
        }
        
    }
    
    private func startTimer(startTime: Date, completition: @escaping () -> ()) {
        DispatchQueue.main.async { [ weak self ] in
            
            let recentSeconds = self!.remainSeconds
            
            self?.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                let expireSecond = recentSeconds
                let elapsedSeconds = Int(Date().timeIntervalSince(startTime))
                
                guard elapsedSeconds <= expireSecond else {
                    timer.invalidate()
                    
                    self?.initEmail()
                    
                    return
                }
                
                self?.remainSeconds = expireSecond - elapsedSeconds
            }
            
            completition()
            
        }
    }
    
}
