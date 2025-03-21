import XCTest
@testable import BrasilAPI

final class CNPJBrasilAPITests: XCTestCase {
    let repository = DataSource.CNPJ.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getCNPJInformation() async throws {
        let brasilAPI = BrasilAPI(cnpjRepository: repository)
        let cnpj: BrasilAPI.CNPJ.CNPJModel = try await brasilAPI.cnpj.getCNPJ(cnpj: "00000000000")
        
        XCTAssertNotNil(cnpj)
    }
}
