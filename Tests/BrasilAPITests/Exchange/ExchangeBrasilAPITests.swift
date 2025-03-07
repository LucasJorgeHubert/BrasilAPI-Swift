import XCTest
@testable import BrasilAPI

final class ExchangeBrasilAPITests: XCTestCase {
    let repository = ExchangeRepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getExchangeCoins() async throws {
        let brasilAPI = BrasilAPI(exchangeRepository: repository)
        let coins = try await brasilAPI.exchange.listCoins()
        
        XCTAssertEqual(coins.first?.symbol, "AUD")
        XCTAssertEqual(coins.first?.name, "Dólar australiano")
        XCTAssertEqual(coins.first?.type, "B")
        
        XCTAssertFalse(coins.isEmpty)
    }
    
    func test_getExchangeQuotation() async throws {
        let brasilAPI = BrasilAPI(exchangeRepository: repository)
        let quote = try await brasilAPI.exchange.getQuotation(coin: "USD", date: "2025-02-28")
        
        XCTAssertEqual(quote.data, "2025-02-28")
        XCTAssertFalse(quote.cotacoes.isEmpty)
    }

}
