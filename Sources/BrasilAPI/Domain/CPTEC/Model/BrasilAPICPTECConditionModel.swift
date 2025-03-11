import Foundation

public struct BrasilAPICPTECConditionModel: Codable {
    let codeICAO: String
    let updated: String
    let pressure: String
    let visibility: String
    let windSpeed: Int
    let windDirection: Int
    let humidity: Int
    let condition: String
    let conditionDescription: String
    let temperature: Int
    
    enum CodingKeys: String, CodingKey {
        case codeICAO = "codigo_icao"
        case updated = "atualizado_em"
        case pressure = "pressao_atmosferica"
        case visibility = "visibilidade"
        case windSpeed = "vento"
        case windDirection = "direcao_vento"
        case humidity = "umidade"
        case condition = "condicao"
        case conditionDescription = "condicao_Desc"
        case temperature = "temp"
    }
}
