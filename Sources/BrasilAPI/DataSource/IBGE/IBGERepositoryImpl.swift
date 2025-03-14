import Foundation

public class IBGERepositoryImpl: IBGERepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func getCities(by uf: String) async throws -> [BrasilAPIIBGECityModel] {
        return try await apiDispatcher.request(apiRouter: IBGEAPIRouter.getCitiesByState(state: uf))
    }
    
    public func getStates() async throws -> [BrasilAPIIBGEStateModel] {
        return try await apiDispatcher.request(apiRouter: IBGEAPIRouter.getStates)
    }
    
    public func getState(by code: String) async throws -> BrasilAPIIBGEStateModel {
        return try await apiDispatcher.request(apiRouter: IBGEAPIRouter.getStateByCode(code: code))
    }
    
    
}
