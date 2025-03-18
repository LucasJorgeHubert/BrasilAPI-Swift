import Foundation

public class GetNationalHolidaysUseCase {
    private let repository: HolidaysRepositoryProtocol
    
    public init(repository: HolidaysRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(year: Int) async throws -> [Domain.Holidays.Models.Holiday] {
        return try await repository.getHolidays(year: year)
    }
}
