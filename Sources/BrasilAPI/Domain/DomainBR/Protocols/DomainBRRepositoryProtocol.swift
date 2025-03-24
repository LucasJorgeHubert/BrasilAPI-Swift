import Foundation

public protocol DomainBRRepositoryProtocol {
    func getDomainBRStatus(domain: String) async throws -> Domain.DomainBR.Models.DomainBRStatus
}
