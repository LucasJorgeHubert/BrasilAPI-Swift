import Foundation

extension Presenter.DomainBR {
    public final class Service {
        private var getDomainBRStatus: Presenter.DomainBR.UseCase.GetDomainBRStatus
        
        public typealias DomainBRStatusModel = Domain.DomainBR.Models.DomainBRStatus
        public typealias DomainBRStatusEnum = Domain.DomainBR.Enums.DomainBRStatusEnum
        public typealias DomainBRStatusCodeEnum = Domain.DomainBR.Enums.DomainBRStatusCodeEnum
        
        public init(repository: DomainBRRepositoryProtocol = DataSource.DomainBR.RepositoryImpl()) {
            self.getDomainBRStatus = Presenter.DomainBR.UseCase.GetDomainBRStatus(repository: repository)
        }
        
        public func getDomainBRStatus(domain: String) async throws -> Domain.DomainBR.Models.DomainBRStatus {
            return try await getDomainBRStatus.execute(domain: domain)
        }
    }
}
