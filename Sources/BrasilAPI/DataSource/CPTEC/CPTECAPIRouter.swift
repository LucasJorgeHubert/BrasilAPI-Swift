import Foundation

public enum CPTECAPIRouter: APIRouterProtocol {
    case listLocals
    case getLocal(localName: String)
    case listCapitalConditions
    case getCapitalCondition(codeICAO: String)
    case getForecast(cityCode: Int, days: Int)
    case getOceanicForecast(cityCode: Int, days: Int)
    
    public var path: String {
        switch self {
        case .listLocals:
            return "/api/cptec/v1/cidade"
        case .getLocal(let localName):
            return "/api/cptec/v1/cidade/\(localName)"
        case .listCapitalConditions:
            return "/api/cptec/v1/clima/capital"
        case .getCapitalCondition(let codeICAO):
            return "/api/cptec/v1/clima/aeroporto/\(codeICAO)"
        case .getForecast(let cityCode, let days):
            return "/api/cptec/v1/clima/previsao/\(cityCode)/\(days)"
        case .getOceanicForecast(let cityCode, let days):
            return "/api/cptec/v1/ondas/\(cityCode)/\(days)"
        }
    }
    
    public var method: String {
        switch self {
        case .listLocals, .getLocal, .listCapitalConditions, .getCapitalCondition, .getForecast, .getOceanicForecast:
            return "GET"
        }
    }
}
