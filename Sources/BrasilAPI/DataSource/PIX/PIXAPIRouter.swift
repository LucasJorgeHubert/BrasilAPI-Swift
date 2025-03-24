import Foundation

extension DataSource.PIX {
    public enum APIRouter: APIRouterProtocol {
        case getPIXPartcipants
        
        public var path: String {
            switch self {
            case .getPIXPartcipants:
                return "/api/pix/v1/participants"
            }
        }
        
        public var method: String {
            return "GET"
        }
    }
}
