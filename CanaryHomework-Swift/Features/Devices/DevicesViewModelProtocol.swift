//
//  DevicesViewModelProtocol.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// Protocol that will define all the public functions for the DevicesViewModel.
protocol DevicesViewModelProtocol {
    
    /// The view title
    var title: String { get }
    
    /// View had loaded.
    func viewDidLoad()
    
    /// The device array number of items count.
    func numberOfItems() -> Int
    
    /// Get the device at the given index path
    /// - Parameter indexPath: The index path given.
    func device(at indexPath: IndexPath) -> Device
    
    /// User seleced a device from the table view screen
    /// - Parameter indexPath: The indexpath selected
    func didSelectDevice(at indexPath: IndexPath)
    
    /// Retry loading devices
    func retryFetchingDevices()
    
    /// Fetch devices from internet.
    func fetchDevices()
}
