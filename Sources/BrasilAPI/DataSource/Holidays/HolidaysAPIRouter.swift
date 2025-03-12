import Foundation

public enum HolidaysAPIRouter: APIRouterProtocol {
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
