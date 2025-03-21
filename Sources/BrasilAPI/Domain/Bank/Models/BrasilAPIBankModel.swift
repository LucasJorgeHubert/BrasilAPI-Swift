import Foundation

extension Domain.Bank.Models {
    public struct Bank: Codable, Hashable, Equatable {
        public let ispb: String
        public let name: String?
        public let code: Int?
        public let fullName: String?
    }
}
