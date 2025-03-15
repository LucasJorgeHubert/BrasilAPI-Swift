import XCTest
@testable import BrasilAPI

final class IntegrationUseCaseTests: XCTestCase {
    var getBookUseCase: Presenter.ISBN.UseCase.GetBook!

    override func setUp() {
        let repository = DataSource.ISBN.RepositoryImpl()
        APIConfig.environment = .production
        getBookUseCase = Presenter.ISBN.UseCase.GetBook(repository: repository)
    }

    func test_integration_fetchCities() async throws {
        let book = try await getBookUseCase.execute(isbn: "9788545702870")
        
        XCTAssertEqual(book.authors, [
            "KATSUHIRO OTOMO",
            "DRIK SADA",
            "CASSIUS MEDAUAR",
            "MARCELO DEL GRECO",
            "DENIS TAKATA"
        ])
        XCTAssertEqual(book.isbn, "9788545702870")
        XCTAssertEqual(book.page_count, 364)
    }
}
