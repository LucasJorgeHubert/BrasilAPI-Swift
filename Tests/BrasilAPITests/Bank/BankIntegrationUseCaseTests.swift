import XCTest
@testable import BrasilAPI

final class BankIntegrationUseCaseTests: XCTestCase {
    var listBanksUseCase: Presenter.Bank.UseCase.GetBankList!
    var getBankByIdUseCase: Presenter.Bank.UseCase.GetBankById!

    override func setUp() {
        let repository = DataSource.Bank.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        listBanksUseCase = Presenter.Bank.UseCase.GetBankList(repository: repository)
        getBankByIdUseCase = Presenter.Bank.UseCase.GetBankById(repository: repository)
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
