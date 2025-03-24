import XCTest
@testable import BrasilAPI

final class PIXIntegrationUseCaseTests: XCTestCase {
    var getPIXPartcipants: Presenter.PIX.UseCase.GetPIXPartcipants!
    
    override func setUp() {
        let repository = DataSource.PIX.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getPIXPartcipants = Presenter.PIX.UseCase.GetPIXPartcipants(repository: repository)
    }
    
    func test_getPixParticipants() async throws {
        let participants: [BrasilAPI.PIX.PIXParticipoantsModel] = try await getPIXPartcipants.execute()
        XCTAssertNotNil(participants)
        XCTAssertTrue(participants.count > 0)
    }
}
