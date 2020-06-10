//
//  DeviceDetailViewModelMock.swift
//  CanaryHomework-SwiftTests
//
//  Created by Stanley Delacruz on 6/10/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation
@testable import CanaryHomework_Swift

final class DevicesDetailViewModelMock: DeviceDetailViewModelProtocol {
    
    var title: String = "Title"
    
    var airqualityMax: Int = 0
    
    var airqualityMin: Int = 0
    
    var airqualityAverage: Int = 0
    
    var airQualityTitle: String = "airQualityTitle"
    
    var humidityTitle: String = "humidityTitle"
    
    var temperatureTitle: String = "airQualityTitle"
    
    var humidityMax: Int = 0
    
    var humidityMin: Int = 0
    
    var humidityAverage: Int = 0
    
    var temperatureMax: Int = 0
    
    var temperatureMin: Int = 0
    
    var temperatureAverage: Int = 0
    
    var viewDidLoaded = false
    
    var shouldRetryToFetchReadings = false
    
    var didFetchReadings = false
    
    func viewDidLoad() {
        viewDidLoaded = true
    }
    
    func retryFetchingReadings() {
        shouldRetryToFetchReadings = true
    }
    
    func fetchReadings() {
        
        if shouldRetryToFetchReadings {
            return
        }
        
        didFetchReadings = true
    }
    
}
