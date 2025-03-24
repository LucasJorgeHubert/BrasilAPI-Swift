import Foundation
import BrasilAPI

extension APIResolver.PIX {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.PIX.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getPIXPartcipants:
            return "pix_v1_participants"
        }
    }
}
