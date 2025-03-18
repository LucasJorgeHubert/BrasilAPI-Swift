import Foundation

public class CNPJService {
    private let getCNPJUseCase: GetCNPJUseCase
    
    public typealias BrasilAPICNPJModel = Domain.CNPJ.Models.CNPJ
    
    public init(repository: CNPJRepositoryProtocol = DataSource.CNPJ.RepositoryImpl()) {
        self.getCNPJUseCase = GetCNPJUseCase(repository: repository)
    }
    
    public func getCNPJ(cnpj: String) async throws -> BrasilAPICNPJModel {
        return try await getCNPJUseCase.execute(cnpj: cnpj)
    }
}
