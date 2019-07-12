import struct Foundation.URLRequest
/**
 Struct representing logging convenience object
 - author: Ali H. Shah
 - date: 07/10/2019
 */
public struct GooseNetLogging {
    public typealias LogURLRequest = (URLRequest) -> Bool
    
    public static var URLRequests: LogURLRequest =  { _ in
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}
