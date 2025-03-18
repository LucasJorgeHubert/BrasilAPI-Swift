import Foundation

extension DataSource.DDD {
    public struct RepositoryImpl: DDDRepositoryProtocol {
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func getCitiesByDDD(ddd: String) async throws -> Domain.DDD.Models.Cities {
            return try await apiDispatcher.request(apiRouter: DataSource.DDD.APIRouter.getCitiesByDDD(ddd: ddd))
        }
    }
}
