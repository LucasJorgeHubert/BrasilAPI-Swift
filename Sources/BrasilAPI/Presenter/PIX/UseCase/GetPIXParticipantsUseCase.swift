import Foundation

extension Presenter.PIX.UseCase {
    public class GetPIXPartcipants {
        private let repository: PIXRepositoryProtocol
        
        public init(repository: PIXRepositoryProtocol = DataSource.PIX.RepositoryImpl()) {
            self.repository = repository
        }
        
        public func execute() async throws -> [Domain.PIX.Models.PixParticipant] {
            return try await repository.getPIXPartcipants()
        }
    }
}
