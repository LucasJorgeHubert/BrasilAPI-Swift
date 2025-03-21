import Foundation

extension Presenter.NCM.UseCase {
    public class GetAllNCM {
        private let repository: NCMRepositoryProtocol
        
        public init(repository: NCMRepositoryProtocol = DataSource.NCM.RepositoryImpl()) {
            self.repository = repository
        }
        
        public func execute() async throws -> [Domain.NCM.Models.NCM] {
            return try await repository.getAllNCM()
        }
    }
}
