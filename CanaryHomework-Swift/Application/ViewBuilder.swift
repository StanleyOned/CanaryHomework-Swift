//
//  ViewBuilder.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// View Builder which will be used to create all view controllers.
/// Extracting all the view controller instantiation from other classes.
final class ViewBuilder {
    
    // MARK: - Properties
    
    private let theme: Theme
    private let client: NetworkClientProtocol
    
    // MARK: - Initializer
    
    init(_ client: NetworkClientProtocol, theme: Theme) {
        self.theme = theme
        self.client = client
    }
    
    // MARK: - Public Functions

    func buildDevicesViewController() -> UIViewController {
        let view = DevicesViewController(theme: theme)
        let devicesProvider = DevicesProvider(client)
        let router = DevicesRouter(viewController: view, viewBuilder: self)
        let viewModel = DevicesViewModel(provider: devicesProvider, router: router)
        view.viewModel = viewModel
        viewModel.view = view
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
    
    func buildDevicesDetailViewController(deviceID: String) -> UIViewController {
        let view = DeviceDetailViewController(theme: theme)
        let readingsProvider = ReadingsProvider(client)
        let viewModel = DeviceDetailViewModel(provider: readingsProvider, deviceID: deviceID)
        view.viewModel = viewModel
        viewModel.view = view
        return view
    }
}
