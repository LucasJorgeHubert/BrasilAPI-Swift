import Foundation

public class ZipCodeRepositoryImpl: ZipCodeRepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol

    public init(
        apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func searchZipCodeV1(zipCode: String) async throws -> BrasilAPIZipCodeV1Model {
        return try await apiDispatcher.request(apiRouter: ZipCodeAPIRouter.getZipCodeV1(zipCode: zipCode))
    }
    
    public func searchZipCodeV2(zipCode: String) async throws -> BrasilAPIZipCodeV2Model {
        return try await apiDispatcher.request(apiRouter: ZipCodeAPIRouter.getZipCodeV2(zipCode: zipCode))
    }
}
