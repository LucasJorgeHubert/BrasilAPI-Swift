import Foundation

extension Presenter.FIPE.UseCase {
    public class GetListVehicleBrandByType {
        private let repository: FIPERepositoryProtocol
        
        init(repository: FIPERepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(carType: Domain.FIPE.Enums.VehicleType) async throws -> [Domain.FIPE.Models.VehicleType] {
            return try await repository.getBrandByVehicleType(carType: carType.rawValue)
        }
    }
}
