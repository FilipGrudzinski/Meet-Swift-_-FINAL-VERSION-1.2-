//
//  ColorTheme.swift
//  Meet Swift
//
//  Created by Filip on 20/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit



struct ColorTheme {
    
    let isDefaultStatusBar: Bool
    let viewControllerBackgroundColor: UIColor
    
    let primaryColor: UIColor
    let primaryTextColor: UIColor
    
    let secondaryColor: UIColor
    
    let accentColor: UIColor
    let outputTextColor: UIColor
    
    
    static let light = ColorTheme(isDefaultStatusBar: true,
                                  viewControllerBackgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
                                  primaryColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  primaryTextColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  secondaryColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  accentColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  outputTextColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    
    static let dark = ColorTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: .tcAlmostBlack,
                                 primaryColor: .tcMediumBlack,
                                 primaryTextColor: .tcWhite,
                                 secondaryColor: .tcBlueBlack,
                                 accentColor: .tcSeafoamGreen,
                                 outputTextColor: .tcWhite)
    
    
}
