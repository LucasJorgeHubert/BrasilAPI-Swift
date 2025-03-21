import Foundation

extension Presenter.NCM {
    public final class Service {
        private var getAllNCM: Presenter.NCM.UseCase.GetAllNCM
        private var getNCMByCode: Presenter.NCM.UseCase.GetNCMByCode
        private var searchNCM: Presenter.NCM.UseCase.SearchNCM
        
        public typealias NCMModel = Domain.NCM.Models.NCM
        
        public init(repository: NCMRepositoryProtocol = DataSource.NCM.RepositoryImpl()) {
            self.getAllNCM = Presenter.NCM.UseCase.GetAllNCM(repository: repository)
            self.getNCMByCode = Presenter.NCM.UseCase.GetNCMByCode(repository: repository)
            self.searchNCM = Presenter.NCM.UseCase.SearchNCM(repository: repository)
        }
        
        public func getAllNCM() async throws -> [Domain.NCM.Models.NCM] {
            return try await getAllNCM.execute()
        }
        
        public func getNCMByCode(code: String) async throws -> Domain.NCM.Models.NCM {
            return try await getNCMByCode.execute(code: code)
        }
        
        public func searchNCM(term: String) async throws -> [Domain.NCM.Models.NCM] {
            return try await searchNCM.execute(term: term)
        }
    }
}

