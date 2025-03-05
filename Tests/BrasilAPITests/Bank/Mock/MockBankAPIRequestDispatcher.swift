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
            throw BrasilAPIRequestError.notFound
        }
        
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
    
    private func resolveMockFileName(for apiRouter: APIRouterProtocol) -> String {
        switch apiRouter {
        case is BankAPIRouter:
            if let bankRouter = apiRouter as? BankAPIRouter {
                switch bankRouter {
                case .getBanks:
                    return "banks_v1"
                case .getBanksByCode(let code):
                    return "banks_v1_\(code)"
                }
            }
        default:
            return "default_mock"
        }
        
        return "default_mock"
    }
    
    private func loadMockJSON(named fileName: String) -> Data? {
        guard let url = Bundle.module.url(forResource: fileName, withExtension: "json") else {
            print("❌ JSON \(fileName).json not found")
            return nil
        }
        
        return try? Data(contentsOf: url)
    }
}

