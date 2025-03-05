import Foundation

public struct BrasilAPIBankModel: Codable, Hashable, Equatable {
    public let ispb: String
    public let name: String?
    public let code: Int?
    public let fullName: String?
}
