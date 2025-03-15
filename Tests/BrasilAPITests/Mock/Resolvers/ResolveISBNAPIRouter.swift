import Foundation
import BrasilAPI

extension APIResolver.ISBN {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.ISBN.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getBook:
            return "isbn_v1_code"
        }
    }
}
