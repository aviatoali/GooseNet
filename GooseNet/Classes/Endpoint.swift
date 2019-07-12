import Foundation
/**
 Represents the definition of a service endpoint.
 - author: Ali H. Shah
 - date: 07/10/2019
 */
public struct Endpoint {
    public let HttpProtocol: HTTPProtocol
    public let Method: HTTPMethod
    public let Headers: [String: String]?
    public let BaseUrl: String
    public let Path: String
    public let Params: [String: String?]?
    public let Body: [String: Any]?
    
    public init (httpProtocol: HTTPProtocol = .https,
                 method: HTTPMethod = .GET,
                 headers: [String: String]? = ["Content-Type": "application/json"],
                 baseUrl: String,
                 path: String,
                 params: [String: String?]? = nil,
                 body: [String: Any]? = nil) {
        HttpProtocol = httpProtocol
        Method = method
        Headers = headers
        BaseUrl = baseUrl
        Path = path
        Params = params
        Body = body
    }
    
    public func UrlComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = HttpProtocol.rawValue
        components.host = BaseUrl
        components.path = Path
        if let params = Params {
            components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return components
    }
}


