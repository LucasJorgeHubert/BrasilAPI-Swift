import Foundation

extension DataSource.IBGE{
    
    public enum APIRouter: APIRouterProtocol {
        case getCitiesByState(state: String)
        case getStates
        case getStateByCode(code: String)
        
        public var path: String {
            switch self {
            case .getStates:
                return "/api/ibge/uf/v1"
            case .getStateByCode(let code):
                return "/api/ibge/uf/v1/\(code)"
            case .getCitiesByState(let state):
                return "/api/ibge/municipios/v1/\(state)"
            }
        }
        
        public var method: String {
            return "GET"
        }
    }
}
