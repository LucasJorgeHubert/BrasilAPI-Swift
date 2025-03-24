import Foundation
import BrasilAPI

extension APIResolver.Tax {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.Tax.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getTaxes:
            return "taxas_v1"
        case .getTax:
            return "taxas_v1_sigla"
        }
    }
}
