import Foundation

internal protocol APIRouterProtocol {
    var path: String { get }
    var method: String { get }
}
