import Foundation

public protocol NCMRepositoryProtocol {
    func getAllNCM() async throws -> [Domain.NCM.Models.NCM]
    func searchNCM(term: String) async throws -> [Domain.NCM.Models.NCM]
    func getNCM(id: String) async throws -> Domain.NCM.Models.NCM
}
