import Foundation

class GetCoinListUseCase {
    private let repository: ExchangeRepositoryProtocol
    
    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [BrasilAPIExchangeCoinModel] {
        return try await repository.listCoins()
    }
}
