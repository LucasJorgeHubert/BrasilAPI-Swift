import Foundation

class DDDRepositoryImpl: DDDRepositoryProtocol {
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    func getCitiesByDDD(ddd: String) async throws -> BrasilAPIDDDCitiesModel {
        return try await apiDispatcher.request(apiRouter: DDDApiRouter.getCitiesByDDD(ddd: ddd))
    }
}
