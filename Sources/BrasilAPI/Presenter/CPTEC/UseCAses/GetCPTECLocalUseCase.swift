import Foundation

class GetCPTECLocalUseCase {
    private let repository: CPTECRepositoryProtocol
    
    init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(localName: String) async throws -> [Domain.CPTEC.Models.Local] {
        return try await repository.getLocal(localName: localName)
    }
}
