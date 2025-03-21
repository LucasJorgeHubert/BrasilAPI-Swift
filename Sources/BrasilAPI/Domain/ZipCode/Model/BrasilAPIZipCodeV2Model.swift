import Foundation

extension Domain.ZipCode.Models.V2 {
    public struct ZipCode: Codable, Hashable, Equatable {
        public let cep: String
        public let state: String
        public let city: String
        public let neighborhood: String?
        public let street: String?
        public let service: String
        public let location: Location
    }
    
    public struct Location: Codable, Hashable, Equatable {
        public let type: String
        public let coordinates: Coordinates?
    }
    
    public struct Coordinates: Codable, Hashable, Equatable {
        public let longitude: String?
        public let latitude: String?
    }
}
