import Foundation

extension DataSource.Tax {
    public enum APIRouter: APIRouterProtocol {
        case getTaxes
        case getTax(taxId: String)
        
        public var path: String {
            switch self {
            case .getTaxes:
                return "/api/taxas/v1"
            case .getTax(let taxId):
                return "/api/taxas/v1/\(taxId)"
            }
        }
        
        public var method: String {
            switch self {
            case .getTaxes, .getTax:
                return "GET"
            }
        }
    }
}
