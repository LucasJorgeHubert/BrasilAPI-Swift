import Foundation

extension DataSource.PIX {
    public struct RepositoryImpl: PIXRepositoryProtocol {
        let dispatcher: APIRequestDispatcherProtocol
        
        public init(dispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()) {
            self.dispatcher = dispatcher
        }
        
        public func getPIXPartcipants() async throws -> [Domain.PIX.Models.PixParticipant] {
            return try await dispatcher.request(apiRouter: APIRouter.getPIXPartcipants)
        }
    }
}
