import Foundation

class GetQuotationUseCase {
    private let repository: ExchangeRepositoryProtocol
    
    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(coin: String, date: String) async throws -> Domain.Exchange.Models.Quotation {
        return try await repository.getQuotation(coin: coin, date: date)
    }
}
