import Foundation

public class BrasilAPI {
    public var banking: BankingService
    public var exchange: ExchangeService
    public var zipCode: ZipCodeService
    public var cnpj: CNPJService
    public var broker: BrokerService
    public var cptec: CPTECService
    public var ddd: DDDService
    public var holidays: HolidaysServices

    public init(
        bankingRepository: BankRepositoryProtocol = BankRepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = ExchangeRepositoryImpl(),
        zipCodeRepository: ZipCodeRepositoryProtocol = ZipCodeRepositoryImpl(),
        cnpjRepository: CNPJRepositoryProtocol = CNPJRepositoryImpl(),
        brokerRepository: BrokerRepositoryProtocol = BrokerRepositoryImpl(),
        cptecRepository: CPTECRepositoryProtocol = CPTECRepositoryImpl(),
        dddRepository: DDDRepositoryProtocol = DDDRepositoryImpl(),
        holidaysRepository: HolidaysRepositoryProtocol = HolidaysRepositoryImpl()
    ) {
        self.banking = BankingService(repository: bankingRepository)
        self.exchange = ExchangeService(repository: exchangeRepository)
        self.zipCode = ZipCodeService(repository: zipCodeRepository)
        self.cnpj = CNPJService(repository: cnpjRepository)
        self.broker = BrokerService(repository: brokerRepository)
        self.cptec = CPTECService(repository: cptecRepository)
        self.ddd = DDDService(repository: dddRepository)
        self.holidays = HolidaysServices(repository: holidaysRepository)
    }
}
