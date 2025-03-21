import Foundation

extension Presenter.DDD.UseCase {
    class GetCitiesByDDD {
        private let repository: DDDRepositoryProtocol
        
        init(repository: DDDRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(ddd: String) async throws -> Domain.DDD.Models.Cities {
            return try await repository.getCitiesByDDD(ddd: ddd)
        }
    }
}
