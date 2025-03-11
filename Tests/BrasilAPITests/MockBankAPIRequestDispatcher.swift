import Foundation
import BrasilAPI

class MockBankAPIRequestDispatcher: APIRequestDispatcherProtocol {
    
    func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T {
        let jsonFileName = resolveMockFileName(for: apiRouter)
        
        guard let jsonData = loadMockJSON(named: jsonFileName) else {
            throw BrasilAPIRequestError.badUrl
        }
        
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
    
    private func resolveMockFileName(for apiRouter: APIRouterProtocol) -> String {
        switch apiRouter {
        case is BankAPIRouter:
            return resolveBankAPIRouter(for: apiRouter)
        case is ExchangeAPIRouter:
            return resolveExchangeAPIRouter(for: apiRouter)
        case is ZipCodeAPIRouter:
            return resolveZipCodeAPIRouter(for: apiRouter)
        case is CNPJAPIRouter:
            return resolveCNPJAPIRouter(for: apiRouter)
        case is BrokerAPIRouter:
            return resolveBrokerAPIRouter(for: apiRouter)
        case is CPTECAPIRouter:
            return resolveCPTECAPIRouter(for: apiRouter)
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
    
    private func resolveBankAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let router = apiRouter as? BankAPIRouter {
            switch router {
            case .getBanks:
                return "banks_v1"
            case .getBanksByCode(let code):
                return "banks_v1_\(code)"
            }
        }
        
        return "default_mock"
    }
    
    private func resolveExchangeAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let router = apiRouter as? ExchangeAPIRouter {
            switch router {
            case .getCoins:
                return "cambio_v1_moedas"
            case .getQuotation:
                return "cambio_v1_cotacao"
            }
        }
        
        return "default_mock"
    }
    
    private func resolveZipCodeAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let router = apiRouter as? ZipCodeAPIRouter {
            switch router {
            case .getZipCodeV1:
                return "cep_v1"
            case .getZipCodeV2:
                return "cep_v2"
            }
        }
        
        return "default_mock"
    }
    
    private func resolveCNPJAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let router = apiRouter as? CNPJAPIRouter {
            switch router {
            case .getCNPJ:
                return "cnpj_v1"
            }
        }
        
        return "default_mock"
    }
    
    private func resolveBrokerAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let router = apiRouter as? BrokerAPIRouter {
            switch router {
            case .getBrokers:
                return "cvm_corretoras_v1"
            case .getBrokersByCnpj:
                return "cvm_corretoras_v1_cnpj"
            }
        }
        
        return "default_mock"
    }
    
    private func resolveCPTECAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let router = apiRouter as? CPTECAPIRouter {
            switch router {
            case .listLocals:
                return "cptec_v1_cidade"
            case .getLocal:
                return "cptec_v1_cidade_nome"
            case .listCapitalConditions:
                return "cptec_v1_clima_capital"
            case .getCapitalCondition:
                return "cptec_v1_clima_aeroporto_icao"
            case .getForecast:
                return "cptec_v1_clima_previsao_code_days"
            case .getOceanicForecast:
                return "cptec_v1_ondas_code_days"
            }
        }
        
        return "default_mock"
    }
}

