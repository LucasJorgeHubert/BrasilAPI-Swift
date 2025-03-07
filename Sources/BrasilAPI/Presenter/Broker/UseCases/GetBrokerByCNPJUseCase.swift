import Foundation

class GetBrokerByCNPJUseCase {
    private let repository: BrokerRepositoryProtocol

    init(repository: BrokerRepositoryProtocol) {
        self.repository = repository
    }

    func execute(cnpj: String) async throws -> BrasilAPIBrokerModel {
        return try await repository.getBrokerByCnpj(cnpj: cnpj)
    }
}
