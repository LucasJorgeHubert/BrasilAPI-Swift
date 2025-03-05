import Foundation

public protocol BankRepositoryProtocol {
    func listBanks() async throws -> [BankModel]
    func getBankByCode(code: String) async throws -> BankModel
}
