//
//  Reading.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// Model class for Reading.
struct Reading: Decodable {
    let type: String
    let value: Int
    let id: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case value
        case id
        case createdAt
        case updatedAt
    }
}
