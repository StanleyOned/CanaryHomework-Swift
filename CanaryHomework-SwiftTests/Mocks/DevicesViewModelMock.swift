//
//  DevicesViewModelMock.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/10/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation
@testable import CanaryHomework_Swift

/// Mock class for DevicesViewModel.
final class DevicesViewModelMock: DevicesViewModelProtocol {
    
    // MARK: - Properties
    
    var title: String = ""
        
    var devices: [Device] = []
    
    var viewDidLoadedSuccessfully = false
    var didFetchDevicesSuccessfully = false
    
    var selectedDevice: Device?
    
    var retryFetching = false
    
    // MARK: - Public Functions
    
    func viewDidLoad() {
        viewDidLoadedSuccessfully = true
    }
    
    func numberOfItems() -> Int {
        devices.count
    }
    
    func device(at indexPath: IndexPath) -> Device {
        devices[indexPath.item]
    }
    
    func didSelectDevice(at indexPath: IndexPath) {
        let selectedDevice = device(at: indexPath)
        self.selectedDevice = selectedDevice
    }
    
    func retryFetchingDevices() {
        retryFetching = true
    }
    
    func fetchDevices() {
        if retryFetching {
            return
        }
        didFetchDevicesSuccessfully = true
        
        devices = [
            Device(name: "Device 1", id: "123123", createdAt: "Date 1", updatedAt: "Date 2", type: "Airquality", value: "123")
        ]
    }
}
