//
//  ReadingTests.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/11/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import XCTest
@testable import CanaryHomework_Swift

/// Test class for Reading model
class ReadingTests: XCTestCase {
    
    var sut: [Reading]!
    
    func testReading_didGetDevicesSuccessfully() {
        // Then
        setupSUT(with: "reading_success")
        
        // When
        XCTAssertNotNil(sut)
    }
    
    func testReading_didNotGetDevicesSuccessfully() {
        // Then
        setupSUT(with: "reading_unsuccess")
        
        // When
        XCTAssertNil(sut)
    }
    
    private func setupSUT(with resource: String) {
        if let path = Bundle(for: type(of: self)).path(forResource: resource, ofType: "json") {
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let readings = try? JSONDecoder().decode([Reading].self, from: data!)
            self.sut = readings
        }
    }
}
