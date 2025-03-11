import Foundation

public struct BrasilAPICPTECOceanicForecastModel: Codable {
    let city: String
    let state: String
    let updated: String
    let waves: [BrasilAPICPTECWavesModel]
    
    enum CodingKeys: String, CodingKey {
        case city = "cidade"
        case state = "estado"
        case updated = "atualizado_em"
        case waves = "ondas"
    }
}

public struct BrasilAPICPTECWavesModel: Codable {
    let date: String
    let data: [BrasilAPICPTECWavesDataModel]
    
    enum CodingKeys: String, CodingKey {
        case date = "data"
        case data = "dados_ondas"
    }
}

public struct BrasilAPICPTECWavesDataModel: Codable {
    let windSpeed: Double
    let windDirection: String
    let windDirectionDescription: String
    let waveHeight: Double
    let waveDirection: String
    let waveDirectionDescription: String
    let agitation: String
    let hour: String
    
    enum CodingKeys: String, CodingKey {
        case windSpeed = "vento"
        case windDirection = "direcao_vento"
        case windDirectionDescription = "direcao_vento_desc"
        case waveHeight = "altura_onda"
        case waveDirection = "direcao_onda"
        case waveDirectionDescription = "direcao_onda_desc"
        case agitation = "agitacao"
        case hour = "hora"
    }
}
