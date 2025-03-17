import Foundation

public class ZipCodeService {
    private let searchZipCodeUseCase: SearchZipCodeUseCaseV1
    private let searchZipCodeUseCaseV2: SearchZipCodeUseCaseV2
    
    public init(repository: ZipCodeRepositoryProtocol = DataSource.ZipCode.RepositoryImpl()) {
        self.searchZipCodeUseCase = SearchZipCodeUseCaseV1(repository: repository)
        self.searchZipCodeUseCaseV2 = SearchZipCodeUseCaseV2(repository: repository)
    }
    
    public func searchZipCodeV1(zipCode: String) async throws -> BrasilAPIZipCodeV1Model {
        return try await searchZipCodeUseCase.execute(zipCode: zipCode)
    }
    
    public func searchZipCodeV2(zipCode: String) async throws -> BrasilAPIZipCodeV2Model {
        return try await searchZipCodeUseCaseV2.execute(zipCode: zipCode)
    }
}
