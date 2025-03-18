import Foundation
import BrasilAPI

extension APIResolver.ZipCode {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.ZipCode.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getZipCodeV1:
            return "cep_v1"
        case .getZipCodeV2:
            return "cep_v2"
        }
    }
}
