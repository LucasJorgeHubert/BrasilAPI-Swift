import Foundation

public class IBGEService {
    private let getIBGECitiesByUFUseCase: GetIBGECitiesByUFUseCase
    private let getIBGEStatesUseCase: GetIBGEStatesUseCase
    private let getIBGEStateByCodeUseCase: GetIBGEStateByCodeUseCase
    
    public init(repository: IBGERepositoryProtocol = IBGERepositoryImpl()) {
        self.getIBGECitiesByUFUseCase = GetIBGECitiesByUFUseCase(repository: repository)
        self.getIBGEStatesUseCase = GetIBGEStatesUseCase(repository: repository)
        self.getIBGEStateByCodeUseCase = GetIBGEStateByCodeUseCase(repository: repository)
    }
    
    public func getIBGECitiesByUF(uf: BrasilState) async throws -> [BrasilAPIIBGECityModel] {
        return try await getIBGECitiesByUFUseCase.execute(uf: uf.rawValue)
    }
    
    public func getIBGEStates() async throws -> [BrasilAPIIBGEStateModel] {
        return try await getIBGEStatesUseCase.execute()
    }
    
    public func getIBGEStateByCode(code: BrasilState) async throws -> BrasilAPIIBGEStateModel {
        return try await getIBGEStateByCodeUseCase.execute(code: code.rawValue)
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
