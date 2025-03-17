import XCTest
@testable import BrasilAPI

final class BrokerIntegrationUseCaseTests: XCTestCase {
    var listBrokersUseCase: GetBrokersUseCase!
    var getBrokerByCNPJUseCase: GetBrokerByCNPJUseCase!

    override func setUp() {
        let repository = DataSource.Broker.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        listBrokersUseCase = GetBrokersUseCase(repository: repository)
        getBrokerByCNPJUseCase = GetBrokerByCNPJUseCase(repository: repository)
    }

    func test_integration_fetchBrokers() async throws {
        let brokers = try await listBrokersUseCase.execute()
        XCTAssertFalse(brokers.isEmpty)
    }
    
    func test_integration_fetchBrokerByCNPJ() async throws {
        let broker = try await getBrokerByCNPJUseCase.execute(cnpj: "02332886000104")
        XCTAssertNotNil(broker)
    }
}
