import Foundation

public protocol ExchangeRepositoryProtocol {
    func listCoins() async throws -> [Domain.Exchange.Models.Coin]
    func getQuotation(coin: String, date: String) async throws -> Domain.Exchange.Models.Quotation
}
