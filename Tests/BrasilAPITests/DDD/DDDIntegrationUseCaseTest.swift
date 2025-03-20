import XCTest
@testable import BrasilAPI

final class DDDIntegrationUseCaseTests: XCTestCase {
    var getCitiesByDDDUseCase: Presenter.DDD.UseCase.GetCitiesByDDD!

    override func setUp() {
        let repository = DataSource.DDD.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getCitiesByDDDUseCase = Presenter.DDD.UseCase.GetCitiesByDDD(repository: repository)
    }

    func test_integration_fetchCities() async throws {
        let cities = try await getCitiesByDDDUseCase.execute(ddd: "47")
        XCTAssertFalse(cities.cities.isEmpty)
        XCTAssertEqual(cities.state, "SC")
        XCTAssertTrue(cities.cities.contains("JOINVILLE"))
    }
}
