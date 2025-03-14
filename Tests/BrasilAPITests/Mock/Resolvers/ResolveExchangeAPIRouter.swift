import Foundation
import BrasilAPI

extension APIResolver.Exchange {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? ExchangeAPIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getCoins:
            return "cambio_v1_moedas"
        case .getQuotation:
            return "cambio_v1_cotacao"
        }
    }
}
