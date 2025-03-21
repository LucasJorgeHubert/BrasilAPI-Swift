import Foundation

extension Domain.DDD.Models {
    public struct Cities: Codable {
        let cities: [String]
        let state: String
    }
}
