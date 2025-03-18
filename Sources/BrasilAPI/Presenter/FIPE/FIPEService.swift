import Foundation

public class FIPEService {
    private let getBrandByVehicleTypeUseCase: GetListVehiclesByBrandAndTypeUseCase
    private let getVehiclePriceUseCase: GetVeihclePriceUseCase
    private let getReferenceTablesUseCase: GetFIPEReferenceTableUseCase
    private let listVehiclesUseCase: GetListVehicleBrandByTypeUseCase
    
    public init(repository: FIPERepositoryProtocol = DataSource.FIPE.RepositoryImpl()) {
        self.getBrandByVehicleTypeUseCase = GetListVehiclesByBrandAndTypeUseCase(repository: repository)
        self.getVehiclePriceUseCase = GetVeihclePriceUseCase(repository: repository)
        self.getReferenceTablesUseCase = GetFIPEReferenceTableUseCase(repository: repository)
        self.listVehiclesUseCase = GetListVehicleBrandByTypeUseCase(repository: repository)
    }
    
    public func getBrandByVehicleType(carType: VehicleTypeEnum) async throws -> [BrasilAPIVehiclesTypeModel] {
        return try await listVehiclesUseCase.execute(carType: carType)
    }
    
    public func getVehiclePrice(codeFIPE: String) async throws -> [BrasilAPIVehiclesPriceModel] {
        return try await getVehiclePriceUseCase.execute(codeFIPE: codeFIPE)
    }
    
    public func getReferenceTables() async throws -> [BrasilAPIFIPETableModel] {
        return try await getReferenceTablesUseCase.execute()
    }
    
    public func listVehicles(type: VehicleTypeEnum, brandCode: String) async throws -> [BrasilAPIVehiclesModel] {
        return try await getBrandByVehicleTypeUseCase.execute(carType: type, brandCode: brandCode)
    }
}
