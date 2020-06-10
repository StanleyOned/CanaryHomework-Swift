//
//  CanaryHomework_SwiftTests.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import XCTest
@testable import CanaryHomework_Swift

class DeviceViewModelTests: XCTestCase {
    
    var sut: DevicesViewModelMock!

    override func setUpWithError() throws {
        sut = DevicesViewModelMock()
    }
    
    func testsDeviceViewModel_didFetchDevicesSuccessfully() {
        // Given
        let success = true
        
        // Then
        sut.fetchDevices()
        
        // When
        XCTAssertEqual(sut.didFetchDevicesSuccessfully, success)
    }
    
    func testsDeviceViewModel_didFetchDevicesUnsuccessfully() {
        // Given
        let success = false
        
        // Then
        sut.retryFetching = true
        sut.fetchDevices()
        
        // When
        XCTAssertEqual(sut.didFetchDevicesSuccessfully, success)
    }
    
    func testsDeviceViewModel_didCreateDeviceSuccessfully() {
        // Given
        let count = sut.numberOfItems()
        
        // Then
        sut.fetchDevices()
        let devices = sut.devices
        
        // When
        XCTAssertGreaterThan(devices.count, count)
    }
    
    func testsDeviceViewModel_didCreateDeviceUnsuccessfully() {
        // Given
        let devices = sut.devices
        
        // Then
        sut.retryFetching = true
        sut.fetchDevices()
        
        // When
        XCTAssertEqual(devices.count, 0)
    }

    override func tearDownWithError() throws {
    }
}
