import Foundation

extension DataSource.DomainBR {
    public enum APIRouter: APIRouterProtocol {
        case getDomainBRStatus(domain: String)
        
        public var path: String {
            switch self {
            case .getDomainBRStatus(let domain):
                return "/api/registrobr/v1/\(domain)"
            }
        }
        
        public var method: String {
            return "GET"
        }
    }
}
