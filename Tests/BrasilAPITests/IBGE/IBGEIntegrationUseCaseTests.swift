import XCTest
@testable import BrasilAPI

class IBGEIntegrationUseCaseTests: XCTestCase {
    var getIBGECitiesByUFUseCase: GetIBGECitiesByUFUseCase!
    var getIBGEStatesUseCase: GetIBGEStatesUseCase!
    var getIBGEStateByCodeUseCase: GetIBGEStateByCodeUseCase!
    
    override func setUp() {
        let repository = IBGERepositoryImpl()
        APIConfig.environment = .production
        getIBGECitiesByUFUseCase = GetIBGECitiesByUFUseCase(repository: repository)
        getIBGEStatesUseCase = GetIBGEStatesUseCase(repository: repository)
        getIBGEStateByCodeUseCase = GetIBGEStateByCodeUseCase(repository: repository)
    }
    
    func test_getIBGECities() async throws {
        let cities = try await getIBGECitiesByUFUseCase.execute(uf: "SC")
        
        XCTAssertNotNil(cities)
        XCTAssertEqual(cities.count, 295)
        XCTAssertEqual(cities.first?.code, "4200051")
        XCTAssertEqual(cities.first?.name, "ABDON BATISTA")
    }
    
    func test_getIBGEStates() async throws {
        let states = try await getIBGEStatesUseCase.execute()
        
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
        let state = try await getIBGEStateByCodeUseCase.execute(code: "11")
        
        XCTAssertNotNil(state)
        XCTAssertEqual(state.id, 11)
        XCTAssertEqual(state.name, "Rondônia")
        
        let region = state.region
        XCTAssertEqual(region.id, 1)
        XCTAssertEqual(region.name, "Norte")
        XCTAssertEqual(region.acronym, "N")
    }
}
