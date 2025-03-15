import XCTest
@testable import BrasilAPI

final class BankIntegrationUseCaseTests: XCTestCase {
    var listBanksUseCase: GetBankListUseCase!
    var getBankByIdUseCase: GetBankByIdUseCase!

    override func setUp() {
        let repository = BankRepositoryImpl()
        DataSource.APIConfig.environment = .production
        listBanksUseCase = GetBankListUseCase(repository: repository)
        getBankByIdUseCase = GetBankByIdUseCase(repository: repository)
    }

    func test_integration_fetchBanks() async throws {
        let banks = try await listBanksUseCase.execute()
        XCTAssertFalse(banks.isEmpty)
    }
    
    func test_integration_fetchBankById() async throws {
        let bank = try await getBankByIdUseCase.execute(code: "001")
        XCTAssertNotNil(bank)
    }
    
    func test_integration_fetchBankById_invalidId() async throws {
        do {
            _ = try await getBankByIdUseCase.execute(code: "999")
            XCTFail("Erro não foi lançado")
        } catch {
            XCTAssert(error is DataSource.BrasilAPIRequestError)
        }
    }
}
