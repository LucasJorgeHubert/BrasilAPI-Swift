import Foundation

public class DDDService {
    private let getCitiesByDDDUseCase: GetCitiesByDDDUseCase
    
    public init(repository: DDDRepositoryProtocol = DataSource.DDD.RepositoryImpl()) {
        self.getCitiesByDDDUseCase = GetCitiesByDDDUseCase(repository: repository)
    }
    
    public func getCitiesByDDD(ddd: String) async throws -> BrasilAPIDDDCitiesModel {
        return try await getCitiesByDDDUseCase.execute(ddd: ddd)
    }
}
