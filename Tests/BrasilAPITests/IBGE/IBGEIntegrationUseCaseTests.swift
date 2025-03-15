import XCTest
@testable import BrasilAPI

class IBGEIntegrationUseCaseTests: XCTestCase {
    var getCitiesByUFUseCase: Presenter.IBGE.UseCase.GetCitiesByUF!
    var getStatesUseCase: Presenter.IBGE.UseCase.GetStates!
    var getStateByCodeUseCase: Presenter.IBGE.UseCase.GetStateByCode!
    
    override func setUp() {
        let repository = DataSource.IBGE.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getCitiesByUFUseCase = Presenter.IBGE.UseCase.GetCitiesByUF(repository: repository)
        getStatesUseCase = Presenter.IBGE.UseCase.GetStates(repository: repository)
        getStateByCodeUseCase = Presenter.IBGE.UseCase.GetStateByCode(repository: repository)
    }
    
    func test_getIBGECities() async throws {
        let cities = try await getCitiesByUFUseCase.execute(uf: "SC")
        
        XCTAssertNotNil(cities)
        XCTAssertEqual(cities.count, 295)
        XCTAssertEqual(cities.first?.code, "4200051")
        XCTAssertEqual(cities.first?.name, "ABDON BATISTA")
    }
    
    func test_getIBGEStates() async throws {
        let states = try await getStatesUseCase.execute()
        
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
        let state = try await getStateByCodeUseCase.execute(code: "11")
        
        XCTAssertNotNil(state)
        XCTAssertEqual(state.id, 11)
        XCTAssertEqual(state.name, "Rondônia")
        
        let region = state.region
        XCTAssertEqual(region.id, 1)
        XCTAssertEqual(region.name, "Norte")
        XCTAssertEqual(region.acronym, "N")
    }
}
