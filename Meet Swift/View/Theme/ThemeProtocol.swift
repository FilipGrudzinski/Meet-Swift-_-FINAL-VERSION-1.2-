//
//  ThemeProtocol.swift
//  Meet Swift
//
//  Created by Filip on 12/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit


protocol ThemeProtocol {
    
   
    var viewControllerBackgroundColor: UIColor { get }
    var navigationColor: UIColor { get }
    var buttonColor: UIColor { get }
    var textColor: UIColor { get }
    var style: UIBarStyle { get }
    var cellProgressBarColor: UIColor { get }
    var cellBackgroundColor: UIColor { get }
    var selectedRow: UIColor { get }
    var headerBackgroundColor: UIColor { get }
    var progressTintColor: UIColor { get }
    var pressedSectionButton: UIColor { get }
    
}
