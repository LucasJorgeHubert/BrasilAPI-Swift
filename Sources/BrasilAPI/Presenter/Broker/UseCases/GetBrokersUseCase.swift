import Foundation

extension Presenter.Broker.UseCase {
    class GetBrokers {
        private let repository: BrokerRepositoryProtocol
        
        init(repository: BrokerRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute() async throws -> [Domain.Broker.Models.Broker] {
            return try await repository.getBrokers()
        }
    }
}
