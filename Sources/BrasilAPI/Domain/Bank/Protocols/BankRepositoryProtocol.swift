import Foundation

public protocol BankRepositoryProtocol {
    func listBanks() async throws -> [Domain.Bank.Models.Bank]
    func getBankByCode(code: String) async throws -> Domain.Bank.Models.Bank
}
