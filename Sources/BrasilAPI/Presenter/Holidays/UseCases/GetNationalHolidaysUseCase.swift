import Foundation

extension Presenter.Holidays.UseCase {
    public class GetNationalHolidays {
        private let repository: HolidaysRepositoryProtocol
        
        public init(repository: HolidaysRepositoryProtocol) {
            self.repository = repository
        }
        
        public func execute(year: Int) async throws -> [Domain.Holidays.Models.Holiday] {
            return try await repository.getHolidays(year: year)
        }
    }
}
