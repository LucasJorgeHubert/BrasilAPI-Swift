import Foundation

public protocol ZipCodeRepositoryProtocol {
    func searchZipCodeV1(zipCode: String) async throws -> BrasilAPIZipCodeV1Model
    func searchZipCodeV2(zipCode: String) async throws -> BrasilAPIZipCodeV2Model
}
