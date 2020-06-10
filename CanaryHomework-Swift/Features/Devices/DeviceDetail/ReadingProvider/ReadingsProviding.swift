//
//  ReadingsProviding.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

/// Protocol which defines Readings Provider.
protocol ReadingsProviding {
    
    /// Get readings with device id
    /// - Parameters:
    ///   - deviceID: The device ID.
    ///   - parameters: The parameters given.
    ///   - completion: Completes with a generic result type.
    func getReadings(deviceID: String,
                     parameters: [String: Any]?,
                     completion: @escaping (Result<[Reading], NetworkError>) -> Void)
}
