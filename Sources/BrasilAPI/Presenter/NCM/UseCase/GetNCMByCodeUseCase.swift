import Foundation

extension Presenter.NCM.UseCase {
    public class GetNCMByCode {
        private let repository: NCMRepositoryProtocol
        
        public init(repository: NCMRepositoryProtocol = DataSource.NCM.RepositoryImpl()) {
            self.repository = repository
        }
        
        public func execute(code: String) async throws -> Domain.NCM.Models.NCM {
            return try await repository.getNCM(id: code)
        }
    }
}
