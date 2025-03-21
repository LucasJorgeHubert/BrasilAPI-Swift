import XCTest
@testable import BrasilAPI

final class ISBNBrasilAPITests: XCTestCase {
    let repository = DataSource.ISBN.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getISBNBook() async throws {
        let brasilAPI = BrasilAPI(isbnRepository: repository)
        let book: BrasilAPI.ISBN.BookModel = try await brasilAPI.isbn.getBook(isbn: "9788545702870")
                                                    
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
