import Foundation

extension Domain.Holidays.Models {
    public struct Holiday: Codable {
        let date: String
        let name: String
        let type: String
    }
}
