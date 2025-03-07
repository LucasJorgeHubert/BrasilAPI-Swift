import Foundation

class GetBrokersUseCase {
    private let repository: BrokerRepositoryProtocol

    init(repository: BrokerRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [BrasilAPIBrokerModel] {
        return try await repository.getBrokers()
    }
}
