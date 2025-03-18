import Foundation

extension Domain.CNPJ.Models {
    public struct CNPJ: Codable {
        let uf: String
        let cep: String
        let qsa: [Qsa]
        let cnpj: String
        let pais: String?
        let email: String?
        let porte: String
        let bairro: String
        let numero: String
        let dddFax: String
        let municipio: String
        let logradouro: String
        let cnaeFiscal: Int
        let codigoPais: Int?
        let complemento: String
        let codigoPorte: Int
        let razaoSocial: String
        let nomeFantasia: String
        let capitalSocial: Int
        let dddTelefone1: String
        let dddTelefone2: String
        let opcaoPeloMei: Bool?
        let descricaoPorte: String
        let codigoMunicipio: Int
        let cnaesSecundarios: [CnaesSecundario]
        let naturezaJuridica: String
        let regimeTributario: [RegimeTributario]
        let situacaoEspecial: String
        let opcaoPeloSimples: Bool?
        let situacaoCadastral: Int
        let dataOpcaoPeloMei: String?
        let dataExclusaoDoMei: String?
        let cnaeFiscalDescricao: String
        let codigoMunicipioIbge: Int
        let dataInicioAtividade: String
        let dataSituacaoEspecial: String?
        let dataOpcaoPeloSimples: String?
        let dataSituacaoCadastral: String
        let nomeCidadeNoExterior: String
        let codigoNaturezaJuridica: Int
        let dataExclusaoDoSimples: String?
        let motivoSituacaoCadastral: Int
        let enteFederativoResponsavel: String
        let identificadorMatrizFilial: Int
        let qualificacaoDoResponsavel: Int
        let descricaoSituacaoCadastral: String
        let descricaoTipoDeLogradouro: String
        let descricaoMotivoSituacaoCadastral: String
        let descricaoIdentificadorMatrizFilial: String
        
        enum CodingKeys: String, CodingKey {
            case uf
            case cep
            case qsa
            case cnpj
            case pais
            case email
            case porte
            case bairro
            case numero
            case dddFax = "ddd_fax"
            case municipio
            case logradouro
            case cnaeFiscal = "cnae_fiscal"
            case codigoPais = "codigo_pais"
            case complemento
            case codigoPorte = "codigo_porte"
            case razaoSocial = "razao_social"
            case nomeFantasia = "nome_fantasia"
            case capitalSocial = "capital_social"
            case dddTelefone1 = "ddd_telefone_1"
            case dddTelefone2 = "ddd_telefone_2"
            case opcaoPeloMei = "opcao_pelo_mei"
            case descricaoPorte = "descricao_porte"
            case codigoMunicipio = "codigo_municipio"
            case cnaesSecundarios = "cnaes_secundarios"
            case naturezaJuridica = "natureza_juridica"
            case regimeTributario = "regime_tributario"
            case situacaoEspecial = "situacao_especial"
            case opcaoPeloSimples = "opcao_pelo_simples"
            case situacaoCadastral = "situacao_cadastral"
            case dataOpcaoPeloMei = "data_opcao_pelo_mei"
            case dataExclusaoDoMei = "data_exclusao_do_mei"
            case cnaeFiscalDescricao = "cnae_fiscal_descricao"
            case codigoMunicipioIbge = "codigo_municipio_ibge"
            case dataInicioAtividade = "data_inicio_atividade"
            case dataSituacaoEspecial = "data_situacao_especial"
            case dataOpcaoPeloSimples = "data_opcao_pelo_simples"
            case dataSituacaoCadastral = "data_situacao_cadastral"
            case nomeCidadeNoExterior = "nome_cidade_no_exterior"
            case codigoNaturezaJuridica = "codigo_natureza_juridica"
            case dataExclusaoDoSimples = "data_exclusao_do_simples"
            case motivoSituacaoCadastral = "motivo_situacao_cadastral"
            case enteFederativoResponsavel = "ente_federativo_responsavel"
            case identificadorMatrizFilial = "identificador_matriz_filial"
            case qualificacaoDoResponsavel = "qualificacao_do_responsavel"
            case descricaoSituacaoCadastral = "descricao_situacao_cadastral"
            case descricaoTipoDeLogradouro = "descricao_tipo_de_logradouro"
            case descricaoMotivoSituacaoCadastral = "descricao_motivo_situacao_cadastral"
            case descricaoIdentificadorMatrizFilial = "descricao_identificador_matriz_filial"
        }
    }
    
    // MARK: - CnaesSecundario
    struct CnaesSecundario: Codable {
        let codigo: Int
        let descricao: String
    }
    
    // MARK: - Qsa
    struct Qsa: Codable {
        let pais: String?
        let nomeSocio: String
        let codigoPais: Int?
        let faixaEtaria: String
        let cnpjCpfDoSocio: String
        let qualificacaoSocio: String
        let codigoFaixaEtaria: Int
        let dataEntradaSociedade: String
        let identificadorDeSocio: Int
        let cpfRepresentanteLegal: String
        let nomeRepresentanteLegal: String
        let codigoQualificacaoSocio: Int
        let qualificacaoRepresentanteLegal: String
        let codigoQualificacaoRepresentanteLegal: Int
        
        enum CodingKeys: String, CodingKey {
            case pais
            case nomeSocio = "nome_socio"
            case codigoPais = "codigo_pais"
            case faixaEtaria = "faixa_etaria"
            case cnpjCpfDoSocio = "cnpj_cpf_do_socio"
            case qualificacaoSocio = "qualificacao_socio"
            case codigoFaixaEtaria = "codigo_faixa_etaria"
            case dataEntradaSociedade = "data_entrada_sociedade"
            case identificadorDeSocio = "identificador_de_socio"
            case cpfRepresentanteLegal = "cpf_representante_legal"
            case nomeRepresentanteLegal = "nome_representante_legal"
            case codigoQualificacaoSocio = "codigo_qualificacao_socio"
            case qualificacaoRepresentanteLegal = "qualificacao_representante_legal"
            case codigoQualificacaoRepresentanteLegal = "codigo_qualificacao_representante_legal"
        }
    }
    
    // MARK: - RegimeTributario
    struct RegimeTributario: Codable {
        let ano: Int
        let cnpjDaSCP: String?
        let formaDeTributacao: String
        let quantidadeDeEscrituracoes: Int
        
        enum CodingKeys: String, CodingKey {
            case ano
            case cnpjDaSCP = "cnpj_da_scp"
            case formaDeTributacao = "forma_de_tributacao"
            case quantidadeDeEscrituracoes = "quantidade_de_escrituracoes"
        }
    }
    
}
