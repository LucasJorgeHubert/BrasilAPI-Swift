import Foundation

public protocol ZipCodeRepositoryProtocol {
    func searchZipCodeV1(zipCode: String) async throws -> Domain.ZipCode.Models.v1.ZipCode
    func searchZipCodeV2(zipCode: String) async throws -> Domain.ZipCode.Models.v2.ZipCode
}
