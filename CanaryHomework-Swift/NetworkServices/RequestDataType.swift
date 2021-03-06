//
//  RequestDataType.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

/// Represents the type of information, or network calls that will be requested by the app.
///

/// - trending: A trending request
/// - search: A Search request using the given term
enum RequestDataType {
    case devices
    case devicesById(String)
    case readings(String)
    
    /// End point used to build URL
    var endPointString: String {
        switch self {
        case .devices:
            return "/devices"
        case .readings(let id):
            return "/devices/\(id)/readings"
        case .devicesById(let id):
            return "/devices/\(id)"
        }
    }
}
