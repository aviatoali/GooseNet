# GooseNet

[![Version](https://img.shields.io/cocoapods/v/GooseNet.svg?style=flat)](https://cocoapods.org/pods/GooseNet)
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
[![Platform](https://img.shields.io/cocoapods/p/GooseNet.svg?style=flat)](https://cocoapods.org/pods/GooseNet)

This CocoaPods library is meant as a minimalistic async networking layer for reuse across projects to cut down on code repetition. Upcoming features include SSL-Pinning helpers for security concerns, request retrying, and webSocketTask and streamTask support.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Usage

As shown in the Example app, the usage of the pod is as follows:

1. Define a model that implements the Codable protocol for the data returned by your endpoint. In the case of the Example app:

```swift
public struct LegalDoc: Codable {
    let url: String
}
```

2. Define an implementation of the ServiceRequest protocol. The ResponseModel must be assigned your Codable model that represents the data returned by your endpoint. Iin the case of the Example app's GetLegalDoc service request:

```swift
import GooseNet

struct GetLegalDoc: ServiceRequest {
    typealias ResponseModel = LegalDoc
    var EndpointDefinition: Endpoint {
    return Endpoint(baseUrl: "someTestBaseUrl.com", path: "/some/test/path")
}
```
3. Call the Request method on the ServiceRequest implementation and handle the result. In the case of the Example app:

```swift
GetLegalDoc().Request { result in
    switch result {
        case .success(let legalDoc):
            print("legal doc url: \(legalDoc.url)")
        case .failure(let error):
            print("request failure with error: \(error)")
    }
}
```

## Installation

GooseNet is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GooseNet'
```

## Author

Ali H. Shah, email: aviatoali@gmail.com, [linkedin](https://www.linkedin.com/in/ali-shah-717144123/)

## License

GooseNet is available under the MIT license. See the LICENSE file for more info.
