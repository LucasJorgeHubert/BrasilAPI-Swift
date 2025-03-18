import Foundation

public class DDDService {
    private let getCitiesByDDDUseCase: GetCitiesByDDDUseCase
    
    public typealias BrasilAPIDDDCitiesModel = Domain.DDD.Models.Cities
    
    public init(repository: DDDRepositoryProtocol = DataSource.DDD.RepositoryImpl()) {
        self.getCitiesByDDDUseCase = GetCitiesByDDDUseCase(repository: repository)
    }
    
    public func getCitiesByDDD(ddd: String) async throws -> BrasilAPIDDDCitiesModel {
        return try await getCitiesByDDDUseCase.execute(ddd: ddd)
    }
}
