import Foundation

public class GetBankListUseCase {
    private let repository: BankRepositoryProtocol

    init(repository: BankRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() async throws -> [BankModel] {
        return try await repository.listBanks()
    }
}
