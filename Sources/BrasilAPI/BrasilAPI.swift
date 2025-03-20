import Foundation

public class BrasilAPI {
    public var banking: Presenter.Bank.Service
    public var exchange: ExchangeService
    public var zipCode: ZipCodeService
    public var cnpj: CNPJService
    public var broker: Presenter.Broker.Service
    public var cptec: CPTECService
    public var ddd: DDDService
    public var holidays: HolidaysService
    public var fipe: FIPEService
    public var ibge: Presenter.IBGE.IBGEService
    public var isbn: Presenter.ISBN.Service
    
    public typealias Bank = Presenter.Bank.Service
    public typealias Broker = Presenter.Broker.Service
    
    public init(
        bankingRepository: BankRepositoryProtocol = DataSource.Bank.RepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = DataSource.Exchange.RepositoryImpl(),
        zipCodeRepository: ZipCodeRepositoryProtocol = DataSource.ZipCode.RepositoryImpl(),
        cnpjRepository: CNPJRepositoryProtocol = DataSource.CNPJ.RepositoryImpl(),
        brokerRepository: BrokerRepositoryProtocol = DataSource.Broker.RepositoryImpl(),
        cptecRepository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl(),
        dddRepository: DDDRepositoryProtocol = DataSource.DDD.RepositoryImpl(),
        holidaysRepository: HolidaysRepositoryProtocol = DataSource.Holidays.RepositoryImpl(),
        fipeRepository: FIPERepositoryProtocol = DataSource.FIPE.RepositoryImpl(),
        ibgeRepository: IBGERepositoryProtocol = DataSource.IBGE.RepositoryImpl(),
        isbnRepository: ISBNRepositoryProtocol = DataSource.ISBN.RepositoryImpl()
    ) {
        self.banking = Presenter.Bank.Service(repository: bankingRepository)
        self.exchange = ExchangeService(repository: exchangeRepository)
        self.zipCode = ZipCodeService(repository: zipCodeRepository)
        self.cnpj = CNPJService(repository: cnpjRepository)
        self.broker = Presenter.Broker.Service(repository: brokerRepository)
        self.cptec = CPTECService(repository: cptecRepository)
        self.ddd = DDDService(repository: dddRepository)
        self.holidays = HolidaysService(repository: holidaysRepository)
        self.fipe = FIPEService(repository: fipeRepository)
        self.ibge = Presenter.IBGE.IBGEService(repository: ibgeRepository)
        self.isbn = Presenter.ISBN.Service(repository: isbnRepository)
    }
}
