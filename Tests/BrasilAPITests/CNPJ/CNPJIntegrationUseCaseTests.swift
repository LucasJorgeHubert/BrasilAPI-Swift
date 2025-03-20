import XCTest
@testable import BrasilAPI

final class CNPJIntegrationUseCaseTests: XCTestCase {
    var getCNPJUseCase: Presenter.CNPJ.UseCase.GetCNPJ!

    override func setUp() {
        let repository = DataSource.CNPJ.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getCNPJUseCase = Presenter.CNPJ.UseCase.GetCNPJ(repository: repository)
    }

    func test_integration_fetchCNPJ() async throws {
        let cnpj = try await getCNPJUseCase.execute(cnpj: "19131243000197")
        XCTAssertNotNil(cnpj)
    }
    
    func test_integration_fetchCNPJ_invalid() async throws {
        do {
            _ = try await getCNPJUseCase.execute(cnpj: "19131243000198")
        } catch {
            XCTAssertTrue(error is DataSource.BrasilAPIRequestError)
        }
    }
}
