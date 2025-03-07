import Foundation

public protocol BrokerRepositoryProtocol {
    func getBrokers() async throws -> [BrasilAPIBrokerModel]
    func getBrokerByCnpj(cnpj: String) async throws -> BrasilAPIBrokerModel
}
