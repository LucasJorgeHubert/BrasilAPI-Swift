import XCTest
@testable import BrasilAPI

final class BrokerBrasilAPITests: XCTestCase {
    let repository = DataSource.Broker.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_listBrokers() async throws {
        let brasilAPI = BrasilAPI(brokerRepository: repository)
        let brokers: [BrokerService.BrasilAPIBrokerModel] = try await brasilAPI.broker.getBrokers()
        
        XCTAssertEqual(brokers.first?.cnpj, "76621457000185")
        XCTAssertTrue(brokers.first?.nomeSocial.contains("4UM DTVM S.A.") ?? false)
        
        XCTAssertFalse(brokers.isEmpty)
    }
    
    func test_getBrokersByCNPJ() async throws {
        let brasilAPI = BrasilAPI(brokerRepository: repository)
        let broker: BrokerService.BrasilAPIBrokerModel = try await brasilAPI.broker.getBrokerByCnpj(cnpj: "76621457000185")
        
        XCTAssertEqual(broker.nomeSocial, "4UM DTVM S.A.")
        XCTAssertEqual(broker.cnpj, "76621457000185")
        XCTAssertEqual(broker.codigoCvm, "2275")
    }

}
