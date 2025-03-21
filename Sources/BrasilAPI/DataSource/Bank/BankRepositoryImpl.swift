import Foundation

extension DataSource.Bank {
    public struct RepositoryImpl: BankRepositoryProtocol {
        
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func listBanks() async throws -> [Domain.Bank.Models.Bank] {
            return try await apiDispatcher.request(apiRouter: DataSource.Bank.APIRouter.getBanks)
        }
        
        public func getBankByCode(code: String) async throws -> Domain.Bank.Models.Bank {
            return try await apiDispatcher.request(apiRouter: DataSource.Bank.APIRouter.getBanksByCode(code: code))
        }
    }
}
