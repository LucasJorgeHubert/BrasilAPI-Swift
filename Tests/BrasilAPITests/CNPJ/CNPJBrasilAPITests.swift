import XCTest
@testable import BrasilAPI

final class CNPJBrasilAPITests: XCTestCase {
    let repository = CNPJRepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getCNPJInformation() async throws {
        let brasilAPI = BrasilAPI(cnpjRepository: repository)
        let cnpj = try await brasilAPI.cnpj.getCNPJ(cnpj: "00000000000")
        
        XCTAssertNotNil(cnpj)
    }

}
