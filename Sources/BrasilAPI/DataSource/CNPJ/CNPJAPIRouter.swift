import Foundation

extension DataSource.CNPJ {
    
    public enum APIRouter: APIRouterProtocol {
        case getCNPJ(cnpj: String)
        
        public var path: String {
            switch self {
            case .getCNPJ(let cnpj):
                return "/api/cnpj/v1/\(cnpj)"
            }
        }
        
        public var method: String {
            switch self {
            case .getCNPJ:
                return "GET"
            }
        }
    }
}
