import XCTest
@testable import BrasilAPI

final class ExchangeIntegrationUseCaseTests: XCTestCase {
    var getCoinListUseCase: GetCoinListUseCase!
    var getQuotationUseCase: GetQuotationUseCase!

    override func setUp() {
        let repository = DataSource.Exchange.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getCoinListUseCase = GetCoinListUseCase(repository: repository)
        getQuotationUseCase = GetQuotationUseCase(repository: repository)
    }

    func test_integration_fetchCoins() async throws {
        let coins = try await getCoinListUseCase.execute()
        XCTAssertFalse(coins.isEmpty)
    }
    
    func test_integration_fetchQuote() async throws {
        let quote = try await getQuotationUseCase.execute(coin: "USD", date: "2025-02-28")
        XCTAssertNotNil(quote)
    }
}
