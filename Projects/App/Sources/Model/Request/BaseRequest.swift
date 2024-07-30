import Foundation

protocol BaseRequest: Encodable {
    var params: [String: Any] { get }
}
