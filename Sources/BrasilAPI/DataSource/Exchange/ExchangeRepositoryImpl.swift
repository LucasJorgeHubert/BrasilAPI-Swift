import Foundation

extension DataSource.Exchange {
    public struct RepositoryImpl: ExchangeRepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func listCoins() async throws -> [BrasilAPIExchangeCoinModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.Exchange.APIRouter.getCoins)
        }
        
        public func getQuotation(coin: String, date: String) async throws -> BrasilAPIExchangeQuotationModel {
            return try await apiDispatcher.request(apiRouter: DataSource.Exchange.APIRouter.getQuotation(coin: coin, date: date))
        }
    }
}
