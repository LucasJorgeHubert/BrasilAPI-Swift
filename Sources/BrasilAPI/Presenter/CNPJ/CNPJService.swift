import Foundation

extension Presenter.CNPJ {
    public class Service {
        private let getCNPJUseCase: Presenter.CNPJ.UseCase.GetCNPJ
        
        public typealias CNPJModel = Domain.CNPJ.Models.CNPJ
        
        public init(repository: CNPJRepositoryProtocol = DataSource.CNPJ.RepositoryImpl()) {
            self.getCNPJUseCase = Presenter.CNPJ.UseCase.GetCNPJ(repository: repository)
        }
        
        public func getCNPJ(cnpj: String) async throws -> CNPJModel {
            return try await getCNPJUseCase.execute(cnpj: cnpj)
        }
    }
}
