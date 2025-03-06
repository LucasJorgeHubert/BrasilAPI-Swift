import Foundation

public enum ZipCodeAPIRouter: APIRouterProtocol {
    case getZipCodeV1(zipCode: String)
    case getZipCodeV2(zipCode: String)
    
    public var path: String {
        switch self {
        case .getZipCodeV1(let zipCode):
            return "/api/cep/v1/\(zipCode)"
        case .getZipCodeV2(let zipCode):
            return "/api/cep/v2/\(zipCode)"
        }
    }
    
    public var method: String {
        switch self {
        case .getZipCodeV1, .getZipCodeV2:
            return "GET"
        }
    }
}
