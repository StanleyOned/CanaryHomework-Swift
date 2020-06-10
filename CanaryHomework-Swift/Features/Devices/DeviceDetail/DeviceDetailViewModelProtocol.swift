//
//  DeviceDetailViewModelProtocol.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/10/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

/// Protocol which defines Device Detail View Model.
protocol DeviceDetailViewModelProtocol {
    
    /// Title for the detail screen.
    var title: String { get }
    
    /// Airquality max value.
    var airqualityMax: Int { get }
    
    /// Airquality min value.
    var airqualityMin: Int { get }
    
    /// Airquality average value.
    var airqualityAverage: Int { get }
    
    /// Title of Airquality.
    var airQualityTitle: String { get }
    
    /// Title of Humidity.
    var humidityTitle: String { get }

    /// Title of Temperature.
    var temperatureTitle: String { get }

    /// Humidity max value.
    var humidityMax: Int { get }
    
    /// Humidity min value.
    var humidityMin: Int { get }
    
    /// Humidity average value.
    var humidityAverage: Int { get }
    
    /// Temperature max value.
    var temperatureMax: Int { get }
    
    /// Temperature min value.
    var temperatureMin: Int { get }
    
    /// Temperature average value.
    var temperatureAverage: Int { get }
    
    /// View has Loaded.
    func viewDidLoad()
    
    /// Retry fetching readings from the server.
    func retryFetchingReadings()
}
