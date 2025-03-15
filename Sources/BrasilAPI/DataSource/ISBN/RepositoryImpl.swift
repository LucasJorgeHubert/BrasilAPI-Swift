import Foundation

extension DataSource.ISBN {
    public struct RepositoryImpl: ISBNRepositoryProtocol {
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func getBook(by isbn: String) async throws -> Domain.ISBN.Models.BookModel {
            return try await apiDispatcher.request(apiRouter: DataSource.ISBN.APIRouter.getBook(isbn: isbn))
        }
    }
}
