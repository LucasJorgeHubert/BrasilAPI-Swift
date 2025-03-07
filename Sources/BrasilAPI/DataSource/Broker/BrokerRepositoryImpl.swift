import Foundation

public class BrokerRepositoryImpl: BrokerRepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol

    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func getBrokers() async throws -> [BrasilAPIBrokerModel] {
        return try await apiDispatcher.request(apiRouter: BrokerAPIRouter.getBrokers)
    }
    
    public func getBrokerByCnpj(cnpj: String) async throws -> BrasilAPIBrokerModel {
        return try await apiDispatcher.request(apiRouter: BrokerAPIRouter.getBrokersByCnpj(cnpj: cnpj))
    }
}

