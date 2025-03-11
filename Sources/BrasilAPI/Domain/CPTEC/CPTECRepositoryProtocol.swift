import Foundation

protocol CPTECRepositoryProtocol {
    func listLocals() async throws -> [BrasilAPICPTECLocalModel]
    func getLocal(localName: String) async throws -> [BrasilAPICPTECLocalModel]
    func listCapitalConditions() async throws -> [BrasilAPICPTECConditionModel]
    func getCapitalCondition(codeICAO: String) async throws -> BrasilAPICPTECConditionModel
    func getForecast(cityCode: Int, days: Int) async throws -> BrasilAPICPTECForecastModel
    func getOceanicForecast(cityCode: Int, days: Int) async throws -> BrasilAPICPTECOceanicForecastModel
}
