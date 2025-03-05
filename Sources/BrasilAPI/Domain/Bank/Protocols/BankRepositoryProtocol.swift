import Foundation

public protocol BankRepositoryProtocol {
    func listBanks() async throws -> [BrasilAPIBankModel]
    func getBankByCode(code: String) async throws -> BrasilAPIBankModel
}
