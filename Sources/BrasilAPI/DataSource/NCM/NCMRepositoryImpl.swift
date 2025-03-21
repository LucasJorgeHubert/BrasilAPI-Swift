import Foundation

extension DataSource.NCM {
    public struct RepositoryImpl: NCMRepositoryProtocol {
        let dispatcher: APIRequestDispatcherProtocol
        
        public init(dispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()) {
            self.dispatcher = dispatcher
        }
        
        public func getAllNCM() async throws -> [Domain.NCM.Models.NCM] {
            return try await dispatcher.request(apiRouter: APIRouter.getAllNCM)
        }
        
        public func searchNCM(term: String) async throws -> [Domain.NCM.Models.NCM] {
            return try await dispatcher.request(apiRouter: APIRouter.searchNCM(term: term))
        }
        
        public func getNCM(id: String) async throws -> Domain.NCM.Models.NCM {
            return try await dispatcher.request(apiRouter: APIRouter.getNCM(id: id))
        }
    }
}
