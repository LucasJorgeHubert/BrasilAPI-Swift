import Foundation

public class BrasilAPI {
    
    public typealias Bank = Presenter.Bank.Service
    public typealias Broker = Presenter.Broker.Service
    public typealias CNPJ = Presenter.CNPJ.Service
    public typealias CPTEC = Presenter.CPTEC.Service
    public typealias DDD = Presenter.DDD.Service
    public typealias Exchange = Presenter.Exchange.Service
    public typealias FIPE = Presenter.FIPE.Service
    public typealias Holidays = Presenter.Holidays.Service
    public typealias IBGE = Presenter.IBGE.Service
    public typealias ISBN = Presenter.ISBN.Service
    
    public var banking: Presenter.Bank.Service
    public var exchange: Presenter.Exchange.Service
    public var zipCode: ZipCodeService
    public var cnpj: Presenter.CNPJ.Service
    public var broker: Presenter.Broker.Service
    public var cptec: Presenter.CPTEC.Service
    public var ddd: Presenter.DDD.Service
    public var holidays: Presenter.Holidays.Service
    public var fipe: Presenter.FIPE.Service
    public var ibge: Presenter.IBGE.Service
    public var isbn: Presenter.ISBN.Service
    
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
        self.exchange = Presenter.Exchange.Service(repository: exchangeRepository)
        self.zipCode = ZipCodeService(repository: zipCodeRepository)
        self.cnpj = Presenter.CNPJ.Service(repository: cnpjRepository)
        self.broker = Presenter.Broker.Service(repository: brokerRepository)
        self.cptec = Presenter.CPTEC.Service(repository: cptecRepository)
        self.ddd = Presenter.DDD.Service(repository: dddRepository)
        self.holidays = Presenter.Holidays.Service(repository: holidaysRepository)
        self.fipe = Presenter.FIPE.Service(repository: fipeRepository)
        self.ibge = Presenter.IBGE.Service(repository: ibgeRepository)
        self.isbn = Presenter.ISBN.Service(repository: isbnRepository)
    }
}
