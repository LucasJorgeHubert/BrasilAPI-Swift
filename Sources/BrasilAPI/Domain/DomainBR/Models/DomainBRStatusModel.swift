import Foundation

extension Domain.DomainBR.Models {
    public struct DomainBRStatus: Codable, Hashable, Equatable {
        public let statusCode: Domain.DomainBR.Enums.DomainBRStatusCodeEnum
        public let status: Domain.DomainBR.Enums.DomainBRStatusEnum
        public let fqdn: String
        public let fqdnace: String?
        public let exempt: Bool?
        public let hosts: [String]?
        public let publicationStatus: String?
        public let expiresAt: String?
        public let suggestions: [String]?
        public let reasons: String?
        
        enum CodingKeys: String, CodingKey {
            case statusCode = "status_code"
            case status = "status"
            case fqdn = "fqdn"
            case fqdnace = "fqdnace"
            case exempt = "exempt"
            case hosts = "hosts"
            case publicationStatus = "publication-status"
            case expiresAt = "expires-at"
            case suggestions = "suggestions"
            case reasons = "reasons"
        }
    }
}
