import Foundation

extension DataSource.Exchange {
    public enum APIRouter: APIRouterProtocol {
        case getCoins
        case getQuotation(coin: String, date: String)
        
        public var path: String {
            switch self {
            case .getCoins:
                return "/api/cambio/v1/moedas"
            case .getQuotation(let coin, let date):
                return "/api/cambio/v1/cotacao/\(coin)/\(date)"
            }
        }
        
        public var method: String {
            switch self {
            case .getCoins, .getQuotation:
                return "GET"
            }
        }
    }
}
