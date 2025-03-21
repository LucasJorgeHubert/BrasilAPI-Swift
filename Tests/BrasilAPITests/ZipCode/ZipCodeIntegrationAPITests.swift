import XCTest
@testable import BrasilAPI

final class ZipCodeIntegrationUseCaseTests: XCTestCase {
    var searchZipCodeUseCase: Presenter.ZipCode.UseCase.V1.SearchZipCode!
    var searchZipCodeUseCaseV2: Presenter.ZipCode.UseCase.V2.SearchZipCode!

    override func setUp() {
        let repository = DataSource.ZipCode.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        searchZipCodeUseCase = Presenter.ZipCode.UseCase.V1.SearchZipCode(repository: repository)
        searchZipCodeUseCaseV2 = Presenter.ZipCode.UseCase.V2.SearchZipCode(repository: repository)
    }

    func test_integration_fetchZipCodeV1() async throws {
        let cepV1: BrasilAPI.ZipCode.ZipCodeV1Model = try await searchZipCodeUseCase.execute(zipCode: "88220000")
        XCTAssertEqual(cepV1.cep, "88220000")
        XCTAssertEqual(cepV1.state, "SC")
        XCTAssertNotNil(cepV1)
    }
    
    func test_integration_fetchZipCodeV2() async throws {
        let cepV2: BrasilAPI.ZipCode.ZipCodeV2Model = try await searchZipCodeUseCaseV2.execute(zipCode: "89010025")
        XCTAssertNotNil(cepV2)
        XCTAssertEqual(cepV2.city, "Blumenau")
        XCTAssertEqual(cepV2.state, "SC")
        XCTAssertEqual(cepV2.location.coordinates?.latitude, "-26.924488960268203")
        XCTAssertEqual(cepV2.location.coordinates?.longitude, "-49.06298335397739")
    }
}
