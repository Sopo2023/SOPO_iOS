import SwiftUI

struct SigninResponse: Codable {
    let accessToken: String
    let refreshToken: String
}
