import Foundation

public class HolidaysService {
    private let getNationalHolidaysUseCase: GetNationalHolidaysUseCase
    
    public init(repository: HolidaysRepositoryProtocol = HolidaysRepositoryImpl()) {
        self.getNationalHolidaysUseCase = GetNationalHolidaysUseCase(repository: repository)
    }
    
    public func getNationalHolidays(year: Int) async throws -> [BrasilAPIHolidaysModel] {
        return try await getNationalHolidaysUseCase.execute(year: year)
    }
}
