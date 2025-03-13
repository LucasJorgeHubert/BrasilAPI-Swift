import Foundation

public protocol FIPERepositoryProtocol {
    func getBrandByVehicleType(carType: String) async throws -> [BrasilAPIVehiclesTypeModel]
    func getVehiclePrice(codeFIPE: String) async throws -> [BrasilAPIVehiclesPriceModel]
    func getReferenceTables() async throws -> [BrasilAPIFIPETableModel]
    func listVehicles(type: String, brandCode: String) async throws -> [BrasilAPIVehiclesModel]
}
