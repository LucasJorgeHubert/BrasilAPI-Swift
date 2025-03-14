import Foundation
import BrasilAPI

extension APIResolver.IBGE {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? IBGEAPIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getCitiesByState:
            return "ibge_municipios_v1_uf"
        case .getStateByCode:
            return "ibge_uf_v1_code"
        case .getStates:
            return "ibge_uf_v1"
        }
    }
}
