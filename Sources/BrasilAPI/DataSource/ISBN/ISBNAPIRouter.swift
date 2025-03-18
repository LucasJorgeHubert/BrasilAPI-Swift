import Foundation

extension DataSource.ISBN {
    public enum APIRouter: APIRouterProtocol {
        case getBook(isbn: String)
        
        public var path: String {
            switch self {
            case .getBook(let isbn):
                return "/api/isbn/v1/\(isbn)"
            }
        }
        
        public var method: String {
            return "GET"
        }
    }
}
    