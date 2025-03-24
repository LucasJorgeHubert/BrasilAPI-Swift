import Foundation
import BrasilAPI

extension APIResolver.DomainBR {
    public static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.DomainBR.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getDomainBRStatus:
            return "registroBR_v1_domain"
        }
    }
}
