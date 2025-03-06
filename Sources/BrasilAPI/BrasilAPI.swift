import Foundation

public class BrasilAPI {
    public var banking: BankingService
    public var exchange: ExchangeService
    public var zipCode: ZipCodeService

    public init(
        bankingRepository: BankRepositoryProtocol = BankRepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = ExchangeRepositoryImpl(),
        zipCodeRepository: ZipCodeRepositoryProtocol = ZipCodeRepositoryImpl()
    ) {
        self.banking = BankingService(repository: bankingRepository)
        self.exchange = ExchangeService(repository: exchangeRepository)
        self.zipCode = ZipCodeService(repository: zipCodeRepository)
    }
}
