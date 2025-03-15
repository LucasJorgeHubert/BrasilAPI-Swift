import Foundation

extension Presenter.ISBN.UseCase {
    public final class GetBook {
        private let repository: ISBNRepositoryProtocol
        
        init(repository: ISBNRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(isbn: String) async throws -> Domain.ISBN.Models.BookModel {
            return try await repository.getBook(by: isbn)
        }
    }
}
