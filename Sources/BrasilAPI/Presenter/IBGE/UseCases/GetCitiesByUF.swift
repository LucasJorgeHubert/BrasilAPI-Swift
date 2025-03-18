import Foundation

extension Presenter.IBGE.UseCase {
    
    public final class GetCitiesByUF {
        private let repository: IBGERepositoryProtocol
        
        init(repository: IBGERepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(uf: String) async throws -> [Domain.IBGE.Models.CityModel] {
            return try await repository.getCities(by: uf)
        }
    }
}
