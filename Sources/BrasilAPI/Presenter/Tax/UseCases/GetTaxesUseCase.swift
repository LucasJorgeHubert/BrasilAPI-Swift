import Foundation

extension Presenter.Tax.UseCase {
    public struct GetTaxes {
        let repository: TaxRepositoryProtocol
        
        public init(repository: TaxRepositoryProtocol = DataSource.Tax.RepositoryImpl()) {
            self.repository = repository
        }
        
        public func execute() async throws -> [Domain.Tax.Models.Tax] {
            return try await repository.fetchTaxes()
        }
    }
}
