//
//  DeviceDetailViewModelTests.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/10/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import XCTest
@testable import CanaryHomework_Swift

class DevicesDetailViewModelTests: XCTestCase {
    
    var sut: DevicesDetailViewModelMock!

    override func setUpWithError() throws {
        sut = DevicesDetailViewModelMock()
    }
    
    func testsDevicesDetailViewModel_didFetchReadingsSuccessfully() {
        // Given
        let success = true
        
        // Then
        sut.fetchReadings()
        
        // When
        XCTAssertEqual(sut.didFetchReadings, success)
    }
    
    func testsDeviceViewModel_didFetchDevicesUnsuccessfully() {
        // Given
        let success = false
        
        // Then
        sut.shouldRetryToFetchReadings = true
        sut.fetchReadings()
        
        // When
        XCTAssertEqual(sut.didFetchReadings, success)
    }

    override func tearDownWithError() throws {
    }
}

