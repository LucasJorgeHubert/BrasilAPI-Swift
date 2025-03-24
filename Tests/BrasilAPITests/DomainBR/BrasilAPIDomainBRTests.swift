import XCTest
@testable import BrasilAPI

final class BrasilAPIDomainBRTests: XCTestCase {
    let repository = DataSource.DomainBR.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }
    
    func test_getDomainBRStatus() async throws {
        let brasilAPI = BrasilAPI(domainBRRepository: repository)
        let status: BrasilAPI.DomainBR.DomainBRStatusModel = try await brasilAPI.domainBR.getDomainBRStatus(domain: "brasilapi.com.br")
        
        XCTAssertEqual(status.fqdn, "brasilapi.com.br")
        XCTAssertNotNil(status)
        XCTAssertEqual(status.status, BrasilAPI.DomainBR.DomainBRStatusEnum.registered )
        XCTAssertEqual(status.statusCode, BrasilAPI.DomainBR.DomainBRStatusCodeEnum.registered)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
