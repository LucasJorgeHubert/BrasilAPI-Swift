import Foundation

public protocol ExchangeRepositoryProtocol {
    func listCoins() async throws -> [BrasilAPIExchangeCoinModel]
    func getQuotation(coin: String, date: String) async throws -> BrasilAPIExchangeQuotationModel
}
