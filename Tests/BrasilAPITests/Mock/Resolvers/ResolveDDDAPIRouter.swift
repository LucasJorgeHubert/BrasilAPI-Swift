import Foundation
import BrasilAPI

extension APIResolver.DDD {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DDDAPIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getCitiesByDDD:
            return "ddd_v1_ddd"
        }
    }
}
