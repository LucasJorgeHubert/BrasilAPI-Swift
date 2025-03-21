import Foundation

extension Domain.FIPE.Models {
    public struct Table: Codable {
        let code: Int
        let month: String
        
        enum CodingKeys: String, CodingKey {
            case code = "codigo"
            case month = "mes"
        }
    }
}
