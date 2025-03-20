import Foundation

extension Presenter.Broker {
    public class Service {
        private let getBrokersUseCase: Presenter.Broker.UseCase.GetBrokers
        private let getBrokerByCNPJUseCase: Presenter.Broker.UseCase.GetBrokerByCNPJ
        
        public typealias BrokerModel = Domain.Broker.Models.Broker
        
        public init(repository: BrokerRepositoryProtocol = DataSource.Broker.RepositoryImpl()) {
            self.getBrokersUseCase = Presenter.Broker.UseCase.GetBrokers(repository: repository)
            self.getBrokerByCNPJUseCase = Presenter.Broker.UseCase.GetBrokerByCNPJ(repository: repository)
        }
        
        public func getBrokers() async throws -> [BrokerModel] {
            return try await getBrokersUseCase.execute()
        }
        
        public func getBrokerByCnpj(cnpj: String) async throws -> BrokerModel {
            return try await getBrokerByCNPJUseCase.execute(cnpj: cnpj)
        }
    }
}
