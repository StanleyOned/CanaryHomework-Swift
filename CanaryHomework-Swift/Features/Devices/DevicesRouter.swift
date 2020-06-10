//
//  DevicesRouter.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// Router for the devices view controller
final class DevicesRouter {
    
    // MARK: - Properties

    private let viewController: UIViewController
    private let viewBuilder: ViewBuilder

    // MARK: - Initializer

    init(viewController: UIViewController, viewBuilder: ViewBuilder) {
        self.viewController = viewController
        self.viewBuilder = viewBuilder
    }

    /// Route to the detail screen.
    /// - Parameters:
    ///   - deviceID: The device id.
    func routeToDetails(with deviceID: String) {
        let detailScreen = viewBuilder.buildDevicesDetailViewController(deviceID: deviceID)
        viewController.navigationController?.pushViewController(detailScreen, animated: true)
    }
}
