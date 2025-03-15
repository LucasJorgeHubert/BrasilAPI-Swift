import Foundation

extension Domain.ISBN.Models {
    public struct BookModel: Codable {
        let isbn: String
        let title: String
        let subtitle: String?
        let authors: [String]
        let publisher: String
        let synopsis: String
        let dimensions: DimensionsModel
        let year: Int
        let format: String
        let page_count: Int
        let subjects: [String]
        let location: String
        let retail_price: String?
        let cover_url: String?
        let provider: String
    }
    
    public struct DimensionsModel: Codable {
        let width: Double
        let height: Double
        let unit: String
    }
}
