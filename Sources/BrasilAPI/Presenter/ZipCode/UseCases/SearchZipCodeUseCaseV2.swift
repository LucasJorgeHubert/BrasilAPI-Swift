import Foundation

public class SearchZipCodeUseCaseV2 {
    private let repository: ZipCodeRepositoryProtocol
    
    init(repository: ZipCodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(zipCode: String) async throws -> Domain.ZipCode.Models.v2.ZipCode {
        return try await repository.searchZipCodeV2(zipCode: zipCode)
    }
}
