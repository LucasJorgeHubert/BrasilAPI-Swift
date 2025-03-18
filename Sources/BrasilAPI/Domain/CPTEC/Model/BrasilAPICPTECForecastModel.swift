import Foundation

extension Domain.CPTEC.Models {
    public struct Forecast: Codable {
        let city: String
        let state: String
        let updated: String
        let weather: [Weather]
        
        enum CodingKeys: String, CodingKey {
            case city = "cidade"
            case state = "estado"
            case updated = "atualizado_em"
            case weather = "clima"
        }
    }
    
    public struct Weather: Codable {
        let date: String
        let condition: String
        let conditionDescription: String
        let min: Int
        let max: Int
        let indexUV: Int
        
        enum CodingKeys: String, CodingKey {
            case date = "data"
            case condition = "condicao"
            case conditionDescription = "condicao_desc"
            case min = "min"
            case max = "max"
            case indexUV = "indice_uv"
        }
    }
}
