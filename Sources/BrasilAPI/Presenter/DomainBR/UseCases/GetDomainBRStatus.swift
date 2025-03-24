import Foundation

extension Presenter.DomainBR.UseCase {
    public final class GetDomainBRStatus {
        private var repository: DomainBRRepositoryProtocol
        
        public init(repository: DomainBRRepositoryProtocol) {
            self.repository = repository
        }
        
        public func execute(domain: String) async throws -> Domain.DomainBR.Models.DomainBRStatus {
            return try await repository.getDomainBRStatus(domain: domain)
        }
    }
}
