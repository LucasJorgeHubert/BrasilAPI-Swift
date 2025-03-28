import Foundation

extension Presenter.Bank.UseCase {
    class GetBankList {
        private let repository: BankRepositoryProtocol
        
        init(repository: BankRepositoryProtocol) {
            self.repository = repository
        }
        
        func execute() async throws -> [Domain.Bank.Models.Bank] {
            return try await repository.listBanks()
        }
    }
}
