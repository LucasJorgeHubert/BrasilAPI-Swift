import Foundation

public class HolidaysService {
    private let getNationalHolidaysUseCase: GetNationalHolidaysUseCase
    
    public typealias BrasilAPIHolidaysModel = Domain.Holidays.Models.Holiday
    
    public init(repository: HolidaysRepositoryProtocol = DataSource.Holidays.RepositoryImpl()) {
        self.getNationalHolidaysUseCase = GetNationalHolidaysUseCase(repository: repository)
    }
    
    public func getNationalHolidays(year: Int) async throws -> [BrasilAPIHolidaysModel] {
        return try await getNationalHolidaysUseCase.execute(year: year)
    }
}
