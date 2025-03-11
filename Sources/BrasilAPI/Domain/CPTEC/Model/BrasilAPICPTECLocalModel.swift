import Foundation

public struct BrasilAPICPTECLocalModel: Codable {
    let name: String
    let state: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case state = "estado"
        case id
    }
}
