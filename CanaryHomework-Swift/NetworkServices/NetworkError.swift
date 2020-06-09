//
//  NetworkError.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

/// Enumerates possible error types which can be thrown by a failed network call.
///
/// - connectionError: uses HTTP error codes
/// - faultyURL: URL is nil
/// - noData: there is a response but no data
/// - unknownError: Uknown Error
enum NetworkError: Error, CustomStringConvertible {
    case connectionError(_ code: Int )
    case faultyURL
    case noData
    case unknownError(text: String)

    /// Per CustomStringConvertible, used to get error messages for specific case.
    /// Use String(describing: ) when implementing.
    var description: String {
        switch self {
        case let .connectionError(code):
            return "Connection error code: \(code)"
        case .faultyURL:
            return "Problem with URL"
        case .noData:
            return "Response with no data"
        case let .unknownError(text):
            return "Unknown error: \(text)"
        }
    }
}
