import Foundation
/**
 Protocol required by any request executor. Has a default implementation for
 logging functions. HandleRequestLogging can be overridden for custom logging
 - author: Ali H. Shah
 - date: 07/10/2019
 */
public protocol URLSessionServiceRequestExecutor {
    func Fire(to endpoint: Endpoint, completion: @escaping (Result<ServiceResponseData, Error>) -> ())
    func HandleRequestLogging(for request: URLRequest, on date: Date?, with response: URLResponse?, and error: Error?)
}

// Note: Logging system grabbed from RxSwift's logging process for Reactive response case
public extension URLSessionServiceRequestExecutor {
    func HandleRequestLogging(for request: URLRequest, on date: Date?, with response: URLResponse?, and error: Error?) {
        if GooseNetLogging.URLRequests(request)  {
            print(convertURLRequestToCurlCommand(request))
            let interval = Date().timeIntervalSince(date ?? Date())
            print(convertResponseToString(response, error.flatMap { $0 as NSError }, interval))
        }
    }
    
    fileprivate func convertResponseToString(_ response: URLResponse?, _ error: NSError?, _ interval: TimeInterval) -> String {
        let ms = Int(interval * 1000)
        
        if let response = response as? HTTPURLResponse {
            if 200 ..< 300 ~= response.statusCode {
                return "Success (\(ms)ms): Status \(response.statusCode)"
            }
            else {
                return "Failure (\(ms)ms): Status \(response.statusCode)"
            }
        }
        if let error = error {
            if error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
                return "Canceled (\(ms)ms)"
            }
            return "Failure (\(ms)ms): NSError > \(error)"
        }
        return "<Unhandled response from server>"
    }
    
    fileprivate func convertURLRequestToCurlCommand(_ request: URLRequest) -> String {
        let method = request.httpMethod ?? "GET"
        var returnValue = "curl -X \(method) "
        if let httpBody = request.httpBody, request.httpMethod == "POST" {
            let maybeBody = String(data: httpBody, encoding: String.Encoding.utf8)
            if let body = maybeBody {
                returnValue += "-d \"\(escapeTerminalString(body))\" "
            }
        }
        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            let escapedKey = escapeTerminalString(key as String)
            let escapedValue = escapeTerminalString(value as String)
            returnValue += "\n    -H \"\(escapedKey): \(escapedValue)\" "
        }
        let URLString = request.url?.absoluteString ?? "<unknown url>"
        returnValue += "\n\"\(escapeTerminalString(URLString))\""
        returnValue += " -i -v"
        return returnValue
    }
    
    fileprivate func escapeTerminalString(_ value: String) -> String {
        return value.replacingOccurrences(of: "\"", with: "\\\"", options:[], range: nil)
    }
}
