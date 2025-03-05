//
//  File.swift
//  
//
//  Created by Lucas Hubert on 04/03/25.
//

import Foundation

public class BrasilAPI {
    public var banking: BankingService
    public var exchange: ExchangeService

    public init(
        bankingRepository: BankRepositoryProtocol = BankRepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = ExchangeRepositoryImpl()
    ) {
        self.banking = BankingService(repository: bankingRepository)
        self.exchange = ExchangeService(repository: exchangeRepository)
    }
}
