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
    let cellColor: UIColor
    
    
    static let light = ColorTheme(isDefaultStatusBar: true,
                                  viewControllerBackgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                  primaryColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  primaryTextColor: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),
                                  secondaryColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  accentColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  outputTextColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  cellColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    
    static let dark = ColorTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                 primaryColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                 primaryTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                 secondaryColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                 accentColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                 outputTextColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                 cellColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    
    
}
