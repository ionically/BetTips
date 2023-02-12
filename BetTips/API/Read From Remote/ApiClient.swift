import Foundation
import Combine

struct HTTPMethod {
    static let get = "GET"
    static let post = "POST"
    static let put = "PUT"
    static let delete = "DELETE"
}

protocol APICall {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    func body() throws -> Data?
}

extension APICall {
    func urlRequest(baseURL: String) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw APIError.url(description: "Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        return request
    }
}

enum APIError: Error, Equatable {
    case parsing(description: String)
    case network(description: String)
    case url(description: String)
}

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    do {
            print(String(data: try
                        JSONSerialization.data(withJSONObject: JSONSerialization.jsonObject(with: data, options: []),
                                               options: .prettyPrinted), encoding: .utf8)!)
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Int] {
                debugPrint(json)
            }
        } catch let error as NSError {
            print(data)
            print("Failed to load: \(error.localizedDescription)")
        }
         
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
