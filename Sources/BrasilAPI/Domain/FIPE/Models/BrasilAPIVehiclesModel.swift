import Foundation

public struct BrasilAPIVehiclesModel: Codable {
    let model: String
    
    enum CodingKeys: String, CodingKey {
        case model = "modelo"
    }
}
