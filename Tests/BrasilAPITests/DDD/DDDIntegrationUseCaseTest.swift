import XCTest
@testable import BrasilAPI

final class DDDIntegrationUseCaseTests: XCTestCase {
    var getCitiesByDDDUseCase: GetCitiesByDDDUseCase!

    override func setUp() {
        let repository = DDDRepositoryImpl()
        DataSource.APIConfig.environment = .production
        getCitiesByDDDUseCase = GetCitiesByDDDUseCase(repository: repository)
    }

    func test_integration_fetchCities() async throws {
        let cities = try await getCitiesByDDDUseCase.execute(ddd: "47")
        XCTAssertFalse(cities.cities.isEmpty)
        XCTAssertEqual(cities.state, "SC")
        XCTAssertTrue(cities.cities.contains("JOINVILLE"))
    }
}
