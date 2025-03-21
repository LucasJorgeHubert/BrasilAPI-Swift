import Foundation

extension Presenter.ZipCode.UseCase.V2 {
    public class SearchZipCode {
        private let repository: ZipCodeRepositoryProtocol
        
        init(repository: ZipCodeRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(zipCode: String) async throws -> Domain.ZipCode.Models.V2.ZipCode {
            return try await repository.searchZipCodeV2(zipCode: zipCode)
        }
    }
}
