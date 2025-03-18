import Foundation
import BrasilAPI

extension APIResolver.Holidays {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.Holidays.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getHolidays:
            return "feriados_v1_ano"
        }
    }
}
