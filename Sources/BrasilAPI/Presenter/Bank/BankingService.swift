import Foundation

public class BankingService {
    private let bankListUseCase: GetBankListUseCase
    private let bankByIdUseCase: GetBankByIdUseCase
    
    public typealias BrasilAPIBankModel = Domain.Bank.Models.BankModel

    public init(repository: BankRepositoryProtocol = DataSource.Bank.RepositoryImpl()) {
        self.bankListUseCase = GetBankListUseCase(repository: repository)
        self.bankByIdUseCase = GetBankByIdUseCase(repository: repository)
    }

    public func listBanks() async throws -> [BrasilAPIBankModel] {
        return try await bankListUseCase.execute()
    }
    
    public func getBankByCode(code: String) async throws -> BrasilAPIBankModel {
        return try await bankByIdUseCase.execute(code: code)
    }
}
