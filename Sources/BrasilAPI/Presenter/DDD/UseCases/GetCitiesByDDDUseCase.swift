import Foundation

class GetCitiesByDDDUseCase {
    private let repository: DDDRepositoryProtocol
    
    init(repository: DDDRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(ddd: String) async throws -> BrasilAPIDDDCitiesModel {
        return try await repository.getCitiesByDDD(ddd: ddd)
    }
}
