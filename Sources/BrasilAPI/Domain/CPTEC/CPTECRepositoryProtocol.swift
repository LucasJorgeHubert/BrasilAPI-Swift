import Foundation

public protocol CPTECRepositoryProtocol {
    func listLocals() async throws -> [Domain.CPTEC.Models.Local]
    func getLocal(localName: String) async throws -> [Domain.CPTEC.Models.Local]
    func listCapitalConditions() async throws -> [Domain.CPTEC.Models.Condition]
    func getCapitalCondition(codeICAO: String) async throws -> Domain.CPTEC.Models.Condition
    func getForecast(cityCode: Int, days: Int) async throws -> Domain.CPTEC.Models.Forecast
    func getOceanicForecast(cityCode: Int, days: Int) async throws -> Domain.CPTEC.Models.OceanicForecast
}
