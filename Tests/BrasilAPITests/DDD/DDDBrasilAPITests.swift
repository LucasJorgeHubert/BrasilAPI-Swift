import XCTest
@testable import BrasilAPI

final class DDDBrasilAPITests: XCTestCase {
    let repository = DataSource.DDD.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getExchangeCoins() async throws {
        let brasilAPI = BrasilAPI(dddRepository: repository)
        let res: BrasilAPI.DDD.CitiesModel = try await brasilAPI.ddd.getCitiesByDDD(ddd: "11")
        
        XCTAssertNotNil(res)
        XCTAssertFalse(res.cities.isEmpty)
        XCTAssertEqual(res.state, "SP")
        XCTAssertTrue(res.cities.contains("EMBU"))
        XCTAssertTrue(res.cities.contains("VÁRZEA PAULISTA"))
        XCTAssertTrue(res.cities.contains("VARGEM GRANDE PAULISTA"))
        XCTAssertTrue(res.cities.contains("VARGEM"))
        XCTAssertTrue(res.cities.contains("TUIUTI"))
        XCTAssertTrue(res.cities.contains("TABOÃO DA SERRA"))
        XCTAssertTrue(res.cities.contains("SUZANO"))
        XCTAssertTrue(res.cities.contains("SÃO ROQUE"))
        XCTAssertTrue(res.cities.contains("SÃO PAULO"))
    }

}
