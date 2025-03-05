//
//  File.swift
//  
//
//  Created by Lucas Hubert on 05/03/25.
//

import Foundation

public enum ExchangeAPIRouter: APIRouterProtocol {
    case getCoins
    case getQuotation(coin: String, date: String)
    
    public var path: String {
        switch self {
        case .getCoins:
            return "/api/cambio/v1/moedas"
        case .getQuotation(let coin, let date):
            return "/api/cambio/v1/cotacao/\(coin)/\(date)"
        }
    }
    
    public var method: String {
        switch self {
        case .getCoins, .getQuotation:
            return "GET"
        }
    }
}
