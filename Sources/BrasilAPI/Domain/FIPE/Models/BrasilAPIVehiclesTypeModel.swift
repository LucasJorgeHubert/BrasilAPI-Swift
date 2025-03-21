import Foundation
extension Domain.FIPE.Models {
    public struct VehicleType: Codable {
        let name: String
        let value: String
        
        enum CodingKeys: String, CodingKey {
            case name = "nome"
            case value = "valor"
        }
    }
}
