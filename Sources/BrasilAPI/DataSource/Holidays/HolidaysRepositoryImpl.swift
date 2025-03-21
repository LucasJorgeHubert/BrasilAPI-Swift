import Foundation

extension DataSource.Holidays {
    public struct RepositoryImpl: HolidaysRepositoryProtocol {
        private let apiDispatcher: APIRequestDispatcherProtocol
        
        public init(
            apiDispatcher: APIRequestDispatcherProtocol = DataSource.APIRequestDispatcher()
        ) {
            self.apiDispatcher = apiDispatcher
        }
        
        public func getHolidays(year: Int) async throws -> [Domain.Holidays.Models.Holiday] {
            return try await apiDispatcher.request(apiRouter: DataSource.Holidays.APIRouter.getHolidays(year: year))
        }
    }
}
