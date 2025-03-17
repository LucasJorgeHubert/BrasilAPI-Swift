import Foundation

extension DataSource.CNPJ {
    
    public struct RepositoryImpl: CNPJRepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func searchCNPJ(cnpj: String) async throws -> BrasilAPICNPJModel {
            return try await apiDispatcher.request(apiRouter: DataSource.CNPJ.APIRouter.getCNPJ(cnpj: cnpj))
        }
    }
}
