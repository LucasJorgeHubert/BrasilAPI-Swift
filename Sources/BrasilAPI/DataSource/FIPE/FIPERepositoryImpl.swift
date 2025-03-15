import Foundation

extension DataSource.FIPE {
    
    public struct RepositoryImpl: FIPERepositoryProtocol {
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func getBrandByVehicleType(carType: String) async throws -> [BrasilAPIVehiclesTypeModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.FIPE.APIRouter.getBrandByVehicleType(carType: carType))
        }
        
        public func getVehiclePrice(codeFIPE: String) async throws -> [BrasilAPIVehiclesPriceModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.FIPE.APIRouter.getVehiclePrice(codeFIPE: codeFIPE))
        }
        
        public func getReferenceTables() async throws -> [BrasilAPIFIPETableModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.FIPE.APIRouter.getReferenceTables)
        }
        
        public func listVehicles(type: String, brandCode: String) async throws -> [BrasilAPIVehiclesModel] {
            return try await apiDispatcher.request(apiRouter: DataSource.FIPE.APIRouter.listVehicles(type: type, brandCode: brandCode))
        }
    }
}
