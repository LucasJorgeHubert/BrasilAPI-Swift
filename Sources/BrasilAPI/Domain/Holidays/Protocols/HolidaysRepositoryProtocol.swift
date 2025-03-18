import Foundation

public protocol HolidaysRepositoryProtocol {
    func getHolidays(year: Int) async throws -> [Domain.Holidays.Models.Holiday]
}
