//
//  SettingsViewController.swift
//  Meet Swift
//
//  Created by Filip on 04/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var isDefaultStatusBar = true
    var cellColor = UIColor()

    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitchOutlet: UISwitch!
    @IBOutlet weak var resetAllProgressButtonLabel: UIButton!
    @IBOutlet weak var restoreInAppPurchaseButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme(isDark: false)
        //resetAllProgressButtonLabel.isHidden = true
        //restoreInAppPurchaseButtonLabel.isHidden = true
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func colorThemeSwitch(_ sender: UISwitch) {
        
        setTheme(isDark: sender.isOn)

        print("Toggle Switch")
        
    }
    
    
    @IBAction func resetAllProgressButton(_ sender: UIButton) {
        
        print("Reset All Progress Button Pressed")
        
    }
    
    
    @IBAction func restoreInAppPurchaseButton(_ sender: UIButton) {
        print("Restore in-app pruchase Button Pressed")
    }
    
   

}

extension SettingsViewController {
    
    func setTheme(isDark: Bool) {
        
        let theme = isDark ? ColorTheme.dark : ColorTheme.light
        
        view.backgroundColor = theme.viewControllerBackgroundColor
        
        navigationController?.navigationBar.barTintColor = theme.primaryColor
        navigationController?.navigationBar.tintColor =  theme.primaryTextColor
    
        cellColor = theme.cellColor
        
        isDefaultStatusBar = theme.isDefaultStatusBar
        
        if isDefaultStatusBar {
            
            navigationController?.navigationBar.barStyle = .default
            
            
        } else {
            
            navigationController?.navigationBar.barStyle = .blackOpaque
            
        }
        
        //tableView.reloadData()
    }
    
}
