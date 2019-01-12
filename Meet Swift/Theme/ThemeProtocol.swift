//
//  ThemeProtocol.swift
//  Meet Swift
//
//  Created by Filip on 12/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit


protocol ThemeProtocol {
    
    var statusBar: Bool {get}
    var viewControllerBackgroundColor: UIColor { get }
    var navigationColor: UIColor { get }
    var navigationButtonColor: UIColor { get }
    var textColor: UIColor { get }
    var style: UIBarStyle { get }
    var cellProgressBarColor: UIColor { get }
    var cellBackgroundColor: UIColor { get }
    var selectedRow: UIColor { get }
    
}


//static let dark = ColorTheme(isDefaultStatusBar: false,
//                             viewControllerBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
//                             navigationColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
//                             navigationButtonColor: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1),
//                             textColor: #colorLiteral(red: 0.9174425006, green: 0.9216420054, blue: 0.9215044379, alpha: 1),
//                             style: .blackOpaque,
//                             cellProgressBarColor: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1),
//                             cellBackgroundColor: #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 0.9),
//                             selectedRow: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.1))

