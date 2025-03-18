import Foundation

extension Domain.CPTEC.Models {
    public struct OceanicForecast: Codable {
        let city: String
        let state: String
        let updated: String
        let waves: [Waves]
        
        enum CodingKeys: String, CodingKey {
            case city = "cidade"
            case state = "estado"
            case updated = "atualizado_em"
            case waves = "ondas"
        }
    }
    
    public struct Waves: Codable {
        let date: String
        let data: [WavesData]
        
        enum CodingKeys: String, CodingKey {
            case date = "data"
            case data = "dados_ondas"
        }
    }
    
    public struct WavesData: Codable {
        let windSpeed: Double
        let windDirection: String
        let windDirectionDescription: String?
        let waveHeight: Double
        let waveDirection: String
        let waveDirectionDescription: String?
        let agitation: String
        let hour: String
        
        enum CodingKeys: String, CodingKey {
            case windSpeed = "vento"
            case windDirection = "direcao_vento"
            case windDirectionDescription = "direcao_vento_desc"
            case waveHeight = "altura_onda"
            case waveDirection = "direcao_onda"
            case waveDirectionDescription = "direcao_onda_desc"
            case agitation
            case hour = "hora"
        }
    }
}
