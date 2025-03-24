import XCTest
@testable import BrasilAPI

final class TaxIntegrationUseCaseTests: XCTestCase {
    var getTaxes: Presenter.Tax.UseCase.GetTaxes!
    var getTaxById: Presenter.Tax.UseCase.GetTaxById!
    
    override func setUp() {
        let repository = DataSource.Tax.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getTaxes = Presenter.Tax.UseCase.GetTaxes(repository: repository)
        getTaxById = Presenter.Tax.UseCase.GetTaxById(repository: repository)
    }
    
    func test_getTaxes() async throws {
        let taxes: [BrasilAPI.Tax.TaxModel] = try await getTaxes.execute()
        XCTAssertNotNil(taxes)
        XCTAssertTrue(taxes.count > 0)
    }
    
    func test_getTaxById() async throws {
        let tax: BrasilAPI.Tax.TaxModel = try await getTaxById.execute(taxId: "CDI")
        XCTAssertNotNil(tax)
    }
}
