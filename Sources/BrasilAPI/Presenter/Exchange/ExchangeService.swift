import Foundation

extension Presenter.Exchange {
    public class Service {
        private let coinListUseCase: Presenter.Exchange.UseCase.GetCoinList
        private let quotationUseCase: Presenter.Exchange.UseCase.GetQuotation
        
        public typealias CoinModel = Domain.Exchange.Models.Coin
        public typealias QuotationModel = Domain.Exchange.Models.Quotation
        public typealias QuotationCoinModel = Domain.Exchange.Models.QuotationCoin
        
        public init(repository: ExchangeRepositoryProtocol = DataSource.Exchange.RepositoryImpl()) {
            self.coinListUseCase = Presenter.Exchange.UseCase.GetCoinList(repository: repository)
            self.quotationUseCase = Presenter.Exchange.UseCase.GetQuotation(repository: repository)
        }
        
        public func listCoins() async throws -> [CoinModel] {
            return try await coinListUseCase.execute()
        }
        
        public func getQuotation(coin: String, date: String) async throws -> QuotationModel {
            return try await quotationUseCase.execute(coin: coin, date: date)
        }
    }
}
