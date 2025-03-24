import Foundation

extension Presenter.Tax {
    public final class Service {
        let getTaxesUseCase: Presenter.Tax.UseCase.GetTaxes
        let getTaxByIdUseCase: Presenter.Tax.UseCase.GetTaxById
        
        public typealias TaxModel = Domain.Tax.Models.Tax
        
        public init(repository: TaxRepositoryProtocol = DataSource.Tax.RepositoryImpl()) {
            self.getTaxesUseCase = Presenter.Tax.UseCase.GetTaxes(repository: repository)
            self.getTaxByIdUseCase = Presenter.Tax.UseCase.GetTaxById(repository: repository)
        }
        
        public func getTaxes() async throws -> [TaxModel] {
            return try await getTaxesUseCase.execute()
        }
        
        public func getTax(taxId: String) async throws -> TaxModel {
            return try await getTaxByIdUseCase.execute(taxId: taxId)
        }
    }
}
