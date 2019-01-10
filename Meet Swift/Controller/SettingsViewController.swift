//
//  SettingsViewController.swift
//  Meet Swift
//
//  Created by Filip on 04/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitchOutlet: UISwitch!
    @IBOutlet weak var resetAllProgressButtonLabel: UIButton!
    @IBOutlet weak var restoreInAppPurchaseButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //resetAllProgressButtonLabel.isHidden = true
        //restoreInAppPurchaseButtonLabel.isHidden = true
        
        let modeValue = UserDefaults.standard.bool(forKey: "mode")
        mode = modeValue
        darkModeSwitchOutlet.setOn(mode, animated: false)
        setTheme(isDark: mode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme(isDark: mode)
        
    }
    
    @IBAction func colorThemeSwitch(_ sender: UISwitch) {
        
        if darkModeSwitchOutlet.isOn {
            
            mode = true
            UserDefaults.standard.set(mode, forKey: "mode")
            
        } else {
            
            mode = false
            UserDefaults.standard.set(mode, forKey: "mode")
            
        }
        
        setTheme(isDark: mode)
    }
    
    
    @IBAction func resetAllProgressButton(_ sender: UIButton) {
        
        print("Reset All Progress Button Pressed")
        
    }
    
    
    @IBAction func restoreInAppPurchaseButton(_ sender: UIButton) {
        print("Restore in-app pruchase Button Pressed")
    }
    
    
    func setTheme(isDark: Bool) {
        
        let theme = isDark ? ColorTheme.dark : ColorTheme.light
        
        view.backgroundColor = theme.viewControllerBackgroundColor
        
        navigationController?.navigationBar.barTintColor = theme.navigationColor // color of navigationbar
        navigationController?.navigationBar.tintColor =  theme.navigationButtonColor // color of navigationbar buttons
        navigationController?.navigationBar.barStyle = theme.style
        
        // Content Text collors
        darkModeLabel.textColor = theme.textColor
        resetAllProgressButtonLabel.tintColor = theme.navigationButtonColor
        restoreInAppPurchaseButtonLabel.tintColor = theme.navigationButtonColor
        
    }
    
}
