import Foundation

extension Domain.NCM.Models {
    public struct NCM: Codable, Hashable, Equatable {
        
        public let codigo: String
        public let descricao: String
        public let dataInicio: String
        public let dataFim: String
        public let tipoAto: String
        public let numeroAto: String
        public let anoAto: String
        
        enum CodingKeys: String, CodingKey {
            case codigo
            case descricao
            case dataInicio = "data_inicio"
            case dataFim = "data_fim"
            case tipoAto = "tipo_ato"
            case numeroAto = "numero_ato"
            case anoAto = "ano_ato"
        }
    }
}
