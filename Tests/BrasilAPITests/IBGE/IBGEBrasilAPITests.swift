import XCTest
@testable import BrasilAPI

class IBGEBrasilAPITests: XCTestCase {
    
    let repository = DataSource.IBGE.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getIBGECities() async throws {
        let brasilAPI = BrasilAPI(ibgeRepository: repository)
        let cities: [BrasilAPI.IBGE.CityModel] = try await brasilAPI.ibge.getCitiesByUF(uf: .SC)

        XCTAssertNotNil(cities)
        XCTAssertEqual(cities.count, 295)
        XCTAssertEqual(cities.first?.code, "4200051")
        XCTAssertEqual(cities.first?.name, "ABDON BATISTA")
    }
    
    func test_getIBGEStates() async throws {
        let brasilAPI = BrasilAPI(ibgeRepository: repository)
        let states: [BrasilAPI.IBGE.StateModel] = try await brasilAPI.ibge.getStates()
        
        XCTAssertNotNil(states)
        XCTAssertEqual(states.count, 27)
        XCTAssertEqual(states.first?.id, 11)
        XCTAssertEqual(states.first?.name, "Rondônia")
        XCTAssertEqual(states.first?.acronym, "RO")
        XCTAssertNotNil(states.first?.region)
        
        let region = states.first?.region
        XCTAssertEqual(region?.id, 1)
        XCTAssertEqual(region?.name, "Norte")
        XCTAssertEqual(region?.acronym, "N")
    }
    
    func test_getIBGEStateByCode() async throws {
        let brasilAPI = BrasilAPI(ibgeRepository: repository)
        let state: BrasilAPI.IBGE.StateModel = try await brasilAPI.ibge.getStateByCode(code: .SC)
        
        XCTAssertNotNil(state)
        XCTAssertEqual(state.id, 42)
        XCTAssertEqual(state.name, "Santa Catarina")
        
        let region = state.region
        XCTAssertEqual(region.id, 4)
        XCTAssertEqual(region.name, "Sul")
        XCTAssertEqual(region.acronym, "S")
    }
}
