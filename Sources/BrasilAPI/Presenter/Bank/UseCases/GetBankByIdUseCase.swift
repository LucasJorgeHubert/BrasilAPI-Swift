import Foundation

extension Presenter.Bank.UseCase {
    class GetBankById {
        private let repository: BankRepositoryProtocol
        
        init(repository: BankRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute(code: String) async throws -> Domain.Bank.Models.Bank {
            return try await repository.getBankByCode(code: code)
        }
    }
}
