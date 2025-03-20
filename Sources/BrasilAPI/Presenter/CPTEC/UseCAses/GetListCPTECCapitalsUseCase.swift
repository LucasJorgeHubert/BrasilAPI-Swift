import Foundation

extension Presenter.CPTEC.UseCase {
    class GetListCPTECCapitals {
        private let repository: CPTECRepositoryProtocol
        
        init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
            self.repository = repository
        }
        
        func execute() async throws -> [Domain.CPTEC.Models.Condition] {
            return try await repository.listCapitalConditions()
        }
    }
}
