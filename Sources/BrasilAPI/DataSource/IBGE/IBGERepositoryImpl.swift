import Foundation

extension DataSource.IBGE {
    public class RepositoryImpl: IBGERepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func getCities(by uf: String) async throws -> [Domain.IBGE.Models.CityModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.IBGE.APIRouter.getCitiesByState(state: uf))
        }
        
        public func getStates() async throws -> [Domain.IBGE.Models.StateModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.IBGE.APIRouter.getStates)
        }
        
        public func getState(by code: String) async throws -> Domain.IBGE.Models.StateModel {
            return try await apiDispatcher.request(apiRouter: DataSource.IBGE.APIRouter.getStateByCode(code: code))
        }
    }
}
