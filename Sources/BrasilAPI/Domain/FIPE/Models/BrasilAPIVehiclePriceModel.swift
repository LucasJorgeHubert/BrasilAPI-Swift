import Foundation

public struct BrasilAPIVehiclesPriceModel: Codable {
    let value: String
    let brand: String
    let model: String
    let yearModel: Int
    let fuel: String
    let codeFipe: String
    let monthReference: String
    let typeVehicle: Int
    let fuelId: String
    let dataConsulta: String
    
    enum CodingKeys: String, CodingKey {
        case value = "valor"
        case brand = "marca"
        case model = "modelo"
        case yearModel = "anoModelo"
        case fuel = "combustivel"
        case codeFipe = "codigoFipe"
        case monthReference = "mesReferencia"
        case typeVehicle = "tipoVeiculo"
        case fuelId = "siglaCombustivel"
        case dataConsulta = "dataConsulta"
    }
}
