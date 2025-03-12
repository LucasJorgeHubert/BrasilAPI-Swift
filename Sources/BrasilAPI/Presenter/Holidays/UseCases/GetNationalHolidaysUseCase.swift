import Foundation

public class GetNationalHolidaysUseCase {
    private let repository: HolidaysRepositoryProtocol
    
    public init(repository: HolidaysRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(year: Int) async throws -> [BrasilAPIHolidaysModel] {
        return try await repository.getHolidays(year: year)
    }
}
