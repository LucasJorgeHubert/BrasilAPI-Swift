import Foundation

extension Presenter.Exchange.UseCase {
    class GetCoinList {
        private let repository: ExchangeRepositoryProtocol
        
        init(repository: ExchangeRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute() async throws -> [Domain.Exchange.Models.Coin] {
            return try await repository.listCoins()
        }
    }
}
