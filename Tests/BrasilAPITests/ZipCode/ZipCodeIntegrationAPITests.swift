import XCTest
@testable import BrasilAPI

final class ZipCodeIntegrationUseCaseTests: XCTestCase {
    var searchZipCodeUseCase: SearchZipCodeUseCaseV1!
    var searchZipCodeUseCaseV2: SearchZipCodeUseCaseV2!

    override func setUp() {
        let repository = ZipCodeRepositoryImpl()
        APIConfig.environment = .production
        searchZipCodeUseCase = SearchZipCodeUseCaseV1(repository: repository)
        searchZipCodeUseCaseV2 = SearchZipCodeUseCaseV2(repository: repository)
    }

    func test_integration_fetchZipCodeV1() async throws {
        let cepV1 = try await searchZipCodeUseCase.execute(zipCode: "88220000")
        XCTAssertEqual(cepV1.cep, "88220000")
        XCTAssertEqual(cepV1.state, "SC")
        XCTAssertNotNil(cepV1)
    }
    
    func test_integration_fetchZipCodeV2() async throws {
        let cepV2 = try await searchZipCodeUseCaseV2.execute(zipCode: "89010025")
        XCTAssertNotNil(cepV2)
        XCTAssertEqual(cepV2.city, "Blumenau")
        XCTAssertEqual(cepV2.state, "SC")
        XCTAssertEqual(cepV2.location.coordinates?.latitude, "-26.924488960268203")
        XCTAssertEqual(cepV2.location.coordinates?.longitude, "-49.06298335397739")
    }
}
