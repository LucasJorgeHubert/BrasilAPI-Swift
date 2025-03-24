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
    public typealias NCM = Presenter.NCM.Service
    public typealias PIX = Presenter.PIX.Service
    public typealias ZipCode = Presenter.ZipCode.Service
    
    public var banking: Presenter.Bank.Service
    public var broker: Presenter.Broker.Service
    public var cnpj: Presenter.CNPJ.Service
    public var cptec: Presenter.CPTEC.Service
    public var ddd: Presenter.DDD.Service
    public var exchange: Presenter.Exchange.Service
    public var fipe: Presenter.FIPE.Service
    public var holidays: Presenter.Holidays.Service
    public var ibge: Presenter.IBGE.Service
    public var isbn: Presenter.ISBN.Service
    public var ncm: Presenter.NCM.Service
    public var pix: Presenter.PIX.Service
    public var zipCode: Presenter.ZipCode.Service
    
    public init(
        bankingRepository: BankRepositoryProtocol = DataSource.Bank.RepositoryImpl(),
        brokerRepository: BrokerRepositoryProtocol = DataSource.Broker.RepositoryImpl(),
        cnpjRepository: CNPJRepositoryProtocol = DataSource.CNPJ.RepositoryImpl(),
        cptecRepository: CPTECRepositoryProtocol = DataSource.CPTEC.RepositoryImpl(),
        dddRepository: DDDRepositoryProtocol = DataSource.DDD.RepositoryImpl(),
        exchangeRepository: ExchangeRepositoryProtocol = DataSource.Exchange.RepositoryImpl(),
        fipeRepository: FIPERepositoryProtocol = DataSource.FIPE.RepositoryImpl(),
        holidaysRepository: HolidaysRepositoryProtocol = DataSource.Holidays.RepositoryImpl(),
        ibgeRepository: IBGERepositoryProtocol = DataSource.IBGE.RepositoryImpl(),
        isbnRepository: ISBNRepositoryProtocol = DataSource.ISBN.RepositoryImpl(),
        ncmRepository: NCMRepositoryProtocol = DataSource.NCM.RepositoryImpl(),
        pixRepository: PIXRepositoryProtocol = DataSource.PIX.RepositoryImpl(),
        zipCodeRepository: ZipCodeRepositoryProtocol = DataSource.ZipCode.RepositoryImpl()
    ) {
        self.banking = Presenter.Bank.Service(repository: bankingRepository)
        self.broker = Presenter.Broker.Service(repository: brokerRepository)
        self.cnpj = Presenter.CNPJ.Service(repository: cnpjRepository)
        self.cptec = Presenter.CPTEC.Service(repository: cptecRepository)
        self.ddd = Presenter.DDD.Service(repository: dddRepository)
        self.exchange = Presenter.Exchange.Service(repository: exchangeRepository)
        self.fipe = Presenter.FIPE.Service(repository: fipeRepository)        
        self.holidays = Presenter.Holidays.Service(repository: holidaysRepository)
        self.ibge = Presenter.IBGE.Service(repository: ibgeRepository)
        self.isbn = Presenter.ISBN.Service(repository: isbnRepository)
        self.ncm = Presenter.NCM.Service(repository: ncmRepository)
        self.pix = Presenter.PIX.Service(repository: pixRepository)
        self.zipCode = Presenter.ZipCode.Service(repository: zipCodeRepository)
    }
}
