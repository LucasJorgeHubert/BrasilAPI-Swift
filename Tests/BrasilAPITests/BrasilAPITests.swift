import XCTest
@testable import BrasilAPI

final class BrasilAPITests: XCTestCase {
    var useCase: GetBankListUseCase!

    override func setUp() {
        let repository = BankRepositoryImpl()
        APIConfig.environment = .local
        useCase = GetBankListUseCase(repository: repository)
    }

    func test_integration_fetchBanks() async throws {
        let banks = try await useCase.execute()
        XCTAssertFalse(banks.isEmpty)
    }
}
