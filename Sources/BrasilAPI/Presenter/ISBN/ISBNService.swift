import Foundation

extension Presenter.ISBN {
    public final class Service {
        private let getBookUseCase: Presenter.ISBN.UseCase.GetBook
        
        public typealias BookModel = Domain.ISBN.Models.BookModel
        
        public init(repository: ISBNRepositoryProtocol = DataSource.ISBN.RepositoryImpl()) {
            self.getBookUseCase = Presenter.ISBN.UseCase.GetBook(repository: repository)
        }
        
        public func getBook(isbn: String) async throws -> BookModel {
            return try await getBookUseCase.execute(isbn: isbn)
        }
    }
}
