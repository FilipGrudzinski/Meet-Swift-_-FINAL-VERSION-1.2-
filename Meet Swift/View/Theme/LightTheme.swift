//
//  LightTheme.swift
//  Meet Swift
//
//  Created by Filip on 12/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit


class LightTheme: ThemeProtocol {
    
    var statusBar: Bool = true
    var viewControllerBackgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var navigationColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var buttonColor: UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    var textColor: UIColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var style: UIBarStyle = .default
    var cellProgressBarColor: UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    var cellBackgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var selectedRow: UIColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.1)
    
}

