//
//  DeviceDetailViewModel.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// View model that will handle the bustiness logic for Device Detail View Controller
final class DeviceDetailViewModel: DeviceDetailViewModelProtocol {
    
    // MARK: - Properties
    
    var title: String = Strings.deviceDetailTitle
    
    var airqualityMax = 0
    var airqualityMin = 0
    var airqualityAverage = 0
    
    var humidityMax = 0
    var humidityMin = 0
    var humidityAverage = 0
    
    var temperatureMax = 0
    var temperatureMin = 0
    var temperatureAverage = 0
    
    private let provider: ReadingsProviding
    private var readings: [Reading]
    private let deviceID: String
    
    private var humidities = [Int]()
    private var airQualities = [Int]()
    private var temperatures = [Int]()
 
    weak var view: DeviceDetailView?
    
    // MARK: - Initializer
    
    init(provider: ReadingsProviding,
         deviceID: String,
         readings: [Reading] = []) {
        self.provider = provider
        self.deviceID = deviceID
        self.readings = readings
    }
    
    // MARK: - Public Functions
    
    func viewDidLoad() {
        fetchReadings()
    }
    
    func retryFetchingReadings() {
        fetchReadings()
    }
    
    // MARK: - Private Functions
    
    private func fetchReadings() {
        provider.getReadings(deviceID: deviceID, parameters: nil) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let readings):
                self.readings = readings
                self.setupReadingsAttributes()
            case .failure(let error):
                self.view?.showAlert(with: error.description)
            }
        }
    }
    
    private func setupReadingsAttributes() {
        readings.forEach { reading in
            if reading.type == ReadingType.airquality.rawValue {
                self.airQualities.append(reading.value)
            } else if reading.type == ReadingType.humidity.rawValue {
                self.humidities.append(reading.value)
            } else if reading.type == ReadingType.temperature.rawValue {
                self.temperatures.append(reading.value)
            }
        }
        if let max = self.airQualities.max(),
            let min = self.airQualities.min() {
            self.airqualityMax = max
            self.airqualityMin = min
            var sum = 0
            airQualities.forEach { value in
                sum += value
            }
            self.airqualityAverage = sum / airQualities.count
        }
        
        if let max = self.humidities.max(),
            let min = self.humidities.min() {
            humidityMax = max
            humidityMin = min
            var sum = 0
            humidities.forEach { value in
                sum += value
            }
            humidityAverage = sum / humidities.count
        }
        
        if let max = self.temperatures.max(),
            let min = self.temperatures.min()  {
            temperatureMax = max
            temperatureMin = min
            var sum = 0
            temperatures.forEach { value in
                sum += value
            }
            temperatureAverage = sum / temperatures.count
        }
        view?.updateData()
    }
}
