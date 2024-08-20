import SwiftUI

struct ProfileResponse: Decodable {
    let memberEmail: String
    let memberId: String
    let memberName: String
    let memberSchool: String
}
