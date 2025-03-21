import Foundation

extension Presenter.ZipCode {
    public class Service {
        private let searchZipCodeUseCase: Presenter.ZipCode.UseCase.V1.SearchZipCode
        private let searchZipCodeUseCaseV2: Presenter.ZipCode.UseCase.V2.SearchZipCode
        
        public typealias ZipCodeV1Model = Domain.ZipCode.Models.V1.ZipCode
        public typealias ZipCodeV2Model = Domain.ZipCode.Models.V2.ZipCode
        public typealias BrasilAPIZipCodeV2LocationModel = Domain.ZipCode.Models.V2.Location
        public typealias BrasilAPIZipCodeV2CoordinatesModel = Domain.ZipCode.Models.V2.Coordinates
        
        public init(repository: ZipCodeRepositoryProtocol = DataSource.ZipCode.RepositoryImpl()) {
            self.searchZipCodeUseCase = Presenter.ZipCode.UseCase.V1.SearchZipCode(repository: repository)
            self.searchZipCodeUseCaseV2 = Presenter.ZipCode.UseCase.V2.SearchZipCode(repository: repository)
        }
        
        public func searchZipCodeV1(zipCode: String) async throws -> ZipCodeV1Model {
            return try await searchZipCodeUseCase.execute(zipCode: zipCode)
        }
        
        public func searchZipCodeV2(zipCode: String) async throws -> ZipCodeV2Model {
            return try await searchZipCodeUseCaseV2.execute(zipCode: zipCode)
        }
    }
}
