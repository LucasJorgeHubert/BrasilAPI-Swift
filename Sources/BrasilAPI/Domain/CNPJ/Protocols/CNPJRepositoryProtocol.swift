import Foundation

public protocol CNPJRepositoryProtocol {
    func searchCNPJ(cnpj: String) async throws -> BrasilAPICNPJModel
}
