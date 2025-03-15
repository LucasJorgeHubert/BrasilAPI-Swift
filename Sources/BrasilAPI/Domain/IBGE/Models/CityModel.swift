import Foundation

extension Domain.IBGE.Models {
    
    public struct CityModel: Codable {
        let name: String
        let code: String
        
        enum CodingKeys: String, CodingKey {
            case name = "nome"
            case code = "codigo_ibge"
        }
    }
}
