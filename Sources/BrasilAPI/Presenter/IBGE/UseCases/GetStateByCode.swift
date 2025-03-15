import Foundation

extension Presenter.IBGE.UseCase {
    
    public final class GetStateByCode {
        private let repository: IBGERepositoryProtocol
        
        init(repository: IBGERepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(code: String) async throws -> Domain.IBGE.Models.StateModel {
            return try await repository.getState(by: code)
        }
    }
}
