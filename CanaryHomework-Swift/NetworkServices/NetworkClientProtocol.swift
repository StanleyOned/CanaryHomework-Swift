//
//  NetworkClientProtocol.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// Protocol for handling network calls
protocol NetworkClientProtocol {
    
    /// Generic Network request functions.
    ///
    /// - Parameters:
    ///   - parameters: The network request parameters.
    ///   - requestType: Type of information requesting from network.
    ///   - completion: Returns a generic result type.
    func request(parameters: [String: Any]?,
                 requestType: RequestDataType,
                 completion: @escaping (Result<Data, NetworkError>) -> Void)
}
