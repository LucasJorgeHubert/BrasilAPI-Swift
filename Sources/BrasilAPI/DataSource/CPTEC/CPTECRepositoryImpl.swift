import Foundation

class CPTECRepositoryImpl: CPTECRepositoryProtocol {
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    func listLocals() async throws -> [BrasilAPICPTECLocalModel] {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.listLocals)
    }
    
    func getLocal(localName: String) async throws -> BrasilAPICPTECLocalModel {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getLocal(localName: localName))
    }
    
    func listCapitalConditions() async throws -> [BrasilAPICPTECConditionModel] {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.listCapitalConditions)
    }
    
    func getCapitalCondition(codeICAO: String) async throws -> BrasilAPICPTECConditionModel {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getCapitalCondition(codeICAO: codeICAO))
    }
    
    func getForecast(cityCode: Int, days: Int?) async throws -> BrasilAPICPTECForecastModel {
        if let days = days {
            return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getForecast(cityCode: cityCode, days: days))
        }
        
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getForecast(cityCode: cityCode, days: nil))
    }
    
    func getOceanicForecast(cityCode: Int, days: Int?) async throws -> BrasilAPICPTECOceanicForecastModel {
        if let days = days {
            return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getOceanicForecast(cityCode: cityCode, days: days))
        }
        
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getOceanicForecast(cityCode: cityCode, days: nil))
    }
}
