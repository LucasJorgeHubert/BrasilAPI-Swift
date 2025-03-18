import XCTest
@testable import BrasilAPI

final class BankBrasilAPITests: XCTestCase {
    let repository = DataSource.Bank.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_listBanks() async throws {
        let brasilAPI = BrasilAPI(bankingRepository: repository)
        let banks = try await brasilAPI.banking.listBanks()
        
        XCTAssertEqual(banks.first?.code, 1)
        XCTAssertTrue(banks.first?.name?.contains("BCO DO BRASIL S.A.") ?? false)
        
        XCTAssertFalse(banks.isEmpty)
    }
    
    func test_getBankById() async throws {
        let brasilAPI = BrasilAPI(bankingRepository: repository)
        let bank = try await brasilAPI.banking.getBankByCode(code: "001")
        
        XCTAssertEqual(bank.code, 1)
        XCTAssertTrue(bank.name?.contains("BCO DO BRASIL S.A.") ?? false)
    }

}
