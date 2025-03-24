import Foundation
import BrasilAPI

class MockBankAPIRequestDispatcher: APIRequestDispatcherProtocol {
    
    func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T {
        let jsonFileName = resolveMockFileName(for: apiRouter)
        
        guard let jsonData = loadMockJSON(named: jsonFileName) else {
            throw DataSource.BrasilAPIRequestError.badUrl
        }
        
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
    
    private func resolveMockFileName(for apiRouter: APIRouterProtocol) -> String {
        switch apiRouter {
        case is DataSource.Bank.APIRouter:
            return APIResolver.Bank.resolve(for: apiRouter)
        case is DataSource.Exchange.APIRouter:
            return APIResolver.Exchange.resolve(for: apiRouter)
        case is DataSource.ZipCode.APIRouter:
            return APIResolver.ZipCode.resolve(for: apiRouter)
        case is DataSource.CNPJ.APIRouter:
            return APIResolver.CNPJ.resolve(for: apiRouter)
        case is DataSource.Broker.APIRouter:
            return APIResolver.Broker.resolve(for: apiRouter)
        case is DataSource.CPTEC.APIRouter:
            return APIResolver.CPTEC.resolve(for: apiRouter)
        case is DataSource.DDD.APIRouter:
            return APIResolver.DDD.resolve(for: apiRouter)
        case is DataSource.Holidays.APIRouter:
            return APIResolver.Holidays.resolve(for: apiRouter)
        case is DataSource.FIPE.APIRouter:
            return APIResolver.FIPE.resolve(for: apiRouter)
        case is DataSource.IBGE.APIRouter:
            return APIResolver.IBGE.resolve(for: apiRouter)
        case is DataSource.ISBN.APIRouter:
            return APIResolver.ISBN.resolve(for: apiRouter)
        case is DataSource.NCM.APIRouter:
            return APIResolver.NCM.resolve(for: apiRouter)
        case is DataSource.PIX.APIRouter:
            return APIResolver.PIX.resolve(for: apiRouter)
        case is DataSource.DomainBR.APIRouter:
            return APIResolver.DomainBR.resolve(for: apiRouter)
        default:
            return "default_mock"
        }
    }
    
    private func loadMockJSON(named fileName: String) -> Data? {
        guard let url = Bundle.module.url(forResource: fileName, withExtension: "json") else {
            print("❌ JSON \(fileName).json not found")
            return nil
        }
        
        return try? Data(contentsOf: url)
    }
}

