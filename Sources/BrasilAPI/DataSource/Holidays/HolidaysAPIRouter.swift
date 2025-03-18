import Foundation

extension DataSource.Holidays {
    
    public enum APIRouter: APIRouterProtocol {
        case getHolidays(year: Int)
        
        public var path: String {
            switch self {
            case .getHolidays(let year):
                return "/api/feriados/v1/\(year)"
            }
        }
        
        public var method: String {
            switch self {
            case .getHolidays:
                return "GET"
            }
        }
    }
}
