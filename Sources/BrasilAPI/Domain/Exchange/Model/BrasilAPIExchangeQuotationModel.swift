import Foundation

public struct BrasilAPIExchangeQuotationModel: Codable, Hashable, Equatable {
    let cotacoes: [BrasilAPIExchangeQuotationCoinModel]
    let moeda: String
    let data: String
}

public struct BrasilAPIExchangeQuotationCoinModel: Codable, Hashable, Equatable {
    let paridadeCompra: Double
    let paridadeVenda: Double
    let cotacaoCompra: Double
    let cotacaoVenda: Double
    let dataHoraCotacao: String
    let tipoBoletim: String
    
    enum CodingKeys: String, CodingKey {
        case paridadeCompra = "paridade_compra"
        case paridadeVenda = "paridade_venda"
        case cotacaoCompra = "cotacao_compra"
        case cotacaoVenda = "cotacao_venda"
        case dataHoraCotacao = "data_hora_cotacao"
        case tipoBoletim = "tipo_boletim"
    }
}
