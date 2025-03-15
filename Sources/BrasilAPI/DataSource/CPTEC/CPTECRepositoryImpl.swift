import Foundation

public class CPTECRepositoryImpl: CPTECRepositoryProtocol {
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(
        apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func listLocals() async throws -> [BrasilAPICPTECLocalModel] {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.listLocals)
    }
    
    public func getLocal(localName: String) async throws -> [BrasilAPICPTECLocalModel] {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getLocal(localName: localName))
    }
    
    public func listCapitalConditions() async throws -> [BrasilAPICPTECConditionModel] {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.listCapitalConditions)
    }
    
    public func getCapitalCondition(codeICAO: String) async throws -> BrasilAPICPTECConditionModel {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getCapitalCondition(codeICAO: codeICAO))
    }
    
    public func getForecast(cityCode: Int, days: Int) async throws -> BrasilAPICPTECForecastModel {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getForecast(cityCode: cityCode, days: days))
    }
    
    public func getOceanicForecast(cityCode: Int, days: Int) async throws -> BrasilAPICPTECOceanicForecastModel {
        return try await apiDispatcher.request(apiRouter: CPTECAPIRouter.getOceanicForecast(cityCode: cityCode, days: days))
    }
}
