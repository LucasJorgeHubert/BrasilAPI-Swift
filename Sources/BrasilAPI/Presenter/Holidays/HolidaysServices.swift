import Foundation

extension Presenter.Holidays {
    public class Service {
        private let getNationalHolidaysUseCase: Presenter.Holidays.UseCase.GetNationalHolidays
        
        public typealias BrasilAPIHolidaysModel = Domain.Holidays.Models.Holiday
        
        public init(repository: HolidaysRepositoryProtocol = DataSource.Holidays.RepositoryImpl()) {
            self.getNationalHolidaysUseCase = Presenter.Holidays.UseCase.GetNationalHolidays(repository: repository)
        }
        
        public func getNationalHolidays(year: Int) async throws -> [BrasilAPIHolidaysModel] {
            return try await getNationalHolidaysUseCase.execute(year: year)
        }
    }
}
