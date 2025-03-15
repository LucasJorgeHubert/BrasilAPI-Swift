import Foundation

public class DDDRepositoryImpl: DDDRepositoryProtocol {
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(
        apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func getCitiesByDDD(ddd: String) async throws -> BrasilAPIDDDCitiesModel {
        return try await apiDispatcher.request(apiRouter: DDDAPIRouter.getCitiesByDDD(ddd: ddd))
    }
}
