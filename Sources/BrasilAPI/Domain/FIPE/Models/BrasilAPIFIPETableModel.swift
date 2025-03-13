import Foundation

public struct BrasilAPIFIPETableModel: Codable {
    let code: Int
    let month: String
    
    enum CodingKeys: String, CodingKey {
        case code = "codigo"
        case month = "mes"
    }
}
