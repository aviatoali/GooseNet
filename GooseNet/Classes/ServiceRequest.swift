import Foundation
/**
 Protocol required by any service request with a default implementation for
 firing off trhe request using the request executor. Implement this protocol
 into your custom service request definitions and do any additional set up, or
 transformation for your particular service in that implementation class/struct,
 then call Request to fire it off
 - author: Ali H. Shah
 - date: 07/10/2019
 */
public protocol ServiceRequest {
    associatedtype ResponseModel: Codable
    typealias RequestResult = (Result<ResponseModel, Error>) -> ()
    var EndpointDefinition: Endpoint { get }
    func Request(executor: URLSessionServiceRequestExecutor, completion: @escaping RequestResult)
}

public extension ServiceRequest {
    func Request(executor: URLSessionServiceRequestExecutor = ServiceRequestExecutor.instance, completion: @escaping RequestResult) {
        executor.Fire(to: self.EndpointDefinition) { response in
            switch response {
            case .success(let result):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(ResponseModel.self, from: result.data)
                    DispatchQueue.main.async { completion(.success(result)) }
                } catch let error {
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            case .failure(let error):
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }
    }
}
