import Foundation

struct SignupRequest: BaseRequest {
    var memberId: String = ""
    var memberName: String = ""
    var memberEmail: String = ""
    var authCode: String = "" {
        didSet {
            authCode = authCode.uppercased()
        }
    }
    var memberPassword: String = ""
    var memberPasswordConfirm: String = ""
    var memberSchool: String = "대구소프트웨어마이스터고등학교"
    var memberFcmToken: String = ""
    
    var params: [String : Any] {
        ["memberId": self.memberId,
         "memberName": self.memberName,
         "memberEmail": self.memberEmail,
         "authCode": self.authCode,
         "memberPassword": self.memberPassword,
         "memberSchool": self.memberSchool,
         "memberFcmToken": self.memberFcmToken]
    }
}

