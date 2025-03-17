import Foundation
import BrasilAPI

extension APIResolver.CPTEC {
    static func resolve(for apiRouter: APIRouterProtocol) -> String {
        guard let router = apiRouter as? DataSource.CPTEC.APIRouter else {
            return "default_mock"
        }
        
        switch router {
        case .listLocals:
            return "cptec_v1_cidade"
        case .getLocal:
            return "cptec_v1_cidade_nome"
        case .listCapitalConditions:
            return "cptec_v1_clima_capital"
        case .getCapitalCondition:
            return "cptec_v1_clima_aeroporto_icao"
        case .getForecast:
            return "cptec_v1_clima_previsao_code_days"
        case .getOceanicForecast:
            return "cptec_v1_ondas_code_days"
        }
    }
}
