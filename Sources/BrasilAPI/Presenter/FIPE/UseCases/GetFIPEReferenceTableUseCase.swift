import Foundation

extension Presenter.FIPE.UseCase {
    public class GetFIPEReferenceTable {
        private let repository: FIPERepositoryProtocol
        
        init(repository: FIPERepositoryProtocol) {
            self.repository = repository
        }
        
        func execute() async throws -> [Domain.FIPE.Models.Table] {
            return try await repository.getReferenceTables()
        }
    }
}
