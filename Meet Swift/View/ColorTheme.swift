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
    
    let navigationColor: UIColor
    let navigationButtonColor: UIColor
    
    let textColor: UIColor
    let style: UIBarStyle
    
    let cellTextColor: UIColor
    let cellProgressBarColor: UIColor
    let cellBackgroundColor: UIColor
    let selectedRow: UIColor
    
  
    
    
    static let light = ColorTheme(isDefaultStatusBar: true,
                                  viewControllerBackgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                  navigationColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  navigationButtonColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1),
                                  textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                  style: .default,
                                  cellTextColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                  cellProgressBarColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1),
                                  cellBackgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                  selectedRow: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.1))
    
    static let dark = ColorTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                 navigationColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                 navigationButtonColor: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1),
                                 textColor: #colorLiteral(red: 0.9174425006, green: 0.9216420054, blue: 0.9215044379, alpha: 1),
                                 style: .blackOpaque,
                                 cellTextColor : #colorLiteral(red: 0.9174425006, green: 0.9216420054, blue: 0.9215044379, alpha: 1),
                                 cellProgressBarColor: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1),
                                 cellBackgroundColor: #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 0.9),
                                 selectedRow: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.1))
    
}
