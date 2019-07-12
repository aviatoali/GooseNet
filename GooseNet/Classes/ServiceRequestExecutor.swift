import Foundation
/**
 Default service request executor that implements URLSessionServiceRequestExecutor.
 Constructs a URLRequest from the data provided by the Endpoint definitiont that
 is passed in by the calling ServiceRequest instance and starts a dataTask with it
 - author: Ali H. Shah
 - date: 07/10/2019
 */
public struct ServiceRequestExecutor: URLSessionServiceRequestExecutor {
    public static let instance = ServiceRequestExecutor()
    
    private init() {}
    
    public func Fire(to endpoint: Endpoint, completion: @escaping (Result<ServiceResponseData, Error>) -> ()) {
        let urlComponents: URLComponents = endpoint.UrlComponents()
        guard let url = urlComponents.url else {
            completion(.failure(GooseNetError.BadURL(desc: "\(endpoint.HttpProtocol)://\(endpoint.BaseUrl)\(endpoint.Path)")))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.Method.rawValue
        if let headers = endpoint.Headers {
            urlRequest.allHTTPHeaderFields = headers
        }
        if let body = endpoint.Body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch let error {
                completion(.failure(error))
                return
            }
        }
        let date: Date? =  GooseNetLogging.URLRequests(urlRequest) ? Date() : nil
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            self.HandleRequestLogging(for: urlRequest, on: date, with: response, and: error)
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let _response = response else {
                completion(.failure(GooseNetError.NoResponse))
                return
            }
            guard let httpResponse = _response as? HTTPURLResponse else {
                completion(.failure(GooseNetError.NonHTTPResponse))
                return
            }
            guard let _data = data else {
                completion(.failure(GooseNetError.NoData))
                return
            }
            completion(.success(ServiceResponseData(with: httpResponse, and: _data)))
            }.resume()
    }
}
