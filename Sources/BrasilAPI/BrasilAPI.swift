//
//  File.swift
//  
//
//  Created by Lucas Hubert on 04/03/25.
//

import Foundation

public class BrasilAPI {
    public var banking: BankingService

    public init(bankingRepository: BankRepositoryProtocol = BankRepositoryImpl()) {
        self.banking = BankingService(repository: bankingRepository)
    }
}
