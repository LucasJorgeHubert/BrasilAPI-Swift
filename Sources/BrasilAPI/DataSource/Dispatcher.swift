import Foundation

internal protocol APIRequestDispatcherProtocol {
    func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T
}

internal class APIRequestDispatcher: APIRequestDispatcherProtocol {
    
    private let session: URLSession
    private let maxRetries: Int
    
    init(session: URLSession = .shared, maxRetries: Int = 3) {
        self.session = session
        self.maxRetries = maxRetries
    }
    
    func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T {
        var components = URLComponents()
        components.scheme = APIConfig.environment == .local ? "http" : "https"
        components.host = APIConfig.baseURL
        components.path = apiRouter.path
        
        if APIConfig.environment == .local {
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
                case 400:
                    throw BrasilAPIRequestError.badRequest
                case 401:
                    throw BrasilAPIRequestError.unauthorized
                case 403:
                    throw BrasilAPIRequestError.forbidden
                case 404:
                    throw BrasilAPIRequestError.notFound
                case 500...599:
                    throw BrasilAPIRequestError.serverError
                default:
                    throw BrasilAPIRequestError.unknownStatusCode(httpResponse.statusCode)
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
enum BrasilAPIRequestError: Error, Equatable {
    case badUrl
    case invalidResponse
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case unknownStatusCode(Int)
    case unknown
}
