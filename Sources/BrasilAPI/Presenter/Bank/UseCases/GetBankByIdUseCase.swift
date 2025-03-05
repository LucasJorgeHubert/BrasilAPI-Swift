import Foundation

class GetBankByIdUseCase {
    private let repository: BankRepositoryProtocol

    init(repository: BankRepositoryProtocol) {
        self.repository = repository
    }

    func execute(code: String) async throws -> BankModel {
        return try await repository.getBankByCode(code: code)
    }
}
