import XCTest
@testable import BrasilAPI

final class BrokerIntegrationUseCaseTests: XCTestCase {
    var listBrokersUseCase: Presenter.Broker.UseCase.GetBrokers!
    var getBrokerByCNPJUseCase: Presenter.Broker.UseCase.GetBrokerByCNPJ!

    override func setUp() {
        let repository = DataSource.Broker.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        listBrokersUseCase = Presenter.Broker.UseCase.GetBrokers(repository: repository)
        getBrokerByCNPJUseCase = Presenter.Broker.UseCase.GetBrokerByCNPJ(repository: repository)
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
