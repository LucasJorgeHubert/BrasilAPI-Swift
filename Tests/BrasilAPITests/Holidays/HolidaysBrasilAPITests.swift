import XCTest
@testable import BrasilAPI

final class HolidaysBrasilAPITests: XCTestCase {
    let repository = DataSource.Holidays.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getExchangeCoins() async throws {
        let brasilAPI = BrasilAPI(holidaysRepository: repository)
        let holidays: [HolidaysService.BrasilAPIHolidaysModel] = try await brasilAPI.holidays.getNationalHolidays(
            year: 2025
        )
        
        XCTAssertEqual(holidays.first?.date, "2025-01-01")
        XCTAssertEqual(holidays.first?.name, "Confraternização mundial")
        XCTAssertEqual(holidays.first?.type, "national")
        
        XCTAssertFalse(holidays.isEmpty)
    }
}
