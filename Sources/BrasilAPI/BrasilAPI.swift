import Foundation

public class BrasilAPI {
    public var banking: BankingService
    public var exchange: ExchangeService
    public var zipCode: ZipCodeService
    public var cnpj: CNPJService

    public init(
        bankingRepository: BankRepositoryProtocol = BankRepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = ExchangeRepositoryImpl(),
        zipCodeRepository: ZipCodeRepositoryProtocol = ZipCodeRepositoryImpl(),
        cnpjRepository: CNPJRepositoryProtocol = CNPJRepositoryImpl()
    ) {
        self.banking = BankingService(repository: bankingRepository)
        self.exchange = ExchangeService(repository: exchangeRepository)
        self.zipCode = ZipCodeService(repository: zipCodeRepository)
        self.cnpj = CNPJService(repository: cnpjRepository)
    }
}
