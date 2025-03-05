import Foundation

public class BankRepositoryImpl: BankRepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol

    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func listBanks() async throws -> [BrasilAPIBankModel] {
        return try await apiDispatcher.request(apiRouter: BankAPIRouter.getBanks)
    }
    
    public func getBankByCode(code: String) async throws -> BrasilAPIBankModel {
        return try await apiDispatcher.request(apiRouter: BankAPIRouter.getBanksByCode(code: code))
    }
}
