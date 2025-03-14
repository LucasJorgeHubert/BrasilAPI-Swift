import Foundation

class GetIBGEStatesUseCase {
    private let repository: IBGERepositoryProtocol
    
    init(repository: IBGERepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [BrasilAPIIBGEStateModel] {
        return try await repository.getStates()
    }
}
