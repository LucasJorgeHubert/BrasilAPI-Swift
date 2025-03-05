import Foundation

public protocol APIRouterProtocol {
    var path: String { get }
    var method: String { get }
}
