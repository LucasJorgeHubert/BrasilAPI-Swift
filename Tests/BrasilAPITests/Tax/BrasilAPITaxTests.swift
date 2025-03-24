import XCTest
@testable import BrasilAPI

final class BrasilAPITaxTests: XCTestCase {
    let repository = DataSource.Tax.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }
    
    func test_getTaxes() async throws {
        let brasilAPI = BrasilAPI(taxRepository: repository)
        let taxes: [BrasilAPI.Tax.TaxModel] = try await brasilAPI.tax.getTaxes()
        
        XCTAssertEqual(taxes.count, 3)
        XCTAssertNotNil(taxes)
    }
    
    func test_getTaxById() async throws {
        let brasilAPI = BrasilAPI(taxRepository: repository)
        let tax: BrasilAPI.Tax.TaxModel = try await brasilAPI.tax.getTax(taxId: "CDI")
        
        XCTAssertNotNil(tax)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
