//
//  TextStyle.swift
//  CanaryHomework-Swift
//
//  Created by Stanley Delacruz on 6/9/20.
//  Copyright © 2020 Stanle Delacruz. All rights reserved.
//

import UIKit

/// The text style for the app.
struct TextStyle {
    
    // MARK: - Properties
    
    private let color: Color
    
    // MARK: - Initializer
    
    /// Init method
    /// - Parameter color: The color given.
    init(color: Color) {
        self.color = color
    }
    
    /// Medium Avenir Regular style attributed text.
    /// - Parameter string: The string given.
    func mediumAvenirRegularStyle() -> [NSAttributedString.Key: NSObject] {
        let font = UIFont(name: "Avenir-Medium", size: 20)
        let attributes = [NSAttributedString.Key.font : font ?? UIFont.systemFont(ofSize: 14),
                          NSAttributedString.Key.foregroundColor: color.brandLabel]
        
        return attributes
    }
    
    /// Gets the attributes for the Large Arial Bold Style
    /// - Returns: Returns a dictionary object.
    func attributesLargeArialBoldStyle() -> [NSAttributedString.Key: NSObject] {
        let font = UIFont(name: "ArialRoundedMTBold", size: 40)
        let attributes = [NSAttributedString.Key.font : font ?? UIFont.boldSystemFont(ofSize: 16),
                          NSAttributedString.Key.foregroundColor: color.brandLabel]
        return attributes
    }
    
    /// Gets the attributes for the Medium Arial Bold Style
    /// - Returns: Returns a dictionary object.
    func attributesMediumArialBoldStyle() -> [NSAttributedString.Key: NSObject] {
        let font = UIFont(name: "ArialRoundedMTBold", size: 20)
        let attributes = [NSAttributedString.Key.font : font ?? UIFont.boldSystemFont(ofSize: 16),
                          NSAttributedString.Key.foregroundColor: color.brandLabel]
        return attributes
    }
}
