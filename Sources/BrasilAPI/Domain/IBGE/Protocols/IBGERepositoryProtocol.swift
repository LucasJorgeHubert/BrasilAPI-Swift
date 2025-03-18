import Foundation

public protocol IBGERepositoryProtocol {
    func getCities(by uf: String) async throws -> [Domain.IBGE.Models.CityModel]
    func getStates() async throws -> [Domain.IBGE.Models.StateModel]
    func getState(by code: String) async throws -> Domain.IBGE.Models.StateModel
}

