import Foundation
import BrasilAPI

extension APIResolver.FIPE {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.FIPE.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .getBrandByVehicleType:
            return "fipe_marcas_v1_tipo"
        case .getVehiclePrice:
            return "fipe_preco_v1_code"
        case .getReferenceTables:
            return "fipe_tabelas_v1"
        case .listVehicles:
            return "fipe_veiculos_v1_type_code"
        }
    }
}
