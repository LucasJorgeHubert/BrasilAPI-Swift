import Foundation

extension Presenter.CPTEC.UseCase {
    class GetListCPTECLocals {
        private let repository: CPTECRepositoryProtocol
        
        init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
            self.repository = repository
        }
        
        func execute() async throws -> [Domain.CPTEC.Models.Local] {
            return try await repository.listLocals()
        }
    }
}
