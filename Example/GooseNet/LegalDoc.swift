//
//  LegalDoc.swift
//  GooseNet_Example
//
//  Created by Shan-e-Ali Shah on 7/12/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public struct LegalDoc: Codable {
    let url: String
    init(url: String) { self.url = url }
}
