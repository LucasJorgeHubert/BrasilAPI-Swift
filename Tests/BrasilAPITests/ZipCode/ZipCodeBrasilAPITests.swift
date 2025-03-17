import XCTest
@testable import BrasilAPI

final class ZipCodeBrasilAPITests: XCTestCase {
    let repository = DataSource.ZipCode.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_searchZipCodeV1() async throws {
        let brasilAPI = BrasilAPI(zipCodeRepository: repository)
        let zipCode = try await brasilAPI.zipCode.searchZipCodeV1(zipCode: "88220000")
        
        XCTAssertNotNil(zipCode)
        XCTAssertEqual(zipCode.city, "Itapema")
        XCTAssertEqual(zipCode.state, "SC")
        XCTAssertEqual(zipCode.service, "open-cep")
    }
        
    
    func test_searchZipCodeV2() async throws {
        let brasilAPI = BrasilAPI(zipCodeRepository: repository)
        let zipCode = try await brasilAPI.zipCode.searchZipCodeV2(zipCode: "89010025")
        
        XCTAssertNotNil(zipCode)
        XCTAssertEqual(zipCode.city, "Blumenau")
        XCTAssertEqual(zipCode.state, "SC")
        XCTAssertEqual(zipCode.location.coordinates?.latitude, "-26.924488960268203")
        XCTAssertEqual(zipCode.location.coordinates?.longitude, "-49.06298335397739")
    }

}
