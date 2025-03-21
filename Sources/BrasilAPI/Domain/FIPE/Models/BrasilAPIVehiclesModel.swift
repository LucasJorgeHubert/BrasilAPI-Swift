import Foundation

extension Domain.FIPE.Models {
    public struct Vehicle: Codable {
        let model: String
        
        enum CodingKeys: String, CodingKey {
            case model = "modelo"
        }
    }
}
