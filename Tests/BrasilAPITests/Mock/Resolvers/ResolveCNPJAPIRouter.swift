import Foundation
import BrasilAPI

extension APIResolver.CNPJ {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.CNPJ.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getCNPJ:
            return "cnpj_v1"
        }
    }
}
