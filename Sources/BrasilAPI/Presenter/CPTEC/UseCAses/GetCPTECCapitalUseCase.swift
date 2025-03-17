import Foundation

class GetCPTECCapitalUseCase {
    private let repository: CPTECRepositoryProtocol
    
    init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(codeICAO: String) async throws -> BrasilAPICPTECConditionModel {
        return try await repository.getCapitalCondition(codeICAO: codeICAO)
    }
}
