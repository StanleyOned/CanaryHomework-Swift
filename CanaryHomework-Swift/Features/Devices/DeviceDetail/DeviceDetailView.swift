//
//  DeviceDetailView.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

/// Protocol which will be used as a listener between the view model and DeviceDetailViewController.
protocol DeviceDetailView: class {
    
    /// Update the data in the device detail view.
    func updateData()
    
    /// Show an alert with the given message.
    /// - Parameter message: The message given.
    func showAlert(with message: String)
    
    /// Toggle loading indicator
    /// - Parameter isLoading: A boolean value representing if the loading indicator should be shown.
    func toggleLoadingIndicator(_ isLoading: Bool)
}
