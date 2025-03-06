import Foundation

public class CNPJRepositoryImpl: CNPJRepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func searchCNPJ(cnpj: String) async throws -> BrasilAPICNPJModel {
        return try await apiDispatcher.request(apiRouter: CNPJAPIRouter.getCNPJ(cnpj: cnpj))
    }
}
