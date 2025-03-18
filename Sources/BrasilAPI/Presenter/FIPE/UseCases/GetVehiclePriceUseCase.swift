import Foundation

class GetVeihclePriceUseCase {
    private let repository: FIPERepositoryProtocol
    
    init(repository: FIPERepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(codeFIPE: String) async throws -> [Domain.FIPE.Models.VehiclePrice] {
        return try await repository.getVehiclePrice(codeFIPE: codeFIPE)
    }
}
