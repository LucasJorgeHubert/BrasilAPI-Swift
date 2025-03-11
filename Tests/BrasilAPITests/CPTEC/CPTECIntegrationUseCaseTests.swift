import XCTest
@testable import BrasilAPI

final class CPTECIntegrationUseCaseTests: XCTestCase {
    var getCPTECCapitalUseCase: GetCPTECCapitalUseCase!
    var getCPTECLocalForecastUseCase: GetCPTECLocalForecastUseCase!
    var getCPTECLocalUseCase: GetCPTECLocalUseCase!
    var getCPTECOceanicForecastUseCase: GetCPTECOceanicForecastUseCase!
    var getListCPTECLocalsUseCase: GetListCPTECLocalsUseCase!
    var getListCPTECCapitalsUseCase: GetListCPTECCapitalsUseCase!

    override func setUp() {
        let repository = CPTECRepositoryImpl()
        APIConfig.environment = .production
        getCPTECCapitalUseCase = GetCPTECCapitalUseCase(repository: repository)
        getCPTECLocalForecastUseCase = GetCPTECLocalForecastUseCase(repository: repository)
        getCPTECLocalUseCase = GetCPTECLocalUseCase(repository: repository)
        getCPTECOceanicForecastUseCase = GetCPTECOceanicForecastUseCase(repository: repository)
        getListCPTECLocalsUseCase = GetListCPTECLocalsUseCase(repository: repository)
        getListCPTECCapitalsUseCase = GetListCPTECCapitalsUseCase(repository: repository)
    }

    func test_integration_fetchCPTECListLocals() async throws {
        let locals = try await getListCPTECLocalsUseCase.execute()
        XCTAssertNotNil(locals)
        
        XCTAssertEqual(locals.count, 60)
        XCTAssertTrue(locals.contains { $0.name == "São Caetano do Sul" })
        XCTAssertTrue(locals.contains { $0.state == "SP" })
        XCTAssertTrue(locals.contains { $0.id == 4772 })
    }
    
    func test_integration_fetchCPTECLocal() async throws {
        let locals = try await getCPTECLocalUseCase.execute(localName: "São Caetano do Sul")
        XCTAssertNotNil(locals)
        XCTAssertEqual(locals.count, 1)
        
        let local = locals[0]
        
        XCTAssertEqual(local.name, "São Caetano do Sul")
        XCTAssertEqual(local.state, "SP")
        XCTAssertEqual(local.id, 4772)
    }
    
    func test_integration_fetchCPTECLocalForecast() async throws {
        let forecast = try await getCPTECLocalForecastUseCase.execute(cityCode: 4772, days: 6)
        XCTAssertNotNil(forecast)
        XCTAssertEqual(forecast.city, "São Caetano do Sul")
        
        XCTAssertEqual(forecast.weather.count, 6)
    }
}
