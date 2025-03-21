import XCTest
@testable import BrasilAPI

final class BrasilAPINCMTests: XCTestCase {
    let repository = DataSource.NCM.RepositoryImpl(dispatcher: MockBankAPIRequestDispatcher())
    
    override func setUp() {
        super.setUp()
    }
    
    func test_getAllNCM() async throws {
        let brasilAPI = BrasilAPI(ncmRepository: repository)
        let ncm: [BrasilAPI.NCM.NCMModel] = try await brasilAPI.ncm.getAllNCM()
        
        XCTAssertEqual(ncm.count, 8)
    }
    
    func test_getNCMByCode() async throws {
        let brasilAPI = BrasilAPI(ncmRepository: repository)
        let ncm: BrasilAPI.NCM.NCMModel = try await brasilAPI.ncm.getNCMByCode(code: "3305.10.00")
        
        XCTAssertEqual(ncm.codigo, "3305.10.00")
    }
    
    func test_searchNCM_byCode() async throws {
        let brasilAPI = BrasilAPI(ncmRepository: repository)
        let ncm: [BrasilAPI.NCM.NCMModel] = try await brasilAPI.ncm.searchNCM(term: "33051000")
        
        XCTAssertEqual(ncm.count, 1)
    }
    
    func test_searchNCM_byTerm() async throws {
        let brasilAPI = BrasilAPI(ncmRepository: repository)
        let ncm: [BrasilAPI.NCM.NCMModel] = try await brasilAPI.ncm.searchNCM(term: "Xampu")
        
        XCTAssertEqual(ncm.count, 1)
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
}
