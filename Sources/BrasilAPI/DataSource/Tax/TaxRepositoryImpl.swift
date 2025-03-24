import Foundation

extension DataSource.Tax {
    public struct RepositoryImpl: TaxRepositoryProtocol {
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func fetchTaxes() async throws -> [Domain.Tax.Models.Tax] {
            return try await apiDispatcher.request(apiRouter: APIRouter.getTaxes)
        }
        
        public func fetchTax(taxId: String) async throws -> Domain.Tax.Models.Tax {
            return try await apiDispatcher.request(apiRouter: APIRouter.getTax(taxId: taxId))
        }
    }
}
