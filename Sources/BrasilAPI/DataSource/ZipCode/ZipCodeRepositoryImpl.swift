import Foundation

extension DataSource.ZipCode {
    public struct RepositoryImpl: ZipCodeRepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func searchZipCodeV1(zipCode: String) async throws -> Domain.ZipCode.Models.V1.ZipCode {
            return try await apiDispatcher.request(apiRouter: DataSource.ZipCode.APIRouter.getZipCodeV1(zipCode: zipCode))
        }
        
        public func searchZipCodeV2(zipCode: String) async throws -> Domain.ZipCode.Models.V2.ZipCode {
            return try await apiDispatcher.request(apiRouter: DataSource.ZipCode.APIRouter.getZipCodeV2(zipCode: zipCode))
        }
    }
}
