//
//  DevicesView.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

/// Devices view used to communicate from the DevicesViewModel to the DevicesViewController
protocol DevicesView: class {
    
    /// Reload data
    func reloadData()
    
    /// Toggle loading indicator
    /// - Parameter isLoading: A boolean value representing if the loading indicator should be shown.
    func toggleLoadingIndicator(_ isLoading: Bool)
    
    /// Show alert
    /// - Parameter message: The message given.
    func showAlert(with message: String)
}
