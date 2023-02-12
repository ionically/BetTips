import Combine
import Foundation

protocol HTTPClient {
    func getFeedList() -> AnyPublisher<DataFromServer, APIError>
}

// Singleton class
class FeedListApi {
    static let shared = FeedListApi()
    private let session = URLSession.shared
}

extension FeedListApi {
    enum FeedListApiEnum {
        case feedlist
    }
}
// MARK: Endpoint configuration
extension FeedListApi.FeedListApiEnum: APICall {
    var headers: [String : String]? {
        return [:]
    }
    
    var path: String {
        switch self {
        case .feedlist:
            return "/feedList"
        }
    }
    
    var method: String {
        switch self {
        case .feedlist:
            return HTTPMethod.get
        }
    }
    
    func body() throws -> Data? {
        return nil
    }
}

var defaultBaseURL = "http://44.192.60.120:5001"

extension FeedListApi: HTTPClient {
    func getFeedList() -> AnyPublisher<DataFromServer, APIError> {
        let request = try? FeedListApiEnum.feedlist.urlRequest(baseURL: defaultBaseURL)
        
        return session.dataTaskPublisher(for: request ?? tempRequest())
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { response in
                decode(response.data)
            }
            .eraseToAnyPublisher()
    }
    
    // Optional request
    func tempRequest() -> URLRequest {
        let url = URL(string: "")!
        let request = URLRequest(url: url)
        return request
    }
}

