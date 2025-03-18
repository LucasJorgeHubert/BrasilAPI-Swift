import Foundation

public protocol FIPERepositoryProtocol {
    func getBrandByVehicleType(carType: String) async throws -> [Domain.FIPE.Models.VehicleType]
    func getVehiclePrice(codeFIPE: String) async throws -> [Domain.FIPE.Models.VehiclePrice]
    func getReferenceTables() async throws -> [Domain.FIPE.Models.Table]
    func listVehicles(type: String, brandCode: String) async throws -> [Domain.FIPE.Models.Vehicle]
}
