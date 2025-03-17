import Foundation

extension DataSource.CPTEC {
    public struct RepositoryImpl: CPTECRepositoryProtocol {
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func listLocals() async throws -> [BrasilAPICPTECLocalModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.CPTEC.APIRouter.listLocals)
        }
        
        public func getLocal(localName: String) async throws -> [BrasilAPICPTECLocalModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.CPTEC.APIRouter.getLocal(localName: localName))
        }
        
        public func listCapitalConditions() async throws -> [BrasilAPICPTECConditionModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.CPTEC.APIRouter.listCapitalConditions)
        }
        
        public func getCapitalCondition(codeICAO: String) async throws -> BrasilAPICPTECConditionModel {
            return try await apiDispatcher.request(apiRouter: DataSource.CPTEC.APIRouter.getCapitalCondition(codeICAO: codeICAO))
        }
        
        public func getForecast(cityCode: Int, days: Int) async throws -> BrasilAPICPTECForecastModel {
            return try await apiDispatcher.request(apiRouter: DataSource.CPTEC.APIRouter.getForecast(cityCode: cityCode, days: days))
        }
        
        public func getOceanicForecast(cityCode: Int, days: Int) async throws -> BrasilAPICPTECOceanicForecastModel {
            return try await apiDispatcher.request(apiRouter: DataSource.CPTEC.APIRouter.getOceanicForecast(cityCode: cityCode, days: days))
        }
    }
}
