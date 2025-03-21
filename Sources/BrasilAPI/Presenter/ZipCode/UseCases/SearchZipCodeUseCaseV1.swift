import Foundation

extension Presenter.ZipCode.UseCase.V1 {
    public class SearchZipCode {
        private let repository: ZipCodeRepositoryProtocol
        
        init(repository: ZipCodeRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(zipCode: String) async throws -> Domain.ZipCode.Models.V1.ZipCode {
            return try await repository.searchZipCodeV1(zipCode: zipCode)
        }
    }
}
