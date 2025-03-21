import Foundation

extension DataSource.Exchange {
    public struct RepositoryImpl: ExchangeRepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func listCoins() async throws -> [Domain.Exchange.Models.Coin] {
            return try await apiDispatcher.request(apiRouter: DataSource.Exchange.APIRouter.getCoins)
        }
        
        public func getQuotation(coin: String, date: String) async throws -> Domain.Exchange.Models.Quotation {
            return try await apiDispatcher.request(apiRouter: DataSource.Exchange.APIRouter.getQuotation(coin: coin, date: date))
        }
    }
}
