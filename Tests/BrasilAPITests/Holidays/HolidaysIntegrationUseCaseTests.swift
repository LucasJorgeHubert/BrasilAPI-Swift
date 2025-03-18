import XCTest
@testable import BrasilAPI

class HolidaysIntegrationUseCaseTests: XCTestCase {
    var getNationalHolidaysUseCase: GetNationalHolidaysUseCase!
    
    override func setUp() {
        let repository = DataSource.Holidays.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getNationalHolidaysUseCase = GetNationalHolidaysUseCase(repository: repository)
    }
    
    func test_getExchangeCoins() async throws {
        let res = try await getNationalHolidaysUseCase.execute(year: 2025)
        
        XCTAssertNotNil(res)
        XCTAssertFalse(res.isEmpty)
        XCTAssertEqual(res.first?.date, "2025-01-01")
        XCTAssertEqual(res.first?.name, "Confraternização mundial")
        XCTAssertEqual(res.first?.type, "national")
    }
}
