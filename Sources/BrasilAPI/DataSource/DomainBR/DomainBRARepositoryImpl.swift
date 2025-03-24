import Foundation

extension DataSource.DomainBR {
    public struct RepositoryImpl: DomainBRRepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func getDomainBRStatus(domain: String) async throws -> Domain.DomainBR.Models.DomainBRStatus {
            return try await apiDispatcher.request(apiRouter: APIRouter.getDomainBRStatus(domain: domain))
        }
        
    }
}
