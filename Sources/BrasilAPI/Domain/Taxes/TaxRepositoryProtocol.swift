
public protocol TaxRepositoryProtocol {
    func fetchTaxes() async throws -> [Domain.Tax.Models.Tax]
    func fetchTax(taxId: String) async throws -> Domain.Tax.Models.Tax
}
