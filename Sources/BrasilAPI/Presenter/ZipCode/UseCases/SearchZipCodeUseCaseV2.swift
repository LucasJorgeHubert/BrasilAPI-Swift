import Foundation

public class SearchZipCodeUseCaseV2 {
    private let repository: ZipCodeRepositoryProtocol
    
    init(repository: ZipCodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(zipCode: String) async throws -> BrasilAPIZipCodeV2Model {
        return try await repository.searchZipCodeV2(zipCode: zipCode)
    }
}
