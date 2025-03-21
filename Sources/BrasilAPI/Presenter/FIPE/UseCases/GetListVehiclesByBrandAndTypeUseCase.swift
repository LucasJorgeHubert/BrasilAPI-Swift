import Foundation

extension Presenter.FIPE.UseCase {
    public class GetListVehiclesByBrandAndType {
        private let repository: FIPERepositoryProtocol
        
        init(repository: FIPERepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(carType: Domain.FIPE.Enums.VehicleType, brandCode: String) async throws -> [Domain.FIPE.Models.Vehicle] {
            return try await repository.listVehicles(type: carType.rawValue, brandCode: brandCode)
        }
    }
}
