import Foundation

public struct BrasilAPIVehiclesTypeModel: Codable {
    let name: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case value = "valor"
    }
}
