import Foundation

public protocol DDDRepositoryProtocol {
    func getCitiesByDDD(ddd: String) async throws -> Domain.DDD.Models.Cities
}
