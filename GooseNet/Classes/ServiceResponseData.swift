import Foundation
/**
 Struct representing the object to be returned by successful case result of
 ServiceRequestExecutor
 - author: Ali H. Shah
 - date: 07/10/2019
 */
public struct ServiceResponseData {
    let response: HTTPURLResponse
    let data: Data
    
    init (with response: HTTPURLResponse, and data: Data) {
        self.response = response
        self.data = data
    }
}
