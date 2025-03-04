import Foundation

protocol APIRequestDispatcherProtocol {
    func request<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T
}

class APIRequestDispatcher: APIRequestDispatcherProtocol {
    
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

        guard let url = components.url else { throw APIRequestError.badUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        
        let session = URLSession.shared
        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIRequestError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIRequestError.invalidResponse
        }
    }
}

enum APIRequestError: Error {
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
