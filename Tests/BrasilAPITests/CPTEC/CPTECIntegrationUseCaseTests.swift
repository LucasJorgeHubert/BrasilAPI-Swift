import XCTest
@testable import BrasilAPI

final class CPTECIntegrationUseCaseTests: XCTestCase {
    var getCPTECCapitalUseCase: Presenter.CPTEC.UseCase.GetCPTECCapital!
    var getCPTECLocalForecastUseCase: Presenter.CPTEC.UseCase.GetCPTECLocalForecast!
    var getCPTECLocalUseCase: Presenter.CPTEC.UseCase.GetCPTECLocal!
    var getCPTECOceanicForecastUseCase: Presenter.CPTEC.UseCase.GetCPTECOceanicForecast!
    var getListCPTECLocalsUseCase: Presenter.CPTEC.UseCase.GetListCPTECLocals!
    var getListCPTECCapitalsUseCase: Presenter.CPTEC.UseCase.GetListCPTECCapitals!

    override func setUp() {
        let repository = DataSource.CPTEC.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getCPTECCapitalUseCase = Presenter.CPTEC.UseCase.GetCPTECCapital(repository: repository)
        getCPTECLocalForecastUseCase = Presenter.CPTEC.UseCase.GetCPTECLocalForecast(repository: repository)
        getCPTECLocalUseCase = Presenter.CPTEC.UseCase.GetCPTECLocal(repository: repository)
        getCPTECOceanicForecastUseCase = Presenter.CPTEC.UseCase.GetCPTECOceanicForecast(repository: repository)
        getListCPTECLocalsUseCase = Presenter.CPTEC.UseCase.GetListCPTECLocals(repository: repository)
        getListCPTECCapitalsUseCase = Presenter.CPTEC.UseCase.GetListCPTECCapitals(repository: repository)
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
