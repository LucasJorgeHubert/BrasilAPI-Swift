import Foundation

public class CPTECService {
    let getCPTECCapitalUseCase: GetCPTECCapitalUseCase
    let getCPTECLocalForecastUseCase: GetCPTECLocalForecastUseCase
    let getCPTECLocalUseCase: GetCPTECLocalUseCase
    let getCPTECOceanicForecastUseCase: GetCPTECOceanicForecastUseCase
    let getListCPTECLocalsUseCase: GetListCPTECLocalsUseCase
    let getListCPTECCapitalsUseCase: GetListCPTECCapitalsUseCase
    
    public typealias BrasilAPICPTECConditionModel = Domain.CPTEC.Models.Condition
    public typealias BrasilAPICPTECWeatherModel = Domain.CPTEC.Models.Weather
    public typealias BrasilAPICPTECForecastModel = Domain.CPTEC.Models.Forecast
    public typealias BrasilAPICPTECLocalModel = Domain.CPTEC.Models.Local
    public typealias BrasilAPICPTECWavesDataModel = Domain.CPTEC.Models.WavesData
    public typealias BrasilAPICPTECWavesModel = Domain.CPTEC.Models.Waves
    public typealias BrasilAPICPTECOceanicForecastModel = Domain.CPTEC.Models.OceanicForecast
    
    public init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
        self.getCPTECCapitalUseCase = GetCPTECCapitalUseCase(repository: repository)
        self.getCPTECLocalForecastUseCase = GetCPTECLocalForecastUseCase(repository: repository)
        self.getCPTECLocalUseCase = GetCPTECLocalUseCase(repository: repository)
        self.getCPTECOceanicForecastUseCase = GetCPTECOceanicForecastUseCase(repository: repository)
        self.getListCPTECLocalsUseCase = GetListCPTECLocalsUseCase(repository: repository)
        self.getListCPTECCapitalsUseCase = GetListCPTECCapitalsUseCase(repository: repository)
    }
    
    public func getCPTECCapital(codeICAO: String) async throws -> BrasilAPICPTECConditionModel {
        return try await getCPTECCapitalUseCase.execute(codeICAO: codeICAO)
    }
    
    public func getCPTECLocal(localName: String) async throws -> [BrasilAPICPTECLocalModel] {
        return try await getCPTECLocalUseCase.execute(localName: localName)
    }
    
    public func getListCPTECLocals() async throws -> [BrasilAPICPTECLocalModel] {
        return try await getListCPTECLocalsUseCase.execute()
    }
    
    public func getListCPTECCapitals() async throws -> [BrasilAPICPTECConditionModel] {
        return try await getListCPTECCapitalsUseCase.execute()
    }
    
    public func getCPTECLocalForecast(cityCode: Int, days: ForecastAvailableDays) async throws -> BrasilAPICPTECForecastModel {
        return try await getCPTECLocalForecastUseCase.execute(cityCode: cityCode, days: days.rawValue)
    }
    
    public func getCPTECOceanicForecast(cityCode: Int, days: ForecastAvailableDays) async throws -> BrasilAPICPTECOceanicForecastModel {
        return try await getCPTECOceanicForecastUseCase.execute(cityCode: cityCode, days: days.rawValue)
    }
}
