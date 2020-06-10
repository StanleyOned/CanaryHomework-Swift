//
//  NetworkClientTests.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/10/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import XCTest
@testable import CanaryHomework_Swift

/// Tests class for network client.
final class NetworkClientTests: XCTestCase {
    
    var sut: NetworkClientMock!
    var urlString = "example.com"
    
    override func setUpWithError() throws {
        sut = NetworkClientMock(urlString: urlString)
    }
    
    func testNetworkClient_didBuildRequestSuccessfully() {
        
        // Given
        var success = false
        
        // When
        sut.request(parameters: nil, requestType: .devices) { result in
            switch result {
            case .success:
                success = true
            case .failure:
                success = false
            }
        }
        
        // Then
        XCTAssertEqual(success, true)
    }
    
    func testNetworkClient_didBuildRequestUnsuccessfully() {
        
        // Given
        sut = NetworkClientMock(urlString: "")
        var success = false
        
        // When
        sut.request(parameters: nil, requestType: .devices) { result in
            switch result {
            case .success:
                success = true
            case .failure:
                success = false
            }
        }
        
        // Then
        XCTAssertEqual(success, false)
    }
    
    func testNetworkClient_didBuildRequestWithParametersSuccessfully() {
        
        // Given
        let correctURL = "example.com/devices?limit=25"
        let parameters: [String: Any] = [
            "limit": 25,
        ]
        
        // When
        sut.request(parameters: parameters, requestType: .devices) { _ in }
        
        // Then
        XCTAssertEqual(sut.urlString, correctURL)
    }
    
    func testNetworkClient_didBuildRequestWithParametersUnsuccessfully() {
        
        // Given
        let correctURL = "example.com/devices"
        let parameters: [String: Any] = [
            "limit": 25
        ]
        
        // When
        sut.request(parameters: parameters, requestType: .devices) { _ in }
        
        // Then
        XCTAssertNotEqual(sut.urlString, correctURL)
    }
    
    override func tearDownWithError() throws {}
}
