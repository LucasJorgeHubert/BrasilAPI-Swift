import Foundation

extension DataSource.Bank {
    public enum APIRouter: APIRouterProtocol {
        case getBanks
        case getBanksByCode(code: String)
        
        public var path: String {
            switch self {
            case .getBanks:
                return "/api/banks/v1"
            case .getBanksByCode(let code):
                return "/api/banks/v1/\(code)"
            }
        }
        
        public var method: String {
            switch self {
            case .getBanks, .getBanksByCode:
                return "GET"
            }
        }
    }
}
