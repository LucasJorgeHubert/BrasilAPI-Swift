import Foundation

extension Domain.Exchange.Models {
    public struct Coin: Codable, Hashable, Equatable {
        public let symbol: String
        public let name: String
        public let type: String
        
        enum CodingKeys: String, CodingKey {
            case symbol = "simbolo"
            case name = "nome"
            case type = "tipo_moeda"
        }
    }
}
