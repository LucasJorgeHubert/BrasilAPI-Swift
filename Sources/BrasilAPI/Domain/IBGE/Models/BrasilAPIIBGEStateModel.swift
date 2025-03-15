import Foundation

public struct BrasilAPIIBGEStateModel: Codable {
    let id: Int
    let acronym: String
    let name: String
    let region: BrasilAPIIBGEStateRegionModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case acronym = "sigla"
        case name = "nome"
        case region = "regiao"
    }
}

public struct BrasilAPIIBGEStateRegionModel: Codable {
    let id: Int
    let acronym: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case acronym = "sigla"
        case name = "nome"
    }
}
