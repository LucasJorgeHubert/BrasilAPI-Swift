import Foundation

extension Presenter.PIX {
    public final class Service {
        private var getPIXPartcipants: Presenter.PIX.UseCase.GetPIXPartcipants
        
        public typealias PIXParticipoantsModel = Domain.PIX.Models.PixParticipant
        
        public init(repository: PIXRepositoryProtocol = DataSource.PIX.RepositoryImpl()) {
            self.getPIXPartcipants = Presenter.PIX.UseCase.GetPIXPartcipants(repository: repository)
        }
        
        public func getPIXPartcipants() async throws -> [Domain.PIX.Models.PixParticipant] {
            return try await getPIXPartcipants.execute()
        }
    }
}
