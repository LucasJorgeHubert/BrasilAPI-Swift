//
//  File.swift
//  
//
//  Created by Lucas Hubert on 04/03/25.
//

import Foundation

public class BankingService {
    private let bankListUseCase: GetBankListUseCase
    private let bankByIdUseCase: GetBankByIdUseCase

    public init(repository: BankRepositoryProtocol = BankRepositoryImpl()) {
        self.bankListUseCase = GetBankListUseCase(repository: repository)
        self.bankByIdUseCase = GetBankByIdUseCase(repository: repository)
    }

    public func listBanks() async throws -> [BrasilAPIBankModel] {
        return try await bankListUseCase.execute()
    }
    
    public func getBankByCode(code: String) async throws -> BrasilAPIBankModel {
        return try await bankByIdUseCase.execute(code: code)
    }
}
