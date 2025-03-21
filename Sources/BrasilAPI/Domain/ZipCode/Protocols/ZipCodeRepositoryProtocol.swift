import Foundation

public protocol ZipCodeRepositoryProtocol {
    func searchZipCodeV1(zipCode: String) async throws -> Domain.ZipCode.Models.V1.ZipCode
    func searchZipCodeV2(zipCode: String) async throws -> Domain.ZipCode.Models.V2.ZipCode
}
