import Foundation

class GetCoinListUseCase {
    private let repository: ExchangeRepositoryProtocol
    
    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Domain.Exchange.Models.Coin] {
        return try await repository.listCoins()
    }
}
