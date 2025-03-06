import Foundation

public class SearchZipCodeUseCaseV1 {
    private let repository: ZipCodeRepositoryProtocol
    
    init(repository: ZipCodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(zipCode: String) async throws -> BrasilAPIZipCodeV1Model {
        return try await repository.searchZipCodeV1(zipCode: zipCode)
    }
}
