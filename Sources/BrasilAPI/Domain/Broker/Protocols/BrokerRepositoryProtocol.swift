import Foundation

public protocol BrokerRepositoryProtocol {
    func getBrokers() async throws -> [Domain.Broker.Models.Broker]
    func getBrokerByCnpj(cnpj: String) async throws -> Domain.Broker.Models.Broker
}
