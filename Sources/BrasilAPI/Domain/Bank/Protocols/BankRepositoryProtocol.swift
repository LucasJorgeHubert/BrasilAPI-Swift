import Foundation

public protocol BankRepositoryProtocol {
    func listBanks() async throws -> [Domain.Bank.Models.BankModel]
    func getBankByCode(code: String) async throws -> Domain.Bank.Models.BankModel
}
