import Foundation

extension Domain.IBGE.Models {
    
    public struct StateModel: Codable {
        let id: Int
        let acronym: String
        let name: String
        let region: StateRegionModel
        
        enum CodingKeys: String, CodingKey {
            case id
            case acronym = "sigla"
            case name = "nome"
            case region = "regiao"
        }
    }
    
    public struct StateRegionModel: Codable {
        let id: Int
        let acronym: String
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case acronym = "sigla"
            case name = "nome"
        }
    }
}
