import Foundation

extension Presenter.CPTEC {
    
    public class Service {
        let getCPTECCapitalUseCase: Presenter.CPTEC.UseCase.GetCPTECCapital
        let getCPTECLocalForecastUseCase: Presenter.CPTEC.UseCase.GetCPTECLocalForecast
        let getCPTECLocalUseCase: Presenter.CPTEC.UseCase.GetCPTECLocal
        let getCPTECOceanicForecastUseCase: Presenter.CPTEC.UseCase.GetCPTECOceanicForecast
        let getListCPTECLocalsUseCase: Presenter.CPTEC.UseCase.GetListCPTECLocals
        let getListCPTECCapitalsUseCase: Presenter.CPTEC.UseCase.GetListCPTECCapitals
        
        public typealias ConditionModel = Domain.CPTEC.Models.Condition
        public typealias WeatherModel = Domain.CPTEC.Models.Weather
        public typealias ForecastModel = Domain.CPTEC.Models.Forecast
        public typealias LocalModel = Domain.CPTEC.Models.Local
        public typealias WavesDataModel = Domain.CPTEC.Models.WavesData
        public typealias WavesModel = Domain.CPTEC.Models.Waves
        public typealias OceanicForecastModel = Domain.CPTEC.Models.OceanicForecast
        
        public typealias ForecastAvailableDays = Presenter.CPTEC.Helper.ForecastAvailableDays
        
        public init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
            self.getCPTECCapitalUseCase = Presenter.CPTEC.UseCase.GetCPTECCapital(repository: repository)
            self.getCPTECLocalForecastUseCase = Presenter.CPTEC.UseCase.GetCPTECLocalForecast(repository: repository)
            self.getCPTECLocalUseCase = Presenter.CPTEC.UseCase.GetCPTECLocal(repository: repository)
            self.getCPTECOceanicForecastUseCase = Presenter.CPTEC.UseCase.GetCPTECOceanicForecast(repository: repository)
            self.getListCPTECLocalsUseCase = Presenter.CPTEC.UseCase.GetListCPTECLocals(repository: repository)
            self.getListCPTECCapitalsUseCase = Presenter.CPTEC.UseCase.GetListCPTECCapitals(repository: repository)
        }
        
        public func getCPTECCapital(codeICAO: String) async throws -> ConditionModel {
            return try await getCPTECCapitalUseCase.execute(codeICAO: codeICAO)
        }
        
        public func getCPTECLocal(localName: String) async throws -> [LocalModel] {
            return try await getCPTECLocalUseCase.execute(localName: localName)
        }
        
        public func getListCPTECLocals() async throws -> [LocalModel] {
            return try await getListCPTECLocalsUseCase.execute()
        }
        
        public func getListCPTECCapitals() async throws -> [ConditionModel] {
            return try await getListCPTECCapitalsUseCase.execute()
        }
        
        public func getCPTECLocalForecast(cityCode: Int, days: ForecastAvailableDays) async throws -> ForecastModel {
            return try await getCPTECLocalForecastUseCase.execute(cityCode: cityCode, days: days.rawValue)
        }
        
        public func getCPTECOceanicForecast(cityCode: Int, days: ForecastAvailableDays) async throws -> OceanicForecastModel {
            return try await getCPTECOceanicForecastUseCase.execute(cityCode: cityCode, days: days.rawValue)
        }
    }
}
