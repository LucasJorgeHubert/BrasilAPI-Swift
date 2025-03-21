import Foundation

extension Presenter.FIPE {
    public class Service {
        private let getBrandByVehicleTypeUseCase: Presenter.FIPE.UseCase.GetListVehiclesByBrandAndType
        private let getVehiclePriceUseCase: Presenter.FIPE.UseCase.GetVeihclePrice
        private let getReferenceTablesUseCase: Presenter.FIPE.UseCase.GetFIPEReferenceTable
        private let listVehiclesUseCase: Presenter.FIPE.UseCase.GetListVehicleBrandByType
        
        public typealias VehicleTypeEnum = Domain.FIPE.Enums.VehicleType
        public typealias FIPETableModel = Domain.FIPE.Models.Table
        public typealias VehiclesTypeModel = Domain.FIPE.Models.VehicleType
        public typealias VehicleModel = Domain.FIPE.Models.Vehicle
        public typealias VehiclePriceModel = Domain.FIPE.Models.VehiclePrice
        
        public init(repository: FIPERepositoryProtocol = DataSource.FIPE.RepositoryImpl()) {
            self.getBrandByVehicleTypeUseCase = Presenter.FIPE.UseCase.GetListVehiclesByBrandAndType(repository: repository)
            self.getVehiclePriceUseCase = Presenter.FIPE.UseCase.GetVeihclePrice(repository: repository)
            self.getReferenceTablesUseCase = Presenter.FIPE.UseCase.GetFIPEReferenceTable(repository: repository)
            self.listVehiclesUseCase = Presenter.FIPE.UseCase.GetListVehicleBrandByType(repository: repository)
        }
        
        public func getBrandByVehicleType(carType: VehicleTypeEnum) async throws -> [VehiclesTypeModel] {
            return try await listVehiclesUseCase.execute(carType: carType)
        }
        
        public func getVehiclePrice(codeFIPE: String) async throws -> [VehiclePriceModel] {
            return try await getVehiclePriceUseCase.execute(codeFIPE: codeFIPE)
        }
        
        public func getReferenceTables() async throws -> [FIPETableModel] {
            return try await getReferenceTablesUseCase.execute()
        }
        
        public func listVehicles(type: VehicleTypeEnum, brandCode: String) async throws -> [VehicleModel] {
            return try await getBrandByVehicleTypeUseCase.execute(carType: type, brandCode: brandCode)
        }
    }
}
