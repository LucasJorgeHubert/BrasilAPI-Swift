import Foundation

class BankRepositoryImpl: BankRepositoryProtocol {
    
    private let apiDispatcher: APIRequestDispatcherProtocol

   init(apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()) {
       self.apiDispatcher = apiDispatcher
   }
    
    func listBanks() async throws -> [BankModel] {
        let result: [BankModel] = try await apiDispatcher.request(apiRouter: BankAPIRouter.getBanks)
        return result
    }
    
    func getBankByCode(code: String) async throws -> BankModel {
        return try await apiDispatcher.request(apiRouter: BankAPIRouter.getBanksByCode(code: code))
    }
}
