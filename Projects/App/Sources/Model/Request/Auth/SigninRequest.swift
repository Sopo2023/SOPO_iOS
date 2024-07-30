import Foundation

struct SigninRequest: BaseRequest {
    var memberId: String = ""
    var memberPassword: String = ""
    
    var params: [String : Any] {
        ["memberId": self.memberId,
         "memberPassword": self.memberPassword]
    }
}
