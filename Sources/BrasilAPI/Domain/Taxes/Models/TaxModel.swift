import Foundation

extension Domain.Tax.Models {
    public struct Tax: Codable, Hashable, Equatable {
        public let name: String
        public let value: Double
        
        enum CodingKeys: String, CodingKey {
            case name = "nome"
            case value = "valor"
        }
    }
}
