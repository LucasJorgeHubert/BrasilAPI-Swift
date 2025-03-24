import Foundation

extension Presenter.Tax.UseCase {
    public struct GetTaxById {
        let repository: TaxRepositoryProtocol
        
        public init(repository: TaxRepositoryProtocol = DataSource.Tax.RepositoryImpl()) {
            self.repository = repository
        }
        
        public func execute(taxId: String) async throws -> Domain.Tax.Models.Tax {
            return try await repository.fetchTax(taxId: taxId)
        }
    }
}
