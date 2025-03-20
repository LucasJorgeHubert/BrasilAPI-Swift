import Foundation

extension Presenter.DDD {
    public class Service {
        private let getCitiesByDDDUseCase: Presenter.DDD.UseCase.GetCitiesByDDD
        
        public typealias CitiesModel = Domain.DDD.Models.Cities
        
        public init(repository: DDDRepositoryProtocol = DataSource.DDD.RepositoryImpl()) {
            self.getCitiesByDDDUseCase = Presenter.DDD.UseCase.GetCitiesByDDD(repository: repository)
        }
        
        public func getCitiesByDDD(ddd: String) async throws -> CitiesModel {
            return try await getCitiesByDDDUseCase.execute(ddd: ddd)
        }
    }
}
