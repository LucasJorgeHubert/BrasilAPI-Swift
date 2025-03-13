import Foundation

class GetListVehiclesByBrandAndTypeUseCase {
    private let repository: FIPERepositoryProtocol
    
    init(repository: FIPERepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(carType: VehicleTypeEnum, brandCode: String) async throws -> [BrasilAPIVehiclesModel] {
        return try await repository.listVehicles(type: carType.rawValue, brandCode: brandCode)
    }
}
