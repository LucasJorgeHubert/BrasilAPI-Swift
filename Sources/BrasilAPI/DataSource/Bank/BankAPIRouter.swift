import Foundation

enum BankAPIRouter: APIRouterProtocol {
    case getBanks
    case getBanksByCode(code: String)
    
    var path: String {
        switch self {
        case .getBanks:
            return "/api/banks/v1"
        case .getBanksByCode(let code):
            return "/api/banks/v1/\(code)"
        }
    }
    
    var method: String {
        switch self {
        case .getBanks, .getBanksByCode:
            return "GET"
        }
    }
}
