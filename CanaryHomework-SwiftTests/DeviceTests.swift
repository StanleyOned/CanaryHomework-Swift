//
//  DeviceTests.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/11/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import XCTest
@testable import CanaryHomework_Swift

/// Test class for Device model
class DeviceTests: XCTestCase {
    
    var sut: [Device]!
    
    func testDevice_didGetDevicesSuccessfully() {
        // Then
        setupSUT(with: "device_success")
        
        // When
        XCTAssertNotNil(sut)
    }
    
    func testDevice_didNotGetDevicesSuccessfully() {
        // Then
        setupSUT(with: "device_unsuccess")
        
        // When
        XCTAssertNil(sut)
    }
    
    private func setupSUT(with resource: String) {
        if let path = Bundle(for: type(of: self)).path(forResource: resource, ofType: "json") {
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let devices = try? JSONDecoder().decode([Device].self, from: data!)
            self.sut = devices
        }
    }
}
