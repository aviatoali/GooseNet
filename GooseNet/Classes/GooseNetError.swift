import Foundation
/**
 Enum that represents some fo the different error types that the
 network api call can have
 - author: Ali H. Shah
 - date: 07/10/2019
 */
public enum GooseNetError: Swift.Error {
    case BadURL(desc: String)
    case NoResponse
    case NonHTTPResponse
    case NoData
    case NotFoundError
    case InternalError(desc: String)
    case ConnectionError(desc: String)
    case NotAuthorizedError
    case UnhandledError(desc: String)
    
    var description: String {
        switch self {
        case .BadURL(let desc):
            return "Bad URL: \(desc)"
        case .NoResponse:
            return "No response returned from endpoint"
        case .NonHTTPResponse:
            return  "Response is not HTTPURLResponse"
        case .NoData:
            return "No data returned from endpoint"
        case .ConnectionError(let desc):
            return "ConnectionError \(desc)"
        case .NotFoundError:
            return "Not Found"
        case .InternalError(let desc):
            return desc
        case .NotAuthorizedError:
            return "Not Authorized"
        case .UnhandledError(let desc):
            return desc
        }
    }
}
