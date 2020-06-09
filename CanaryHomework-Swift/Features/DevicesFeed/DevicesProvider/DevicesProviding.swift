//
//  DeviceProviding.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// Protocol that defines the DevicesProvider class.
protocol DevicesProviding {
    
    /// Get devices
    /// - Parameter completion: Completes with a Generic Result type.
    func getDevices(_ completion: @escaping (Result<[Device], NetworkError>) -> Void)
}
