//
//  Theme.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// The app theme
struct Theme {
    
    // MARK: - Properties
    
    let color: Color
    let textStyle: TextStyle
    
    // MARK: - Initializer
    
    /// Init method
    /// - Parameter color: The colors given
    init(color: Color = Color()) {
        self.color = color
        self.textStyle = TextStyle(color: color)
    }
    
    func setAppearence() {
        UINavigationBar.appearance().largeTitleTextAttributes = textStyle.attributesLargeArialBoldStyle()
        UINavigationBar.appearance().titleTextAttributes = textStyle.attributesMediumArialBoldStyle()
        UINavigationBar.appearance().backgroundColor = color.brandSystemBackground
        UINavigationBar.appearance().tintColor = color.brandSystemBackground
    }
}
