import XCTest
@testable import BrasilAPI

final class NCMIntegrationUseCaseTests: XCTestCase {
    var getAllNCMUseCase: Presenter.NCM.UseCase.GetAllNCM!
    var getNCMByCodeUseCase: Presenter.NCM.UseCase.GetNCMByCode!
    var searchNCMUseCase: Presenter.NCM.UseCase.SearchNCM!
    
    override func setUp() {
        let repository = DataSource.NCM.RepositoryImpl()
        DataSource.APIConfig.environment = .production
        getAllNCMUseCase = Presenter.NCM.UseCase.GetAllNCM(repository: repository)
        getNCMByCodeUseCase = Presenter.NCM.UseCase.GetNCMByCode(repository: repository)
        searchNCMUseCase = Presenter.NCM.UseCase.SearchNCM(repository: repository)
    }
    
    func test_getAllNCM() async throws {
        let ncm: [BrasilAPI.NCM.NCMModel] = try await getAllNCMUseCase.execute()
        XCTAssertNotNil(ncm)
    }
    
    func test_getNCMByCode() async throws {
        let ncm: BrasilAPI.NCM.NCMModel = try await getNCMByCodeUseCase.execute(code: "3305.10.00")
        XCTAssertNotNil(ncm)
    }
    
    func test_searchNCM_byCode() async throws {
        let ncm: [BrasilAPI.NCM.NCMModel] = try await searchNCMUseCase.execute(term: "33051000")
        XCTAssertNotNil(ncm)
    }
    
    func test_searchNCM_byDescription() async throws {
        let ncm: [BrasilAPI.NCM.NCMModel] = try await searchNCMUseCase.execute(term: "Xampus")
        XCTAssertNotNil(ncm)
    }
}
