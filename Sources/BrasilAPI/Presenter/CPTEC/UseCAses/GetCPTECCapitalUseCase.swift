import Foundation

extension Presenter.CPTEC.UseCase {
    class GetCPTECCapital {
        private let repository: CPTECRepositoryProtocol
        
        init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
            self.repository = repository
        }
        
        func execute(codeICAO: String) async throws -> Domain.CPTEC.Models.Condition {
            return try await repository.getCapitalCondition(codeICAO: codeICAO)
        }
    }
}
