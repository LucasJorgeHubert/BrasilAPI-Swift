import Foundation

public protocol IBGERepositoryProtocol {
    func getCities(by uf: String) async throws -> [BrasilAPIIBGECityModel]
    func getStates() async throws -> [BrasilAPIIBGEStateModel]
    func getState(by code: String) async throws -> BrasilAPIIBGEStateModel
}

