import Foundation

public class ExchangeService {
    private let coinListUseCase: GetCoinListUseCase
    private let quotationUseCase: GetQuotationUseCase
    
    public typealias BrasilAPIExchangeCoinModel = Domain.Exchange.Models.Coin
    public typealias BrasilAPIExchangeQuotationModel = Domain.Exchange.Models.Quotation
    public typealias BrasilAPIExchangeQuotationCoinModel = Domain.Exchange.Models.QuotationCoin
    
    public init(repository: ExchangeRepositoryProtocol = DataSource.Exchange.RepositoryImpl()) {
        self.coinListUseCase = GetCoinListUseCase(repository: repository)
        self.quotationUseCase = GetQuotationUseCase(repository: repository)
    }
    
    public func listCoins() async throws -> [BrasilAPIExchangeCoinModel] {
        return try await coinListUseCase.execute()
    }
    
    public func getQuotation(coin: String, date: String) async throws -> BrasilAPIExchangeQuotationModel {
        return try await quotationUseCase.execute(coin: coin, date: date)
    }
}
