import Foundation

extension Presenter.Bank {
    public struct Service {
        private let bankListUseCase: Presenter.Bank.UseCase.GetBankList
        private let bankByIdUseCase: Presenter.Bank.UseCase.GetBankById
        
        public typealias BrasilAPIBankModel = Domain.Bank.Models.Bank
        
        public init(repository: BankRepositoryProtocol = DataSource.Bank.RepositoryImpl()) {
            self.bankListUseCase = Presenter.Bank.UseCase.GetBankList(repository: repository)
            self.bankByIdUseCase = Presenter.Bank.UseCase.GetBankById(repository: repository)
        }
        
        public func listBanks() async throws -> [BrasilAPIBankModel] {
            return try await bankListUseCase.execute()
        }
        
        public func getBankByCode(code: String) async throws -> BrasilAPIBankModel {
            return try await bankByIdUseCase.execute(code: code)
        }
    }
}
