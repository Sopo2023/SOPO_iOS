import Foundation

struct STJResponse: Decodable {
    let boardContent: String
    let boardId: Int
    let boardLikeCount: Int
    let boardTitle: String
    let memberName: String
}
