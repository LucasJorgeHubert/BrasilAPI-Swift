import XCTest
@testable import BrasilAPI

final class CNPJIntegrationUseCaseTests: XCTestCase {
    var getCNPJUseCase: GetCNPJUseCase!

    override func setUp() {
        let repository = DataSource.CNPJ.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getCNPJUseCase = GetCNPJUseCase(repository: repository)
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
