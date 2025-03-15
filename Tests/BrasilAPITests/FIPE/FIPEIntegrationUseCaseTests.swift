import XCTest
@testable import BrasilAPI

final class FIPEIntegrationUseCaseTests: XCTestCase {
    var getBrandByVehicleTypeUseCase: GetListVehiclesByBrandAndTypeUseCase!
    var getVehiclePriceUseCase: GetVeihclePriceUseCase!
    var getReferenceTablesUseCase: GetFIPEReferenceTableUseCase!
    var listVehiclesUseCase: GetListVehicleBrandByTypeUseCase!

    override func setUp() {
        let repository = FIPERepositoryImpl()
        APIConfig.environment = .production
        getBrandByVehicleTypeUseCase = GetListVehiclesByBrandAndTypeUseCase(repository: repository)
        getVehiclePriceUseCase = GetVeihclePriceUseCase(repository: repository)
        getReferenceTablesUseCase = GetFIPEReferenceTableUseCase(repository: repository)
        listVehiclesUseCase = GetListVehicleBrandByTypeUseCase(repository: repository)
    }

    func test_integration_fetchFIPEVehicleByBrandAndType() async throws {
        let cars = try await getBrandByVehicleTypeUseCase.execute(carType: .car, brandCode: "171")
        
        XCTAssertFalse(cars.isEmpty)
        XCTAssertEqual(cars.first?.model, "AVENTADOR 770-4 SVJ ROADSTER V12")
    }
    
    func test_integration_fetchFIPEVehiclePrice() async throws {
        let carsPrices = try await getVehiclePriceUseCase.execute(codeFIPE: "001004-9")
        
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
    }
    
    func test_integration_fetchFIPEReferenceTable() async throws {
        let tables = try await getReferenceTablesUseCase.execute()
        
        XCTAssertFalse(tables.isEmpty)
        XCTAssertEqual(tables.first?.month, "março/2025 ")
        XCTAssertEqual(tables.first?.code, 319)
    }
    
    func test_integration_fetchFIPEVehiclesBrands() async throws {
        let cars = try await listVehiclesUseCase.execute(carType: .car)
        
        XCTAssertFalse(cars.isEmpty)
        XCTAssertEqual(cars.first?.name, "Acura")
        XCTAssertEqual(cars.first?.value, "1")
    }
}
