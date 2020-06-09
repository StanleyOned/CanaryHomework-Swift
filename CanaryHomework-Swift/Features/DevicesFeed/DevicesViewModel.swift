//
//  DevicesViewModel.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import Foundation

/// View model for the device view controller.
final class DevicesViewModel: DevicesViewModelProtocol {
    
    // MARK: - Properties
    
    var title: String = Strings.deviceTitle
    
    weak var view: DevicesView?
    
    private let provider: DevicesProviding
    private var devices: [Device]
    
    init(provider: DevicesProviding,
         devices: [Device] = []) {
        self.provider = provider
        self.devices = devices
    }
    
    // MARK: - Public Functions
    
    func viewDidLoad() {
        fetchDevices()
    }
    
    func device(at indexPath: IndexPath) -> Device {
        devices[indexPath.row]
    }
    
    func numberOfItems() -> Int {
        devices.count
    }
    
    func retryFetchingDevices() {
        fetchDevices()
    }
    
    // MARK: - Private Functions
    
    private func fetchDevices() {
        view?.toggleLoadingIndicator(true)
        provider.getDevices { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.toggleLoadingIndicator(false)
            switch result {
            case .success(let devices):
                self.devices = devices
                self.view?.reloadData()
            case .failure(let error):
                self.view?.showAlert(with: error.localizedDescription)
            }
        }
    }
}
