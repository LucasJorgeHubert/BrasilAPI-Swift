import XCTest
@testable import BrasilAPI

final class CPTECBrasilAPITests: XCTestCase {
    let repository = CPTECRepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getCPTECCapital() async throws {
        let brasilAPI = BrasilAPI(cptecRepository: repository)
        let local = try await brasilAPI.cptec.getCPTECCapital(codeICAO: "SBAR")
        
        XCTAssertEqual(local.codeICAO, "SBAR")
        XCTAssertEqual(local.pressure, "1014")
        XCTAssertEqual(local.visibility, "9000")
        XCTAssertEqual(local.windSpeed, 29)
        XCTAssertEqual(local.windDirection, 90)
        XCTAssertEqual(local.humidity, 74)
        XCTAssertEqual(local.condition, "ps")
        XCTAssertEqual(local.conditionDescription, "Predomínio de Sol")
        XCTAssertEqual(local.temperature, 28)
        
    }
    
    func test_getCPTECLocals() async throws {
        let brasilAPI = BrasilAPI(cptecRepository: repository)
        let locals = try await brasilAPI.cptec.getCPTECLocal(localName: "São Paulo")
        
        XCTAssertNotNil(locals)
        XCTAssertEqual(locals.count, 4)
        
        let local = locals[0]
        
        XCTAssertEqual(local.name, "São Paulo")
        XCTAssertEqual(local.state, "SP")
        XCTAssertEqual(local.id, 244)
        
    }
    
    func test_getCPTECLocalForecast() async throws {
        let brasilAPI = BrasilAPI(cptecRepository: repository)
        let forecast = try await brasilAPI.cptec.getCPTECLocalForecast(cityCode: 4772, days: .six)
        
        XCTAssertEqual(forecast.city, "Brasília")
        XCTAssertEqual(forecast.state, "DF")
        
        XCTAssertEqual(forecast.weather.count, 6)
        XCTAssertEqual(forecast.weather[0].condition, "pn")
        XCTAssertEqual(forecast.weather[0].conditionDescription, "Parcialmente Nublado")
        XCTAssertEqual(forecast.weather[0].min, 19)
        XCTAssertEqual(forecast.weather[0].max, 32)
        XCTAssertEqual(forecast.weather[0].indexUV, 0)
        
        
    }
    
    func test_getCPTECOceanicForecast() async throws {
        let brasilAPI = BrasilAPI(cptecRepository: repository)
        let forecast = try await brasilAPI.cptec.getCPTECOceanicForecast(cityCode: 4772, days: .six)
        
        XCTAssertEqual(forecast.city, "Rio de Janeiro")
        XCTAssertEqual(forecast.state, "RJ")
        XCTAssertEqual(forecast.waves.count, 5)
        
        XCTAssertEqual(forecast.waves[0].data[0].agitation, "Fraco")
        XCTAssertEqual(forecast.waves[0].data[0].waveDirection, "SE")
        XCTAssertEqual(forecast.waves[0].data[0].waveHeight, 0.6)
        XCTAssertEqual(forecast.waves[0].data[0].windSpeed, 5.1)
    }
    
    func test_getCPTECCapitalList() async throws {
        let brasilAPI = BrasilAPI(cptecRepository: repository)
        let capitals = try await brasilAPI.cptec.getListCPTECCapitals()
        
        let capital = capitals[0]
        
        XCTAssertEqual(capital.codeICAO, "SBAR")
        XCTAssertEqual(capital.pressure, "1014")
        XCTAssertEqual(capital.visibility, "9000")
        XCTAssertEqual(capital.windSpeed, 29)
        XCTAssertEqual(capital.windDirection, 90)
        XCTAssertEqual(capital.humidity, 74)
        XCTAssertEqual(capital.condition, "ps")
        XCTAssertEqual(capital.conditionDescription, "Predomínio de Sol")
        XCTAssertEqual(capital.temperature, 28)
    }
    
    func test_getCPTECLocalList() async throws {
        let brasilAPI = BrasilAPI(cptecRepository: repository)
        let locals = try await brasilAPI.cptec.getListCPTECLocals()
        
        let local = locals[0]
        
        XCTAssertEqual(local.name, "São Benedito")
        XCTAssertEqual(local.state, "CE")
        XCTAssertEqual(local.id, 4750)
    }

}
