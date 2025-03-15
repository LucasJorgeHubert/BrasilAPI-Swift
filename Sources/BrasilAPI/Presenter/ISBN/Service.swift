import Foundation

extension Presenter.ISBN {
    public final class Service {
        private let getBookUseCase: Presenter.ISBN.UseCase.GetBook
        
        public init(repository: ISBNRepositoryProtocol = DataSource.ISBN.RepositoryImpl()) {
            self.getBookUseCase = Presenter.ISBN.UseCase.GetBook(repository: repository)
        }
        
        public func getBook(isbn: String) async throws -> Domain.ISBN.Models.BookModel {
            return try await getBookUseCase.execute(isbn: isbn)
        }
    }
}
