import Foundation

public protocol APIRequestDispatcherProtocol {
    func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T
}

extension DataSource {
    
    public class APIRequestDispatcher: APIRequestDispatcherProtocol {
        
        private let session: URLSession
        private let maxRetries: Int
        
        public init(session: URLSession = .shared, maxRetries: Int = 3) {
            self.session = session
            self.maxRetries = maxRetries
        }
        
        public func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T {
            var components = URLComponents()
            components.scheme = DataSource.APIConfig.environment == .local ? "http" : "https"
            components.host = DataSource.APIConfig.baseURL
            components.path = apiRouter.path
            
            if DataSource.APIConfig.environment == .local {
                components.port = 3000
            }
            
            guard let url = components.url else { throw BrasilAPIRequestError.badUrl }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = apiRouter.method
            
            var currentAttempt = 0
            var lastError: Error?
            
            while currentAttempt < maxRetries {
                do {
                    let (data, response) = try await session.data(for: urlRequest)
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw BrasilAPIRequestError.invalidResponse
                    }
                    
                    switch httpResponse.statusCode {
                    case 200...299:
                        return try JSONDecoder().decode(T.self, from: data)
                        
                    case 400...599:
                        let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: data)
                        
                        if let apiError = apiError {
                            throw BrasilAPIRequestError.apiError(apiError)
                        } else {
                            throw BrasilAPIRequestError.unknownStatusCode(httpResponse.statusCode, nil)
                        }
                        
                    default:
                        throw BrasilAPIRequestError.unknown
                    }
                    
                } catch {
                    lastError = error
                    currentAttempt += 1
                    
                    if currentAttempt >= maxRetries {
                        throw lastError ?? BrasilAPIRequestError.unknown
                    }
                    
                    try await Task.sleep(nanoseconds: UInt64(pow(2.0, Double(currentAttempt)) * 500_000_000))
                }
            }
            
            throw BrasilAPIRequestError.unknown
        }
        
    }
    
    public enum BrasilAPIRequestError: Error {
        case badUrl
        case invalidResponse
        case apiError(APIErrorResponse)
        case unknownStatusCode(Int, APIErrorResponse?)
        case unknown
        
        var localizedDescription: String {
            switch self {
            case .badUrl:
                return "URL inválida."
            case .invalidResponse:
                return "Resposta inválida do servidor."
            case .apiError(let errorResponse):
                return "Erro: \(errorResponse.message) (\(errorResponse.type))"
            case .unknownStatusCode(let code, let errorResponse):
                return "Erro \(code): \(errorResponse?.message ?? "Resposta desconhecida")"
            case .unknown:
                return "Ocorreu um erro desconhecido."
            }
        }
    }
    
    public struct APIErrorResponse: Codable {
        let name: String?
        let message: String
        let type: String
        let errors: [APIServiceError]?
    }
    
    public struct APIServiceError: Codable {
        let name: String?
        let message: String
        let service: String?
    }
}
