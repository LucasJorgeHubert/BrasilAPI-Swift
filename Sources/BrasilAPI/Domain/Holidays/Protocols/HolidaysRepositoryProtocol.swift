import Foundation

public protocol HolidaysRepositoryProtocol {
    func getHolidays(year: Int) async throws -> BrasilAPIHolidaysModel
}
