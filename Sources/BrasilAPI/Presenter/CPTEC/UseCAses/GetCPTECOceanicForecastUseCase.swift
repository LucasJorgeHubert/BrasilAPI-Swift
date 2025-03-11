import Foundation

class GetCPTECOceanicForecastUseCase {
    private let repository: CPTECRepositoryProtocol
    
    init(repository: CPTECRepositoryProtocol = CPTECRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(cityCode: Int, days: Int) async throws -> BrasilAPICPTECOceanicForecastModel {
        return try await repository.getOceanicForecast(cityCode: cityCode, days: days)
    }
}
