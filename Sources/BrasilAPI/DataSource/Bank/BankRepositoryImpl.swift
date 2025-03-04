import Foundation

internal class BankRepositoryImpl: BankRepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol

    init(apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()) {
        self.apiDispatcher = apiDispatcher
    }
    
    func listBanks() async throws -> [BankModel] {
        return try await apiDispatcher.request(apiRouter: BankAPIRouter.getBanks)
    }
    
    func getBankByCode(code: String) async throws -> BankModel {
        return try await apiDispatcher.request(apiRouter: BankAPIRouter.getBanksByCode(code: code))
    }
}
