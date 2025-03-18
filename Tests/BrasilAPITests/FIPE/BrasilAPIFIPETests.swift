import XCTest
@testable import BrasilAPI

final class FIPEBrasilAPITests: XCTestCase {
    let repository = DataSource.FIPE.RepositoryImpl(apiDispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }

    func test_getFIPEBrandsByVehicleType() async throws {
        let brasilAPI = BrasilAPI(fipeRepository: repository)
        let cars: [FIPEService.BrasilAPIVehiclesTypeModel] = try await brasilAPI.fipe.getBrandByVehicleType(carType: .car)
        
        XCTAssertNotNil(cars)
        XCTAssertFalse(cars.isEmpty)
        
        XCTAssertEqual(cars.first?.name, "Acura")
        XCTAssertEqual(cars.first?.value, "1")
    }
    
    func test_getFIPEVehiclePrice() async throws {
        let brasilAPI = BrasilAPI(fipeRepository: repository)
        let carsPrices: [FIPEService.BrasilAPIVehiclePriceModel] = try await brasilAPI.fipe.getVehiclePrice(codeFIPE: "1")
        
        XCTAssertNotNil(carsPrices)
        XCTAssertFalse(carsPrices.isEmpty)
        
        XCTAssertEqual(carsPrices.first?.brand, "Fiat")
        XCTAssertEqual(carsPrices.first?.value, "R$ 8.794,00")
        XCTAssertEqual(carsPrices.first?.model, "Palio EX 1.0 mpi 2p")
        XCTAssertEqual(carsPrices.first?.yearModel, 2000)
        XCTAssertEqual(carsPrices.first?.fuel, "Gasolina")
        XCTAssertEqual(carsPrices.first?.codeFipe, "001004-9")
        XCTAssertEqual(carsPrices.first?.monthReference, "março de 2025 ")
        XCTAssertEqual(carsPrices.first?.typeVehicle, 1)
        XCTAssertEqual(carsPrices.first?.fuelId, "G")
        XCTAssertEqual(carsPrices.first?.dataConsulta, "quinta-feira, 13 de março de 2025 11:57")
    }
    
    func test_getFIPEReferencePriceTable() async throws {
        let brasilAPI = BrasilAPI(fipeRepository: repository)
        let tables: [FIPEService.BrasilAPIFIPETableModel] = try await brasilAPI.fipe.getReferenceTables()
        
        XCTAssertNotNil(tables)
        XCTAssertFalse(tables.isEmpty)
        
        XCTAssertEqual(tables.first?.month, "março/2025")
        XCTAssertEqual(tables.first?.code, 319)
    }
    
    func test_getFIPEVehiclesByBrandAndType() async throws {
        let brasilAPI = BrasilAPI(fipeRepository: repository)
        let cars: [FIPEService.BrasilAPIVehicleModel] = try await brasilAPI.fipe.listVehicles(type: .car, brandCode: "1")
        
        XCTAssertNotNil(cars)
        XCTAssertFalse(cars.isEmpty)
        
        XCTAssertEqual(cars.first?.model, "AVENTADOR 770-4 SVJ ROADSTER V12")
    }

}
