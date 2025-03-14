import Foundation

public enum DDDAPIRouter: APIRouterProtocol {
    case getCitiesByDDD(ddd: String)
    
    public var path: String {
        switch self {
        case .getCitiesByDDD(let ddd):
            return "/api/ddd/v1/\(ddd)"
        }
    }
    
    public var method: String {
        switch self {
        case .getCitiesByDDD:
            return "GET"
        }
    }
}
