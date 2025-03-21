import Foundation

extension Presenter.CPTEC.UseCase {
    class GetCPTECOceanicForecast {
        private let repository: CPTECRepositoryProtocol
        
        init(repository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl()) {
            self.repository = repository
        }
        
        func execute(cityCode: Int, days: Int) async throws -> Domain.CPTEC.Models.OceanicForecast {
            return try await repository.getOceanicForecast(cityCode: cityCode, days: days)
        }
    }
}
