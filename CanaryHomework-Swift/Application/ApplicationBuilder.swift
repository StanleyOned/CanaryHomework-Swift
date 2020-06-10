//
//  ApplicationBuilder.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// The builder class, the initial state in the app.
/// This class main purpose is to extract some functionality from the AppDelegate / SceneDelegate
final class ApplicationBuilder {
    
    // MARK: Public Functions
    
    /// Build the application using the app window.
    /// - Parameter window: The app window.
    func build(on window: UIWindow?) {
        let theme = Theme()
        let client = NetworkClient(urlString: Environment.baseURLString)
        let viewBuilder = ViewBuilder(client, theme: theme)
        let devicesViewController = viewBuilder.buildDevicesViewController()
        theme.setAppearence()
        window?.rootViewController = devicesViewController
        window?.makeKeyAndVisible()
    }
}
