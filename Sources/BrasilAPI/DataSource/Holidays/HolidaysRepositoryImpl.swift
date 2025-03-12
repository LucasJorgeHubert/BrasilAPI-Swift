import Foundation

public class HolidaysRepositoryImpl: HolidaysRepositoryProtocol {
    private let apiDispatcher: APIRequestDispatcherProtocol
    
    public init(
        apiDispatcher: APIRequestDispatcherProtocol = APIRequestDispatcher()
    ) {
        self.apiDispatcher = apiDispatcher
    }
    
    public func getHolidays(year: Int) async throws -> BrasilAPIHolidaysModel {
        return try await apiDispatcher.request(apiRouter: HolidaysAPIRouter.getHolidays(year: year))
    }
}
