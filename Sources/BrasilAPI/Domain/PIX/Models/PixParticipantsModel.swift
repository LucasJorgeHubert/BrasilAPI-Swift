import Foundation

extension Domain.PIX.Models {
    public struct PixParticipant: Codable, Hashable, Equatable {
        public let ispb: String
        public let name: String
        public let nameReduzido: String
        public let modalidadeParticipacao: String
        public let tipoParticipacao: String
        public let inicioOperacao: String
        
        enum CodingKeys: String, CodingKey {
            case ispb = "ispb"
            case name = "nome"
            case nameReduzido = "nome_reduzido"
            case modalidadeParticipacao = "modalidade_participacao"
            case tipoParticipacao = "tipo_participacao"
            case inicioOperacao = "inicio_operacao"
        }
    }
}
