import Foundation

public enum FIPEAPIRouter: APIRouterProtocol {
    case getBrandByVehicleType(carType: String)
    case getVehiclePrice(codeFIPE: String)
    case getReferenceTables
    case listVehicles(type: String, brandCode: String)
    
    public var path: String {
        switch self {
        case .getBrandByVehicleType(let carType):
            return "/api/fipe/marcas/v1/\(carType)"
        case .getVehiclePrice(let codeFIPE):
            return "/api/fipe/preco/v1/\(codeFIPE)"
        case .getReferenceTables:
            return "/api/fipe/tabelas/v1"
        case .listVehicles(let type, let brandCode):
            return "/api/fipe/veiculos/v1/\(type)/\(brandCode)"
        }
    }
    
    public var method: String {
        switch self {
        case .getBrandByVehicleType, .getVehiclePrice, .getReferenceTables, .listVehicles:
            return "GET"
        }
    }
}
