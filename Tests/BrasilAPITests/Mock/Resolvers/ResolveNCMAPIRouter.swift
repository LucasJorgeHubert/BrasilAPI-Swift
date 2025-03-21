import Foundation
import BrasilAPI

extension APIResolver.NCM {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.NCM.APIRouter else {
            return "default_mock"
        }
        
        switch router {
            case .getAllNCM:
                return "ncm_v1"
            case .searchNCM:
                return "ncm_v1_term"
            case .getNCM:
                return "ncm_v1_code"
        }
    }
}
