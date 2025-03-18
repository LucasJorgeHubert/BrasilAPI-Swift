import Foundation

class GetFIPEReferenceTableUseCase {
    private let repository: FIPERepositoryProtocol
    
    init(repository: FIPERepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Domain.FIPE.Models.Table] {
        return try await repository.getReferenceTables()
    }
}
