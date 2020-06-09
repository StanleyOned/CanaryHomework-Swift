//
//  UIViewController+Extensions.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

// UIViewController extension.
extension UIViewController {
    
    /// Display an UIAlertController.
    ///
    /// - Parameters:
    ///   - title: The Alert Title.
    ///   - message: The Alert Message.
    ///   - actionTitles: The Action titles.
    ///   - actions: The Actions.
    func displayAlert(title: String?,
                      message: String? = nil,
                      actionTitles: [String?],
                      cancelAction: Bool = false,
                      style: UIAlertController.Style = .actionSheet,
                      actions: [((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        if cancelAction {
            alert.addAction(UIAlertAction(title: Strings.cancel, style: .cancel))
        }
        present(alert, animated: true)
    }
}
