import Foundation

public class BrasilAPI {
    public var banking: BankingService
    public var exchange: ExchangeService
    public var zipCode: ZipCodeService
    public var cnpj: CNPJService
    public var broker: BrokerService
    public var cptec: CPTECService

    public init(
        bankingRepository: BankRepositoryProtocol = BankRepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = ExchangeRepositoryImpl(),
        zipCodeRepository: ZipCodeRepositoryProtocol = ZipCodeRepositoryImpl(),
        cnpjRepository: CNPJRepositoryProtocol = CNPJRepositoryImpl(),
        brokerRepository: BrokerRepositoryProtocol = BrokerRepositoryImpl(),
        cptecRepository: CPTECRepositoryProtocol = CPTECRepositoryImpl()
    ) {
        self.banking = BankingService(repository: bankingRepository)
        self.exchange = ExchangeService(repository: exchangeRepository)
        self.zipCode = ZipCodeService(repository: zipCodeRepository)
        self.cnpj = CNPJService(repository: cnpjRepository)
        self.broker = BrokerService(repository: brokerRepository)
        self.cptec = CPTECService(repository: cptecRepository)
    }
}
