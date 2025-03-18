import Foundation

extension DataSource {
    enum APIEnvironment {
        case local
        case production
    }

    struct APIConfig {
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

}
