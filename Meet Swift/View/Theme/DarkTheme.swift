//
//  DarkTheme.swift
//  Meet Swift
//
//  Created by Filip on 12/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class DarkTheme: ThemeProtocol {
    
    var viewControllerBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var navigationColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var buttonColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
    var textColor = #colorLiteral(red: 0.9174425006, green: 0.9216420054, blue: 0.9215044379, alpha: 1)
    var style: UIBarStyle = .blackOpaque
    var cellProgressBarColor = #colorLiteral(red: 1, green: 0.5764705882, blue: 0, alpha: 1)
    var cellBackgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 0.9)
    var selectedRow = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.1)
    var headerBackgroundColor = #colorLiteral(red: 0.08537990196, green: 0.08537990196, blue: 0.08537990196, alpha: 1)
    var progressTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var pressedSectionButton = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.5)
}
