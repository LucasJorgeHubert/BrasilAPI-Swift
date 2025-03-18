import Foundation

class GetCPTECLocalForecastUseCase {
    private let repository: CPTECRepositoryProtocol
    
    init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(cityCode: Int, days: Int) async throws -> Domain.CPTEC.Models.Forecast {
        return try await repository.getForecast(cityCode: cityCode, days: days)
    }
}
