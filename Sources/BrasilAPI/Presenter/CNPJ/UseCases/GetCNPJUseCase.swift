import Foundation

extension Presenter.CNPJ.UseCase {
    class GetCNPJ {
        private let repository: CNPJRepositoryProtocol
        
        init(repository: CNPJRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(cnpj: String) async throws -> Domain.CNPJ.Models.CNPJ {
            return try await repository.searchCNPJ(cnpj: cnpj)
        }
    }
}

