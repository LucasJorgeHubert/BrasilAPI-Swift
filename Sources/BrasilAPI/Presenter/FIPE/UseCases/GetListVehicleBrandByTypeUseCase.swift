import Foundation

public class GetListVehicleBrandByTypeUseCase {
    private let repository: FIPERepositoryProtocol
    
    init(repository: FIPERepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(carType: VehicleTypeEnum) async throws -> [BrasilAPIVehiclesTypeModel] {
        return try await repository.getBrandByVehicleType(carType: carType.rawValue)
    }
}
