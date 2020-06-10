//
//  Device.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// Model class for Device.
struct Device: Decodable {
    let name: String
    let id: String
    let createdAt: String
    let updatedAt: String
    let type: String?
    let value: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case type
        case value
        case createdAt
        case updatedAt
    }
    
    func getCreatedAtDateString() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.date(from: createdAt)
        guard let date = formatter.date(from: createdAt) else {
            return nil
        }
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter.string(from: date)
    }
}
