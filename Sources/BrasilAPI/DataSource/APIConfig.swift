import Foundation

public enum APIEnvironment {
    case local
    case production
}

public struct APIConfig {
    public static var environment: APIEnvironment = .production

    public static var baseURL: String {
        switch environment {
        case .local:
            return "localhost"
        case .production:
            return "brasilapi.com.br"
        }
    }
}
