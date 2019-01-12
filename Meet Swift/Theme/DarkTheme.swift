//
//  DarkTheme.swift
//  Meet Swift
//
//  Created by Filip on 12/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class DarkTheme: ThemeProtocol {
    
    var statusBar: Bool = false
    var viewControllerBackgroundColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var navigationColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var navigationButtonColor: UIColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
    var textColor: UIColor = #colorLiteral(red: 0.9174425006, green: 0.9216420054, blue: 0.9215044379, alpha: 1)
    var style: UIBarStyle = .blackOpaque
    var cellProgressBarColor: UIColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
    var cellBackgroundColor: UIColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 0.9)
    var selectedRow: UIColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.1)
    
}
