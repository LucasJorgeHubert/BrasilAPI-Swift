import Foundation
import BrasilAPI

extension APIResolver.Broker {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? BrokerAPIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getBrokers:
            return "cvm_corretoras_v1"
        case .getBrokersByCnpj:
            return "cvm_corretoras_v1_cnpj"
        }
    }
}
