import Foundation

extension Presenter.IBGE.UseCase {
    
    public final class GetStates {
        private let repository: IBGERepositoryProtocol
        
        init(repository: IBGERepositoryProtocol) {
            self.repository = repository
        }
        
        func execute() async throws -> [Domain.IBGE.Models.StateModel] {
            return try await repository.getStates()
        }
    }
}
