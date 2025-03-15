import Foundation

extension Presenter.IBGE {
    
    public final class IBGEService {
        private let getCitiesByUFUseCase: Presenter.IBGE.UseCase.GetCitiesByUF
        private let getStatesUseCase: Presenter.IBGE.UseCase.GetStates
        private let getStateByCodeUseCase: Presenter.IBGE.UseCase.GetStateByCode
        
        public init(repository: IBGERepositoryProtocol = IBGERepositoryImpl()) {
            self.getCitiesByUFUseCase = Presenter.IBGE.UseCase.GetCitiesByUF(repository: repository)
            self.getStatesUseCase = Presenter.IBGE.UseCase.GetStates(repository: repository)
            self.getStateByCodeUseCase = Presenter.IBGE.UseCase.GetStateByCode(repository: repository)
        }
        
        public func getCitiesByUF(uf: BrasilState) async throws -> [Domain.IBGE.Models.CityModel] {
            return try await getCitiesByUFUseCase.execute(uf: uf.rawValue)
        }
        
        public func getStates() async throws -> [Domain.IBGE.Models.StateModel] {
            return try await getStatesUseCase.execute()
        }
        
        public func getStateByCode(code: BrasilState) async throws -> Domain.IBGE.Models.StateModel {
            return try await getStateByCodeUseCase.execute(code: code.rawValue)
        }
    }
    
    public enum BrasilState: String {
        case AC = "AC"
        case AL = "AL"
        case AP = "AP"
        case AM = "AM"
        case BA = "BA"
        case CE = "CE"
        case DF = "DF"
        case ES = "ES"
        case GO = "GO"
        case MA = "MA"
        case MT = "MT"
        case MS = "MS"
        case MG = "MG"
        case PA = "PA"
        case PB = "PB"
        case PR = "PR"
        case PE = "PE"
        case PI = "PI"
        case RJ = "RJ"
        case RN = "RN"
        case RS = "RS"
        case RO = "RO"
        case RR = "RR"
        case SC = "SC"
        case SP = "SP"
        case SE = "SE"
        case TO = "TO"
    }
}
