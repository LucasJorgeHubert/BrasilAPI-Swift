import XCTest
@testable import BrasilAPI

class IBGEBrasilAPITests: XCTestCase {
    
    let repository = IBGERepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getIBGECities() async throws {
        let brasilAPI = BrasilAPI(ibgeRepository: repository)
        let cities = try await brasilAPI.ibge.getIBGECitiesByUF(uf: .SC)

        XCTAssertNotNil(cities)
        XCTAssertEqual(cities.count, 295)
        XCTAssertEqual(cities.first?.code, "4200051")
        XCTAssertEqual(cities.first?.name, "ABDON BATISTA")
    }
    
    func test_getIBGEStates() async throws {
        let brasilAPI = BrasilAPI(ibgeRepository: repository)
        let states = try await brasilAPI.ibge.getIBGEStates()
        
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
        let state = try await brasilAPI.ibge.getIBGEStateByCode(code: .SC)
        
        XCTAssertNotNil(state)
        XCTAssertEqual(state.id, 42)
        XCTAssertEqual(state.name, "Santa Catarina")
        
        let region = state.region
        XCTAssertEqual(region.id, 4)
        XCTAssertEqual(region.name, "Sul")
        XCTAssertEqual(region.acronym, "S")
    }
}
