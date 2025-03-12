import Foundation

public class HolidaysServices {
    private let getNationalHolidaysUseCase: GetNationalHolidaysUseCase
    
    public init(repository: HolidaysRepositoryProtocol = HolidaysRepositoryImpl()) {
        self.getNationalHolidaysUseCase = GetNationalHolidaysUseCase(repository: repository)
    }
    
    public func getNationalHolidays(year: Int) async throws -> [BrasilAPIHolidaysModel] {
        return try await getNationalHolidaysUseCase.execute(year: year)
    }
}
