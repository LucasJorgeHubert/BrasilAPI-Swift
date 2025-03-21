import Foundation

public protocol APIRouterProtocol {
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem]? { get }
}

public extension APIRouterProtocol {
    var queryItems: [URLQueryItem]? { nil }
}
