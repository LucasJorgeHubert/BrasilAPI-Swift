//
//  File.swift
//  
//
//  Created by Lucas Hubert on 05/03/25.
//

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
        if let bankRouter = apiRouter as? BankAPIRouter {
            switch bankRouter {
            case .getBanks:
                return "banks_v1"
            case .getBanksByCode(let code):
                return "banks_v1_\(code)"
            }
        }
        
        return "default_mock"
    }
    
    private func resolveExchangeAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let bankRouter = apiRouter as? ExchangeAPIRouter {
            switch bankRouter {
            case .getCoins:
                return "cambio_v1_moedas"
            case .getQuotation:
                return "cambio_v1_cotacao"
            }
        }
        
        return "default_mock"
    }
    
    private func resolveZipCodeAPIRouter(for apiRouter: APIRouterProtocol) -> String {
        if let bankRouter = apiRouter as? ZipCodeAPIRouter {
            switch bankRouter {
            case .getZipCodeV1:
                return "cep_v1"
            case .getZipCodeV2:
                return "cep_v2"
            }
        }
        
        return "default_mock"
    }
}

