import Foundation
import BrasilAPI

extension APIResolver.Bank {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.Bank.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getBanks:
            return "banks_v1"
        case .getBanksByCode(let code):
            return "banks_v1_\(code)"
        }
    }
}
