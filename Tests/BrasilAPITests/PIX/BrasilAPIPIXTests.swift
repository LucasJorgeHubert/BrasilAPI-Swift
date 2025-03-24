import XCTest
@testable import BrasilAPI

final class BrasilAPIPIXTests: XCTestCase {
    let repository = DataSource.PIX.RepositoryImpl(dispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }
    
    func test_getPixParticipants() async throws {
        let brasilAPI = BrasilAPI(pixRepository: repository)
        let participants: [BrasilAPI.PIX.PIXParticipoantsModel] = try await brasilAPI.pix.getPIXPartcipants()
        
        XCTAssertEqual(participants.count, 8)
        XCTAssertNotNil(participants)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
