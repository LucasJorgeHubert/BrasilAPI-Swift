import Foundation

class GetQuotationUseCase {
    private let repository: ExchangeRepositoryProtocol
    
    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(coin: String, date: String) async throws -> BrasilAPIExchangeQuotationModel {
        return try await repository.getQuotation(coin: coin, date: date)
    }
}
