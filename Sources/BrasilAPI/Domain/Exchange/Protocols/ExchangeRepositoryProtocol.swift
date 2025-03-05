//
//  File.swift
//  
//
//  Created by Lucas Hubert on 05/03/25.
//

import Foundation

public protocol ExchangeRepositoryProtocol {
    func listCoins() async throws -> [BrasilAPIExchangeCoinModel]
    func getQuotation(coin: String, date: String) async throws -> BrasilAPIExchangeQuotationModel
}
