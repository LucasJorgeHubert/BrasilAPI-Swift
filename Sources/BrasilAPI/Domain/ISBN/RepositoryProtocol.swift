import Foundation

public protocol ISBNRepositoryProtocol {
    func getBook(by isbn: String) async throws -> Domain.ISBN.Models.BookModel
}
