import Foundation

extension Presenter.NCM.UseCase {
    public class SearchNCM {
        private let repository: NCMRepositoryProtocol
        
        public init(repository: NCMRepositoryProtocol = DataSource.NCM.RepositoryImpl()) {
            self.repository = repository
        }
        
        public func execute(term: String) async throws -> [Domain.NCM.Models.NCM] {
            return try await repository.searchNCM(term: term)
        }
    }
}
