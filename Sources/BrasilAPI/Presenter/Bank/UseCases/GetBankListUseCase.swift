import Foundation

class GetBankListUseCase {
    private let repository: BankRepositoryProtocol

    init(repository: BankRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [BankModel] {
        return try await repository.listBanks()
    }
}
