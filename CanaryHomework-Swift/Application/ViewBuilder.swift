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
    
    // MARK: - Public Functions

    /// Build the devices view controller
    /// - Parameter client: The network client
    /// - Returns: Returns the view controller instance
    func buildDevicesViewController(_ client: NetworkClientProtocol, theme: Theme) -> UIViewController {
        let view = DevicesViewController(theme: theme)
        let client = NetworkClient(urlString: Environment.baseURLString)
        let devicesProvider = DevicesProvider(client)
        let viewModel = DevicesViewModel(provider: devicesProvider)
        view.viewModel = viewModel
        viewModel.view = view
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
