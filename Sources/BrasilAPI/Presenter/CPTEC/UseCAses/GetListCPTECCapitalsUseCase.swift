import Foundation

class GetListCPTECCapitalsUseCase {
    private let repository: CPTECRepositoryProtocol
    
    init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [BrasilAPICPTECConditionModel] {
        return try await repository.listCapitalConditions()
    }
}
 
