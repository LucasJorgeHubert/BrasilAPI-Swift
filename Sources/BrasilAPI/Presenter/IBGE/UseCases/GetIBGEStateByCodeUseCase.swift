import Foundation

class GetIBGEStateByCodeUseCase {
    private let repository: IBGERepositoryProtocol
    
    init(repository: IBGERepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(code: String) async throws -> BrasilAPIIBGEStateModel {
        return try await repository.getState(by: code)
    }
}
