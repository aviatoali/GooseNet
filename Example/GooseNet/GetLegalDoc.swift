//
//  GetLegalDoc.swift
//  GooseNet_Example
//
//  Created by Shan-e-Ali Shah on 7/12/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import GooseNet

struct GetLegalDoc: ServiceRequest {
    typealias ResponseModel = LegalDoc
    var EndpointDefinition: Endpoint {
        return Endpoint(baseUrl: "someTestBaseUrl", path: "some test path")
    }
}
