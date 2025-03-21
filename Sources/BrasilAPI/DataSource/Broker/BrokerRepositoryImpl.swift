import Foundation
extension DataSource.Broker {
    public struct RepositoryImpl: BrokerRepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func getBrokers() async throws -> [Domain.Broker.Models.Broker] {
            return try await apiDispatcher.request(apiRouter: DataSource.Broker.APIRouter.getBrokers)
        }
        
        public func getBrokerByCnpj(cnpj: String) async throws -> Domain.Broker.Models.Broker {
            return try await apiDispatcher.request(apiRouter: DataSource.Broker.APIRouter.getBrokersByCnpj(cnpj: cnpj))
        }
    }
    
}
