import Foundation

extension Domain.Broker.Models {
    public struct Broker: Codable {
        let cnpj: String
        let type: String
        let nomeSocial: String
        let nomeComercial: String
        let status: String
        let email: String
        let telefone: String
        let cep: String
        let pais: String
        let uf: String
        let municipio: String
        let bairro: String
        let complemento: String
        let logradouro: String
        let dataPatrimonioLiquido: String
        let valorPatrimonioLiquido: String
        let codigoCvm: String
        let dataInicioSituacao: String
        let dataRegistro: String
        
        enum CodingKeys: String, CodingKey {
            case cnpj, type
            case nomeSocial = "nome_social"
            case nomeComercial = "nome_comercial"
            case status, email, telefone, cep, pais, uf, municipio, bairro, complemento, logradouro
            case dataPatrimonioLiquido = "data_patrimonio_liquido"
            case valorPatrimonioLiquido = "valor_patrimonio_liquido"
            case codigoCvm = "codigo_cvm"
            case dataInicioSituacao = "data_inicio_situacao"
            case dataRegistro = "data_registro"
        }
    }
}
