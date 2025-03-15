import Foundation

public class BrasilAPI {
    public var banking: BankingService
    public var exchange: ExchangeService
    public var zipCode: ZipCodeService
    public var cnpj: CNPJService
    public var broker: BrokerService
    public var cptec: CPTECService
    public var ddd: DDDService
    public var holidays: HolidaysService
    public var fipe: FIPEService
    public var ibge: Presenter.IBGE.IBGEService
    public var isbn: Presenter.ISBN.Service
    
    public init(
        bankingRepository: BankRepositoryProtocol = BankRepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = ExchangeRepositoryImpl(),
        zipCodeRepository: ZipCodeRepositoryProtocol = ZipCodeRepositoryImpl(),
        cnpjRepository: CNPJRepositoryProtocol = CNPJRepositoryImpl(),
        brokerRepository: BrokerRepositoryProtocol = BrokerRepositoryImpl(),
        cptecRepository: CPTECRepositoryProtocol = CPTECRepositoryImpl(),
        dddRepository: DDDRepositoryProtocol = DDDRepositoryImpl(),
        holidaysRepository: HolidaysRepositoryProtocol = DataSource.Holidays.RepositoryImpl(),
        fipeRepository: FIPERepositoryProtocol = FIPERepositoryImpl(),
        ibgeRepository: IBGERepositoryProtocol = DataSource.IBGE.RepositoryImpl(),
        isbnRepository: ISBNRepositoryProtocol = DataSource.ISBN.RepositoryImpl()
    ) {
        self.banking = BankingService(repository: bankingRepository)
        self.exchange = ExchangeService(repository: exchangeRepository)
        self.zipCode = ZipCodeService(repository: zipCodeRepository)
        self.cnpj = CNPJService(repository: cnpjRepository)
        self.broker = BrokerService(repository: brokerRepository)
        self.cptec = CPTECService(repository: cptecRepository)
        self.ddd = DDDService(repository: dddRepository)
        self.holidays = HolidaysService(repository: holidaysRepository)
        self.fipe = FIPEService(repository: fipeRepository)
        self.ibge = Presenter.IBGE.IBGEService(repository: ibgeRepository)
        self.isbn = Presenter.ISBN.Service(repository: isbnRepository)
    }
}
