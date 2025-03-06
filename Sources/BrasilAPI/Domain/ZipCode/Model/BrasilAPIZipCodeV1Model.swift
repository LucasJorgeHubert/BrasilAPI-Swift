import Foundation

public struct BrasilAPIZipCodeV1Model: Codable, Hashable, Equatable {
    public let cep: String
    public let state: String
    public let city: String
    public let neighborhood: String
    public let street: String
    public let service: String
}
