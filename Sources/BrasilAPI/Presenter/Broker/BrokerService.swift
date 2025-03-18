import Foundation

public class BrokerService {
    private let getBrokersUseCase: GetBrokersUseCase
    private let getBrokerByCNPJUseCase: GetBrokerByCNPJUseCase
    
    public typealias BrasilAPIBrokerModel = Domain.Broker.Models.Broker
    
    public init(repository: BrokerRepositoryProtocol = DataSource.Broker.RepositoryImpl()) {
        self.getBrokersUseCase = GetBrokersUseCase(repository: repository)
        self.getBrokerByCNPJUseCase = GetBrokerByCNPJUseCase(repository: repository)
    }
    
    public func getBrokers() async throws -> [BrasilAPIBrokerModel] {
        return try await getBrokersUseCase.execute()
    }
    
    public func getBrokerByCnpj(cnpj: String) async throws -> BrasilAPIBrokerModel {
        return try await getBrokerByCNPJUseCase.execute(cnpj: cnpj)
    }
}
