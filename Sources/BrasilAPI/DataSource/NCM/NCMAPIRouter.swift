import Foundation

extension DataSource.NCM {
    public enum APIRouter: APIRouterProtocol {
        case getAllNCM
        case searchNCM(term: String)
        case getNCM(id: String)
        
        public var path: String {
            switch self {
            case .getAllNCM, .searchNCM:
                return "/api/ncm/v1"
            case .getNCM(let id):
                return "/api/ncm/v1/\(id)"
            }
        }
        
        public var method: String {
            return "GET"
        }
        
        public var queryItems: [URLQueryItem]? {
            switch self {
                case .searchNCM(let term):
                    return [URLQueryItem(name: "search", value: term)]
                default:
                    return nil
            }
        }
    }
}
