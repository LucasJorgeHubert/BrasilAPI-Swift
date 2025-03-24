import XCTest
@testable import BrasilAPI

final class DomainBRIntegrationUseCaseTests: XCTestCase {
    var getDomainBRStatusUseCase: Presenter.DomainBR.UseCase.GetDomainBRStatus!
    
    override func setUp() {
        let repository = DataSource.DomainBR.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getDomainBRStatusUseCase = Presenter.DomainBR.UseCase.GetDomainBRStatus(repository: repository)
    }
    
    func test_integration_fetchDomainBRStatus() async throws {
        let status = try await getDomainBRStatusUseCase.execute(domain: "brasilapi.com.br")
        XCTAssertNotNil(status)
    }
}

