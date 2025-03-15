import Foundation

public class FIPERepositoryImpl: FIPERepositoryProtocol {
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func getBrandByVehicleType(carType: String) async throws -> [BrasilAPIVehiclesTypeModel] {
        return try await apiDispatcher.request(apiRouter: FIPEAPIRouter.getBrandByVehicleType(carType: carType))
    }
    
    public func getVehiclePrice(codeFIPE: String) async throws -> [BrasilAPIVehiclesPriceModel] {
        return try await apiDispatcher.request(apiRouter: FIPEAPIRouter.getVehiclePrice(codeFIPE: codeFIPE))
    }
    
    public func getReferenceTables() async throws -> [BrasilAPIFIPETableModel] {
        return try await apiDispatcher.request(apiRouter: FIPEAPIRouter.getReferenceTables)
    }
    
    public func listVehicles(type: String, brandCode: String) async throws -> [BrasilAPIVehiclesModel] {
        return try await apiDispatcher.request(apiRouter: FIPEAPIRouter.listVehicles(type: type, brandCode: brandCode))
    }
}
