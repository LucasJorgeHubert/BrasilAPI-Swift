import Foundation

extension DataSource.Broker {
    
    public enum APIRouter: APIRouterProtocol {
        case getBrokers
        case getBrokersByCnpj(cnpj: String)
        
        public var path: String {
            switch self {
            case .getBrokers:
                return "/api/cvm/corretoras/v1"
            case .getBrokersByCnpj(let cnpj):
                return "/api/cvm/corretoras/v1/\(cnpj)"
            }
        }
        
        public var method: String {
            switch self {
            case .getBrokers, .getBrokersByCnpj:
                return "GET"
            }
        }
    }
}
